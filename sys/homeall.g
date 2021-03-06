; homeall.g
; Called to home all axes
;

; BLTouch preperation
M280 P0 S160														; Precautionary alarm release
M280 P0 S90															; Ensure the pin is raised

; Switch tool if required
if state.currentTool != 0
	T0 P0															; Switch to Tool0 which carries the Z-Probe (P0 skips tool files)

; Home X, Y and U simultaneously
G91																	; Relative positioning
G1 Z5 F6000 H2														; Lift Z relative to current position
G1 X-999 Y-999 U999 F6000 H1										; Move Y-axis to the endstop and stop (first pass)
G1 X5 Y5 U-5 F360													; Go back a few mm
G1 X-999 Y-999 U999 F360 H1											; Move Y-axis to the endstop once more (second pass)
G90																	; Absolute positioning

; Home Z using the Z-Probe
M290 R0 S0															; Reset baby-stepping to 0
G1 X34.75 Y19.50 F6000												; Move T0 to probing point (X5, Y5), including probe offset
G30																	; Probe the bed and set Z to the probe offset
G1 X-100 F6000														; Move X1 back to parked position
