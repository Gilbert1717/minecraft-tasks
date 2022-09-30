.ORIG x3000
TRAP 0x32
LD, R3 G_X
NOT R3, R3
ADD R3, R3, #1
ADD R5, R0, R3
JSR Square
ADD R0, R3, #0

LD, R3 G_Y
NOT R3, R3
ADD R3, R3, #1
ADD R5, R1, R3
JSR Square
ADD R1, R3, #0

LD, R3 G_Z 
NOT R3, R3
ADD R3, R3, #1
ADD R5, R2, R3
JSR Square
ADD R2, R3, #0

;sum (x - G_X)^2 , (y - G_Y)^2, (z - G_Z)^2 up
ADD R0, R0, R1
ADD R0, R0, R2

LD, R5 GOAL_DIST
JSR Square
NOT R3, R3
ADD R3, R3, #1
ADD R0, R0, R3
BRn Reach_

LEA	R0,	OUT_DIST
JSR Print_

Reach_
    LEA	R0,	IN_DIST

Print_
TRAP 0x31

HALT
;R3 and R4 for the result and loop number R5 for the coord-number
Square
        ADD R3 R5 #0
        TRAP 0x30
        ADD R4 R5 #-1
        LOOP
        ADD R3 R3 R5
        ADD R4 R4 #-1
        BRp LOOP
        RET

; Note: Please do not change the names of the constants below
G_X .FILL #7
G_Y .FILL #-8
G_Z .FILL #5
GOAL_DIST .FILL #10


IN_DIST .STRINGZ	"The player is within distance of the goal"
OUT_DIST .STRINGZ	"The player is outside the goal bounds"
.END