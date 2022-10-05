.ORIG x3000
TRAP 0x32
ADD R0, R0, #1
ADD R1, R1, #-1
ADD R2, R2, #1
ADD R4, R1, #0
NOT R4, R4
ADD R4, R4, #1 
ADD R5, R5, #3
ST R5, Z_BUFFER
LINE_CHECK
    LD R6, DIMENSION
    POINT_CHECK

    TRAP 0x36
    ADD R5, R1, R4
        LD, R3, GRASS
        ADD R5, R5, #0
        BRn INCRE 
        LD, R3, AIR
        ADD R5, R5, #0
        BRp DECRE
    JSR X_MOVE

        INCRE
            ADD R1 R1 #1
            ADD R5 R5 #1
            TRAP 0x35
            BRn INCRE
            JSR X_MOVE
        DECRE
            TRAP 0x35
            ADD R1 R1 #-1
            ADD R5 R5 #-1
            BRp DECRE
            JSR X_MOVE
            
        X_MOVE
            ADD R0, R0, #-1
            ADD R6, R6, #-1
            BRp POINT_CHECK
ADD R0, R0, #3
ADD R2, R2, #-1
LD R5, Z_BUFFER
ADD R5, R5, #-1
ST R5, Z_BUFFER
BRp LINE_CHECK





HALT
DIMENSION .FILL	3
GRASS .FILL	2
AIR .FILL	0
Z_BUFFER .FILL	x3050


.END