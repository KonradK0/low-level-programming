BITS 32
section .text 

global _sortuj
 
_sortuj:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine    addr_a    [ebp+8]
%idefine    addr_b    [ebp+12]
%idefine    addr_c    [ebp+16]

; tu zaczyna się właściwy kod funkcji

mov edx, dword addr_a
mov eax, [edx]
mov edx, dword addr_b
mov ebx, [edx]
mov edx, dword addr_c
mov ecx, [edx]

.a:
cmp eax, ebx
jg .a_gt_b
mov edx, eax
mov eax, ebx
mov ebx, edx

.a_gt_b:
cmp ebx, ecx
jg .b_gt_c
mov edx, ebx
mov ebx, ecx
mov ecx, edx

.b_gt_c:
cmp eax, ecx
jg .last
mov edx, eax
mov eax, ecx
mov ecx, edx

.last:
cmp eax, ebx
jg .end
mov edx, eax
mov eax, ebx
mov ebx, edx

.end:
mov edx, addr_a
mov [edx], eax
mov edx, addr_b
mov [edx], ebx
mov edx, addr_c
mov [edx], ecx

; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret