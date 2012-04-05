package MC9001::Mneumonics;

use warnings;
use strict;

sub new { bless { }, shift }

sub lookup {
	# Mneumonics (In opcode order):
	[
	    
	    # instruction  opcode addressing    status
	    
	    
	    'brk',     #    00    implied
	    'ora',     #    01    indirect,X
	    ,
	    ,
	    ,
	    'ora',     #    05    zeropage
	    'asl',     #    06    zeropage
	    ,
	    'php',     #    08    implied
	    'ora',     #    09    immediate
	    'asl',     #    0A    accumulator
	    ,
	    ,
	    'ora',     #    0D    absolute
	    'asl',     #    0E    absolute
	    ,
	    'bpl',     #    10    relative
	    'ora',     #    11    indirect,Y
	    ,
	    ,
	    ,
	    'ora',     #    15    zeropage,X
	    'asl',     #    16    zeropage,X
	    ,
	    'clc',     #    18    implied
	    'ora',     #    19    absolute,Y
	    ,
	    ,
	    ,
	    'ora',     #    1D    absolute,X
	    'asl',     #    1E    absolute,X
	    ,
	    'jsr',     #    20    absolute
	    'and',     #    21    indirect,X
	    ,
	    ,
	    'bit',     #    24    zeropage
	    'and',     #    25    zeropage
	    'rol',     #    26    zeropage
	    ,
	    'plp',     #    28    implied
	    'and',     #    29    immediate
	    'rol',     #    2A    accumulator
	    ,
	    'bit',     #    2C    absolute
	    'and',     #    2D    absolute
	    'rol',     #    2E    absolute
	    ,
	    'bmi',     #    30    relative
	    'and',     #    31    indirect,Y
	    ,
	    ,
	    ,
	    'and',     #    35    zeropage,X
	    'rol',     #    36    zeropage,X
	    ,
	    'sec',     #    38    implied
	    'and',     #    39    absolute,Y
	    ,
	    ,
	    ,
	    'and',     #    3D    absolute,X
	    'rol',     #    3E    absolute,X
	    ,
	    'rti',     #    40    implied
	    'eor',     #    41    indirect,X
	    ,
	    ,
	    ,
	    'eor',     #    45    zeropage
	    'lsr',     #    46    zeropage
	    ,
	    'pha',     #    48    implied
	    'eor',     #    49    immediate
	    'lsr',     #    4A    accumulator
	    ,
	    'jmp',     #    4C    absolute
	    'eor',     #    4D    absolute
	    'lsr',     #    4E    absolute
	    ,
	    'bvc',     #    50    relative
	    'eor',     #    51    indirect,Y
	    ,
	    ,
	    ,
	    'eor',     #    55    zeropage,X
	    'lsr',     #    56    zeropage,X
	    ,
	    'cli',     #    58    implied
	    'eor',     #    59    absolute,Y
	    ,
	    ,
	    ,
	    'eor',     #    5D    absolute,X
	    'lsr',     #    5E    absolute,X
	    ,
	    'rts',     #    60    implied
	    'adc',     #    61    indirect,X
	    ,
	    ,
	    ,
	    'adc',     #    65    zeropage
	    'eor',     #    66    zeropage
	    ,
	    'pla',     #    68    implied
	    'adc',     #    69    immediate
	    'ror',     #    6A    accumulator
	    ,
	    'jmp',     #    6C    indirect
	    'adc',     #    6D    absolute
	    'ror',     #    6E    absolute,
	    ,
	    'bvs',     #    70    relative
	    'adc',     #    71    indirect,Y
	    ,
	    ,
	    ,
	    'adc',     #    75    zeropage,X
	    'ror',     #    76    zeropage,X
	    ,
	    'sei',     #    78    implied
	    'adc',     #    79    absolute,Y
	    ,
	    ,
	    ,
	    'adc',     #    7D    absolute,X
	    'ror',     #    7E    absolute,X
	    ,
	    ,
	    'sta',     #    81    indirect
	    ,
	    ,
	    'sty',     #    84    zeropage
	    'sta',     #    85    zeropage
	    'stx',     #    86    zeropage
	    ,
	    'dey',     #    88    implied
	    ,
	    'txa',     #    8A    implied
	    ,
	    'sty',     #    8C    absolute
	    'sta',     #    8D    absolute
	    'stx',     #    8E    absolute
	    ,
	    'bcc',     #    90    relative
	    'sta',     #    91    indirect,Y
	    ,
	    ,
	    'sty',     #    94    zeropage,X
	    'sta',     #    95    zeropage,X
	    'stx',     #    96    zeropage,Y
	    ,
	    'tya',     #    98    implied
	    'sta',     #    99    absolute,Y
	    'txs',     #    9A    implied
	    ,
	    ,
	    'sta',     #    9D    absolute,X
	    ,
	    ,
	    'ldy',     #    A0    immediate
	    'lda',     #    A1    indirect,X
	    'ldx',     #    A2    immediate
	    ,
	    'ldy',     #    A4    zeropage
	    'lda',     #    A5    zeropage
	    'ldx',     #    A6    zeropage
	    ,
	    'tay',     #    A8    implied
	    'lda',     #    A9    immediate
	    'tax',     #    AA    implied
	    ,
	    'tdy',     #    AC    absolute
	    'lda',     #    AD    absolute
	    'ldx',     #    AE    absolute
	    ,
	    'bcs',     #    B0    relative
	    'lda',     #    B1    indirect,Y
	    ,
	    ,
	    'ldy',     #    B4    zeropage,X
	    'lda',     #    B5    zeropage,X
	    'ldx',     #    B6    zeropage,Y
	    ,
	    'clv',     #    B8    implied
	    'lda',     #    B9    absolute,Y
	    'tsx',     #    BA    implied
	    ,
	    'ldy',     #    BC    absolute,X
	    'lda',     #    BD    absolute,X
	    'ldx',     #    BE    absolute,Y
	    ,
	    'cpy',     #    C0    immediate
	    'cmp',     #    C1    indirect,X
	    ,
	    ,
	    'cpy',     #    C4    zeropage
	    'cmp',     #    C5    zeropage
	    'dec',     #    C6    zeropage
	    ,
	    'iny',     #    C8    implied
	    'cmp',     #    C9    immediate
	    'dex',     #    CA    implied
	    ,
	    'cpy',     #    CC    absolute
	    'cmp',     #    CD    absolute
	    'dec',     #    CE    absolute
	    ,
	    'bne',     #    D0    relative
	    'cmp',     #    D1    indirect,Y
	    ,
	    ,
	    ,
	    'cmp',     #    D5    zeropage,X
	    'dec',     #    D6    zeropage,X
	    ,
	    'cld',     #    D8    implied
	    'cmp',     #    D9    absolute,Y
	    ,
	    ,
	    ,
	    'cmp',     #    DD    absolute,X
	    'dec',     #    DE    absolute,X
	    ,
	    'cpx',     #    E0    immediate
	    'sbc',     #    E1    indirect,X
	    ,
	    ,
	    'cpx',     #    E4    zeropage
	    'sbc',     #    E5    zeropage
	    'inc',     #    E6    zeropage
	    ,
	    'inx',     #    E8    implied
	    'sbc',     #    E9    immediate
	    'nop',     #    EA    implied
	    ,
	    'cpx',     #    EC    absolute
	    'sbc',     #    ED    absolute
	    'inc',     #    EE    absolute
	    ,
	    'beq',     #    F0    relative
	    'sbc',     #    F1    indirect,Y
	    ,
	    ,
	    ,
	    'sbc',     #    F5    zeropage,X
	    'inc',     #    F6    zeropage,X
	    ,
	    'sed',     #    F8    implied
	    'sbc',     #    F9    absolute,Y
	    ,
	    ,
	    ,
	    'sbc',     #    FD    absolute,X
	    'inc',     #    FE    absolute,X
  
	    ],
}

1;
