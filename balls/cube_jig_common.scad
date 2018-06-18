ball_diameter = 40.0;
wall = 3.0;
gap = 0;
e = 0.01;
slot = 3.0;
cube_size = [ball_diameter+wall,
             ball_diameter+wall,
             ball_diameter/2+wall-gap];

module jig() {
  difference() {
    translate([-cube_size[0]/2, -cube_size[1]/2, 0]) cube(cube_size);
    translate([0, 0, ball_diameter/2+wall]) sphere(d=ball_diameter);
    for (i = [-cube_size[0]/4, cube_size[0]/4]) {
        for (j = [(slot-cube_size[1]-e)/2, (e+cube_size[1]-slot)/2]) {
            translate([i,j,0]) cube([slot, slot, ball_diameter+wall*2+e], center=true);
        }
    }
  }
}

jig();
