.ORIG x3000
LD R3, GOAL_X
NOT R3, R3
ADD R3, R3 #1

LD R4, GOAL_Z
NOT R4, R4
ADD R4, R4 #1

LOOP_
TRAP 0x32
ADD R0, R0, R3
TRAP 0x30
BRnp LOOP_

ADD R2, R2, R4
BRnp LOOP_

LEA R0 STRING
TRAP 0x31

HALT
; Note: Please do not change the names of the constants below
;prepare for subtraction
; GOAL_X .FILL #4
; GOAL_Z .FILL #-5
GOAL_X .FILL #10
GOAL_Z .FILL #1
STRING .STRINGZ	"goal reached"
.END