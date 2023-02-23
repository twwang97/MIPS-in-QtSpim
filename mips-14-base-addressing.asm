#################################
#                               #
# MIPS Addresses                #
#                               #
# Author: David Wang            #
# Last updated on Feb. 23, 2023 #
#                               #
#################################

# An instruction that refers to memory uses a base register and an offset. 
# The base register is a general purpose register that contains a 32-bit address. 
# The offset is a 16-bit signed integer contained in the instruction. 
# The sum of the address in the base register with the (sign-extended) offset forms the memory address.

	.data
	
endLine: .asciiz "\n"

	.text
	
main:

	li $t9,0x10000000 # base address
	
	li $t0,15
	sw $t0,24($t9)
	
	li $t0,25
	sw $t0,28($t9)
	
	lw $t1,24($t9)
	lw $t2,28($t9)
	sw $t1,28($t9)
	sw $t2,24($t9)
	
	lw $t1,24($t9)
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	lw $t1,28($t9)
	li $v0,1
	move $a0,$t1
	syscall
		
	li $v0, 10 # exit
	syscall