global _ft_list_sort

_ft_list_sort:
                mov        r13, [rdi]    ; r13 = *list_start
                mov        rdi, [rdi]    ; 1st = *list_start (b/c before 1st = **list_start)

loop:
                mov        r10, [rdi+8]  ; r10 = lst->next
                cmp        r10, 0        ; if lst->next == NULL return
                je        end            ;
                push    rdi              ; save tmp
                push    rsi              ; save function
                mov        rcx, rsi      ; rcx = function
                mov        rsi, [r10]    ; 2nd = lst->next->data
                mov        rdi, [rdi]    ; 1st = lst->data
                call    rcx              ; *cmp(lst->data, lst->next->data)
                pop        rsi           ; 2nd = function
                pop        rdi           ; 1st = *list_start
                cmp        rax, 0        ; if rax > 0 (right order)
                jng        next          ; then next

switch:
                mov        r11, [r10]    ; r11 = lst->next->data
                mov        r12, [rdi]    ; r12 = lst->data
                mov        [rdi], r11    ; lst->data = lst->next->data
                mov        [r10], r12    ; lst->next->data = lst->data
                mov        rdi, r13      ; return to beginning of list
                jmp        loop          ; loop

next:
                mov        rdi, [rdi+8]  ; 1st = lst->next
                jmp        loop          ; loop

end:
                ret
