use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'meic_det1_solenoid_dual_barrel';

my $offset=70.9;

my $offset_inner=40.3;

sub make_meic_det1_solenoid_dual
{
make_meic_det1_solenoid_dual_coil_inner();
make_meic_det1_solenoid_dual_coil_outer();
make_meic_det1_solenoid_dual_coil_side_upstream();
make_meic_det1_solenoid_dual_coil_side_downstream();
# make_meic_det1_solenoid_dual_coil_upstream();
# make_meic_det1_solenoid_dual_coil_downstream();
}

sub make_meic_det1_solenoid_dual_coil_inner
{
 my $NUM  = 1;
 my @z    = ($offset_inner);
 my @Rin  = (150);
 my @Rout = (160);
 my @Dz   = (160);
 my @name = ("coil_inner"); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("Kryptonite");
 

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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

sub make_meic_det1_solenoid_dual_coil_side_upstream
{
 my $NUM  = 1;
 my @z    = (-160.5-20+$offset_inner);
 my @Rin  = (150);
 my @Rout = (162.4);
 my @Dz   = (20);
 my @name = ("coil_side_upstream"); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("Kryptonite");
 

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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

sub make_meic_det1_solenoid_dual_coil_side_downstream
{
 my $NUM  = 1;
 my @z    = (160.5+20+$offset_inner);
 my @Rin  = (150);
 my @Rout = (162.4);
 my @Dz   = (20);
 my @name = ("coil_side_downstream"); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("Kryptonite");
 

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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

sub make_meic_det1_solenoid_dual_coil_outer
{
 my $NUM  = 1;
 my @z    = ($offset);
 my @Rin  = (230.5);
 my @Rout = (236.5);
 my @Dz   = (400.1);
 my @name = ("coil_outer"); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("Kryptonite");
 

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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

sub make_meic_det1_solenoid_dual_coil_upstream
{
 my $coilthickness=17;
 my $NUM  = 7;
 my @z    = (-412.5-3.5+$offset,-412.5-3.5+$offset,-412.5-3.5+$offset,-412.5-3.5+$offset,-412.5-3.5+$offset,-412.5-3.5+$offset,-412.5-3.5+$offset);
 my @Rin  = (32,62,93,123,154,184,214);
 my @Rout =  (32+$coilthickness,62+$coilthickness,93+$coilthickness,123+$coilthickness,154+$coilthickness,184+$coilthickness,214+$coilthickness);
 my @Dz   = (3.5,3.5,3.5,3.5,3.5,3.5,3.5);
 my @name = ("coil_upstream_1","coil_upstream_2","coil_upstream_3","coil_upstream_4","coil_upstream_5","coil_upstream_6","coil_upstream_7"); 
 my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother"); 
 my @mat  = ("Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite");
 my @rot  = (0,0,0,0,0,0,0);

#  for(my $n=1; $n<=$NUM; $n++)
 for(my $n=2; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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


sub make_meic_det1_solenoid_dual_coil_downstream
{
 my $coilthickness=17;
 my $NUM  = 7;
 my @z    = (412.5+3.5+$offset,412.5+3.5+$offset,412.5+3.5+$offset,412.5+3.5+$offset,412.5+3.5+$offset,412.5+3.5+$offset,412.5+3.5+$offset);
 my @Rin  = (32,62,93,123,154,184,214);
 my @Rout = (32+$coilthickness,62+$coilthickness,93+$coilthickness,123+$coilthickness,154+$coilthickness,184+$coilthickness,214+$coilthickness);
 my @Dz   = (3.5,3.5,3.5,3.5,3.5,3.5,3.5);
 my @name = ("coil_downstream_1","coil_downstream_2","coil_downstream_3","coil_downstream_4","coil_downstream_5","coil_downstream_6","coil_downstream_7"); 
 my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother"); 
 my @mat  = ("Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite");
 my @rot  = (0,0,0,0,0,0,0);

#  for(my $n=1; $n<=$NUM; $n++)
 for(my $n=2; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "C0C0C0"; #silver
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
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