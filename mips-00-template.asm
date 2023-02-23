#
# Outline of MIPS assembly language program
#
# reference: 
# https://minnie.tuhs.org/CompArch/Resources/mips_quick_tutorial.html
#

##################################
#                                #
# Program Structure =            #
#   data section + code section  #
#                                #
##################################

###################
#
# data section
# 
#   declares variable names used in program; 
#   storage allocated in main memory (RAM)
# 
###################

	.data 	# variable declarations follow this line
			# ...
			
string1: .asciiz "Hello World"

###################
#
# code section
# 
#   includes instructions;
#   starts from label main;
#   ends with system call
# 
###################

	.text 	# instructions follow this line	
			# ...

main: # indicates start of code (first instruction to execute)


	la $a0 , string1        # load address
	syscall	
		 
	li $v0, 10              # system call code for exit = 10
	syscall
	
