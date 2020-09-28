.text
# .global main
main:
    ADDI R1, R0, 4004       # R1 = array
    ADDI R2, R0, 4004       # R2 = low
    LW R3, 4000(R0)         # R3 = # of numbers to sort
    SLL R3, R3, 2           # Multiply by 4 to go from # of number to # of bytes
    ADD R3, R3, R1          # R3 now equals the last number in the array?
    ADDI R3, R3, -4         # R3 NOW equals the last number in the array
    ADDI R30, R0, 5000      # Stack starts at 5000
    --
    JAL QuickSort
    J End
    --
    LABEL QuickSort
    SW R31, 0(R30)
    ADDI R30, R30, 4        # Increment stack pointer
    SUB R10, R3, R2         # R10 = high - low
    BLEZ R10, EndOfQS       # if high <= low, branch
    --
    LW R4, 0(R3)            # pivot = arr[high]
    ADDI R5, R2, -4         # i = low - 1
    SUB R5, R5, R1
    SUB R6, R2, R1          # j = low - arr 
    --
    LABEL StartOfLoop       # START OF LOOP
    SUB R11, R3, R6         # R11 = high - j
    SUB R11, R11, R1        # R11 = high - j - arr
    BLEZ R11, EndOfLoop     # Exit loop condition
    ADD R14, R6, R1         # R14 = &arr[j]
    LW R8, 0(R14)           # R8 = arr[j]
    SUB R12, R4, R8         # R12 = pivot - arr[j]
    BLTZ R12, EndOfIf
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
    SW R5, 4(R30)           # Save i (pi)
    ADDI R30, R30, 8        # Post Increment
    --
    ADDI R3, R5, -1         # High = pi - 1
    JAL QuickSort
    --
    ADDI R30, R30, -8       # pre decrement for simplicity
    LW R3, 0(R30)           # high = pop high
    LW R2, 4(R30)           # Low = pop pi
    ADDI R2, R2, 1          # Low = pi + 1 
    --
    LABEL EndOfQS
    ADDI R30, R30, -4       # pre decrement for consistency
    LW R31, 0(R30)          # pop return address
    JR R31                  # return
    --
    LABEL End
    HALT
Begin Data 4000 64
15
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
End Data