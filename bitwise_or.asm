.ORIG x3000
TRAP 0x32

; get 1st Block
ADD R0 R0 #1
ADD R1 R1 #-1
TRAP 0x34
ADD R4 R3 #0 ;store block ID in R4

; get 2nd Block
AND R0 R0 #1
TRAP 0x34

NOT R3 R3
NOT R4 R4
AND R3 R3 R4
NOT R3 R3

; place new block
ADD R0 R0 #1
TRAP 0x35


HALT
.END