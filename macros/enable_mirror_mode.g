M563 P2 D0:1 H1:2 X0:3 F0:2	S"Duplicate"							; Define a new Tool2 in duplicate mode using both extruders, heaters and fans
G10 P2 X0 Y0 U-150 Z0 R0 S0											; Set Tool2 axis offsets and temperatures
M567 P2 E1:1														; Set mix ratio to 100% for both extruders
T2																	; Select Tool2
