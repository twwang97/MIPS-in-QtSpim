#################################
#                               #
# Division                      #
#                               #
# Author: David Wang            #
# Last updated on Feb. 22, 2023 #
#                               #
#################################

	.data
	
string1: 		.asciiz "Enter the 1st number (s0): "
string2: 		.asciiz "Enter the 2nd number (s1): "
string3: 		.asciiz "Division: "
string4: 		.asciiz "Remainder: "
equalString: 	.asciiz " = "
timesString: 	.asciiz " * "
plusString: 	.asciiz " + "
finalString: 	.asciiz "Final Result: "
endLine: 		.asciiz "\n"

	.text
	
main:

	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
		
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 5	
	syscall
	move $s1, $v0
	
	# Division
	# t0 = s0 / s1
	div $t0,$s0,$s1  

	#  move quantity in special register Lo
	mflo $s2
	li $v0, 1				# print integer
	add $a0, $zero, $s2
	syscall
	
	li $v0, 4
	la $a0, endLine
	syscall
	
	#  move quantity in special register Hi
	mfhi $s3
	li $v0, 1				# print integer
	add $a0, $zero, $s3
	syscall
	
	li $v0, 4
	la $a0, endLine
	syscall
	
	# Print finals
	li $v0, 4
	la $a0, finalString
	syscall
	add $a0, $zero, $s0
	li $v0, 1	# print integer
	syscall
	li $v0, 4
	la $a0, equalString
	syscall
	add $a0, $zero, $s1
	li $v0, 1	# print integer
	syscall
	li $v0, 4
	la $a0, timesString
	syscall
	add $a0, $zero, $s2
	li $v0, 1	# print integer
	syscall
	li $v0, 4
	la $a0, plusString
	syscall
	add $a0, $zero, $s3
	li $v0, 1	# print integer
	syscall
	
	li $v0, 10 # exit
	syscall