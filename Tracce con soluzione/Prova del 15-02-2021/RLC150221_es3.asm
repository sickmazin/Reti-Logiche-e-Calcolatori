;Sia dato un vettore di word V contenente informazioni riguardanti le temperature massime e minime rilevate in n città. 
;Dunque, sia V un vettore di dimensione 2*n in cui ciascun elemento in posizione pari contiene la temperatura minima 
;in una certa città e l’elemento immediatamente successivo contiene la temperatura massima rilevata nella stessa città. 
;Scrivere una procedura Assembly che calcola e restituisce un vettore di word W formato da due elementi e costruito come segue: 
;
;- W[0] contiene la massima escursione termica (differenza tra temperatura massima e minima rilevate in una stessa città).
;- W[1] contiene l’escursione termica media.
;
;Si scriva, inoltre, un programma principale che invochi correttamente la procedura descritta.
;Segue un esempio. Il vettore V, memorizzato a partire dalla locazione di indirizzo 456, contiene le temperature di 5 città:
; V = [8,10,0,5,-1,3,-4,3,7,12]
;
;Gli elementi di W sono calcolati come segue:
;
;W[0] = max{(10-8),(5-0),(3-(-1)),(3-(-4)),(12-7)} = max{2,5,4,7,5} = 7  
;W[1] = [(10-8)+(5-0)+(3-(-1))+(3-(-4))+(12-7)]/5 = 23/5 = 4
;
; ESECUZIONE:
;	nasm -f elf32 temperature.asm 
;	ld -m elf_i386 utils.o temperature.o -o temp

%include "utils.nasm"

section .data
V dw 8,10,0,5,-1,3,-4,3,7,12
nv equ ($-V)/2

section .bss
W resw 2

section .text
global _start
_start: push W
        push V
        push word nv
        call escursione_terminca
        printw word [W]
        printw word [W+2]
        exit 0

;;;;; procedura "escursione_termica" ;;;;;

WW equ 14
VV equ 10
c equ 8

escursione_terminca:
    push ebp
    mov ebp, esp
    pushad
    mov edx, [ebp+VV]
    mov ecx, [ebp+WW]
    mov di, [ebp+c]
   
    mov bx,[edx+2] ;lettura temperatura massima della prima città
    sub bx,[edx]   ;escursione termica nella prima città
    add edx, 4     ;aggiornamento del valore in EDX in modo che contenga l'indirizzo della temperatura minima della seconda città
    
    mov si, bx      ;si userà il registro si per mantenere il massimo perciò lo si inizializza con l'escurione termica nella prima città
    mov ax, bx      ;si userà il registro ax per sommare le escursioni termiche di tutte le città. Tale valore verrà diviso per il numero   di città per ottenere la media
    
    shr di,1      ;calcolo del numero di città: (lunghezza del vettore)/2
    dec di        ;decremento del numero di città per tener conto del fatto che la prima è stata già valutata
    
loop: 
    cmp di,0
    jle fine_ciclo
    mov bx,[edx+2] ;lettura temperatura massima dell'i-esima città
    sub bx,[edx]   ;escursione termica nell'i-esima città
    
    ;aggiunta della nuova escursione terminca calcolata per il calcolo della media
    add ax,bx
    
    ;aggiornamento del massimo
    cmp si,bx
    jge finalOP
    mov si, bx

finalOP: 
    add edx, 4
    dec di
    jmp loop
         
fine_ciclo:
    mov [ecx], si
    xor dx,dx
    mov edi, [ebp+c]
    shr di,1
    idiv di
    mov [ecx+2],ax
    
    popad
    pop ebp
    ret 10


