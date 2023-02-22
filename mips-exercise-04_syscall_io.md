# System Calls and I/O

* Author: David Wang
* Last updated on Feb. 22, 2023

---

# System Calls
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