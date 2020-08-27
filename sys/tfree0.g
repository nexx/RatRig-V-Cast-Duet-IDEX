; tfree0.g
; Called upon releasing tool 0
;

M106 S0														; Disable part cooling on this tool
G91															; Relative positioning
G1 Z5 F6000 												; Lift Z relative to current position
G90															; Absolute positioning
G1 X-51.80 F6000 H2											; Move X1 to axis minima
