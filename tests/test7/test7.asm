Address     Code        Basic                        Line Source

4194304  0x0080036f  jal x6,8                     13       jal t1, label1   # t1 = pc+4 (address of 'jal t1 ...' + 4); jump to label1
4194308  0xfff00313  addi x6,x0,-1                15       addi t1, x0, -1  # Should NOT run (t1 overwritten by jal)
4194312  0x0fc10297  auipc x5,64528               19       la   t0, out_jal
4194316  0xff828293  addi x5,x5,-8                     
4194320  0x0062a023  sw x6,0(x5)                  20       sw   t1, 0(t0)
4194324  0x00000e17  auipc x28,0                  23       la   t3, label2
4194328  0x010e0e13  addi x28,x28,16                   
4194332  0x000e03e7  jalr x7,x28,0                24       jalr t2, t3, 0   # t2 = pc+4; jump to address in t3 (label2)
4194336  0xffe00393  addi x7,x0,-2                25       addi t2, x0, -2  # Should NOT run
4194340  0x0fc10297  auipc x5,64528               28       la   t0, out_jalr
4194344  0xfe028293  addi x5,x5,-32                    
4194348  0x0072a023  sw x7,0(x5)                  29       sw   t2, 0(t0)
4194352  0x00a00513  addi x10,x0,10               32       li a0, 10
4194356  0x00000073  ecall                        33       ecall
