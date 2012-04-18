package MC9001;

use warnings;
use strict;

use Data::Dumper;
use base 'MC9001::Operation'; # Consume operations

use constant {
    FLAG_IRQ    => 2,
};

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
	
	# Vectors:
	'vectors'     => {
	    'nmi'         => $params{'vector_nmi'}   || 0xFFFA,
	    'reset'       => $params{'vector_reset'} || 0xFFFC,
	    'irq'         => $params{'vector_irq'}   || 0xFFFE,
	},

	# Memory:
	'zeropage'    => [],    # $0   - $FF
	'stack'       => [],    # $100 - $1FF
	'mem_obj'     => $params{'memory_handler'} || die "MC9001.pm requires a memory handler\n",
	
	# Misc:
	'flags'       => 0,     # Processor status
	
    };

    bless $self, $class;
}

# Read memory
sub mem_read {
    my ($self, $addr) = @_;
    $self->{'mem_obj'}->mem_read($addr);
}

# Write memory
sub mem_write {
    my ($self, $addr, $byte) = @_;
    $self->{'mem_obj'}->mem_write($addr, $byte);
}

# Change pin status low / high
sub pin {
    
}

# Startup initialization:
sub init {
    my $self = shift;

    $self->{'PC'} = $self->{'vectors'}->{'reset'}; # align program counter
    $self->next_operation();
}

sub next_operation {
    my $self = shift;

    my $instr = $self->fetch(); # Fetch the next instruction
    $self->{'PC'}++;            # Incrememnt the program counter
    $self->execute($instr);
}

sub fetch { $_[0]->mem_read( $_[0]->{'PC'} ) }

sub execute {

}

1;

