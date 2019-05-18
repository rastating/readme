global _start

section .text
  _start:
    ; set the frame pointer
    mov   ebp, esp

    ; clear required registers
    xor   eax, eax
    xor   ebx, ebx
    xor   ecx, ecx
    xor   edx, edx

    ; push encoded password onto stack
    push  0x7f7f1312
    push  0x157b2f22
    push  0x13247312
    push  0x087b0423
    push  0x73287022
    push  0x30280912
    push  0x3b162f20
    push  0x360e1919
    push  0x157b0913
    push  0x757b0960
    push  0x70167510
    push  0x2d162f25
    push  0x73241923
    push  0x09167527
    push  0x1a772b0c
    push  0x37787217

    ; calculate size of password and store in $ecx
    lea   ecx, [ebp]
    sub   ecx, esp

    ; begin xor on the encoded password
    decode_loop:
      ; if at dword 12, xor with F
      lea   edx, [0x14]
      cmp   ecx, edx
      jz    xor_f

      ; if at dword 11, xor with E
      lea   edx, [0x18]
      cmp   ecx, edx
      jz    xor_e

      ; if at dword 10, xor with E
      lea   edx, [0x1c]
      cmp   ecx, edx
      jz    xor_e

      ; if at dword 9, xor with B
      lea   edx, [0x20]
      cmp   ecx, edx
      jz    xor_b

      ; if at dword 8, xor with D
      lea   edx, [0x24]
      cmp   ecx, edx
      jz    xor_d

      ; if at dword 7, xor with 4
      lea   edx, [0x28]
      cmp   ecx, edx
      jz    xor_4

      ; if at dword 6, xor with E
      lea   edx, [0x2c]
      cmp   ecx, edx
      jz    xor_e

      ; if at dword 3, xor with D
      lea   edx, [0x38]
      cmp   ecx, edx
      jz    xor_d

      ; if at none of the unique indexes
      ; xor with A.
      jmp   xor_a

      short_loop_jmp:
        jmp decode_loop

      xor_f:
        lea   ebx, [0x41414146]
        jmp   xor_eof

      xor_e:
        lea   ebx, [0x41414145]
        jmp   xor_eof

      xor_b:
        lea   ebx, [0x41414142]
        jmp   xor_eof

      xor_d:
        lea   ebx, [0x41414144]
        jmp   xor_eof

      xor_4:
        lea   ebx, [0x41414134]
        jmp   xor_eof

      xor_a:
        lea   ebx, [0x41414141]
        jmp   xor_eof

      xor_eof:
        lea   eax, [ebp]
        sub   eax, ecx
        xor   [eax], ebx
        sub   dword [eax], 0x01010101

        sub   ecx, 0x4

    xor   eax, eax
    cmp   ecx, eax
    jnz   short_loop_jmp

    int3
    int3
    int3
    int3
