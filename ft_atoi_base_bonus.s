global _ft_atoi_base

_ft_atoi_base:
				mov rax, -1
                mov r11, 0                           ; res = 0
                mov r13, 1                           ; sign = 1
                jmp check_base_p1

continue:
                mov r12, rax						; taille = strlen(base)
				mov rax, -1
				jmp skip_space

get_posi:                                           ; FOR A GIVEN STR[i] LOOK FOR THE MATCHING BASE[j]
                inc rbx
                cmp BYTE [rsi + rbx], 0             ; while base[i] != '\0'
                je return
                mov dl, [rdi + rax]
                cmp dl, [rsi + rbx]
                je calc_res
                jmp get_posi

calc_res:                                      ; IF STR[i] == BASE[j] CALCULATE RESULT & MOVE TO NEXT DIGIT
                imul r11, r12                       ; res = res * taille (ici rdx)
                add r11, rbx                        ; res = res + pos
                inc rax
                mov rbx, -1
                cmp BYTE [rdi + rax], 0
                jne get_posi
                imul r11, r13                       ; res *= sign
                mov rax, r11                        ; return res
                ret


check_base_p1:                                      ; CHECK FORBIDDEN CHAR IN BASE
				inc rax								; i++
                mov rbx, -1
                cmp BYTE [rsi + rax], 0				; while base[i] != '\0'
				je continue
				cmp BYTE [rsi + rax], 32			; base[i] != ' '
				je error_base
				cmp BYTE [rsi + rax], 43			; base[i] != '+'
				je error_base
				cmp BYTE [rsi + rax], 45			; base[i] != '-'
				je error_base
				cmp BYTE [rsi + rax], 9				; base[i] != blank_space
				je error_base
                cmp BYTE [rsi + rax], 10
                je error_base
                cmp BYTE [rsi + rax], 11
                je error_base
                cmp BYTE [rsi + rax], 12
                je error_base
				cmp BYTE [rsi + rax], 13			
				je error_base

check_base_p2:                                      ; CHECK DOUBLE CHAR IN BASE
				inc rbx
				cmp rbx, rax						; while j != i
                je check_base_p1                    ;       check forbidden char
                mov cl, BYTE [rsi + rax]
                cmp cl, BYTE [rsi + rbx]            ; base[i] == base[j] ?
				je error_base
				jmp check_base_p2

skip_space:                                         ; SKIP BLANK SPACE IN THE NUMBER
                inc rax
                cmp BYTE [rdi + rax], 0             ; while str[i] != '\0'
                je error_base
                cmp BYTE [rdi + rax], 32            ; str[i] != ' '
                je skip_space
                cmp BYTE [rdi + rax], 9             ; str[i] != blank_space
                je skip_space
                cmp BYTE [rsi + rax], 10
                je skip_space
                cmp BYTE [rsi + rax], 11
                je skip_space
                cmp BYTE [rsi + rax], 12
                je skip_space
                cmp BYTE [rdi + rax], 13
                je skip_space
                dec rax
                jmp check_sign

check_sign:                                         ; GET THE SIGN OF THE NUMBER
                inc rax
                cmp BYTE [rdi + rax], 0             ; while str[i] != '\0'
                je error_base
                cmp BYTE [rdi + rax], 43            ; str[i] != '+'
                je check_sign
                cmp BYTE [rdi + rax], 45            ; str[i] != '-'
                jne get_posi
                imul r13, -1
                jmp check_sign

error_base:
                mov rax, 0
                ret

return:                                             ; RETURN THE SIGNED NUMBER
                imul r11, r13                       ; res *= sign
                mov rax, r11
                ret
