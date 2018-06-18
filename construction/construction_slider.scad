depth = 10.0;
ball_diameter = 40.0;
height = ball_diameter+2;
rod_thickness = 2.6;
strut_thickness = 5.0;
sep = 9.0;
screw_hole = 4.0;
tower_width = sep - rod_thickness - 1.0;
balcony_width = sep + rod_thickness + 2.0;
balcony_height = height/2 - sep/2 -strut_thickness;
spar_height = height/2 + sep/2 - strut_thickness;
tower_height = balcony_height;

$fn = 30;

module rods() {
    translate([0, height/2, 0])
    for(i = [-sep/2, sep/2]) {
       for(j =  [-sep/2, sep/2]) {
           translate([i,j,0]) cylinder(h=depth*4, d=rod_thickness, center=true);
       }
   }
}

module main_block() {
    //L shape
    translate([-height/2,0,0]) cube([height, strut_thickness, depth]);
    translate([-height/2,0,0]) cube([strut_thickness, height, depth*2]);
    translate([-tower_width/2,0,0]) cube([tower_width, tower_height, depth]);
    translate([-balcony_width/2, balcony_height,0]) 
        cube([balcony_width, strut_thickness, depth]);
    translate([-height/2, spar_height, 0]) 
        cube([height/2 + balcony_width/2, strut_thickness, depth]);
    translate([-tower_width/3, spar_height, 0]) 
        cube([tower_width*2/3, strut_thickness, depth*2]);
}

module screw_holes() {
    for (i=[height/4, height*3/4]) {
    translate([-height/2, i, depth])
    rotate([0,90,0])    
    cylinder(d = screw_hole, h = strut_thickness*3, center = true);
    }
}



difference() {
    main_block();
    rods();
    screw_holes();
}
