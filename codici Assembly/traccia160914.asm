%include "utils.nasm"

section .data
    V dd 
    W dw
    n equ ($-W)/2
section .bss
    Z resw n
section .text
global _start
_start:
    