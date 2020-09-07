; tpost1.g
; Called after activating tool 1
;

M703														; Apply the tuning config.g for the loaded filament
M106 R2														; Restore part cooling on this tool
M116 P1														; Wait for this tool to reach printing temperature
