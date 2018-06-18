jaw_width = 20.0;
bump = 1.5;
bump_gap = 6.0;
wall = 3.0;
height = 8.0;
bite = 15.0;
$fn=30;
linear_extrude(height)
polygon([[0,0], 
         [jaw_width+wall*2, 0], 
         [jaw_width+wall*1.2, bite],
         [jaw_width+wall -bump, wall + bump_gap],
         [jaw_width+wall, wall + bump_gap-1],
         [jaw_width+wall, wall],
         [wall, wall],
         [wall, wall + bump_gap - 1],
         [wall + bump, wall + bump_gap],
         [wall*0.8, bite],
         [0,0]]);
         
