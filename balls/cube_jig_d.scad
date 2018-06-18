use <cube_jig_common.scad>;
sep = 9.0;
hole = 2.5;
wall = 3.0;

jig();
translate([0,0,wall]) cylinder(d2=1.0, d1=hole, h = 5, center=false); 