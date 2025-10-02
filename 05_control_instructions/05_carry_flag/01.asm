; JC → Jump if Carry
section .data
    msg_carry db "Carry occurred (CF=1) - Daniel Morara 168326",10,0
        len_carry equ $ - msg_carry
    msg_nocarry db "No carry (CF=0) - Daniel Morara 168326",10,0
        len_nocarry equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,0FFFFh
    add ax,1       ; sets CF=1
    jc carry

    mov ecx, msg_nocarry
    jmp print

carry:
    mov ecx, msg_carry
    mov edx, len_carry

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
