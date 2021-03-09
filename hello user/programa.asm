section .data
  question db "What is your name?",10
  phrase db "Hello, "

section .bss
  name resb 16

section .text
  global _start

_start:
  call _printQuestion
;get  username
  
  call _getUserNameAndPrint


  mov rax,60
  mov rdi,0
  syscall


_printQuestion:
  mov rax,1
  mov rdi,1
  mov rsi,question
  mov rdx,19
  syscall
  ret

_getUserNameAndPrint:
;buscar nome do user
  mov rax,0
  mov rdi,0
  mov rsi,name
  mov rdx,16
  syscall

;"Hello, " depois dar print do nome
  mov rax,1
  mov rdi,1
  mov rsi,phrase
  mov rdx,7
  syscall
  mov rax,1
  mov rdi,1
  mov rsi,name
  mov rdx,16
  syscall
  ret

