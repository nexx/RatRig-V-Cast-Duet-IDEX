; load.g
; Used to load filament into an extruder.
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

; Run filament load procedure
M291 P"Heating nozzle to 200C..." R"Please wait" T0					; Display message
G10 S200															; Heat the current tool to 200C
M116																; Wait for nozzle to reach temperature
M291 P"Please load filament into the extruder and click OK" S2		; Wait for user to continue
M291 P"Loading filament..." R"Please wait" T0						; Update message
G1 E20 F120															; Slowly load 20mm of filament
G1 E80 F3000														; Quickly load filament to nozzle
M400																; Wait for all moves to finish
M291 P"Purging nozzle..." R"Please wait" T0							; Update message
G1 E50 F120															; Complete load and purge the nozzle
M400																; Wait for all moves to finish
G4 P1000															; Wait for 1000ms
G1 E-4 F1800														; Retract to prevent oozing
M400																; Wait for all moves to finish
M291 P"Complete. Cooling nozzle." R"Loading filament" T5			; Update message
G10 S0																; Disable the heater
M84 E0:1															; Disable the extruder steppers

