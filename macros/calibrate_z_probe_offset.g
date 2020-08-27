; calibrate_z_probe_offset.g
; Macro used to calculate the Z-Probe Z offset
;

G31 P100 X0 Y0 Z0											; Reset Z trigger height to 0mm
M290 R0 S0													; Reset babystepping
G29 S2														; Clear bed mesh
G1 X179.75 Y164.50 Z15 F6000								; Move to probing point (X150, Y150), including probe offset
G30															; Probe to find a rough Z 0mm

G1 X150 Y150 Z1 F3000										; Move the nozzle to 150,150,1 slowly
M564 S0														; Allow movement outside axis limits
M291 P"Lower the nozzle to until it holds a sheet of paper. Click to continue." S2 Z1
G92 Z0														; Define this point as 0mm
M564 S1														; Disallow movement outside axis limits

G1 X179.75 Y164.50 Z15 F6000								; Move to probing point (X150, Y150), including probe offset
G30 S-1														; Probe and report the trigger height
