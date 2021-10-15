global _iloczyn
section .text

_iloczyn:

pop r11

push r9
push r8
push rcx
push rdx
push rsi

mov r10, rbp
mov rbp, rsp

mov rcx, rdi
mov rax, 1

.loop:
dec rcx
xor rdx, rdx
mov rsi, qword [rbp + rcx * 8]
mul rsi
cmp rcx, 0
jg .loop

mov rbp, r10

pop rsi
pop rdx
pop rcx
pop r8
pop r9

push r11

ret