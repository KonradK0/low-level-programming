bits 64

segment .data
    vtable: dq func, 0

segment .text
    global zmien

zmien:
    lea rax, [rel vtable]
    mov r8, [rdi]
    mov r8, [r8]
    mov qword [rax + 8], r8
    mov qword [rdi], rax
    ret

func:
    mov r8, [rdi]
    mov r8, [r8 + 8]
    call r8
    sub rax, 1
    ret
