.ORIG x3000
TRAP 0x32

ADD R1 R1 #-1
LD R4 LINE_LEN


LOOP_
ADD R0 R0 #1
TRAP 0x34 ;get block ID
ADD R3 R3 #1
TRAP 0x35 ;set block with ID + 1
ADD R4 R4 #-1
BRp LOOP_

HALT
LINE_LEN .FILL #5 ; Note: Please do not change the name of this constant
.END