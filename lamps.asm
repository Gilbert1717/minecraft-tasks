.ORIG x3000

TRAP 0x32
ADD R0 R0 #2
ADD R2 R2 #2
ADD R3 R3 #1
LD, R4 STONE_level
Lamp_Base
    JSR Lamp
    ADD R4 R4 #-1
BRp Lamp_Base
LD, R3 Glow
JSR Lamp



HALT
Lamp    
    TRAP 0x35
    ADD R2 R2 #-4
    TRAP 0x35
    ADD R0 R0 #-4
    TRAP 0x35
    ADD R2 R2 #4
    TRAP 0x35
    ADD R0 R0 #4
    ADD R1 R1 #1
    RET
STONE_level .FILL #3
Glow .FILL	#89
CL .FILL Lamp


.END