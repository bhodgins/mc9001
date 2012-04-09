package MC9001;

use warnings;
use strict;

use Data::Dumper;
use base 'MC9001::Operation'; # Consume operations

sub new {
    my $class = shift;
    my %params = @_;
    
    my $self = {
	
	# Registers:
	'A'           => 0,     # Accumulator
	'X'           => 0,     # X index register
	'Y'           => 0,     # Y index register
	'S'           => 0,     # Stack pointer
	'PC'          => 0,     # Program Counter
	
	# Memory:
	'zeropage'    => [],    # The zeropage
	'stack'       => [],    # $100 - $1FF
	'mem_obj'     => $params{'memory_handler'} || die "MC9001.pm requires a memory handler\n",
	
	# Misc:
	'flags'       => 0,     # Processor status
	
    };
    
    bless $self, $class;
}

# Read memory
sub read {
    my ($self, $addr) = @_;
    $self->{'mem_obj'}->read($addr);
}

# Write memory
sub write {
    my ($self, $addr, $byte) = @_;
    $self->{'mem_obj'}->write($addr, $byte);
}

# Change pin status low / high
sub pin {
    
}

1;
