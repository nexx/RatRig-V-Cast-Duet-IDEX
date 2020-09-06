; unload.g
; Used to unload filament from an extruder.
;

; Make sure the extruders are at their home positions
if !move.axes[0].homed
	G28 X															; Home X
elif !sensors.endstops[0].triggered
	G1 X-100 F6000													; Move X to parking position

if !move.axes[3].homed
	G28 U															; Home U
elif !sensors.endstops[3].triggered
	G1 U400 F6000													; Move U to parking position

; Run filament unload procedure
M291 P"Heating nozzle to 100C..." R"Please wait" T0					; Display message
G10 S100															; Heat the current tool to 100C
M116																; Wait for nozzle to reach temperature
M291 P"Unloading filament..." R"Please wait" T0						; Update message
G1 E-20 F300														; Slowly retract 20mm of filament
G1 E-120 F3000														; Retract the remaining filament
M400																; Wait for all moves to finish
M291 P"Complete. Cooling nozzle." R"Unloading filament" T5			; Update message
G10 S0																; Disable the heater
M84 E0:1															; Disable the extruder steppers
