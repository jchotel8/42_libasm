global _ft_strcmp

_ft_strcmp:
            mov rcx, -1

loop:
            inc rcx
            mov dl, [rsi + rcx]
            mov bl, [rdi + rcx]
            cmp bl, 0                           ;if end of s1
            je loop_end
            cmp bl, dl                         ;if different
            je loop

loop_end:                                      ;else prep for return
            xor rax, rax
            sub bl, dl
            mov al, bl
            jnc return

            neg al
            neg eax

return:
			ret

