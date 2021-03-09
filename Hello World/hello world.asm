section .data   ; Pode ser interpretado como a secção de definição de variáveis
  text db "Hello, World!",10    ;text <- nome da VAR, db <- define bytes ->"Hello, World!", 10 <- endline char

section .text   ;Secção que define o inicio de execução do programa
  global _start   ;O linker procura por esta linha para começar a execução do programa, é obrigatória. o global pode ser interpretado como uma espécia de public de uma classe, o _start é uma "label" que define o sitio de inicio de execução do programa

_start:
  mov rax, 1  ;Instrução com ID1 => sys_write
  mov rdi, 1  ;Primeiro argumento do sys_write define que o sys_write vai escrever no standart_output
  mov rsi, text;O segundo argumento vai buscar a string de texto que é para dar "print"
  mov rdx, 14;Este argumento é o tamanho da string, neste caso "Hello, World!",10 = 14bytes, (nao esquecer que o 10 tambem é um char, que simboliza \n)
  syscall;executa a instrução

  mov rax, 60;instrução sys_exit
  mov rdi, 0 ;Error code
  syscall;executa a instrução
