; bed.g
; Called on G32 to tram the gantry to the bed
;
G28 U														; Home U to avoid collision from X
G28 Z														; Home Z
G30 P0 X20 Y150 Z-99999										; Probe near the left leadscrew
G30 P1 X280 Y150 Z-99999 S2									; Probe near the right leadscrew and calibrate
