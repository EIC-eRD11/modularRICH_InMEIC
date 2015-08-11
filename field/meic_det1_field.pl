#!/usr/bin/perl -w

use strict;
# use warnings;
use lib ("$ENV{GEMC}/io");
use parameters;
use utils;
use geometry;
use hit;
use bank;
use math;

use Getopt::Long;
use Math::Trig;

my $config_file   = $ARGV[0];
our %configuration = load_configuration($config_file);

# One can change the "variation" here if one is desired different from the config.dat
$configuration{"detector_name"} = "../geometry/meic_det1";
$configuration{"variation"} = "Original";

# To get the parameters proper authentication is needed.
our %parameters    = get_parameters(%configuration);

#length in m, halfaperture in cm, streng in T or T/m, X in m, Z in m, Theta in rad
my $e_ds_dipole1_length			= $parameters{"e_ds_bsp1_length"};
my $e_ds_dipole1_halfaperture		= $parameters{"e_ds_bsp1_halfaperture"};
my $e_ds_dipole1_strength		= $parameters{"e_ds_bsp1_strength"};
my $e_ds_dipole1_X			= $parameters{"e_ds_bsp1_X"};
my $e_ds_dipole1_Z			= $parameters{"e_ds_bsp1_Z"};
my $e_ds_dipole1_Theta			= $parameters{"e_ds_bsp1_Theta"};
my $e_ds_dipole2_length			= $parameters{"e_ds_bsp2_length"};
my $e_ds_dipole2_halfaperture		= $parameters{"e_ds_bsp2_halfaperture"};
my $e_ds_dipole2_strength		= $parameters{"e_ds_bsp2_strength"};
my $e_ds_dipole2_X			= $parameters{"e_ds_bsp2_X"};
my $e_ds_dipole2_Z			= $parameters{"e_ds_bsp2_Z"};
my $e_ds_dipole2_Theta			= $parameters{"e_ds_bsp2_Theta"};
my $e_ds_dipole3_length			= $parameters{"e_ds_bsp3_length"};
my $e_ds_dipole3_halfaperture		= $parameters{"e_ds_bsp3_halfaperture"};
my $e_ds_dipole3_strength		= $parameters{"e_ds_bsp3_strength"};
my $e_ds_dipole3_X			= $parameters{"e_ds_bsp3_X"};
my $e_ds_dipole3_Z			= $parameters{"e_ds_bsp3_Z"};
my $e_ds_dipole3_Theta			= $parameters{"e_ds_bsp3_Theta"};
my $e_ds_dipole4_length			= $parameters{"e_ds_bsp4_length"};
my $e_ds_dipole4_halfaperture		= $parameters{"e_ds_bsp4_halfaperture"};
my $e_ds_dipole4_strength		= $parameters{"e_ds_bsp4_strength"};
my $e_ds_dipole4_X			= $parameters{"e_ds_bsp4_X"};
my $e_ds_dipole4_Z			= $parameters{"e_ds_bsp4_Z"};
my $e_ds_dipole4_Theta			= $parameters{"e_ds_bsp4_Theta"};
my $e_ds_dipole5_length			= $parameters{"e_ds_bsp5_length"};
my $e_ds_dipole5_halfaperture		= $parameters{"e_ds_bsp5_halfaperture"};
my $e_ds_dipole5_strength		= $parameters{"e_ds_bsp5_strength"};
my $e_ds_dipole5_X			= $parameters{"e_ds_bsp5_X"};
my $e_ds_dipole5_Z			= $parameters{"e_ds_bsp5_Z"};
my $e_ds_dipole5_Theta			= $parameters{"e_ds_bsp5_Theta"};
my $e_ds_dipole6_length			= $parameters{"e_ds_bsp6_length"};
my $e_ds_dipole6_halfaperture		= $parameters{"e_ds_bsp6_halfaperture"};
my $e_ds_dipole6_strength		= $parameters{"e_ds_bsp6_strength"};
my $e_ds_dipole6_X			= $parameters{"e_ds_bsp6_X"};
my $e_ds_dipole6_Z			= $parameters{"e_ds_bsp6_Z"};
my $e_ds_dipole6_Theta			= $parameters{"e_ds_bsp6_Theta"};
my $e_ds_dipole7_length			= $parameters{"e_ds_bsp7_length"};
my $e_ds_dipole7_halfaperture		= $parameters{"e_ds_bsp7_halfaperture"};
my $e_ds_dipole7_strength		= $parameters{"e_ds_bsp7_strength"};
my $e_ds_dipole7_X			= $parameters{"e_ds_bsp7_X"};
my $e_ds_dipole7_Z			= $parameters{"e_ds_bsp7_Z"};
my $e_ds_dipole7_Theta			= $parameters{"e_ds_bsp7_Theta"};
my $e_ds_dipole8_length			= $parameters{"e_ds_bsp8_length"};
my $e_ds_dipole8_halfaperture		= $parameters{"e_ds_bsp8_halfaperture"};
my $e_ds_dipole8_strength		= $parameters{"e_ds_bsp8_strength"};
my $e_ds_dipole8_X			= $parameters{"e_ds_bsp8_X"};
my $e_ds_dipole8_Z			= $parameters{"e_ds_bsp8_Z"};
my $e_ds_dipole8_Theta			= $parameters{"e_ds_bsp8_Theta"};
my $e_ds_quad1_length		= $parameters{"e_ds_qffb1_length"};
my $e_ds_quad1_halfaperture	= $parameters{"e_ds_qffb1_halfaperture"};
my $e_ds_quad1_strength		= $parameters{"e_ds_qffb1_strength"};
my $e_ds_quad1_X		= $parameters{"e_ds_qffb1_X"};
my $e_ds_quad1_Z		= $parameters{"e_ds_qffb1_Z"};
my $e_ds_quad1_Theta		= $parameters{"e_ds_qffb1_Theta"};
my $e_ds_quad2_length		= $parameters{"e_ds_qffb2_length"};
my $e_ds_quad2_halfaperture	= $parameters{"e_ds_qffb2_halfaperture"};
my $e_ds_quad2_strength		= $parameters{"e_ds_qffb2_strength"};
my $e_ds_quad2_X		= $parameters{"e_ds_qffb2_X"};
my $e_ds_quad2_Z		= $parameters{"e_ds_qffb2_Z"};
my $e_ds_quad2_Theta		= $parameters{"e_ds_qffb2_Theta"};
my $e_ds_quad3_length		= $parameters{"e_ds_qffb3_length"};
my $e_ds_quad3_halfaperture	= $parameters{"e_ds_qffb3_halfaperture"};
my $e_ds_quad3_strength		= $parameters{"e_ds_qffb3_strength"};
my $e_ds_quad3_X		= $parameters{"e_ds_qffb3_X"};
my $e_ds_quad3_Z		= $parameters{"e_ds_qffb3_Z"};
my $e_ds_quad3_Theta		= $parameters{"e_ds_qffb3_Theta"};
my $e_ds_quad4_length		= $parameters{"e_ds_qffb4_length"};
my $e_ds_quad4_halfaperture	= $parameters{"e_ds_qffb4_halfaperture"};
my $e_ds_quad4_strength		= $parameters{"e_ds_qffb4_strength"};
my $e_ds_quad4_X		= $parameters{"e_ds_qffb4_X"};
my $e_ds_quad4_Z		= $parameters{"e_ds_qffb4_Z"};
my $e_ds_quad4_Theta		= $parameters{"e_ds_qffb5_Theta"};
my $e_ds_quad5_length		= $parameters{"e_ds_qffb5_length"};
my $e_ds_quad5_halfaperture	= $parameters{"e_ds_qffb5_halfaperture"};
my $e_ds_quad5_strength		= $parameters{"e_ds_qffb5_strength"};
my $e_ds_quad5_X		= $parameters{"e_ds_qffb5_X"};
my $e_ds_quad5_Z		= $parameters{"e_ds_qffb5_Z"};
my $e_ds_quad5_Theta		= $parameters{"e_ds_qffb5_Theta"};
my $e_us_quad1_length		= $parameters{"e_us_qffb1_length"};
my $e_us_quad1_halfaperture	= $parameters{"e_us_qffb1_halfaperture"};
my $e_us_quad1_strength		= $parameters{"e_us_qffb1_strength"};
my $e_us_quad1_X		= $parameters{"e_us_qffb1_X"};
my $e_us_quad1_Z		= $parameters{"e_us_qffb1_Z"};
my $e_us_quad1_Theta		= $parameters{"e_us_qffb1_Theta"};
my $e_us_quad2_length		= $parameters{"e_us_qffb2_length"};
my $e_us_quad2_halfaperture	= $parameters{"e_us_qffb2_halfaperture"};
my $e_us_quad2_strength		= $parameters{"e_us_qffb2_strength"};
my $e_us_quad2_X		= $parameters{"e_us_qffb2_X"};
my $e_us_quad2_Z		= $parameters{"e_us_qffb2_Z"};
my $e_us_quad2_Theta		= $parameters{"e_us_qffb2_Theta"};
my $e_us_quad3_length		= $parameters{"e_us_qffb3_length"};
my $e_us_quad3_halfaperture	= $parameters{"e_us_qffb3_halfaperture"};
my $e_us_quad3_strength		= $parameters{"e_us_qffb3_strength"};
my $e_us_quad3_X		= $parameters{"e_us_qffb3_X"};
my $e_us_quad3_Z		= $parameters{"e_us_qffb3_Z"};
my $e_us_quad3_Theta		= $parameters{"e_us_qffb3_Theta"};
my $e_us_quad4_length		= $parameters{"e_us_qffb4_length"};
my $e_us_quad4_halfaperture	= $parameters{"e_us_qffb4_halfaperture"};
my $e_us_quad4_strength		= $parameters{"e_us_qffb4_strength"};
my $e_us_quad4_X		= $parameters{"e_us_qffb4_X"};
my $e_us_quad4_Z		= $parameters{"e_us_qffb4_Z"};
my $e_us_quad4_Theta		= $parameters{"e_us_qffb4_Theta"};
my $e_us_quad5_length		= $parameters{"e_us_qffb5_length"};
my $e_us_quad5_halfaperture	= $parameters{"e_us_qffb5_halfaperture"};
my $e_us_quad5_strength		= $parameters{"e_us_qffb5_strength"};
my $e_us_quad5_X		= $parameters{"e_us_qffb5_X"};
my $e_us_quad5_Z		= $parameters{"e_us_qffb5_Z"};
my $e_us_quad5_Theta		= $parameters{"e_us_qffb5_Theta"};

my $i_ds_dipole1_length			= $parameters{"i_ds_rbffb_length"};
my $i_ds_dipole1_halfaperture		= $parameters{"i_ds_rbffb_halfaperture"};
my $i_ds_dipole1_strength		= $parameters{"i_ds_rbffb_strength"};
my $i_ds_dipole1_X			= $parameters{"i_ds_rbffb_X"};
my $i_ds_dipole1_Z			= $parameters{"i_ds_rbffb_Z"};
my $i_ds_dipole1_Theta			= $parameters{"i_ds_rbffb_Theta"};
my $i_ds_dipole2_length			= $parameters{"i_ds_sbffb_length"};
my $i_ds_dipole2_halfaperture		= $parameters{"i_ds_sbffb_halfaperture"};
my $i_ds_dipole2_strength		= $parameters{"i_ds_sbffb_strength"};
my $i_ds_dipole2_X			= $parameters{"i_ds_sbffb_X"};
my $i_ds_dipole2_Z			= $parameters{"i_ds_sbffb_Z"};
my $i_ds_dipole2_Theta			= $parameters{"i_ds_sbffb_Theta"};
my $i_ds_quad1_length		= $parameters{"i_ds_qffb1_length"};
my $i_ds_quad1_halfaperture	= $parameters{"i_ds_qffb1_halfaperture"};
my $i_ds_quad1_strength		= $parameters{"i_ds_qffb1_strength"};
my $i_ds_quad1_X		= $parameters{"i_ds_qffb1_X"};
my $i_ds_quad1_Z		= $parameters{"i_ds_qffb1_Z"};
my $i_ds_quad1_Theta		= $parameters{"i_ds_qffb1_Theta"};
my $i_ds_quad2_length		= $parameters{"i_ds_qffb2_length"};
my $i_ds_quad2_halfaperture	= $parameters{"i_ds_qffb2_halfaperture"};
my $i_ds_quad2_strength		= $parameters{"i_ds_qffb2_strength"};
my $i_ds_quad2_X		= $parameters{"i_ds_qffb2_X"};
my $i_ds_quad2_Z		= $parameters{"i_ds_qffb2_Z"};
my $i_ds_quad2_Theta		= $parameters{"i_ds_qffb2_Theta"};
my $i_ds_quad3_length		= $parameters{"i_ds_qffb3_length"};
my $i_ds_quad3_halfaperture	= $parameters{"i_ds_qffb3_halfaperture"};
my $i_ds_quad3_strength		= $parameters{"i_ds_qffb3_strength"};
my $i_ds_quad3_X		= $parameters{"i_ds_qffb3_X"};
my $i_ds_quad3_Z		= $parameters{"i_ds_qffb3_Z"};
my $i_ds_quad3_Theta		= $parameters{"i_ds_qffb3_Theta"};
my $i_ds_quad4_length		= $parameters{"i_ds_qccb1_length"};
my $i_ds_quad4_halfaperture	= $parameters{"i_ds_qccb1_halfaperture"};
my $i_ds_quad4_strength		= $parameters{"i_ds_qccb1_strength"};
my $i_ds_quad4_X		= $parameters{"i_ds_qccb1_X"};
my $i_ds_quad4_Z		= $parameters{"i_ds_qccb1_Z"};
my $i_ds_quad4_Theta		= $parameters{"i_ds_qccb1_Theta"};
my $i_us_quad1_length		= $parameters{"i_us_qffb1_length"};
my $i_us_quad1_halfaperture	= $parameters{"i_us_qffb1_halfaperture"};
my $i_us_quad1_strength		= $parameters{"i_us_qffb1_strength"};
my $i_us_quad1_X		= $parameters{"i_us_qffb1_X"};
my $i_us_quad1_Z		= $parameters{"i_us_qffb1_Z"};
my $i_us_quad1_Theta		= $parameters{"i_us_qffb1_Theta"};
my $i_us_quad2_length		= $parameters{"i_us_qffb2_length"};
my $i_us_quad2_halfaperture	= $parameters{"i_us_qffb2_halfaperture"};
my $i_us_quad2_strength		= $parameters{"i_us_qffb2_strength"};
my $i_us_quad2_X		= $parameters{"i_us_qffb2_X"};
my $i_us_quad2_Z		= $parameters{"i_us_qffb2_Z"};
my $i_us_quad2_Theta		= $parameters{"i_us_qffb2_Theta"};
my $i_us_quad3_length		= $parameters{"i_us_qffb3_length"};
my $i_us_quad3_halfaperture	= $parameters{"i_us_qffb3_halfaperture"};
my $i_us_quad3_strength		= $parameters{"i_us_qffb3_strength"};
my $i_us_quad3_X		= $parameters{"i_us_qffb3_X"};
my $i_us_quad3_Z		= $parameters{"i_us_qffb3_Z"};
my $i_us_quad3_Theta		= $parameters{"i_us_qffb3_Theta"};

# my $file = $configuration{"detector_name"}."__geometry_".$varia.".txt";
my $NUM=27;
my @file = (
"meic_det1_ele_downstream_dipole1_simple",
"meic_det1_ele_downstream_dipole2_simple",
"meic_det1_ele_downstream_dipole3_simple",
"meic_det1_ele_downstream_dipole4_simple",
"meic_det1_ele_downstream_dipole5_simple",
"meic_det1_ele_downstream_dipole6_simple",
"meic_det1_ele_downstream_dipole7_simple",
"meic_det1_ele_downstream_dipole8_simple",
"meic_det1_ele_downstream_quadrupole1_simple",
"meic_det1_ele_downstream_quadrupole2_simple",
"meic_det1_ele_downstream_quadrupole3_simple",
"meic_det1_ele_downstream_quadrupole4_simple",
"meic_det1_ele_downstream_quadrupole5_simple",
"meic_det1_ele_upstream_quadrupole1_simple",
"meic_det1_ele_upstream_quadrupole2_simple",
"meic_det1_ele_upstream_quadrupole3_simple",
"meic_det1_ele_upstream_quadrupole4_simple",
"meic_det1_ele_upstream_quadrupole5_simple",
"meic_det1_ion_downstream_dipole1_simple",
"meic_det1_ion_downstream_dipole2_simple",
"meic_det1_ion_downstream_quadrupole1_simple",
"meic_det1_ion_downstream_quadrupole2_simple",
"meic_det1_ion_downstream_quadrupole3_simple",
"meic_det1_ion_downstream_quadrupole4_simple",
"meic_det1_ion_upstream_quadrupole1_simple",
"meic_det1_ion_upstream_quadrupole2_simple",
"meic_det1_ion_upstream_quadrupole3_simple"
);
my @Npole=(
2,2,2,2,2,2,2,2,
4,4,4,4,4,
4,4,4,4,4,
2,2,
4,4,4,4,
4,4,4
);
my @scale=(
$e_ds_dipole1_strength,$e_ds_dipole2_strength,$e_ds_dipole3_strength,$e_ds_dipole4_strength,$e_ds_dipole5_strength,$e_ds_dipole6_strength,$e_ds_dipole7_strength,$e_ds_dipole8_strength,
$e_ds_quad1_strength,$e_ds_quad2_strength,$e_ds_quad3_strength,$e_ds_quad4_strength,$e_ds_quad5_strength,
$e_us_quad1_strength,$e_us_quad2_strength,$e_us_quad3_strength,$e_us_quad4_strength,$e_us_quad5_strength,
$i_ds_dipole1_strength,$i_ds_dipole2_strength,
$i_ds_quad1_strength,$i_ds_quad2_strength,$i_ds_quad3_strength,$i_ds_quad4_strength,
$i_us_quad1_strength,$i_us_quad2_strength,$i_us_quad3_strength,
);
my @x=(
$e_ds_dipole1_X,$e_ds_dipole2_X,$e_ds_dipole3_X,$e_ds_dipole4_X,$e_ds_dipole5_X,$e_ds_dipole6_X,$e_ds_dipole7_X,$e_ds_dipole8_X,
$e_ds_quad1_X,$e_ds_quad2_X,$e_ds_quad3_X,$e_ds_quad4_X,$e_ds_quad5_X,
$e_us_quad1_X,$e_us_quad2_X,$e_us_quad3_X,$e_us_quad4_X,$e_us_quad5_X,
$i_ds_dipole1_X,$i_ds_dipole2_X,
$i_ds_quad1_X,$i_ds_quad2_X,$i_ds_quad3_X,$i_ds_quad4_X,
$i_us_quad1_X,$i_us_quad2_X,$i_us_quad3_X,
);
my @z=(
$e_ds_dipole1_Z,$e_ds_dipole2_Z,$e_ds_dipole3_Z,$e_ds_dipole4_Z,$e_ds_dipole5_Z,$e_ds_dipole6_Z,$e_ds_dipole7_Z,$e_ds_dipole8_Z,
$e_ds_quad1_Z,$e_ds_quad2_Z,$e_ds_quad3_Z,$e_ds_quad4_Z,$e_ds_quad5_Z,
$e_us_quad1_Z,$e_us_quad2_Z,$e_us_quad3_Z,$e_us_quad4_Z,$e_us_quad5_Z,
$i_ds_dipole1_Z,$i_ds_dipole2_Z,
$i_ds_quad1_Z,$i_ds_quad2_Z,$i_ds_quad3_Z,$i_ds_quad4_Z,
$i_us_quad1_Z,$i_us_quad2_Z,$i_us_quad3_Z,
);
my @rot=(
$e_ds_dipole1_Theta,$e_ds_dipole2_Theta,$e_ds_dipole3_Theta,$e_ds_dipole4_Theta,$e_ds_dipole5_Theta,$e_ds_dipole6_Theta,$e_ds_dipole7_Theta,$e_ds_dipole8_Theta,
$e_ds_quad1_Theta,$e_ds_quad2_Theta,$e_ds_quad3_Theta,$e_ds_quad4_Theta,$e_ds_quad5_Theta,
$e_us_quad1_Theta,$e_us_quad2_Theta,$e_us_quad3_Theta,$e_us_quad4_Theta,$e_us_quad5_Theta,
$i_ds_dipole1_Theta,$i_ds_dipole2_Theta,
$i_ds_quad1_Theta,$i_ds_quad2_Theta,$i_ds_quad3_Theta,$i_ds_quad4_Theta,
$i_us_quad1_Theta,$i_us_quad2_Theta,$i_us_quad3_Theta,
);

for(my $n=0; $n<$NUM; $n++)
{
my $filename=sprintf("%s.dat",$file[$n]);
`rm -f $filename`;
print "Overwriting if existing: ", $filename, "\n";
open(INFO, ">>$filename");
printf INFO ("<mfield>\n");
printf INFO ("<description name=\"%s\" factory=\"ASCII\" comment=\"%s\"/>\n",$file[$n],$file[$n]);
printf INFO ("<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\" minStep=\"1*mm\"/>\n");
printf INFO ("<dimension Npole=\"%i\" scale=\"%s\" Bunit=\"T\" x=\"%s\" y=\"0\" z=\"%s\" XYZunit=\"m\" rot=\"%s\" ROTunit=\"rad\" ROTaxis=\"Y\"/>\n",$Npole[$n],$scale[$n],$x[$n],$z[$n],$rot[$n]);
printf INFO ("<mfield>\n");
close(INFO);
}

