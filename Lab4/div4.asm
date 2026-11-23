# Lab 4 - Divisible by 4
# A number is divisible by 4 when its last 2 bits are 0.

.data
length:  .word 10
array:   .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24

.text
.globl main
main:
    li    $s0, 0                  # i = 0
    lw    $s1, length             # length = 10
    li    $s2, 0                  # count = 0
    la    $t0, array              # start of array

checkNext:
    slt   $t1, $s0, $s1           # is i < length?
    beq   $t1, $zero, showCount   # stop at end of array

    sll   $t2, $s0, 2             # i * 4 bytes
    addu  $t2, $t0, $t2           # address of array[i]
    lw    $t3, 0($t2)             # get current number
    andi  $t4, $t3, 3             # check last 2 bits
    bne   $t4, $zero, nextItem    # skip if not divisible by 4

    addiu $s2, $s2, 1             # count++

nextItem:
    addiu $s0, $s0, 1             # i++
    j     checkNext

showCount:
    li    $v0, 1                  # print count
    move  $a0, $s2
    syscall

    li    $v0, 10                 # exit
    syscall
