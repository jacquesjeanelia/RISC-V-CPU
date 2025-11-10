Address     Code        Basic                        Line Source

4194304  0xabcde337  lui x6,703710                21       lui  t1, 0xABCDE
4194308  0x00001397  auipc x7,1                   28       auipc t2, 0x1
4194312  0x00000417  auipc x8,0                   32       la   s0, result_lui
4194316  0xff840413  addi x8,x8,-8                     
4194320  0x00642023  sw x6,0(x8)                  35       sw   t1, 0(s0)
4194324  0x00742223  sw x7,4(x8)                  39       sw   t2, 4(s0)
4194328  0x00a00513  addi x10,x0,10               42       li   a0, 10
4194332  0x00000073  ecall                        43       ecall
