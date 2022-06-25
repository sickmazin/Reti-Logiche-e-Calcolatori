; --------------------------------------------------------------------------------
;
; Esempio di programma nasm
;
; Per eseguire:
;	nasm -f elf32 primo.nasm 
;	ld -m elf_i386 primo.o -o primo
;


section .data


msg	db	'Ciao a tutti!',10
len	equ	$-msg


section .text


global _start


_start:
	;
	; stampa un messaggio
	;
	mov	ecx, msg		; indirizzo della stringa da stampare
	mov	edx, len		; lunghezza della stringa da stampare
	mov	ebx, 1			; periferica di stampa (1=schermo)
	mov	eax, 4			; numero del servizio di stampa (sysout)
	int	80h			; invoca il sistema operativo
	;
	; esce dal programma
	;
	mov	ebx, 0			; codice di uscita 0
	mov	eax, 1			; numero del servizio di uscita del programma
	int	80h			; invoca il sistema operativo

	
	
	