Address     Code        Basic                        Line Source

4194304  0x0fc10417  auipc x8,64528               20       la   s0, vals
4194308  0x00040413  addi x8,x8,0                      
4194312  0x00042483  lw x9,0(x8)                  23       lw   s1, 0(s0)      # s1 = 100
4194316  0x00442903  lw x18,4(x8)                 24       lw   s2, 4(s0)      # s2 = 100
4194320  0x00842983  lw x19,8(x8)                 25       lw   s3, 8(s0)      # s3 = -100
4194324  0x00c42a03  lw x20,12(x8)                26       lw   s4, 12(s0)     # s4 = 200
4194328  0x00000f93  addi x31,x0,0                29       li   t6, 0
4194332  0x01248463  beq x9,x18,8                 34       beq  s1, s2, pass_beq
4194336  0x0540006f  jal x0,84                    35       j    fail_test        # Should not be reached
4194340  0x001f8f93  addi x31,x31,1               37       addi t6, t6, 1
4194344  0x01449463  bne x9,x20,8                 40       bne  s1, s4, pass_bne
4194348  0x0480006f  jal x0,72                    41       j    fail_test        # Should not be reached
4194352  0x001f8f93  addi x31,x31,1               43       addi t6, t6, 1
4194356  0x0099c463  blt x19,x9,8                 46       blt  s3, s1, pass_blt
4194360  0x03c0006f  jal x0,60                    47       j    fail_test        # Should not be reached
4194364  0x001f8f93  addi x31,x31,1               49       addi t6, t6, 1
4194368  0x009a5463  bge x20,x9,8                 52       bge  s4, s1, pass_bge
4194372  0x0300006f  jal x0,48                    53       j    fail_test        # Should not be reached
4194376  0x001f8f93  addi x31,x31,1               55       addi t6, t6, 1
4194380  0x0134e463  bltu x9,x19,8                59       bltu s1, s3, pass_bltu
4194384  0x0240006f  jal x0,36                    60       j    fail_test        # Should not be reached
4194388  0x001f8f93  addi x31,x31,1               62       addi t6, t6, 1
4194392  0x013a7e63  bgeu x20,x19,28              66       bgeu s4, s3, fail_test
4194396  0x001f8f93  addi x31,x31,1               68       addi t6, t6, 1
4194400  0x0fc10417  auipc x8,64528               73       la   s0, result_space
4194404  0xfb040413  addi x8,x8,-80                    
4194408  0x01f42023  sw x31,0(x8)                 74       sw   t6, 0(s0)
4194412  0x00a00513  addi x10,x0,10               77       li   a0, 10
4194416  0x00000073  ecall                        78       ecall
4194420  0x0000006f  jal x0,0                     82       j fail_test
