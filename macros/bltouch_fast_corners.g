; bltouch_fast_corners.g
; Macro used to measure the bed corners using an alternative & experimental BLTouch
; mode. This prevents pin retraction at each probe which speeds probing considerably.
;
; WARNING: Use with caution

G28																	; Home all
M557 X20:280 Y20:280 P2												; Override the bed mesh with 4 points
M558 P5 C"^zprobe.in" H0.5 F240 T24000 A5							; Switch Z-Probe to type 5 for fast BLTouch mode
G31 P25 X-29.75 Y-14.50 Z3.80										; Re-Set Z probe trigger value, nozzle offsets, and trigger height
M401																; Deploy the BLTouch pin
G4 P200																; Pause for 200ms
M280 P0 S60															; Enable BLTouch Touch SW Mode
G29																	; Build the bed mesh
M402																; Retract the BLTouch pin
M557 X5:280 Y5:295 P20												; Restore the bed mesh settings
M558 P9 C"^zprobe.in" H10 F480 T12000 A5							; Restore Z-Probe to default settings
G31 P25 X-29.75 Y-14.50 Z3.80										; Re-Set Z probe trigger value, nozzle offsets, and trigger height
