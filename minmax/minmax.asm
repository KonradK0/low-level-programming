BITS 32
section .text 

global _minmax
 
_minmax:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

extern _printf

%idefine    n    dword [ebp+8]

; tu zaczyna się właściwy kod funkcji

mov ecx, n
sub ecx, 1
mov eax, [ebp + 12]
mov edx, [ebp + 12]
cmp ecx, 0
je .end_proc

.loop:
mov ebx, [ebp + 4 * ecx + 12]
cmp edx, ebx
jge .check_min
mov edx, ebx
.check_min:
cmp eax, ebx
jle .end_loop
mov eax, ebx
.end_loop:
sub ecx, 1
cmp ecx, 0
jne .loop

.end_proc:

; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret