# Introduction

* Author: David Wang
* Last updated on Feb. 22, 2023

## Data types:

* Instructions are all 32 bits
* byte (**8 bits**), halfword (**2 bytes**), word (**4 bytes**)
* a character requires **1 byte** of storage
* an integer requires 1 word (**4 bytes**) of storage

---

## Registers
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
