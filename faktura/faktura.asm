global _wypisz
global _podatek
extern _printf

section .data

form dd "Faktura %d : obrot %f podatek %f", 0ah, 0dh, 0h

section .text

_podatek:
movss xmm1, xmm0
shufps xmm0, xmm0, 1
movss xmm2, xmm0
movq xmm0, rdi
shufps xmm0, xmm0, 1
subps xmm0, xmm1
mulps xmm0, xmm2

ret

_wypisz:

movss xmm3, xmm0

call _podatek

cvtss2sd xmm0, xmm0
cvtss2sd xmm1, xmm3
mov rax, 2
shl rdi, 32
mov rsi, rdi
mov rdi, form
sub rsp, 8

call _printf
mov rax, 0

add rsp, 8
ret