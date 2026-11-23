# Lab 4 - Signed Min/Max
# Go through the array and keep the smallest and largest values.

.data
length:  .word 8
array:   .word 5, -3, 12, -40, 7, 0, 33, -8
minMsg:  .asciiz "Min: "
maxMsg:  .asciiz "\nMax: "

.text
.globl main
main:
    lw    $s1, length             # get array length
    la    $s2, array              # start of array
    lw    $s3, 0($s2)             # min = array[0]
    lw    $s4, 0($s2)             # max = array[0]
    li    $s0, 1                  # i = 1

checkNext:
    slt   $t0, $s0, $s1           # is i < length?
    beq   $t0, $zero, showResult  # stop when done

    sll   $t1, $s0, 2             # i * 4 bytes
    addu  $t1, $s2, $t1           # address of array[i]
    lw    $t2, 0($t1)             # get array[i]

    slt   $t3, $t2, $s3           # is current < min (signed)?
    bne   $t3, $zero, newMin      # update min if yes

    slt   $t3, $s4, $t2           # otherwise is current > max?
    bne   $t3, $zero, newMax      # update max if yes
    j     nextItem                # no change needed

newMin:
    move  $s3, $t2                # min = array[i]
    j     nextItem

newMax:
    move  $s4, $t2                # max = array[i]

nextItem:
    addiu $s0, $s0, 1             # i++
    j     checkNext

showResult:
    li    $v0, 4                  # print "Min: "
    la    $a0, minMsg
    syscall

    li    $v0, 1                  # print min
    move  $a0, $s3
    syscall

    li    $v0, 4                  # print "Max: " on next line
    la    $a0, maxMsg
    syscall

    li    $v0, 1                  # print max
    move  $a0, $s4
    syscall

    li    $v0, 10                 # exit
    syscall
