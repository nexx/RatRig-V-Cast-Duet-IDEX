; config.g overrides for PLA filament
;

; Z-Probe offset tuning
G31 P25 X-29.75 Y-14.50 Z3.75										; Set Z probe trigger value, nozzle offsets, and trigger height

; Heater PID tuning
M307 H0 A153.4 C224.4 D2.2 S1.00 V24.1 B0							; PID Tuning for Heater0, Heated Bed (45C)
M307 H1 A495.8 C172.0 D3.8 S1.00 V24.1 B0							; PID Tuning for Heater1, X1 (200C)
M307 H2 A589.3 C216.6 D4.4 S1.00 V24.1 B0							; PID Tuning for Heater1, X2 (200C)

; Additional Settings
M207 P0 S0.7 R0.05 F3000 Z0.20										; Firmware retraction, X1
M207 P1 S0.7 R0.05 F3000 Z0.20										; Firmware retraction, X2
M572 D0:1 S0														; Pressure advance, X1 & X2