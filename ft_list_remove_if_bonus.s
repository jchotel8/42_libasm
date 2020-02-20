global _ft_list_remove_if
extern _free

_ft_list_remove_if:
                mov        r12, rdi         ; r12 = **list_start
                mov        r13, [rdi]       ; r13 = *list_start
                mov        rdi, [rdi]       ; 1st = *tmp


loop:
               cmp        rdi, 0           ; if *lst == NULL return
               je         end
               push       rdi              ; save tmp
               push       rsi
               mov        rdi, [rdi]       ; 1st = lst->data
               mov        rcx, rdx         ; rcx = function
               call       rcx              ; 1st > 2nd ?
               pop        rsi
               pop        rdi              ; 1st = *tmp
               cmp        rax, 0
               jg         next

remove_first:
               mov        BYTE [rdi] , 0   ; tmp->data = 0
               push    rdi
               push    rsi
               push    rdx
               call       _free
               pop        rdx
               pop        rsi
               pop        rdi
               mov        rdi, [rdi + 8]   ; 1st = tmp->next
               mov        [r13 + 8], rdi   ; previous = tmp->next
               mov        [r12], rdi       ; r12 = **new_start
               jmp        loop

loop2:                                     ; SAME AS LOOP
                cmp        rdi, 0
                je         end
                push       rdi
                push       rsi
                mov        rdi, [rdi]
                mov        rcx, rdx
                call       rcx
                pop        rsi
                pop        rdi
                cmp        rax, 0
                jg         next

remove:
               mov        BYTE [rdi], 0    ; SAME AS REMOVE_FIRST, exept for the first link
               push    rdi
               push    rsi
               push    rdx
               call       _free
               pop        rdx
               pop        rsi
               pop        rdi
               mov        rdi, [rdi + 8]
               mov        [r13 + 8], rdi
               jmp        loop2

next:
               mov        r13, rdi         ; r13 = *previous
               mov        rdi, [rdi + 8]   ; 1st = tmp->next
               jmp        loop2

end:
               ret
