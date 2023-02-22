# Load / Store Instructions 
* Objective: RAM access is only allowed with load and store instructions
* Author: David Wang
* Last updated in Feb. 22, 2023

# A. load

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
	
#### (A2) copy byte at source RAM location to low-order byte of destination register, and sign-extend to higher-order bytes
```
lb	register_destination, RAM_source
```

#### (A3) load immediate value into destination register. 
```
li	register_destination, value
```

#### (A4) copy RAM address of var1 (presumably a label defined in the program) into register $t0
```
la	$t0, var1
```


# B. store

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

#### (B2) store byte (low-order) in source register into RAM destination
```
sb	register_source, RAM_destination
```