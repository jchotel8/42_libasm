global _ft_list_size

_ft_list_size:
    mov rax, 0
    cmp rdi, 0
    je end

loop:
    inc rax
    mov rdi, [rdi + 8]
    cmp rdi, 0
    je end
    jmp loop
    ret

end:
    ret
