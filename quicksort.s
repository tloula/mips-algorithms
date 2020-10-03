-- Bubble Sort Assembly Program
-- 4000 number of numbers to sort
-- 4004 beginning of array of numbers
-- 5000 beginning of stack
--
-- Register variables
-- R1 = Array
-- R2 = low pointer
-- R3 = high pointer
-- R4 = pivot
-- R5 = i, it is actually a pointer to arr[i]
-- R6 = j, loop variable, also a pointer to arr[j]
-- R7 = arr[i]
-- R8 = arr[j]
-- R9 = arr[high]
-- R10 = high - low
-- R11 = high - j - arr
-- R12 = pivot - arr[j]
-- R30 = stack pointer
--
Begin Assembly
ADDI R1, R0, 4004       # R1 = array pointer, arr[0]
ADDI R2, R0, 4004       # R2 = low pointer arr[0] initially
LW R3, 4000(R0)         # R3 = # of numbers to sort
SLL R3, R3, 2           # Multiply by 4 to go from # of numbers to # of bytes
ADD R3, R3, R1          # R3 now equals the last number in the array + 1
ADDI R3, R3, -4         # R3 NOW equals high pointer or arr[last]
ADDI R30, R0, 5000      # Stack starts at 5000
--
JAL QuickSort           # Actual call to recursive QuickSort function
J End                   # Once the above call returns, jump to end
--
LABEL QuickSort
SW R31, 0(R30)          # Since this is a recursive function, save the return address
ADDI R30, R30, 4        # Increment stack pointer
SUB R10, R3, R2         # R10 = high - low
BLEZ R10, EndOfQS       # if high <= low, then branch
--
LW R4, 0(R3)            # pivot (R4) = arr[high]
ADDI R5, R2, -4         # i = low - 1, i is an address, not an index
ADDI R6, R2, 0          # j = low 
--
LABEL StartOfLoop       # START OF LOOP
SUB R11, R3, R6         # R11 = high - j (if j < high)
BLEZ R11, EndOfLoop     # Exit loop if j not less than high
LW R8, 0(R6)            # R8 = arr[j]
SUB R12, R4, R8         # R12 = pivot - arr[j] (setting up for "if arr[j] <= pivot")
BLTZ R12, EndOfIf       # Jump past the if statement if condition is false
--                      # START OF IF
ADDI R5, R5, 4          # i++
LW R7, 0(R5)            # R7 = arr[i]
SW R7, 0(R6)            # arr[i] = arr[j]
SW R8, 0(R5)            # arr[j] = arr[i]
LABEL EndOfIf           # END OF IF
ADDI R6, R6, 4          # j++
J StartOfLoop           # Loop
--
LABEL EndOfLoop
ADDI R5, R5, 4          # i++
LW R7, 0(R5)            # R7 = arr[i]
SW R4, 0(R5)            # arr[i] = pivot
SW R7, 0(R3)            # arr[high] = arr[i]
--
SW R3, 0(R30)           # Save high
SW R5, 4(R30)           # Save i
ADDI R30, R30, 8        # Post Increment
--
ADDI R3, R5, -4         # high = i - 1, i is an address
JAL QuickSort           # call quicksort recursively
--
ADDI R30, R30, -8       # Pre decrement for simplicity
LW R3, 0(R30)           # high = pop high
LW R2, 4(R30)           # low = pop i
ADDI R2, R2, 4          # low = i + 1, i is an address
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
Begin Data 4000 68
16
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
End Data