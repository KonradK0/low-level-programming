%include "asm64_io.inc"

segment .data
pytanie db "Podaj dwie liczby : ", 0  ; tekst musi kończyć się zerem
wynik   db "Suma = ", 0
segment .bss

segment .text
global _asm_main
_asm_main:
 enter 0,0 
; ----

dump_regs 1     ; pierwsze wypisanie zawartości rejestrów

mov rax, pytanie
dump_regs 3
call print_string
call read_int   ; wczytanie liczby int
dump_regs 6
mov ebx, eax
call read_int   ; wczytanie drugiej liczby
dump_regs 9
cmp eax, ebx
dump_regs 2     ; drugie wypisanie zawartości rejestrów 
call print_nl

add eax, ebx
call println_int  ; wypisanie liczby int z rax
call print_nl


; ---
mov rax, 0 ; powrót do C
leave
ret

 
