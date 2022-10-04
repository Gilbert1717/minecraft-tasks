.ORIG x3000
; GET PLAYER'S TITLE POSITION
TRAP 0x32
ADD R0, R0, #1
ADD R2, R2, #1
ADD R3, R3, #1
LD, R4 STAIRS_HEIGHT ;height of the stair
LD, R5 STAIRS_WIDTH ;width of the stair
LD, R6 STAIRS_LENGTH;height of the stair
ST, R6 TEMP_LENGTH


ST, R0, START_X
ST, R2, START_Z


    PUT_BLOCK
    ;create line on x-coord
    TRAP 0x35
    ADD R2 R2 #1
    ADD R6 R6 #-1
    ; TRAP 0x30
    BRp PUT_BLOCK
        ; create line on x-coord -1
        LD, R6 TEMP_LENGTH ;width of the stair
        LD, R2, START_Z
        ADD R0 R0 #1
        ADD R5 R5 #-1
        BRp PUT_BLOCK
            LD, R6 TEMP_LENGTH
            ADD, R6, R6, #-1
            ST, R6 TEMP_LENGTH
            LD, R0, START_X
            LD, R2, START_Z
            LD, R5, STAIRS_WIDTH
            ADD, R2, R2, #1
            ST, R2, START_Z
            ADD, R1, R1, #1
            ADD, R4, R4, #-1
            BRp PUT_BLOCK

HALT
; Note: Please do not change the names of the constants below
STAIRS_WIDTH .FILL #2
STAIRS_LENGTH .FILL #4
STAIRS_HEIGHT .FILL #3
TEMP_LENGTH .FILL x3099
START_X .FILL	x3100
START_Z .FILL	x3101

.END