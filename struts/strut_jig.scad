base_depth = 4.0;
wall = 6.0;
wing_width = 25.0;
strip_width= 15.0;
hole_diameter = 7.0;
slot_separation = 45.0;
slot_count=3;
column_separation = 130;
jig_length = column_separation*1.4;
jig_width = strip_width+wall*2;
wire_separation = 9.0;
wire_diam = 1.8;
end_offset = 45.0;
origin = [0, -jig_length/2 + wire_separation, 0];
$fn=30;

module quadruple() {
    for (i = [0,1]) {
        mirror([i,0,0]) {
            for (j = [0,1]) {
                mirror([0,j,0]) children();
            }
        }
    }
}

module quarter_base() {
    difference() {
        union() {
            cube([jig_width/2,(jig_length/2), base_depth]);
            translate([0, (slot_separation*slot_count-wing_width)/2, 0])
                cube([jig_width/2+wing_width,wing_width,base_depth]);
            translate([strip_width/2, 0, base_depth]) cube([wall, jig_length/2, base_depth]);
        }
        translate([(jig_width+wing_width)/2, (slot_separation*slot_count)/2, 0])
            cylinder(d=hole_diameter, h=20, center=true);
    }
}


module base() {
    quadruple() quarter_base();
}

module cutout(w, l, h) {
    quadruple() {
        cube([w/2, l/2, h]);
        translate([0, l/2, 0]) rotate([45,0,0]) cube([w/2, l, h]); 
    }
}


difference() {
    union() {
        base();
        translate(origin) {
            quadruple() 
                translate([wire_separation/2, wire_separation/2, base_depth]) {
                    translate([0, -wire_diam/2, 0])
                        cube([(strip_width-wire_separation)/2, wire_diam, base_depth]);
                    cylinder(d=wire_diam, h=base_depth);
                }
            
        }
    }
    translate(origin) translate([0, column_separation, base_depth-1.5]){
        cutout(jig_width, wire_separation*1.5, wall*3);
        cylinder(h=20, d= 3.2, center=true);
    }
    translate(origin) translate([0, column_separation-end_offset,0])
        cylinder(h=20, d=2.6, center=true);
    translate(origin) translate([0, end_offset, base_depth-1.5])
        cutout(jig_width, wire_separation*1.5, wall*2);
}