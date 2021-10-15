 %define a qword [ebp+8]
 %define b qword [ebp+16]
 %define c qword [ebp+24]
 %define d dword [ebp+32]
 %define x dword [ebp+40]

 segment .text
 global _wartosc
 _wartosc:

 enter 0, 0

 fld x
 fld a
 fmulp st1
 fld b
 faddp st1
 fld x
 fmulp st1
 fld c
 faddp st1
 fld x
 fmulp st1
 fld d
 faddp st1

 quit:
 leave
 ret