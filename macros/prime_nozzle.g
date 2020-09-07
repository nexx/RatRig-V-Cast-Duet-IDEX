; prime_nozzle.g
; Prime the nozzle prior to printing by extruding a line along
; the leftside edge.
;

G1 X0.5 Y5 Z0.3 F6000												; Move to the priming location
G1 X0.5 Y150 F1500 E10												; Draw line 1
G1 X0.9 Y150 F6000													; Slide to the right
G1 X0.9 Y5 F1500 E20												; Draw line 2
