global _ft_strdup
extern _malloc
extern _ft_strcpy
extern _ft_strlen

_ft_strdup:
			call _ft_strlen						; rax = ft_strlen(s1)
			push rdi							; save (s1)
			mov	rdi, rax						; 
			call _malloc						; rax = malloc(rax)
			cmp	rax, 0							; if !malloc return 0
			je return							
			pop rdi								; get (s1)
			mov rsi, rdi						; s2 = s1
			mov rdi, rax
			call _ft_strcpy						; new = s2
			ret
			
return:
			mov rax, 0
			ret
