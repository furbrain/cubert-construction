h = 2;
cyl_height=1.8;
e=0.001;
$fn=30;
difference() {
    cube([13,6.5,h]);
    translate([3.7,4.0,-e]) cube([5.6,5,h+e*2]);
}
translate([2,2,0]) cylinder(d=1.8, h=h+cyl_height);
translate([11,2,0]) cylinder(d=1.8, h=h+cyl_height);