section .text

global _wartosc
_wartosc:
mulpd xmm0, xmm2
addpd xmm0, xmm1

mov rcx, rdi
cmp rcx, 1
je .end
dec rcx
.loop:
dec rcx
mulpd xmm0, xmm0
cmp rcx, 0
jg .loop

.end:
ret