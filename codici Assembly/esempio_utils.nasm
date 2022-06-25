; --------------------------------------------------------------------------------
;
; Esempio di utilizzo di utils.nasm
;
;
; Per eseguire:
;	nasm -f elf32 prova.nasm 
;	ld -m elf_i386 prova.o utils.o -o prova
;


%include "utils.nasm"


section .data

a	db	1
b	dw	2
c	dd	3

msg	db	'Inserisci un numero: '
len	equ	$-msg

section .text


global _start


_start:
	; ------------------------------------------------------------
	; stampa dei byte (in formato decimale - default)
	;
	printb	byte -1
	printb	byte [a]
	mov	al, -8
	printb	al
	
	; ------------------------------------------------------------
	; stampa delle word (in formato decimale senza segno)
	;
	format_udec
	printw	word -1
	printw	word [b]
	mov	bx, 112
	printw	bx

	; ------------------------------------------------------------
	; stampa delle double word (in formato binario)
	;
	format_bin
	printd	dword -1
	printd	dword [c]
	mov	esi, 87699
	printd	esi
	
	; ------------------------------------------------------------
	; stampa dei registri (in formato esadecimale)
	;
	format_hex
	mov	eax, 255
	printeax
	printregs
	
	; ------------------------------------------------------------
	; stampa i registri generali (in formato decimale)
	;
	format_dec
	printregs
	
	; ------------------------------------------------------------
	; stampa una stringa
	;
	prints	msg, len
		
	; ------------------------------------------------------------
	; legge un intero (double word)
	;
	inputd eax
	printd eax
	
	; ------------------------------------------------------------
	; torna al sistema operativo (e restituisce 0)
	;
	exit	0
