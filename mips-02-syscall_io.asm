
#################################
#                               #
# System Calls and I/O          #
#                               #
# Author: David Wang            #
# Last updated on Feb. 22, 2023 #
#                               #
#################################

# Program Stucture = Data Section + Code Section

# Data Section

	.data
	
string1: .asciiz "Enter a number:"
string2: .asciiz "Enter the second number:"
string3: .asciiz "Sum:"
endLine: .asciiz "\n"

# Code Section

	.text
	
main:

	li $v0 , 4				# load appropriate system call code into register $v0; 
							# code in $v0 for printing string is 4
	la $a0 , string1  		# load address of string1 to be printed into $a0
	syscall					# call operating sys

	li $v0 , 5	 			# load appropriate system call code into register $v0; 
							# code in $v0 for reading integer is 5
	syscall
	
	move $t0,$v0            # move integer to be printed into $t0:  $t0 = $vo
	
	li $v0 , 4
	la $a0 , endLine   
	syscall
	
	li $v0 , 4
	la $a0 , string2        
	syscall
	
	li $v0 , 5
	syscall
	
	move $t1,$v0             
	
	li $v0 , 4
	la $a0 , string3
	syscall
	
	add $t2,$t1,$t0			# $t2 = $t1 + $t0
	li $v0, 1			    # load appropriate system call code into register $v0; 
							# code in $v0 for printing integer is 1
	move $a0, $t2			# $a0 = $t2
	syscall
	
		 
	li $v0, 10              # system call code for exit = 10
	syscall
	
