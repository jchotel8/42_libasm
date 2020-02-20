global _ft_strcpy

_ft_strcpy:
            mov rax, -1

loop:
            inc rax
            mov cl, [rsi + rax]
            mov [rdi + rax], cl
            cmp cl, 0
            jne loop                    ; si cl ne vaut pas 0 alors on recommance

return:
            mov rax, rdi                ; returned value rax should be the position of the argument rdi
            ret
