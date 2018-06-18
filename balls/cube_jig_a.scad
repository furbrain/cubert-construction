use <cube_jig_common.scad>;
sep = 9.0;
hole = 2.5;
$fn=30;
difference() {
    jig();
    for (i = [-sep/2, +sep/2]) {
        for (j = [-sep/2, +sep/2]) {
            translate([i,j,0]) cylinder(d=hole,h = 20, center=true);  
        }
    }
}
