use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;
use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";
my $DetectorName = 'meic_det1_rich';
my $hittype="eic_rich";

sub make_meic_det1_rich
{
require "meic_det1_rich_modular.pl";

#modular RICH size in X, Y
my $box_half = 56.25;

###### upper left quard, X>0, Y>0
my $quard1="upperleft";
for(my $n=0; $n<12; $n++){
	modular_rich($quard1, $n, 0, (6.25+2.5*$n)*$box_half, (1.25+2.5*0)*$box_half );
	modular_rich($quard1, $n, 1, (6.25+2.5*$n)*$box_half, (1.25+2.5*1.)*$box_half );
}
for(my $n=0; $n<14; $n++){
	modular_rich($quard1, $n, 2, (1.25+2.5*$n)*$box_half, (1.25+2.5*2.)*$box_half);
	modular_rich($quard1, $n, 3, (1.25+2.5*$n)*$box_half, (1.25+2.5*3.)*$box_half);
}
for(my $n=0; $n<13; $n++){
	modular_rich($quard1, $n, 4, (1.25+2.5*$n)*$box_half, (1.25+2.5*4)*$box_half);
	modular_rich($quard1, $n, 5, (1.25+2.5*$n)*$box_half, (1.25+2.5*5)*$box_half);
}
for(my $n=0; $n<12; $n++){
	modular_rich($quard1, $n, 6, (1.25+2.5*$n)*$box_half, (1.25+2.5*6)*$box_half);
	modular_rich($quard1, $n, 7, (1.25+2.5*$n)*$box_half, (1.25+2.5*7)*$box_half);
}
for(my $n=0; $n<11; $n++){
	modular_rich($quard1, $n, 8, (1.25+2.5*$n)*$box_half, (1.25+2.5*8)*$box_half);
}
for(my $n=0; $n<10; $n++){
	modular_rich($quard1, $n, 9, (1.25+2.5*$n)*$box_half, (1.25+2.5*9)*$box_half);
}
for(my $n=0; $n<9; $n++){
	modular_rich($quard1, $n, 10, (1.25+2.5*$n)*$box_half, (1.25+2.5*10)*$box_half);
}
for(my $n=0; $n<8; $n++){
	modular_rich($quard1, $n, 11, (1.25+2.5*$n)*$box_half, (1.25+2.5*11)*$box_half);
}
for(my $n=0; $n<6; $n++){
	modular_rich($quard1, $n, 12, (1.25+2.5*$n)*$box_half, (1.25+2.5*12)*$box_half);
}
for(my $n=0; $n<4; $n++){
	modular_rich($quard1, $n, 13, (1.25+2.5*$n)*$box_half, (1.25+2.5*13)*$box_half);
}

 ###### upper right quard, X<0, Y>0
my $quard2="upperright";
for(my $n=0; $n<12; $n++){
	modular_rich($quard2, $n, 0, (6.25+2.5*$n)*$box_half, -1.*(1.25+2.5*0)*$box_half );
	modular_rich($quard2, $n, 1, (6.25+2.5*$n)*$box_half, -1.*(1.25+2.5*1.)*$box_half );
}
for(my $n=0; $n<14; $n++){
	modular_rich($quard2, $n, 2, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*2.)*$box_half);
	modular_rich($quard2, $n, 3, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*3.)*$box_half);
}
for(my $n=0; $n<13; $n++){
	modular_rich($quard2, $n, 4, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*4)*$box_half);
	modular_rich($quard2, $n, 5, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*5)*$box_half);
}
for(my $n=0; $n<12; $n++){
	modular_rich($quard2, $n, 6, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*6)*$box_half);
	modular_rich($quard2, $n, 7, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*7)*$box_half);
}
for(my $n=0; $n<11; $n++){
	modular_rich($quard2, $n, 8, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*8)*$box_half);
}
for(my $n=0; $n<10; $n++){
	modular_rich($quard2, $n, 9, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*9)*$box_half);
}
for(my $n=0; $n<9; $n++){
	modular_rich($quard2, $n, 10, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*10)*$box_half);
}
for(my $n=0; $n<8; $n++){
	modular_rich($quard2, $n, 11, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*11)*$box_half);
}
for(my $n=0; $n<6; $n++){
	modular_rich($quard2, $n, 12, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*12)*$box_half);
}
for(my $n=0; $n<4; $n++){
	modular_rich($quard2, $n, 13, (1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*13)*$box_half);
}


 ###### lower left quard, X>0, Y<0
my $quard3="lowerleft";
for(my $n=0; $n<12; $n++){
	modular_rich($quard3, $n, 0, -1.*(6.25+2.5*$n)*$box_half, (1.25+2.5*0)*$box_half );
	modular_rich($quard3, $n, 1, -1.*(6.25+2.5*$n)*$box_half, (1.25+2.5*1.)*$box_half );
}
for(my $n=0; $n<14; $n++){
	modular_rich($quard3, $n, 2, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*2.)*$box_half);
	modular_rich($quard3, $n, 3, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*3.)*$box_half);
}
for(my $n=0; $n<13; $n++){
	modular_rich($quard3, $n, 4, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*4)*$box_half);
	modular_rich($quard3, $n, 5, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*5)*$box_half);
}
for(my $n=0; $n<12; $n++){
	modular_rich($quard3, $n, 6, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*6)*$box_half);
	modular_rich($quard3, $n, 7, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*7)*$box_half);
}
for(my $n=0; $n<11; $n++){
	modular_rich($quard3, $n, 8, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*8)*$box_half);
}
for(my $n=0; $n<10; $n++){
	modular_rich($quard3, $n, 9, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*9)*$box_half);
}
for(my $n=0; $n<9; $n++){
	modular_rich($quard3, $n, 10, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*10)*$box_half);
}
for(my $n=0; $n<8; $n++){
	modular_rich($quard3, $n, 11, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*11)*$box_half);
}
for(my $n=0; $n<6; $n++){
	modular_rich($quard3, $n, 12, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*12)*$box_half);
}
for(my $n=0; $n<4; $n++){
	modular_rich($quard3, $n, 13, -1.*(1.25+2.5*$n)*$box_half, (1.25+2.5*13)*$box_half);
}


###### low right quard, X<0, Y<0
my $quard4="lowerright";
for(my $n=0; $n<12; $n++){
	modular_rich($quard4, $n, 0, -1.*(6.25+2.5*$n)*$box_half, -1.*(1.25+2.5*0)*$box_half );
	modular_rich($quard4, $n, 1, -1.*(6.25+2.5*$n)*$box_half, -1.*(1.25+2.5*1.)*$box_half );
}
for(my $n=0; $n<14; $n++){
	modular_rich($quard4, $n, 2, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*2.)*$box_half);
	modular_rich($quard4, $n, 3, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*3.)*$box_half);
}
for(my $n=0; $n<13; $n++){
	modular_rich($quard4, $n, 4, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*4)*$box_half);
	modular_rich($quard4, $n, 5, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*5)*$box_half);
}
for(my $n=0; $n<12; $n++){
	modular_rich($quard4, $n, 6, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*6)*$box_half);
	modular_rich($quard4, $n, 7, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*7)*$box_half);
}
for(my $n=0; $n<11; $n++){
	modular_rich($quard4, $n, 8, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*8)*$box_half);
}
for(my $n=0; $n<10; $n++){
	modular_rich($quard4, $n, 9, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*9)*$box_half);
}
for(my $n=0; $n<9; $n++){
	modular_rich($quard4, $n, 10, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*10)*$box_half);
}
for(my $n=0; $n<8; $n++){
	modular_rich($quard4, $n, 11, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*11)*$box_half);
}
for(my $n=0; $n<6; $n++){
	modular_rich($quard4, $n, 12, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*12)*$box_half);
}
for(my $n=0; $n<4; $n++){
	modular_rich($quard4, $n, 13, -1.*(1.25+2.5*$n)*$box_half, -1.*(1.25+2.5*13)*$box_half);
}


}
