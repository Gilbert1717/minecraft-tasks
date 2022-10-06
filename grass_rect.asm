.ORIG x3000
TRAP 0x32
LD, R4 X_DIST
LD, R5 Z_DIST
ADD R0 R0 R4
ADD R1 R1 #-1
ADD R2 R2 R5
ADD R3 R3 #2

ADD R4 R4 R4
ADD R4 R4 #1 ;width of the rect
ADD R5 R5 R5
ADD R5 R5 #1 ;length of the rect
ADD R6 R5 #0 ;store length
PUT_BLOCK
    ;create line on x-coord
    TRAP 0x35
    ADD R2 R2 #-1
    ADD R5 R5 #-1
    BRp PUT_BLOCK
        ;create line on x-coord -1
        ADD R5 R6 #0
        ADD R2 R2 R5
        ADD R0 R0 #-1
        ADD R4 R4 #-1
        BRp PUT_BLOCK
HALT
SET_BLOCKS
    
        RET
; Note: Please do not change the names of the constants below
X_DIST .FILL #2
Z_DIST .FILL #3
.END