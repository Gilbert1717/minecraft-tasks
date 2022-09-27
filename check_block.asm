.ORIG x3000
; GET PLAYER'S TITLE POSITION
TRAP 0x32
ADD R1 R1 #-1
; get block ID
TRAP 0x34
ADD R4 R3 #-1
BRz STONE_
ADD R4 R3 #-2
BRz GRASS_

LEA R0, NEITHER_STR
JSR	Jump_
STONE_
    LEA R0, STONE_STR
    JSR	Jump_
GRASS_
    LEA R0, GRASS_STR
    JSR	Jump_
; post to chat
Jump_
TRAP 0x31

HALT
STONE_STR .STRINGZ "The block beneath the player tile is stone"
GRASS_STR .STRINGZ "The block beneath the player tile is grass"
NEITHER_STR .STRINGZ "The block beneath the player tile is neither stone nor grass"
.END