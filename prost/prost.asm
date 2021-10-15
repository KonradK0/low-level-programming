;Bartosz Zmija
%define a qword [ebp+8]
%define b qword [ebp+16]
%define c qword [ebp+24]
%define obj dword [ebp+32]
%define pole dword [ebp+36]

segment .data
Two dw 2
segment .text
global prostopadloscian
prostopadloscian:
enter 0, 0
fld a
fld b
fmulp st1
fld c
fmulp st1

mov ebx, obj
fstp qword [ebx]

fld a
fld b
fmulp st1
fild word [Two]
fmulp st1
fld b
fld c
fmulp st1
fild word [Two]
fmulp st1
faddp st1
fld c
fld a
fild word [Two]
fmulp st1
faddp st1

mov ebx, pole
fstp qword [ebx]

leave
ret