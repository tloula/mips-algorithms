-- Bubble Sort Assembly Program
-- 4000 number of numbers to sort
-- 4004 beginning of array of numbers
--
-- Register variables
-- R1 = n/n - 1, i.e. size of array
-- R2 = i, outer loop variable
-- R3 = j, inner loop variable
-- R4 = array pointer
-- R7 = arr[j]
-- R8 = arr[j+1]
-- R9 = arr[j] - arr[j + 1]
-- R10 = n - i - 1
-- R11 = tmp, for swap function
-- R31 = Return address
--
Begin Assembly
LW R1, 4000(R0)         # R1 = n
SLL R1, R1, 2           # n *= 4 since we're on 4 byte boundaries
ADDI R1, R1, -4         # n -= 1
ADDI R2, R0, 0          # i = 0
--
LABEL OuterLoop
BEQ R1, R2, PostOuter   # end loop if i == n - 1
SUB R10, R1, R2         # R10 = n - i - 1
ADDI R3, R0, 0          # j = 0 (Very important)
--
LABEL InnerLoop
BEQ R10, R3, PostInner  # end loop if j == n - i
--
LW R7, 4004(R3)         # R7 = arr[j]
LW R8, 4008(R3)         # R8 = arr[j + 1]
SUB R9, R7, R8          # R9 = arr[j] - arr[j+1]
BLTZ R9, EndSwap        # jump past swap "function" if condition is false
--
SW R7, 4008(R3)         # these two stores perform the swap
SW R8, 4004(R3)         # these two stores perform the swap
--
LABEL EndSwap
ADDI R3, R3, 4          # j++
J InnerLoop             # goes back to top of inner loop
--
LABEL PostInner
ADDI R2, R2, 4          # i++
J OuterLoop             # goes back to top of outer loop
--
LABEL PostOuter
HALT
End Assembly
Begin Data 4000 68
16
864
394
776
911
430
41
265
988
523
497
414
940
802
849
310
991
End Data