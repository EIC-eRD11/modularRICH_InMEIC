use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;
use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";
my $DetectorName = 'meic_det1_rich';

sub make_meic_det1_rich
{
require "meic_det1_rich_modular.pl";

#modular RICH size in X, Y
my $box_half = 56.25;

###### upper left quard, X>0, Y>0
my $quard1="upperleft";
for(my $n=2; $n<3; $n++){
	modular_rich($quard1, $n, 0, (6.25+2.5*$n)*$box_half, -1*(1.25+2.5*0)*$box_half );
}

}
