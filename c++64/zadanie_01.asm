bits 64

segment .data
    vtable: dq func

segment .text
    global zmien

zmien:
    lea rax, [rel vtable]
    mov qword [rdi], rax         ; *rdi -> ptr to vtable
    ret

func:
    sub rsi, 1
    mov rax, rsi
    ret
