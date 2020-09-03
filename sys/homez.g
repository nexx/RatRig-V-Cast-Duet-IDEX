; homez.g
; Called to home the Z axis
;

; BLTouch preperation
M280 P0 S160												; Precautionary alarm release
M280 P0 S90													; Ensure the pin is raised

; Switch tool if required
if state.currentTool != 0
	T0 P0													; Switch to Tool0 which carries the Z-Probe (P0 skips tool files)

; Park X2 if not at endstop
if !sensors.endstops[3].triggered
    G1 U400 F6000											; Make sure X2 is parked

; Home Z using the Z-Probe
M290 R0 S0													; Reset baby-stepping to 0
G91															; Relative positioning
G1 Z10 F6000 H2												; Lift Z relative to current position
G90															; Absolute positioning
G1 X49.75 Y34.50 F6000										; Move T0 to probing point (X20, Y20), including probe offset
G30															; Probe the bed and set Z to the probe offset
