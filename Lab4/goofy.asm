# Lab 4 - Goofy Array Ops
# B[3] = A[i-j] + A[i+j]

.data
A:       .word 1, 2, 4, 8, 16, 32, 64, 128
B:       .word 0, 0, 0, 0
iValue:  .word 3                  # sample value for i
jValue:  .word 1                  # sample value for j

.text
.globl main
main:
    lw    $s0, iValue             # i
    lw    $s1, jValue             # j
    la    $s2, A                  # start of A
    la    $s3, B                  # start of B

    subu  $t0, $s0, $s1           # find i - j
    sll   $t0, $t0, 2             # each int uses 4 bytes
    addu  $t0, $s2, $t0           # address of A[i-j]
    lw    $t1, 0($t0)             # get A[i-j]

    addu  $t2, $s0, $s1           # find i + j
    sll   $t2, $t2, 2             # change index to bytes
    addu  $t2, $s2, $t2           # address of A[i+j]
    lw    $t3, 0($t2)             # get A[i+j]

    addu  $t4, $t1, $t3           # add the two values
    sw    $t4, 12($s3)            # save answer in B[3]
                                    # sample result: B[3] = 20

    li    $v0, 10                 # exit
    syscall
