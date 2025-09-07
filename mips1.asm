.data
array:   .word 4, 3, 9, 5, 2, 1
msg_antes: .asciiz "Antes: "
msg_depois: .asciiz "Depois: "
espaco: .asciiz " "
.text
.globl main
main:
    li $v0, 4
    la $a0, msg_antes
    syscall
    jal mostrar_array

    li $t0, 5
loop_externo:
    la $t1, array
    li $t2, 0
    li $t3, 0
loop_interno:
    lw $t4, 0($t1)
    lw $t5, 4($t1)

    ble $t4, $t5, nao_trocar

    sw $t5, 0($t1)
    sw $t4, 4($t1)
    li $t3, 1
nao_trocar:
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    blt $t2, $t0, loop_interno
    beq $t3, 0, fim_ordenacao

    addi $t0, $t0, -1
    bgtz $t0, loop_externo
fim_ordenacao:
    li $v0, 4
    la $a0, msg_depois
    syscall
    jal mostrar_array

    li $v0, 10
    syscall
mostrar_array:
    la $t0, array
    li $t1, 0
    li $t2, 6

mostrar_loop:
    lw $a0, 0($t0)
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, espaco
    syscall

    addi $t0, $t0, 4
    addi $t1, $t1, 1
    blt $t1, $t2, mostrar_loop

    li $a0, 10
    li $v0, 11
    syscall

    jr $ra