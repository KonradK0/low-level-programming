BITS 32
section .text 

global _iloczyn
 
_iloczyn:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine    size    dword [ebp+8]
%idefine    array    [ebp+12]

; tu zaczyna się właściwy kod funkcji

mov    ecx, size
sub    ecx, 1
mov    eax, 1
mov    ebx, array
.loop:
mov    edx, dword [ebx + ecx * 4]
mul    edx
xor    edx, edx
loop .loop

mov    edx, dword [ebx]
mul    edx


; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret