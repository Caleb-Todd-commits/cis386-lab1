# Lab 4 - Count NonZeros
# Keep going until the first 0 shows up.

.data
array:    .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0
countMsg: .asciiz "Count: "

.text
.globl main
main:
    li    $s0, 0                  # i = 0
    la    $s1, array              # start of array

checkNext:
    sll   $t0, $s0, 2             # i * 4 bytes
    addu  $t0, $s1, $t0           # address of array[i]
    lw    $t1, 0($t0)             # read array[i]
    beq   $t1, $zero, showCount   # stop when we find 0

    addiu $s0, $s0, 1             # i++
    j     checkNext               # check another number

showCount:
    li    $v0, 4                  # print "Count: "
    la    $a0, countMsg
    syscall

    li    $v0, 1                  # print i
    move  $a0, $s0
    syscall

    li    $v0, 10                 # exit
    syscall
