.data
msg:    .asciiz "Soma dos anos: "
ano1:   .word 2006 #Matheus
ano2:   .word 1993 #Edmund
ano3:	.word 2005 #Vinicius
ano4:	.word 2003 #JV

.text
.globl main
main:
    #Define o lugar das variaveis
    lw $t0, ano1
    lw $t1, ano2
    lw $t2, ano3
    lw $t3, ano4
    
#Soma os anos 

    add $t4, $t0, $t1    # $t4 = ano1 + ano2
    add $t4, $t4, $t2    # $t4 = ($t4) + ano3
    add $t4, $t4, $t3    # $t4 = ($t4) + ano4
    
    li $v0, 4
    la $a0, msg
    syscall
    
    #Mostra resultado
    move $a0, $t4
    li $v0, 1
    syscall
    
    #Encerra
    li $v0, 10
    syscall