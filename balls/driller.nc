(Block-name: header)
(Block-expand: 1)
(Block-enable: 1)
G0 X-4.5 Y-4.5 Z2
M3 S12000
(Block-name: fourholes)
(Block-expand: 1)
(Block-enable: 1)
G0 X-4.5 Y-4.5
G1 Z-8 F400
G1 Z2 

G0 X4.5 Y-4.5
G1 Z-8
G1 Z2 

G0 X4.5 Y4.5
G1 Z-8
G1 Z2 

(Block-name: footer)
(Block-expand: 1)
(Block-enable: 1)
G0 Z2
M5
G0 Y40

