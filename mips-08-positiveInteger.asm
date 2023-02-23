#################################
#                               #
# If-Else                       #
#                               #
# Author: David Wang            #
# Last updated on Feb. 23, 2023 #
#                               #
#################################

# Objective: The BEQ instruction branches the PC 
# 			if the first source register's contents 
#           and the second source register's contents are equal.

	.data
	
string1: .asciiz "Enter a number : "
endLine: .asciiz "\n"
string2: .asciiz "Addition result is  : "
string3: .asciiz "Substraction result is : "
string4: .asciiz "Your second number is greater than your first number and then you can not sub these two numbers : "

	.text
	
main:
	j EnterOneNumber

EnterOneNumber:
	li $v0,4
	la $a0,string1		# cout << Enter a number
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0,4
	la $a0,string1    	# cout << Enter a number
	syscall

	li $v0,5
	syscall
	move $t1,$v0

	beq $t0,$t1, Addition
	j Substraction



Addition:
	add $t2,$t1,$t0
	li $v0,4
	la $a0,string2    # cout<<Addition result is 
	syscall

	li $v0,1
	move $a0,$t2
	syscall
	j end_label



# bgt: Conditionally branch to the instruction at the label if the contents of register Rsrc1 are greater than Src2.

Substraction:
	bgt $t1,$t0, EnterOneNumber2
	j SUB2

	SUB2:
	sub $t2,$t0,$t1
	li $v0,4
	la $a0,string3    # cout<<Addition result is 
	syscall

	li $v0,1
	move $a0,$t2
	syscall
	j end_label

EnterOneNumber2:
	li $v0,4
	la $a0,string4
	syscall

	li $v0,4
	la $a0,endLine
	syscall

	li $v0,4
	la $a0,string1
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0,4
	la $a0,string1    #cout<<Enter a number
	syscall

	li $v0,5
	syscall
	move $t1,$v0
	j Substraction


	end_label:
	li $v0, 10 	#exit
	syscall