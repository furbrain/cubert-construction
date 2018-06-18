$fn=30;
difference() {
    cube([40,40,40], center=true);
    for (i = [-4.5,4.5]) {
        for (j= [-4.5, 4.5]) {
            translate([i,j,15]) cylinder(d=3.0, h=10);
        }
    }
}