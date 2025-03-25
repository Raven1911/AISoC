
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <main>:
   0:	ff010113          	addi	sp,sp,-16
   4:	00112623          	sw	ra,12(sp)
   8:	00812423          	sw	s0,8(sp)
   c:	01010413          	addi	s0,sp,16
  10:	0080006f          	j	18 <main+0x18>
  14:	028000ef          	jal	3c <_Z4loopv>
  18:	06c02703          	lw	a4,108(zero) # 6c <z>
  1c:	03100793          	li	a5,49
  20:	fee7dae3          	bge	a5,a4,14 <main+0x14>
  24:	00000793          	li	a5,0
  28:	00078513          	mv	a0,a5
  2c:	00c12083          	lw	ra,12(sp)
  30:	00812403          	lw	s0,8(sp)
  34:	01010113          	addi	sp,sp,16
  38:	00008067          	ret

0000003c <_Z4loopv>:
  3c:	ff010113          	addi	sp,sp,-16
  40:	00112623          	sw	ra,12(sp)
  44:	00812423          	sw	s0,8(sp)
  48:	01010413          	addi	s0,sp,16
  4c:	06c02783          	lw	a5,108(zero) # 6c <z>
  50:	00178713          	addi	a4,a5,1
  54:	06e02623          	sw	a4,108(zero) # 6c <z>
  58:	00000013          	nop
  5c:	00c12083          	lw	ra,12(sp)
  60:	00812403          	lw	s0,8(sp)
  64:	01010113          	addi	sp,sp,16
  68:	00008067          	ret
