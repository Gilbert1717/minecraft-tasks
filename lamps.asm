.ORIG x3000
TRAP 0x32
ADD R0 R0 #2
ADD R5 R1 #0
ADD R2 R2 #2
JSR Lamp
ADD R1 R5 #0
ADD R2 R2 #-4
JSR Lamp
ADD R1 R5 #0
ADD R0 R0 #-4
JSR Lamp
ADD R1 R5 #0
ADD R2 R2 #4
JSR Lamp




HALT
Lamp    
    LD, R3 Stone
    ADD R4 R4 #3
    Lamp_Base
        TRAP 0x35
        ADD R1 R1 #1
        ADD R4 R4 #-1
    BRp Lamp_Base
    LD, R3 Glow
    TRAP 0x35
    RET
Glow .FILL	#89
Stone .FILL	#1



.END