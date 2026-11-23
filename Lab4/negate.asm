# Lab 4 - Negate an Integer
# Flip the bits, then add 1. No subtraction needed.

.data
value:  .word 37

.text
.globl main
main:
    lw    $s0, value              # load x
    not   $s0, $s0                # flip every bit
    addiu $s0, $s0, 1             # add 1 to finish negating
                                    # addiu allows 32-bit wraparound

    li    $v0, 1                  # print integer
    move  $a0, $s0
    syscall

    li    $v0, 10                 # exit
    syscall
