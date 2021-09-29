;Booth's Algorithm

jmp start

arsp: stc
cmc
rar
push PSW
ani 7FH
mov B, A
pop PSW
mov A, C
rar
mov C, A
jmp continue

arsn: stc
cmc
rar
push PSW
ori 80H
mov B, A
pop PSW
mov A, C
rar
mov C, A
jmp continue

subtraction: lxi H, 000BH ; A = A - B
mov A, B
add M
mov B, A
jmp resume

addition: lxi H, 000AH ; A = A + B
mov A, B
add M
mov B, A
jmp resume


checkq1: pop psw
jnc subtraction ; 10 case
jc resume ; 11 case

checkq0: pop PSW
jc addition ; 01 case
jnc resume ; 00 case

checkq: push PSW ; This checks Q0
mov A, C
ani 01H
jnz checkq1 ; These functions check Q-1, this one is for Q0 = 1
jz checkq0 ; For Q0 = 0

start: mvi B, 0 ; This is A
lda 0003H
mov C, A; This is Q (multiplicand)
lda 000AH ; This address now has the multiplier
cma
inr a
sta 000BH ; This address now has the 2's complement of the multiplier
mvi D, 8 ; This is the sequence counter

stc
cmc ; These two instructions ensure that carry is 0, this is our Q-1

loop: jmp checkq

resume: mov A, B ; This is the arithmetic right shift part
ori 00H
jp arsp ; Two separate subroutines for negative and positive numbers
jm arsn

continue: dcr D ; Decrementing sequence counter
mov A, D
jnz loop

hlt