; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up

; General preferences
G90																	; Send absolute coordinates...
M83																	; ...but relative extruder moves

; Network
M550 P"VCast"														; Set machine name
M552 S1																; Enable network
M586 P0 S1															; Enable HTTP
M586 P1 S0															; Disable FTP
M586 P2 S0															; Disable Telnet

; Drives
M569 P0 S0															; Drive 0 (Y) goes backwards
M569 P1 S1															; Drive 1 (Z1) goes forwards
M569 P2 S1															; Drive 2 (Z2) goes forwards
M569 P3 S0															; Drive 3 (X) goes backwards
M569 P4 S0															; Drive 4 (U) goes backwards
M569 P5 S1															; Drive 5 (E0) goes forwards
M569 P6 S1															; Drive 6 (E1) goes forwards
M584 X3 Y0 Z1:2 U4 E5:6												; Driver 0=X, 1=Y, 2+4=Z, 5+6=E0+E1
M92 X80 Y80 Z400 U80 E425											; Set steps/mm
M350 X16 Y16 Z16 U16 E16 I1											; Configure micro-stepping with interpolation for all drives
M203 X18000 Y18000 Z18000 U18000 E3600								; Set maximum speeds (mm/min)
M201 X500 Y500 Z100 U500 E10000										; Set accelerations (mm/s^2)
M566 X600 Y600 Z60 U600 E1200										; Set maximum instantaneous speed changes (mm/min)
M906 X2000 Y2000 Z2000 U2000 E500 I25								; Set motor currents (mA) and motor idle factor in per cent
M84 S30																; Set idle timeout

; Axis Limits
M208 X-51.80 Y-26.00 Z0 U0 S1										; Set axes minima
M208 X310 Y320 Z300 U361.2 S0										; Set axes maxima

; Endstops
M574 X1 P"e0stop" S1												; Use an endstop on X, stop at low end
M574 Y1 P"ystop" S1													; Use an endstop on Y, stop at low end
M574 U2 P"e1stop" S1												; Use an endstop on U, stop at high end

; BLTouch Z-Probe
M574 Z1 S2															; Define Z endstop at a probe
M558 P9 C"^zprobe.in" H10 F480 T12000 A5							; Set Z probe to BLTouch, 5mm dive at 8mm/s, 5 attempts
M950 S0 C"duex.pwm5"												; Create a servo pin on Duex PWM5 header
G31 P25 X-29.75 Y-14.50 Z3.775										; Set Z probe trigger value, nozzle offsets, and trigger height
M557 X5:280 Y5:295 P10:10											; Define a 10x10 bed mesh

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 C0 R4700				; Define Sensor0 as the heated bed temperature
M950 H0 C"bedheat" T0												; Define Heater0 as the heated bed, bind to Sensor0
M140 H0 P0															; Define Heated Bed
M307 H0 A476.8 C689.6 D2.1 S1.00 V24.1 B0							; PID Tuning for Heater0, Heated Bed
M143 H0 S120														; Set temperature limit for Heater0 to 120C
M308 S1 P"duex.e2temp" Y"thermistor" B4725 C7.060000e-8		    	; Define Sensor1 as Extruder0 temperature
M950 H1 C"duex.e2heat" T1											; Define Heater1 as Extruder0 heater, bind to Sensor1
M307 H1 A465.0 C164.3 D4.0 S1.00 V24.1 B0							; PID Tuning for Heater1
M143 H1 S285														; Set temperature limit for heater 1 to 285C
M308 S2 P"duex.e3temp" Y"thermistor" B4725 C7.060000e-8	    		; Define Sensor2 as Extruder1 temperature
M950 H2 C"duex.e3heat" T2											; Define Heater2 as Extruder1 heater, bind to Sensor2
M307 H2 A536.8 C191.7 D4.4 S1.00 V24.1 B0							; PID Tuning for Heater2
M143 H2 S285														; Set temperature limit for heater 2 to 285C

; Fans
M950 F0 C"fan0" Q20000												; Define Fan0 for T0 Part Cooling
M106 P0 S0 H-1 C"X1 Part Cooling"									; Set Fan0 to default off, manual control
M950 F1 C"duex.fan3"												; Define Fan1 for T0 Hotend cooling
M106 P1 S1 H1 T45													; Set Fan1 to Thermostatic control, max RPM at 45C
M950 F2 C"fan1" Q20000												; Define Fan2 for T1 Part Cooling
M106 P2 S0 H-1 C"X2 Part Cooling"									; Set Fan2 to default off, manual control
M950 F3 C"duex.fan4"												; Define Fan3 for T1 Hotend cooling
M106 P3 S2 H2 T45													; Set Fan3 to Thermostatic control, max RPM at 45C

; Tools
M563 P0 D0 H1 F0 S"X1"												; Tool0 uses Extruder0, Heater1 and Fan0
G10 P0 X0 Y0 Z0 R0 S0												; Set Tool0 axis offsets and temperatures
M563 P1 D1 H2 X4 F2 S"X2"											; Tool1 uses Extruder1, Heater2 and Fan2. X-axis is mapped to U
G10 P1 X0 Y0 Z0 R0 S0												; Set Tool1 axis offsets and temperatures

; Additional Settings
M671 X-93:393 Y150:150 S2.0											; Define Z-axis leadscrew positions for G32
M404 N1.75															; Define filament diameter for print monitor
