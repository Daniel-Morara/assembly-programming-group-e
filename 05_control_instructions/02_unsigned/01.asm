; JA / JNBE → Jump if Above
section .data
    str_above db "AX > BX (Above) - Daniel Morara 168326",10,0
    len_above equ $ - str_above

    str_not_above db "AX <= BX (Not Above) - Daniel Morara 168326",10,0
    len_not_above equ $ - str_not_above
    
section .text
    global _start
_start:
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

    mov ecx, str_not_above
    mov edx, len_not_above
    jmp print

above:
    mov ecx, str_above
    mov edx, len_above

print:
    mov eax,4  ; display
    mov ebx,1  ; how to display stdout
    mov edx,30 ; len of what to display
    int 0x80   ; call

    mov eax,1
    xor ebx,ebx
    int 0x80
