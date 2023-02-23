#################################
#                               #
# Array                         #
#                               #
# Author: David Wang            #
# Last updated on Feb. 23, 2023 #
#                               #
#################################

# The SW instruction stores data 
# to a specified address on the data memory with a possible offset. 

	.data

endLine: 	.asciiz "\n"
stringC: 	.asciiz "C:"
stringB: 	.asciiz "B:"
A:			.word 	3, 4, 5

	.text
	
main:
	
	li $s0,1 # a
	li $s1,4 # b
	add $s0,$s0,$s1 # a = a + b

	la $s3,A # address
	lw $t2,8($s3) # A[2]

	sub $t3,$s0,$s1
	add $t2,$t2,$t3
	
	sw $t2,4($s3)

while_loop:	
	beq $s0,1,endWhile
	
	add $s2,$s0,$s1
	sub $s0,1
	
	li $v0,4
	la $a0,stringC
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	li $v0,4
	la $a0,stringB
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	j while_loop
	
endWhile:
	
	li $v0, 10
	syscall