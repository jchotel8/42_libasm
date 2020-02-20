global _ft_list_push_front
extern _malloc

_ft_list_push_front:
                    push rdi
                    push rsi
                    mov rdi, 16               ; sizeof(t_lst) = 16
                    call _malloc              ; malloc size is defined by rdi
                    cmp rax, 0                ; if !malloc, return
                    pop rsi
                    pop rdi
                    je return
                    mov [rax], rsi            ; lst->data = data
                    mov rbx, [rdi]            ;
                    mov [rax + 8], rbx        ; lst->next = *list
                    mov [rdi], rax            ; *list = new
return:
                    ret
