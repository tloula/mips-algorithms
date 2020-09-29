-- Bubble Sort Assembly Program
-- 4000 number of numbers to sort
-- 4004 beginning of array of numbers
-- 5000 beginning of stack
--
-- Register variables
-- R1 = Array
-- R2 = low
-- R3 = high
-- R4 = pivot
-- R5 = i, turns into pi
-- R6 = j, loop variable
-- R7 = arr[i]
-- R8 = arr[j]
-- R9 = arr[high]
-- R10 = high - low
-- R11 = high - j - arr
-- R12 = pivot - arr[j]
-- R13 = &arr[i]
-- R14 = &arr[j]
-- R30 = stack pointer
--
Begin Assembly
ADDI R1, R0, 4004       # R1 = array
ADDI R2, R0, 4004       # R2 = low
LW R3, 4000(R0)         # R3 = # of numbers to sort
SLL R3, R3, 2           # Multiply by 4 to go from # of number to # of bytes
ADD R3, R3, R1          # R3 now equals the last number in the array?
ADDI R3, R3, -4         # R3 NOW equals the last number in the array
ADDI R30, R0, 5000      # Stack starts at 5000
--
JAL QuickSort           # Actual call to recursive QuickSort function
J End                   # Once the above call returns, jump to end
--
LABEL QuickSort
SW R31, 0(R30)          # Since this is a recursive function, save the return address
ADDI R30, R30, 4        # Increment stack pointer
SUB R10, R3, R2         # R10 = high - low
BLEZ R10, EndOfQS       # if high <= low, branch
--
LW R4, 0(R3)            # pivot = arr[high]
ADDI R5, R2, -4         # i = low - 1, except low is an address, not an index
SUB R5, R5, R1          # i = low - 1, now low/i is an index
SUB R6, R2, R1          # j = low - arr 
--
LABEL StartOfLoop       # START OF LOOP
SUB R11, R3, R6         # R11 = high - j
SUB R11, R11, R1        # R11 = high - j - arr
BLEZ R11, EndOfLoop     # Exit loop condition
ADD R14, R6, R1         # R14 = &arr[j]
LW R8, 0(R14)           # R8 = arr[j]
SUB R12, R4, R8         # R12 = pivot - arr[j]
BLTZ R12, EndOfIf       # Jump past the if statement if condition is false
--                      # START OF IF
ADDI R5, R5, 4          # i++
ADD R13, R5, R1         # R13 = &arr[i]
LW R7, 0(R13)           # R7 = *arr[i]
SW R7, 0(R14)           # Swapping arr[i] and arr[j]
SW R8, 0(R13)           # Swapping arr[i] and arr[j]
LABEL EndOfIf           # END OF IF
ADDI R6, R6, 4          # j++
J StartOfLoop           # Loop
--
LABEL EndOfLoop
ADDI R5, R5, 4          # i++
ADD R13, R5, R1         # R13 = &arr[i]
LW R7, 0(R13)           # R7 = *arr[i]
SW R4, 0(R13)           # &arr[i] = pivot
SW R7, 0(R3)            # arr[i] = arr[high]
--
SW R3, 0(R30)           # Save high
SW R5, 4(R30)           # Save i
ADDI R30, R30, 8        # Post Increment
--
ADDI R3, R5, -4         # high = i - 1, except i is an index
ADD R3, R3, R1          # high is an address now
JAL QuickSort           # call quicksort recursively
--
ADDI R30, R30, -8       # Pre decrement for simplicity
LW R3, 0(R30)           # high = pop high
LW R2, 4(R30)           # low = pop i
ADDI R2, R2, 4          # low = i + 1, except i is an index
ADD R2, R2, R1          # low is an address now
JAL QuickSort           # Call QuickSort recursively
--
LABEL EndOfQS
ADDI R30, R30, -4       # Pre decrement for consistency
LW R31, 0(R30)          # Pop return address
JR R31                  # Return
--
LABEL End
HALT
End Assembly
Begin Data 4000 128
32
844
757
420
258
511
404
783
303
476
583
908
504
281
755
618
250
909
982
810
902
310
729
898
683
472
100
434
610
913
966
477
865
End Data