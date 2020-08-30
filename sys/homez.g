; homez.g
; Called to home the Z axis
;
M280 P0 S160												; Precautionary alarm release
M280 P0 S90													; Ensure the pin is raised
T0 P0														; Ensure we are on Tool0 which carries the Z-Probe (P0 skips tool files)
G1 U400 F6000												; Make sure X2 is parked
M290 R0 S0													; Reset baby-stepping to 0
G91															; Relative positioning
G1 Z20 F6000 H2												; Lift Z relative to current position
G90															; Absolute positioning
G1 X49.75 Y34.50 F6000										; Move T0 to probing point (X20, Y20), including probe offset
G30															; Probe the bed and set Z to the probe offset
