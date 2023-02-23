#################################
#                               #
# Function                      #
#                               #
# Author: David Wang            #
# Last updated on Feb. 23, 2023 #
#                               #
#################################

# "jr $ra" jumps back to that address
# "jal label" represents "link and jump", which stores return address in register ($ra)
# (jal step 1) link: Save address of next instruction into $ra
# (jal step 2) jump: Jump to the given label

	.data
	
string1: .asciiz "Enter a number:"
string2: .asciiz "Sum of digits = " # 
string3: .asciiz "Original number = " # 
endLine: .asciiz "\n"

	.text

sumFunc: 
	add $v0,$a0,$a1 # (int a0,int a1)
    jr $ra	
	
main:
	li $v0,4
	la $a0,string1
	syscall	
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,string1
	syscall	
	
	li $v0,5
	syscall
	move $t1,$v0
	
	move $a0,$t0
	move $a1,$t1
	
	# t2 = sumFunc(a0,a1) 
	jal sumFunc
	move $t2,$v0 
	
	li $v0,1
	move $a0,$t2
	syscall # Result
	
	li $v0,10
	syscall