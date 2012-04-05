package MC9001::Memory::TQueue;

use warnings;
use strict;


sub new {
	my $class = shift;
	
	bless {
		'queue' => shift,
	}, $class;
}

sub write {

}

sub read {

}

1;
