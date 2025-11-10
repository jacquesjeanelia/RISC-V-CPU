Address     Code        Basic                        Line Source

4194304  0x0fc10417  auipc x8,64528               23       la   s0, initial_values # s0 points to 0x11223344
4194308  0x00040413  addi x8,x8,0                      
4194312  0x0fc10497  auipc x9,64528               24       la   s1, store_region   # s1 points to the memory we will write to
4194316  0x00848493  addi x9,x9,8                      
4194320  0x00042303  lw x6,0(x8)                  27       lw   t1, 0(s0)          # t1 = 0x11223344
4194324  0x00442383  lw x7,4(x8)                  28       lw   t2, 4(s0)          # t2 = 0xAABBCCDD
4194328  0x0064a023  sw x6,0(x9)                  35       sw   t1, 0(s1)
4194332  0x00749223  sh x7,4(x9)                  40       sh   t2, 4(s1)
4194336  0x00748423  sb x7,8(x9)                  46       sb   t2, 8(s1)
4194340  0x00a00513  addi x10,x0,10               49       li   a0, 10             # Load exit code 10
4194344  0x00000073  ecall                        50       ecall                   # Make system call to terminate
