use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'meic_det1_rich';

my $offset=70.9;

my $offset_inner=40.3;

sub make_meic_det1_rich
{
make_meic_det1_rich_box();
make_meic_det1_rich_readout();
make_meic_det1_rich_mirror();
make_meic_det1_rich_aerogel();
}
sub make_meic_det1_rich_box
{
 my $NUM  = 1;
 my @z    = (262.5+$offset);
 my @Rin1  = (15);
 my @Rout1 = (170);
 my @Rin2  = (25);
 my @Rout2 = (225);
 my @Dz   = (82.5);
 my @name = ("box"); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("Vacuum");
 my @rot  = (0);

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "$rot[$n-1]*deg 0*deg 0*deg";
    $detector{"color"}      = "808000"; #olive
    $detector{"type"}       = "Cons";
    $detector{"dimensions"} = "$Rin1[$n-1]*cm $Rout1[$n-1]*cm $Rin2[$n-1]*cm $Rout2[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
     print_det(\%configuration, \%detector);
 }
}

sub make_meic_det1_rich_readout
{
 my $NUM  = 30;
 my $z    = 0;
 my $name = "readout";
 my $mother = "meic_det1_rich_box"; 
 my $mat  = "Vacuum";
 my $rot  = 0;

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name\_$n";
    $detector{"mother"}      = "$mother" ;
    $detector{"description"} = $detector{"name"};
    $detector{"pos"}        = "0*cm 0*cm 0*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "f0ff00";
    my $deg = ($n-1)*(8+4)-4;
    $detector{"type"}       = "Polycone";    
    $detector{"dimensions"} = "$deg*deg 8*deg 2*counts 140*cm 175*cm 142*cm 177*cm -60*cm -20*cm";
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

sub make_meic_det1_rich_mirror
{
 my $NUM  = 30;
 my $z    = 0;
 my $name = "mirror";
 my $mother = "meic_det1_rich_box"; 
 my $mat  = "Vacuum";
 my $rot  = 0;

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name\_$n";
    $detector{"mother"}      = "$mother" ;
    $detector{"description"} = $detector{"name"};
    $detector{"pos"}        = "0*cm 0*cm 0*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "fff5ea";
    my $deg = ($n-1)*(8+4)-4;
    $detector{"type"}       = "Polycone";
    $detector{"dimensions"} = "$deg*deg 8*deg 2*counts 30*cm 200*cm 32*cm 202*cm 60*cm 80*cm";
    $detector{"material"}   = $mat;
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
     print_det(\%configuration, \%detector);
 }
}


sub make_meic_det1_rich_aerogel
{
 my $NUM  = 1;
 my @z    = (-70);
 my @name = ("aerogel"); 
 my @mother = ("meic_det1_rich_box"); 
 my @mat  = ("Vacuum");
 my @rot  = (0);

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "$rot[$n-1]*deg 0*deg 0*deg";
    $detector{"color"}      = "f43300";
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "20*cm 120*cm 2.5*cm 0*deg 360*deg";
    $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
     print_det(\%configuration, \%detector);
 }
}
