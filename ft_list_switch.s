global _ft_list_switch

_ft_list_switch:
                    mov r13, [rdi]          ; debut->list = *list
                    mov rdi, [rdi]
                    mov rsi, [rsi]
                    mov r11, [rdi]
                    mov r12, [rsi]
                    mov [rdi], r12
                    mov [rsi], r11
                    mov rdi, r13
                    ret
