section .text

global _diff

_diff:

mov rdx, 99
mov rax, rdx
   
mov rdx, 0
mov r10, 4
div r10
mov r9, rax
mov rcx, 0

.wektorowo:

   movups xmm0, [rsi+rcx*4]
   movups xmm1, [rsi+rcx*4 + 1]
   psubsb xmm1, xmm0
   movups [rdi+rcx*4], xmm1
   
   add rcx, 4
   cmp rcx, rax
   jl .wektorowo

.skalarnie:   
   
   cmp rcx, r9
   jg .koniec
   
   movss xmm0, [rsi+rcx*4]
   movss xmm1, [rsi+rcx*4 + 1]
   psubsb xmm1, xmm0
   movss [rdi+rcx*4], xmm1
    
   inc rcx
   jmp .skalarnie
      
.koniec:
   mov rax, 0
   ret