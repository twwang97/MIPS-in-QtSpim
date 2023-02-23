#################################
#                               #
# Integer Multiplication        #
#                               #
# Author: David Wang            #
# Last updated on Feb. 22, 2023 #
#                               #
#################################

# Program Stucture = Data Section + Code Section

# Data Section

	.data
	
string1: .asciiz "(Lo, Hi)\n"
endNewLine: .asciiz "\n"

# Code Section

	.text
	
main:
	
	# add immediate
	addi $t0, $zero, 19
	addi $t1, $zero, 18
	
	mult $t0, $t1
	
	li $v0, 4			# print string
	la $a0, string1
	syscall
	
	#  move quantity in special register Lo to $s0: $s0 = Lo
	mflo $s0
	li $v0, 1				# print integer
	add $a0, $zero, $s0
	syscall
	
	li $v0, 4			# print string
	la $a0, endNewLine
	syscall
	
	#  move quantity in special register Lo to $s0: $s0 = Hi
	mfhi $s0
	li $v0, 1				# print integer
	add $a0, $zero, $s0
	syscall
	
	li $v0, 10              # system call code for exit = 10
	syscall
	
	

