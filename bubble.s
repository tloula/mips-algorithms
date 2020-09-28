-- Bubble Sort Assembly Program
-- 4000 number of numbers to sort
-- 4004 beginning of array of numbers
--
-- Register variables
-- R1 = n, i.e. size of array
-- R2 = i, outer loop variable
-- R3 = j, inner loop variable
-- R4 = array pointer
-- R5 = x, for swap function
-- R6 = y, for swap function
-- R7 = arr[j]
-- R8 = arr[j+1]
-- R9 = arr[j] - arr[j + 1]
-- R10 = n - i
-- R11 = tmp, for swap function
-- R31 = Return address
--
Begin Assembly
LW R1, 4000(R0)     # R1 = n
SLL R1, R1, 2       # n *= 4 since we're on 4 byte boundaries
ADDI R2, R0, 0      # i = 0
LW R4, 4004(R0)     # TODO: Don't really need this anymore; R4 = array * 
--
LABEL OuterLoop
BEQ R1, R2, PostOuter   # end loop if i == n
SUB R10, R1, R2         # R10 = n - i
--
LABEL InnerLoop
BEQ R10, R3, PostInner  # end loop if j == n - i
--
LW R7, 4004(R3)     # R7 = arr[j]
LW R8, 4008(R3)     # R8 = arr[j + 1]
SUB R9, R7, R8      # R9 = arr[j] - arr[j+1]
BLTZ R9, EndSwap
--
SW R7, 4008(R3)
SW R8, 4004(R3)
--
LABEL EndSwap
ADDI R3, R3, 4  # j++
J InnerLoop # goes back to top of inner loop
--
LABEL PostInner
ADDI R2, R2, 4 # i++
J OuterLoop # goes back to top of outer loop
--
LABEL PostOuter
HALT
End Assembly
Begin Data 4000 68
16
23
71
33
5
93
82
34
13
111
23
8
9
46
75
82
15
End Data