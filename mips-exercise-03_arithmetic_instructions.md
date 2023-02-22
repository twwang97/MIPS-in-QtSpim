# Arithmetic Instructions

* Author: David Wang
* Last updated on Feb. 22, 2023

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
