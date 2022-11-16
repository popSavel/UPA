.data

     text:  .asciiz "Enter a number: "
	 yes:	.asciiz "primary number"
	 no:	.asciiz "not a primary number"
	 printl: .asciiz "\n"

.text

main:
	#vypis hlasky
    li $v0, 4
    la $a0, text
    syscall  
	
	#nacteni vstupu
	li $v0, 5
    syscall
	
	# presun vstupu
	move $t0, $v0
	
	#0 a 1 specialni pripad, nejsou prvocisla
	beq	 $t0,0,nonprime
	beq	 $t0,1,nonprime
	
	#promenne pro cyklus - od 2 do vstup-1
	move $t1, $t0
	addi $t1, $t1, -1
	li $t2, 2
	
loop:
    bgt $t2,$t1,prime
	div $t0,$t2
	#zbytek po deleni
	mfhi $a2
	beq $a2,0,nonprime
	addi $t2,$t2,1
    j loop 
			
	
nonprime:
	li $v0, 4
	la $a0, no
	syscall
	
	#odradkovani
	li $v0, 4
    la $a0, printl
    syscall
	j main

prime:
	li $v0, 4
	la $a0, yes
	syscall
	
	#odradkovani
	li $v0, 4
    la $a0, printl
    syscall
	j main
	
exit:	
	jr $ra