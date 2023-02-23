# MIPS in QtSpim: Exercise

* Assembly Language: ```MIPS```
* Simulator that runs MIPS32 programs: ```QtSpim```

# MIPS Quick Tutorial
#### [Registers](#registers-1)
#### [Data Transfer](#load--store-instructions)
#### [Arithmetic Instructions](#arithmetic-instructions-1)
#### [System Call](#system-calls-and-i--o)
Tha summarized table of MIPS instruction set could be found [here](#registers-1)

# Data types:

* Instructions are all 32 bits
* byte (**8 bits**), halfword (**2 bytes**), word (**4 bytes**)
* a character requires **1 byte** of storage
* an integer requires 1 word (**4 bytes**) of storage

---

# Registers
* 32 general-purpose registers
* register preceded by $ in assembly language instruction
<br>

(column name) <br> 

```Register Number``` , (Full) **Name** , Description <br>

```0``` , **zero** , the value 0 <br>

```1``` , (assembler temporary) **at** , **reserved** by the assembler <br>

```2, 3``` , (values) **$vo, $v1** , from expression evaluation and function results <br>

```4, 5, 6, 7``` , (arguments) **$a0, $a1, $a2, $a3** ,  First four parameters for subroutine. <br>

```8, 9, ..., 15``` , (temporaries) **$t0, $t1, ..., $t7** , Caller saved if needed. Subroutines can use w/out saving. <br>

```16, 17, ..., 23``` , (saved values) **$s0, $s1, ..., $s7** , Callee saved. **Preserved** across procedure calls <br>

```24, 25``` , (temporaries) **$t8, $t9** , Caller saved if needed. <br>

```26, 27``` , **$k0, $k1** , **reserved** for use by the interrupt/trap handler <br>

``` 28 ``` , (global pointer) **$gp** , Points to the middle of the 64K block of memory in the static data segment. <br>

``` 29 ``` , (stack pointer) **$sp** , Points to last location on the stack <br>

``` 30 ``` , (frame pointer) **$fp** , **Preserved** across procedure calls <br>

``` 31 ``` , (return address) **$ra** , return address <br>

---

# Load / Store Instructions 


## A. load

#### (A1) copy word (4 bytes) at source RAM location to destination register.
```
lw	register_destination, RAM_source
```
* E.g., load word at RAM address contained in $t0 into $t2 
```
lw	$t2, ($t0)
```
* E.g., load word at RAM address ($t0+4) into register $t2, where "4" gives offset from address in register $t0 (indirect addressing)
```
lw	$t2, 4($t0)
```


---

#### (A2) copy byte at source RAM location to low-order byte of destination register, and sign-extend to higher-order bytes
```
lb	register_destination, RAM_source
```

---

#### (A3) load immediate value into destination register. 
```
li	register_destination, value
```

---

#### (A4) copy RAM address of var1 (presumably a label defined in the program) into register $t0
```
la	$t0, var1
```

---


## B. store

#### (B1) store word in source register into RAM destination
```
sw	register_source, RAM_destination
```
* E.g., store word in register $t2 into RAM at address contained in $t0
```
sw	$t2, ($t0)
```
* E.g., store word in register $t2 into RAM at address ($t0 - 12) (indirect addressing)
```
sw	$t2, -12($t0)
```

---

#### (B2) store byte (low-order) in source register into RAM destination
```
sb	register_source, RAM_destination
```

---

# Arithmetic Instructions

* most use 3 operands
* all operands are registers
* no RAM or indirect addressing
* operand size is word (4 bytes)

---

(1) add as signed (2's complement) integers
* e.g.,  $t0 = $t1 + $t2
```
add	$t0,$t1,$t2
``` 

(2) $t2 = $t3 - $t4
```
sub	$t2,$t3,$t4
```

(3) add immediate (Warning: there is no sub immediate)
* e.g., $t2 = $t3 + 5
```	
addi	$t2,$t3, 5	
```

(4) add as unsigned integers
* e.g., $t1 = $t6 + $t7
```
addu	$t1,$t6,$t7	
```

(5) subtract as unsigned integers
* e.g., $t1 = $t6 - $t7
```
subu	$t1,$t6,$t7	
```

(6) multiply 32-bit quantities in $t3 and $t4, and store the 64-bit result in special registers Lo and Hi:  
* (Hi,Lo) = $t3 * $t4
```
mult	$t3,$t4
```

(7) Division
* Lo = $t5 / $t6   (integer quotient)
* Hi = $t5 mod $t6   (remainder)
```
div	$t5,$t6
```

(8) move quantity in special register Lo to $t1 (i.e., $t1 = Lo) in order to get at result of product or quotient
```
mflo	$t1
```

(9) move quantity in special register Hi to $t0 ,
* i.e., $t0 = Hi
```
mfhi	$t0
```	

(10) move quantity $t2 = $t3
```
move	$t2,$t3
```

---

# System Calls and I/O

* used to read or print values or strings from input/output window, and indicate program end
* use syscall operating system routine call
* first supply appropriate values in registers ```$v0, $a0, $a1```
* result value (if any) returned in register ```$v0```

---

### **syscall** services
(column name) 
<br>
```Code in $v0```, Service, Description 
<br>
```1``` , **print_int**, $a0 = integer to be printed
<br>
```2``` , **print_float**, $f12 = float to be printed
<br>
```3``` , **print_double**, $f12 = double to be printed
<br>
```4``` , **print_string**, $a0 = address of string in memory
<br>
```5``` , **read_int**, integer returned in $v0
<br>
```6``` , **read_float**, float returned in $v0
<br>
```7``` , **read_double**, double returned in $v0
<br>
```8``` , **read_string**, $a0 = memory address of string input buffer, $a1 = length of string buffer (n)
<br>
```9``` , **sbrk**, $a0 = amount
<br>
```10``` , **exit**,
<br>

# References: 
[1] MIPS Architecture and Assembly Language [Tutorial](https://minnie.tuhs.org/CompArch/Resources/mips_quick_tutorial.html) <br>
[2] MIPS Examples from [ffcabbar's Github](https://github.com/ffcabbar/MIPS-Assembly-Language-Examples) <br>
[3] Merge Sort from [henrykorir's Github](https://github.com/henrykorir/MergeSortInMIPS) <br>
