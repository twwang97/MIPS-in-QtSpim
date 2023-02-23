#################################
#                               #
# Load / Store Instructions     #
#                               #
# Author: David Wang            #
# Last updated on Feb. 22, 2023 #
#                               #
#################################


# Program Stucture = Data Section + Code Section

# Data Section

	.data 	# variable declarations follow this line
			# ...
			
array1:	.space	12		# declare 12 bytes (for 3 integers)

# Code Section

	.text 	# instructions follow this line	
			# ...

main: # indicates start of code (first instruction to execute)
	
	la $t0, array1		#  load base address of array into register $t0
	li $t1, 5			#  $t1 = 5  
	sw $t1, ($t0)		#  first array element set to 5 (indirect addressing)
	li $t1, 13			#  $t1 = 13
	sw $t1, 4($t0)		#  second array element set to 13
	li $t1, -7			#  $t1 = -7
	sw $t1, 8($t0)		#  third array element set to -7
		 
	li $v0, 10          # system call code for exit = 10
	syscall
	
