include <cube_jig_common.scad>;
sep = 9.0;
hole = 2.5;
ratio = 40/140;
difference() {
    jig();
    translate([-sep/2, sep/2,0]) cylinder(d=hole,h = 20, center=true);  
    translate([sep/2, -sep/2,0]) cylinder(d=hole,h = 20, center=true);  
    translate([sep*ratio-sep/2, sep*ratio-sep/2,0]) cylinder(d=hole,h = 20, center=true);  
}
