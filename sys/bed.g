; bed.g
; Called on G32 to tram the gantry to the bed
;
if !sensors.endstops[3].triggered
    G1 U400 F6000													; Make sure X2 is parked

G30 P0 X20 Y150 Z-99999												; Probe near the left leadscrew
G30 P1 X280.2 Y150 Z-99999 S2										; Probe near the right leadscrew and calibrate
G28 Z
G30 P0 X20 Y150 Z-99999												; Probe near the left leadscrew
G30 P1 X280.2 Y150 Z-99999 S2										; Probe near the right leadscrew and calibrate
