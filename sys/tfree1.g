; tfree1.g
; Called upon releasing tool 1
;

M106 S0														; Disable part cooling on this tool
G91															; Relative positioning
G1 Z5 F6000 												; Lift Z relative to current position
G90															; Absolute positioning
G1 U400 F6000												; Move X2 to axis maxima
