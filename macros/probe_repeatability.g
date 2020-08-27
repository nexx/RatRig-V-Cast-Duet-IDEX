; probe_repeatability.g
; Macro used to test the repeatability of the Z-Probe
;

M558 A1 F120												; Set Z-probe to a maximum of 1 probe at 120mm/min dive speed
G1 Z20 F6000												; Raise Z to clear the bed
G1 X179.75 Y164.50 Z15 F6000								; Move to probing point (X150, Y150), including probe offset
G30 P0 Z-9999												; Probe this spot 20 times to gather results
G30 P1 Z-9999
G30 P2 Z-9999
G30 P3 Z-9999
G30 P4 Z-9999
G30 P5 Z-9999
G30 P6 Z-9999
G30 P7 Z-9999
G30 P8 Z-9999
G30 P9 Z-9999
G30 P10 Z-9999
G30 P11 Z-9999
G30 P12 Z-9999
G30 P13 Z-9999
G30 P14 Z-9999
G30 P15 Z-9999
G30 P16 Z-9999
G30 P17 Z-9999
G30 P18 Z-9999
G30 P19 Z-9999 S-1
M558 A5 F480												; Set Z-probe to a maximum of 5 probes at 480mm/min dive speed
