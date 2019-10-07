  .syntax unified
    .text


    .global inner_prod_asm
    .func inner_prod_asm, inner_prod_asm
    .thumb_func
inner_prod_asm:
   
    PUSH {r4,r5,r6,r7}
    MOV r4,#0
    MOV r7,#0
   
   
    Loop:
    CMP r2,r7
    BLE continue
   
    ADD r7,r7,#1
    LDRSH r5,[r0],#2
    LDRSH r6,[r1],#2
    MUL r5,r5,r6
    ADD r4,r4,r5
    
    B Loop
   
    continue:
    ASR r0,r4,#16
    POP {r4,r5,r6,r7}
   
    BX lr
    .endfunc


    .end


