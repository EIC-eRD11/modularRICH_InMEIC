use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'meic_det1_tracking_vertex';

my $offset=70.9;

my $offset_inner=40.3;

sub make_meic_det1_tracking_vertex
{
#  my $NUM  = 4;
#  my @z    = ($offset_inner/2,$offset_inner/2,$offset_inner/2,$offset_inner/2);
#  my @Rin  = (20,30,40,50);
#  my @Rout = (21,31,41,51);
#  my @Dz   = (50,50,50,50);
#  my @name = ("1","2","3","4"); 
#  my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother"); 
#  my $mat  = ("Vacuum");

 my $NUM  = 1;
 my @z    = (0);
 my @Rin  = (9);
 my @Rout = (10);
 my @Dz   = (10);
 my @name = ("1"); 
 my @mother = ("$DetectorMother"); 
 my $mat  = ("Vacuum");

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "FF00FF"; #Fuchsia
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $mat;
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 0;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
     print_det(\%configuration, \%detector);
 }
}
