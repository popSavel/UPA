.data

     text:  .asciiz "fobik "

.text

main:
	li $v0, 4
    la $a0, text
	li $t2, 6

loop:
    bgt $t0,$t2,exit
	addi $t0,$t0,1
    syscall
    j loop 

exit:
	jr $ra