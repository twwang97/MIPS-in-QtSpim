#################################
#                               #
# If-Else                       #
#                               #
# Author: David Wang            #
# Last updated on Feb. 23, 2023 #
#                               #
#################################

# Objective: Learn Jump instruction (j) in MIPS Assembly

	.data
	
stringa: .asciiz "Enter a number C: "
string1: .asciiz "Enter another number : "
endLine: .asciiz "\n"
string2: .asciiz "C is equal to be: "
string3: .asciiz "C is not equal to be: "

	.text
	
main:

	# Enter the 1st number
	li $v0,4
	la $a0,stringa
	syscall
	li $v0,5
	syscall
	move $t0,$v0

	# Enter the 2nd number
	li $v0,4
	la $a0,string1    
	syscall
	li $v0,5
	syscall
	move $t1,$v0

	beq $t0,$t1, if_label
	j else_label

	if_label:

	li $v0,4
	la $a0,string2
	syscall
	add $a0, $zero, $t0
	li $v0, 1	# print integer
	syscall
	j end_label


else_label:

	li $v0,4
	la $a0,string3
	syscall
	add $a0, $zero, $t1
	li $v0, 1	# print integer
	syscall

end_label:

	li $v0, 10        #exit
	syscall