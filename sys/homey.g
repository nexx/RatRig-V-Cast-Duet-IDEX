; homey.g
; Called to home the Y axis
;
G91															; Relative positioning
G1 Z5 F6000 H2												; Lift Z relative to current position
G1 Y-999 F6000 H1											; Move Y-axis to the endstop and stop (first pass)
G1 Y5 F360													; Go back a few mm
G1 Y-999 F360 H1											; Move Y-axis to the endstop once more (second pass)
G1 Z-5 F6000 H2												; Return Z to previous height
G90															; Absolute positioning
