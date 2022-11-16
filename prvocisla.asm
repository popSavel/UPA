.data

     text:  .asciiz "Enter a number: "

.text

main:
    li $v0, 4
    la $a0, text
    syscall  
	
	li $v0, 5
    syscall
	
	# Moving the integer input to another register
	move $t0, $v0
	move $t1, $t0
	addi $t1, $t1, -1
	li $t2, 2
	
	li $v0, 1 #vypis
    move $a0, $t1 #vypis
	syscall
	
loop:
    bgt $t2,$t1,exit
	div $t0,$t2
	mfhi $a2
	move $a0, $a2
    syscall
	addi $t2,$t2,1
    j loop 
	
	
exit:	
	jr $ra