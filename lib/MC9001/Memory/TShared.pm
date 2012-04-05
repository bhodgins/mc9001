package MC9001::Memory::TShared;

use warnings;
use strict;

use threads;
use threads::shared;


sub new {
	my $class = shift;
	
	my $self = {
		'queue'     => shift,
		'memory'    => [],
	};
	
	share($self->{'memory'});
	bless $self, $class;
}

sub write {
	my ($self, $addr, $value) = @_;
	
	$self->{'memory'}->[$addr] = $value;
}

sub read {
	my ($self, $addr) = @_;

	$self->{'memory'}->[$addr];
}

1;
