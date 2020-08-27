; resume.g
; Called upon resuming a print in DWC
;

G1 R1 Z5 F6000												; Return X,Y,U to previous coordinates, and Z to previous +5mm
G1 R1														; Lower the nozzle to the previous Z height
M83															; Relative extruder positioning
G1 E4 F1800													; Undo the previous retraction
