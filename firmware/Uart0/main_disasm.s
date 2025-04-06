
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <main>:
   0:	fe010113          	addi	sp,sp,-32
   4:	00112e23          	sw	ra,28(sp)
   8:	00812c23          	sw	s0,24(sp)
   c:	02010413          	addi	s0,sp,32
  10:	fe840793          	addi	a5,s0,-24
  14:	020005b7          	lui	a1,0x2000
  18:	00078513          	mv	a0,a5
  1c:	14c000ef          	jal	168 <_ZN4UartC1Em>
  20:	fe840713          	addi	a4,s0,-24
  24:	0001c7b7          	lui	a5,0x1c
  28:	20078613          	addi	a2,a5,512 # 1c200 <_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE+0x1bdbe>
  2c:	077367b7          	lui	a5,0x7736
  30:	94078593          	addi	a1,a5,-1728 # 7735940 <_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE+0x77354fe>
  34:	00070513          	mv	a0,a4
  38:	1f8000ef          	jal	230 <_ZN4Uart4initEmm>
  3c:	fe840793          	addi	a5,s0,-24
  40:	04100593          	li	a1,65
  44:	00078513          	mv	a0,a5
  48:	248000ef          	jal	290 <_ZN4Uart5writeEh>
  4c:	fe840793          	addi	a5,s0,-24
  50:	04900593          	li	a1,73
  54:	00078513          	mv	a0,a5
  58:	238000ef          	jal	290 <_ZN4Uart5writeEh>
  5c:	fe840793          	addi	a5,s0,-24
  60:	05300593          	li	a1,83
  64:	00078513          	mv	a0,a5
  68:	228000ef          	jal	290 <_ZN4Uart5writeEh>
  6c:	fe840793          	addi	a5,s0,-24
  70:	06f00593          	li	a1,111
  74:	00078513          	mv	a0,a5
  78:	218000ef          	jal	290 <_ZN4Uart5writeEh>
  7c:	fe840793          	addi	a5,s0,-24
  80:	04300593          	li	a1,67
  84:	00078513          	mv	a0,a5
  88:	208000ef          	jal	290 <_ZN4Uart5writeEh>
  8c:	fe840793          	addi	a5,s0,-24
  90:	02000593          	li	a1,32
  94:	00078513          	mv	a0,a5
  98:	1f8000ef          	jal	290 <_ZN4Uart5writeEh>
  9c:	fe840793          	addi	a5,s0,-24
  a0:	07800593          	li	a1,120
  a4:	00078513          	mv	a0,a5
  a8:	1e8000ef          	jal	290 <_ZN4Uart5writeEh>
  ac:	fe840793          	addi	a5,s0,-24
  b0:	06900593          	li	a1,105
  b4:	00078513          	mv	a0,a5
  b8:	1d8000ef          	jal	290 <_ZN4Uart5writeEh>
  bc:	fe840793          	addi	a5,s0,-24
  c0:	06e00593          	li	a1,110
  c4:	00078513          	mv	a0,a5
  c8:	1c8000ef          	jal	290 <_ZN4Uart5writeEh>
  cc:	fe840793          	addi	a5,s0,-24
  d0:	02000593          	li	a1,32
  d4:	00078513          	mv	a0,a5
  d8:	1b8000ef          	jal	290 <_ZN4Uart5writeEh>
  dc:	fe840793          	addi	a5,s0,-24
  e0:	06300593          	li	a1,99
  e4:	00078513          	mv	a0,a5
  e8:	1a8000ef          	jal	290 <_ZN4Uart5writeEh>
  ec:	fe840793          	addi	a5,s0,-24
  f0:	06800593          	li	a1,104
  f4:	00078513          	mv	a0,a5
  f8:	198000ef          	jal	290 <_ZN4Uart5writeEh>
  fc:	fe840793          	addi	a5,s0,-24
 100:	06100593          	li	a1,97
 104:	00078513          	mv	a0,a5
 108:	188000ef          	jal	290 <_ZN4Uart5writeEh>
 10c:	fe840793          	addi	a5,s0,-24
 110:	06f00593          	li	a1,111
 114:	00078513          	mv	a0,a5
 118:	178000ef          	jal	290 <_ZN4Uart5writeEh>
 11c:	fe840793          	addi	a5,s0,-24
 120:	00a00593          	li	a1,10
 124:	00078513          	mv	a0,a5
 128:	168000ef          	jal	290 <_ZN4Uart5writeEh>
 12c:	fe840793          	addi	a5,s0,-24
 130:	00078513          	mv	a0,a5
 134:	1c4000ef          	jal	2f8 <_ZN4Uart4readEv>
 138:	00050793          	mv	a5,a0
 13c:	fef41723          	sh	a5,-18(s0)
 140:	fee41703          	lh	a4,-18(s0)
 144:	fff00793          	li	a5,-1
 148:	fef702e3          	beq	a4,a5,12c <main+0x12c>
 14c:	fee45783          	lhu	a5,-18(s0)
 150:	0ff7f713          	zext.b	a4,a5
 154:	fe840793          	addi	a5,s0,-24
 158:	00070593          	mv	a1,a4
 15c:	00078513          	mv	a0,a5
 160:	130000ef          	jal	290 <_ZN4Uart5writeEh>
 164:	fc9ff06f          	j	12c <main+0x12c>

00000168 <_ZN4UartC1Em>:
 168:	fe010113          	addi	sp,sp,-32
 16c:	00112e23          	sw	ra,28(sp)
 170:	00812c23          	sw	s0,24(sp)
 174:	02010413          	addi	s0,sp,32
 178:	fea42623          	sw	a0,-20(s0)
 17c:	feb42423          	sw	a1,-24(s0)
 180:	fe842703          	lw	a4,-24(s0)
 184:	fec42783          	lw	a5,-20(s0)
 188:	00e7a023          	sw	a4,0(a5)
 18c:	00000013          	nop
 190:	01c12083          	lw	ra,28(sp)
 194:	01812403          	lw	s0,24(sp)
 198:	02010113          	addi	sp,sp,32
 19c:	00008067          	ret

000001a0 <_ZN4Uart9write_regEmm>:
 1a0:	fe010113          	addi	sp,sp,-32
 1a4:	00112e23          	sw	ra,28(sp)
 1a8:	00812c23          	sw	s0,24(sp)
 1ac:	02010413          	addi	s0,sp,32
 1b0:	fea42623          	sw	a0,-20(s0)
 1b4:	feb42423          	sw	a1,-24(s0)
 1b8:	fec42223          	sw	a2,-28(s0)
 1bc:	fec42783          	lw	a5,-20(s0)
 1c0:	0007a703          	lw	a4,0(a5)
 1c4:	fe842783          	lw	a5,-24(s0)
 1c8:	00279793          	slli	a5,a5,0x2
 1cc:	00f707b3          	add	a5,a4,a5
 1d0:	fe442703          	lw	a4,-28(s0)
 1d4:	00e7a023          	sw	a4,0(a5)
 1d8:	00000013          	nop
 1dc:	01c12083          	lw	ra,28(sp)
 1e0:	01812403          	lw	s0,24(sp)
 1e4:	02010113          	addi	sp,sp,32
 1e8:	00008067          	ret

000001ec <_ZN4Uart8read_regEm>:
 1ec:	fe010113          	addi	sp,sp,-32
 1f0:	00112e23          	sw	ra,28(sp)
 1f4:	00812c23          	sw	s0,24(sp)
 1f8:	02010413          	addi	s0,sp,32
 1fc:	fea42623          	sw	a0,-20(s0)
 200:	feb42423          	sw	a1,-24(s0)
 204:	fec42783          	lw	a5,-20(s0)
 208:	0007a703          	lw	a4,0(a5)
 20c:	fe842783          	lw	a5,-24(s0)
 210:	00279793          	slli	a5,a5,0x2
 214:	00f707b3          	add	a5,a4,a5
 218:	0007a783          	lw	a5,0(a5)
 21c:	00078513          	mv	a0,a5
 220:	01c12083          	lw	ra,28(sp)
 224:	01812403          	lw	s0,24(sp)
 228:	02010113          	addi	sp,sp,32
 22c:	00008067          	ret

00000230 <_ZN4Uart4initEmm>:
 230:	fd010113          	addi	sp,sp,-48
 234:	02112623          	sw	ra,44(sp)
 238:	02812423          	sw	s0,40(sp)
 23c:	03010413          	addi	s0,sp,48
 240:	fca42e23          	sw	a0,-36(s0)
 244:	fcb42c23          	sw	a1,-40(s0)
 248:	fcc42a23          	sw	a2,-44(s0)
 24c:	fd442783          	lw	a5,-44(s0)
 250:	00479793          	slli	a5,a5,0x4
 254:	fd842703          	lw	a4,-40(s0)
 258:	02f757b3          	divu	a5,a4,a5
 25c:	fff78793          	addi	a5,a5,-1
 260:	fef42623          	sw	a5,-20(s0)
 264:	fec42783          	lw	a5,-20(s0)
 268:	7ff7f793          	andi	a5,a5,2047
 26c:	00078613          	mv	a2,a5
 270:	00100593          	li	a1,1
 274:	fdc42503          	lw	a0,-36(s0)
 278:	f29ff0ef          	jal	1a0 <_ZN4Uart9write_regEmm>
 27c:	00000013          	nop
 280:	02c12083          	lw	ra,44(sp)
 284:	02812403          	lw	s0,40(sp)
 288:	03010113          	addi	sp,sp,48
 28c:	00008067          	ret

00000290 <_ZN4Uart5writeEh>:
 290:	fe010113          	addi	sp,sp,-32
 294:	00112e23          	sw	ra,28(sp)
 298:	00812c23          	sw	s0,24(sp)
 29c:	02010413          	addi	s0,sp,32
 2a0:	fea42623          	sw	a0,-20(s0)
 2a4:	00058793          	mv	a5,a1
 2a8:	fef405a3          	sb	a5,-21(s0)
 2ac:	00000013          	nop
 2b0:	00300593          	li	a1,3
 2b4:	fec42503          	lw	a0,-20(s0)
 2b8:	f35ff0ef          	jal	1ec <_ZN4Uart8read_regEm>
 2bc:	00050793          	mv	a5,a0
 2c0:	2007f793          	andi	a5,a5,512
 2c4:	00f037b3          	snez	a5,a5
 2c8:	0ff7f793          	zext.b	a5,a5
 2cc:	fe0792e3          	bnez	a5,2b0 <_ZN4Uart5writeEh+0x20>
 2d0:	feb44783          	lbu	a5,-21(s0)
 2d4:	00078613          	mv	a2,a5
 2d8:	00200593          	li	a1,2
 2dc:	fec42503          	lw	a0,-20(s0)
 2e0:	ec1ff0ef          	jal	1a0 <_ZN4Uart9write_regEmm>
 2e4:	00000013          	nop
 2e8:	01c12083          	lw	ra,28(sp)
 2ec:	01812403          	lw	s0,24(sp)
 2f0:	02010113          	addi	sp,sp,32
 2f4:	00008067          	ret

000002f8 <_ZN4Uart4readEv>:
 2f8:	fd010113          	addi	sp,sp,-48
 2fc:	02112623          	sw	ra,44(sp)
 300:	02812423          	sw	s0,40(sp)
 304:	03010413          	addi	s0,sp,48
 308:	fca42e23          	sw	a0,-36(s0)
 30c:	00300593          	li	a1,3
 310:	fdc42503          	lw	a0,-36(s0)
 314:	ed9ff0ef          	jal	1ec <_ZN4Uart8read_regEm>
 318:	fea42623          	sw	a0,-20(s0)
 31c:	fec42783          	lw	a5,-20(s0)
 320:	1007f793          	andi	a5,a5,256
 324:	00078663          	beqz	a5,330 <_ZN4Uart4readEv+0x38>
 328:	fff00793          	li	a5,-1
 32c:	01c0006f          	j	348 <_ZN4Uart4readEv+0x50>
 330:	fec42783          	lw	a5,-20(s0)
 334:	01079793          	slli	a5,a5,0x10
 338:	4107d793          	srai	a5,a5,0x10
 33c:	0ff7f793          	zext.b	a5,a5
 340:	01079793          	slli	a5,a5,0x10
 344:	4107d793          	srai	a5,a5,0x10
 348:	00078513          	mv	a0,a5
 34c:	02c12083          	lw	ra,44(sp)
 350:	02812403          	lw	s0,40(sp)
 354:	03010113          	addi	sp,sp,48
 358:	00008067          	ret

0000035c <_ZN4Uart10is_tx_fullEv>:
 35c:	fe010113          	addi	sp,sp,-32
 360:	00112e23          	sw	ra,28(sp)
 364:	00812c23          	sw	s0,24(sp)
 368:	02010413          	addi	s0,sp,32
 36c:	fea42623          	sw	a0,-20(s0)
 370:	00300593          	li	a1,3
 374:	fec42503          	lw	a0,-20(s0)
 378:	e75ff0ef          	jal	1ec <_ZN4Uart8read_regEm>
 37c:	00050793          	mv	a5,a0
 380:	2007f793          	andi	a5,a5,512
 384:	00f037b3          	snez	a5,a5
 388:	0ff7f793          	zext.b	a5,a5
 38c:	00078513          	mv	a0,a5
 390:	01c12083          	lw	ra,28(sp)
 394:	01812403          	lw	s0,24(sp)
 398:	02010113          	addi	sp,sp,32
 39c:	00008067          	ret

000003a0 <_ZN4Uart11is_rx_emptyEv>:
 3a0:	fe010113          	addi	sp,sp,-32
 3a4:	00112e23          	sw	ra,28(sp)
 3a8:	00812c23          	sw	s0,24(sp)
 3ac:	02010413          	addi	s0,sp,32
 3b0:	fea42623          	sw	a0,-20(s0)
 3b4:	00300593          	li	a1,3
 3b8:	fec42503          	lw	a0,-20(s0)
 3bc:	e31ff0ef          	jal	1ec <_ZN4Uart8read_regEm>
 3c0:	00050793          	mv	a5,a0
 3c4:	1007f793          	andi	a5,a5,256
 3c8:	00f037b3          	snez	a5,a5
 3cc:	0ff7f793          	zext.b	a5,a5
 3d0:	00078513          	mv	a0,a5
 3d4:	01c12083          	lw	ra,28(sp)
 3d8:	01812403          	lw	s0,24(sp)
 3dc:	02010113          	addi	sp,sp,32
 3e0:	00008067          	ret

000003e4 <_ZN4Uart12write_stringEPKc>:
 3e4:	fe010113          	addi	sp,sp,-32
 3e8:	00112e23          	sw	ra,28(sp)
 3ec:	00812c23          	sw	s0,24(sp)
 3f0:	02010413          	addi	s0,sp,32
 3f4:	fea42623          	sw	a0,-20(s0)
 3f8:	feb42423          	sw	a1,-24(s0)
 3fc:	0200006f          	j	41c <_ZN4Uart12write_stringEPKc+0x38>
 400:	fe842783          	lw	a5,-24(s0)
 404:	00178713          	addi	a4,a5,1
 408:	fee42423          	sw	a4,-24(s0)
 40c:	0007c783          	lbu	a5,0(a5)
 410:	00078593          	mv	a1,a5
 414:	fec42503          	lw	a0,-20(s0)
 418:	e79ff0ef          	jal	290 <_ZN4Uart5writeEh>
 41c:	fe842783          	lw	a5,-24(s0)
 420:	0007c783          	lbu	a5,0(a5)
 424:	fc079ee3          	bnez	a5,400 <_ZN4Uart12write_stringEPKc+0x1c>
 428:	00000013          	nop
 42c:	00000013          	nop
 430:	01c12083          	lw	ra,28(sp)
 434:	01812403          	lw	s0,24(sp)
 438:	02010113          	addi	sp,sp,32
 43c:	00008067          	ret
