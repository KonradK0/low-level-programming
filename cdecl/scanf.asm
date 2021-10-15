;KOMPILACJA:  plik źródłowy c_asm.asm
;nasm -o c_asm.obj -felf32 c_asm.asm
;gcc -m32 c_asm.obj -o c_asm

section .text
          

extern _printf          ; definicja funkcji printf znajduje się w bibliotece standardowej C
extern _scanf

global _main  
_main:                  ; punkt wejścia - funkcja main
enter 0, 0
                  

push int1
push formatin
call _scanf
add esp, 2 * 4

push int2
push formatin
call _scanf
add esp, 2 * 4

mov eax, dword [int1]
mov ecx, dword [int2]
xor edx, edx
div ecx
mov ebx, edx

push   eax          ; drugi argument
push   dword iloraz
call   _printf
add    esp, 2 * 4

push   ebx              ; printf("Liczba jeden to: %d\n", 1);
push   dword napis      ; pierwszy argument - UWAGA na właściwą kolejność argumentów wołanej funkcji                        ; pierwszy argument funkcji dodajemy na stos jako ostatni!!!
call   _printf          ; uruchomienie funkcji
add    esp, 2 * 4         ; posprzątanie stosu - rejestr ESP wskazuje to samo, co przed wywołaniem
                        ; funkcji printf

xor    eax, eax         ; return 0;
leave
ret                     ; wyjście z programu

section .data

iloraz: db "Iloraz: %d", 10, 0
napis: db "Reszta: %d", 10, 0
formatin: db "%d", 0
int1: times 4 db 0 ; 32bit
int2: times 4 db 0