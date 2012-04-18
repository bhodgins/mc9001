#!/usr/bin/env perl
use warnings;
use strict;

use Config;
use Data::Dumper;
use IO::Socket;
use Config::Auto;
use define { DEBUG => 1 };
use lib 'lib';

use MC9001;
use MC9001::Memory::TShared;

# Make sure we have ithread features in Perl:
$Config{useithreads} or die('To run this program, Perl must be compiled withthreads');

use threads; # We know we can thread at this point
use Thread::Queue;
use threads 'exit' => 'threads_only';

# Load our configuration file:
my $config = Config::Auto::parse('etc/mc9001.conf') or die 'configuration error';

my $cluster_heap = {}; # Stores information about active clusters

sub authenticate {
    my ($cluster_id, $password) = @_;
    
    return unless exists($config->{'clusters'}{$cluster_id});
    return 1 if $config->{'clusters'}->{$cluster_id}->{'password'} eq $password;
}

sub machine_thread {
    my ($so_client, $queue, $processor) = @_;
    my $operand;
    
    print "Thread on " . fileno($so_client) . " is waiting for instruction\n";
    
    sysread($so_client, $operand, 1);
    
    # Read memory
    if    ($operand == 0x00) {
	sysread($so_client, my $addr, 2) || exit;
	syswrite($so_client, $processor->read($addr));
    }
    
    # Write memory
    elsif ($operand == 0x01) {
	sysread($so_client, my $addr, 2) || exit;
	sysread($so_client, my $byte, 1) || exit;
	$processor->write($addr, $byte);
    }
    
    # Set pin to high
    elsif ($operand == 0x02) {
	$processor->pin(sysread($so_client, my $pin, 1) || exit, 1);
    }
    
    # Set pin to low
    elsif ($operand == 0x03) {
	$processor->pin(sysread($so_client, my $pin, 1) || exit, 0);
    }
    
    print "Closing thread on " . fileno($so_client) . "\n";
    close $so_client;
}


# main:
my $so_obj = IO::Socket::INET->new(
    LocalPort    => $config->{'settings'}->{'port'},
    Listen       => $config->{'settings'}->{'connections'},
    Proto        => 'tcp',
    Type	 => SOCK_STREAM,
    Reuse        => 1,
    ) or die $!;

print "socket ready.\n";

while (my $client  =  $so_obj->accept) {
    
    my $cluster_id =  <$client>;
    my $password   =  <$client>;
    
    chomp $cluster_id;
    chomp $password;
    
    # Apparently, chomp doesn't remove carriage returns:
    $cluster_id    =~ s/\r//;
    $password      =~ s/\r//;
    
    if (authenticate($cluster_id, $password)) {
	
	unless (exists($cluster_heap->{$cluster_id})) {
	    $cluster_heap->{$cluster_id}->{'queue'} = Thread::Queue->new();
	    
	    # Fire additional hardware up:
	    foreach my $module (@{$config->{'clusters'}->{$cluster_id}->{'hardware'}}) {
		
	    }
	}
	
	threads->create(
	    'machine_thread',
	    $client,                                 # socket object
	    $cluster_heap->{$cluster_id}->{'queue'}, # intra-cluster communication
	    MC9001->new(
		memory_handler    => MC9001::Memory::TShared->new($cluster_id),
	    )->init(),
	    )->detach;
	
    }

    else { close $client }
}

sub cleanup {
    exit close $so_obj;
}

# Help prevent messy terminations:
$SIG{INT} = sub { exit cleanup() }
