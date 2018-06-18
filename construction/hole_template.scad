hole_size = 3.0;
base = [20,20,1];
slot = [5,1,2];

$fn = 30;
difference() {
    cube(base, center=true);
    for(i = [-4.5, 4.5]) {
        for(j = [-4.5, 4.5]) {
            translate([i,j,0]) cylinder(d=hole_size, h=10, center=true);
        }
    }
    for(theta = [0, 90, 180, 270]) {
        rotate([0,0,theta]) translate([base[0]/2-slot[0]/2,0,0]) cube(slot, center=true);
    }
}