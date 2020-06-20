    .data
    .balign 4
string: .asciz "%d+%d=%d\n"
a:  .word   56
b:  .word   2345
c:  .word   0

.text
.global main
.extern printf



threeVarPrinter:
    push    {ip, lr}
    
    ldr     r0, =string @get addr of str into r0
    @ldr     r1, [r2]    @pass c into r1
    ldr     r1, =a      @get addr of a into r1
    ldr     r1, [r1]    @get a into r1
    ldr     r2, =b
    ldr     r2, [r2]
    ldr     r3, =c
    ldr     r3, [r3]
    
    bl      printf

    pop     {ip, pc}

mathLoop:
    push    {ip, lr}

    ldr     r1, =a      @get addr of a into r1
    ldr     r1, [r1]    @get a into r1
    ldr     r2, =b
    ldr     r2, [r2]
    add     r1, r1, r2  @add r1, r2, store in r1
    ldr     r2, =c      @get addr of c into r2
    str     r1, [r2]    @store r1 into c

    bl      threeVarPrinter

    ldr     r1, =a
    ldr     r2, [r1]
    add     r2, r2, #1
    str     r2, [r1]

    sub     r6, r6, #1
    cmp     r6, #0
    bne     mathLoop        @"b" if not equal (b = branch?)

    pop     {ip, pc}


main:
    push    {ip, lr}    @push ret addr, dummy reg
    
    @this is being used as loop counter
    mov     r6, #3      @I think MOV is immediate?

    bl      mathLoop    

    bl      end
    
end:
    pop     {ip, pc}    @pop ret addr into pc
