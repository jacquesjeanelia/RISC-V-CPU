Address     Code        Basic                        Line Source

4194304  0x0fc10297  auipc x5,64528               19       la   t0, data_start
4194308  0x00028293  addi x5,x5,0                      
4194312  0x0142a483  lw x9,20(x5)                 22       lw   s1, 20(t0)      # s1 (x9) = 6
4194316  0x0182a903  lw x18,24(x5)                23       lw   s2, 24(t0)      # s2 (x18) = 7
4194320  0x03c2a983  lw x19,60(x5)                24       lw   s3, 60(t0)      # s3 (x19) = 16
4194324  0x06448313  addi x6,x9,100               30       addi t1, s1, 100
4194328  0x0644a393  slti x7,x9,100               34       slti t2, s1, 100
4194332  0xfff4be13  sltiu x28,x9,-1              39       sltiu t3, s1, -1
4194336  0x00f4ce93  xori x29,x9,15               44       xori t4, s1, 15
4194340  0x00f96f13  ori x30,x18,15               49       ori  t5, s2, 15
4194344  0x00f97f93  andi x31,x18,15              54       andi t6, s2, 15
4194348  0x00449a13  slli x20,x9,4                60       slli s4, s1, 4
4194352  0x0029da93  srli x21,x19,2               64       srli s5, s3, 2
4194356  0xff000b13  addi x22,x0,-16              68       addi s6, x0, -16       # s6 = -16
4194360  0x402b5b93  srai x23,x22,2               70       srai s7, s6, 2
4194364  0x0002ac03  lw x24,0(x5)                 76       lw   s8, 0(t0)
4194368  0x00429c83  lh x25,4(x5)                 81       lh   s9, 4(t0)
4194372  0x0042dd03  lhu x26,4(x5)                83       lhu  s10, 4(t0)
4194376  0x00828d83  lb x27,8(x5)                 90       lb   s11, 8(t0)
4194380  0x0082c083  lbu x1,8(x5)                 92       lbu  ra, 8(t0)
4194384  0x00000317  auipc x6,0                   98       la   t1, jalr_target   # Load address of the target label into t1
4194388  0x01030313  addi x6,x6,16                     
4194392  0x000300e7  jalr x1,x6,0                 99       jalr ra, t1, 0         # Jump to target, save return address in ra
4194396  0x00c0006f  jal x0,12                    102      j    end_tests
4194400  0x3e700113  addi x2,x0,999               107      addi sp, x0, 999
4194404  0x00008067  jalr x0,x1,0                 109      jalr x0, ra, 0
4194408  0x00a00513  addi x10,x0,10               113      li   a0, 10          # Load exit code 10 into a0
4194412  0x00000073  ecall                        114      ecall                # Make system call to terminate
