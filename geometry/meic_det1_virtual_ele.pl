use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'meic_det1_virtual_ele';

sub make_meic_det1_virtual_ele
{
my $NUM  = 9;
my @z  = (-1,-2.05,-2.9,-5,-10,-17,-24,-30,-40);
# my @z  = (1,2,2.9,6.6,8.6,12,15.8,26,32);
# my $NUM  = 6;
# my @z  = (9,6.6,8.6,12,15.8,26,32);

# <x>:     50.0417 100.083 145.121 249.896 302.869 336.931 358.836 425.995 449.04  481.962 616.282 639.625 672.249 739.409 852.633 963.238 1067.21 1050.2 1026.07 1002.85 1001.64
# <z>:    1000    2000    2900    4993.75 5992.35 6600    6990.78 8188.9  8600    9187.33 11583.6 12000   12582   13780.1 15800   17773.2 21773.2 26000 32000    37772.4 38072.4

# my $Rout=200;
# my @x = (0,0,0,0,0,0,0,0,0);
# my @rot=(0,0,0,0,0,0,0,0,0);

my @Rout = (50,50,50,300,300,300,300,300,300);
my $x=0;
# my @x = (50.0417, 100.083, 145.121, 336.931, 449.04, 639.625, 852.633, 1050.2, 1026.07);
# my @x = (336.931, 449.04, 639.625, 852.633, 1050.2, 1026.07);
# my @x=(50.0417 100.083 145.121 '249.896 302.869' 336.931 '358.836 425.995' 449.04  '481.962 616.282' 639.625 '672.249 739.409' 852.633 '963.238 1067.21' 1050.2 1026.07 '1002.85 1001.64');
# my @x  = (1*tan(0.05),2*tan(0.05),3*tan(0.05),6.5*tan(0.055996009),8.6*tan(0.055996009),12*tan(0.055996009),15.8*tan(0.055996009),26*tan(0.012),32*tan(0.012));
my @rot=(0.,0.,0.,0.,0.,0.,0.,0.,0.);
# my @rot=(0.05,0.05,0.05,0.055996009,0.055996009,0.055996009,0.055996009,-0.004003991,-0.004003991);
# my @rot=(0.055996009,0.055996009,0.055996009,0.055996009,-0.004003991,-0.004003991);
my @id = ("id manual 22311","id manual 22321","id manual 22331","id manual 22341","id manual 22351","id manual 22361","id manual 22371","id manual 22381","id manual 22391");

# == id name ==============================================================
# digit     beamline                side          magnet      number          window
#        ion    1        upstream    1    dipole    1           n     front      1
#        ele    2       downstream   2  quadrupole  2                 back       2
#                                          virtual  3
# =========================================================================


 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$n";
    $detector{"mother"}      = "$DetectorMother" ;
    $detector{"description"} = "$DetectorName\_$n";
    $detector{"pos"}        = "$x*mm 0*m $z[$n-1]*m";
    $detector{"rotation"}   = "0*rad $rot[$n-1]*rad 0*rad";
    $detector{"color"}      = "ff00ff"; 
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "0*cm $Rout[$n-1]*cm 1e-7*cm 0*deg 360*deg";
    $detector{"material"}   = "Vacuum";
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    $detector{"identifiers"} = $id[$n-1];
     print_det(\%configuration, \%detector);
 }
}