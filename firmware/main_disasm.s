
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <main>:
   0:	fe010113          	addi	sp,sp,-32
   4:	00112e23          	sw	ra,28(sp)
   8:	00812c23          	sw	s0,24(sp)
   c:	02010413          	addi	s0,sp,32
  10:	00f00793          	li	a5,15
  14:	fef42623          	sw	a5,-20(s0)
  18:	01900793          	li	a5,25
  1c:	fef42423          	sw	a5,-24(s0)
  20:	fec42703          	lw	a4,-20(s0)
  24:	fe842783          	lw	a5,-24(s0)
  28:	00f707b3          	add	a5,a4,a5
  2c:	fef42223          	sw	a5,-28(s0)
  30:	000027b7          	lui	a5,0x2
  34:	fef42023          	sw	a5,-32(s0)
  38:	fe442703          	lw	a4,-28(s0)
  3c:	fe042783          	lw	a5,-32(s0)
  40:	00e7a023          	sw	a4,0(a5) # 2000 <main+0x2000>
  44:	0000006f          	j	44 <main+0x44>
