.ORIG x3000
; GET PLAYER'S TITLE POSITION
TRAP 0x32

; set Y-coordinate
LD R3 value
ADD R4, R1, #0
TRAP 0x30
multiply_
    ADD R1 R1 R4
    ADD R3 R3 #-1
BRp multiply_

; set X-coordinate

ADD R0, R0 #0
BRn negative_
JSR end_point

; when x-coord is negative
negative_
NOT R0, R0
ADD R0 R0 #1
JSR end_point

end_point
ADD R3 R2 #0 ;store Z-cood to R3
ADD R2 R0 #0
TRAP 0x30

; set Z-coordinate
NOT R3, R3
ADD R3 R3 #1
ADD R0 R3 #0
TRAP 0x30

; teleport to R0, R1, R2
TRAP 0x33

HALT
value .fill 2
.END