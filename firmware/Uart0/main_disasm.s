
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

01000000 <main>:
 1000000:	fe010113          	addi	sp,sp,-32
 1000004:	00112e23          	sw	ra,28(sp)
 1000008:	00812c23          	sw	s0,24(sp)
 100000c:	02010413          	addi	s0,sp,32
 1000010:	fe440793          	addi	a5,s0,-28
 1000014:	020025b7          	lui	a1,0x2002
 1000018:	00078513          	mv	a0,a5
 100001c:	164000ef          	jal	1000180 <_ZN4UartC1Em>
 1000020:	fe440713          	addi	a4,s0,-28
 1000024:	0001c7b7          	lui	a5,0x1c
 1000028:	20078613          	addi	a2,a5,512 # 1c200 <_ebss+0x1c200>
 100002c:	077367b7          	lui	a5,0x7736
 1000030:	94078593          	addi	a1,a5,-1728 # 7735940 <_etext+0x67354d8>
 1000034:	00070513          	mv	a0,a4
 1000038:	210000ef          	jal	1000248 <_ZN4Uart4initEmm>
 100003c:	010007b7          	lui	a5,0x1000
 1000040:	45878793          	addi	a5,a5,1112 # 1000458 <_ZN4Uart12write_stringEPKc+0x5c>
 1000044:	fef42423          	sw	a5,-24(s0)
 1000048:	fe0407a3          	sb	zero,-17(s0)
 100004c:	fe440793          	addi	a5,s0,-28
 1000050:	04100593          	li	a1,65
 1000054:	00078513          	mv	a0,a5
 1000058:	250000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100005c:	fe440793          	addi	a5,s0,-28
 1000060:	04900593          	li	a1,73
 1000064:	00078513          	mv	a0,a5
 1000068:	240000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100006c:	fe440793          	addi	a5,s0,-28
 1000070:	05300593          	li	a1,83
 1000074:	00078513          	mv	a0,a5
 1000078:	230000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100007c:	fe440793          	addi	a5,s0,-28
 1000080:	06f00593          	li	a1,111
 1000084:	00078513          	mv	a0,a5
 1000088:	220000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100008c:	fe440793          	addi	a5,s0,-28
 1000090:	04300593          	li	a1,67
 1000094:	00078513          	mv	a0,a5
 1000098:	210000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100009c:	fe440793          	addi	a5,s0,-28
 10000a0:	02000593          	li	a1,32
 10000a4:	00078513          	mv	a0,a5
 10000a8:	200000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000ac:	fe440793          	addi	a5,s0,-28
 10000b0:	07800593          	li	a1,120
 10000b4:	00078513          	mv	a0,a5
 10000b8:	1f0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000bc:	fe440793          	addi	a5,s0,-28
 10000c0:	06900593          	li	a1,105
 10000c4:	00078513          	mv	a0,a5
 10000c8:	1e0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000cc:	fe440793          	addi	a5,s0,-28
 10000d0:	06e00593          	li	a1,110
 10000d4:	00078513          	mv	a0,a5
 10000d8:	1d0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000dc:	fe440793          	addi	a5,s0,-28
 10000e0:	02000593          	li	a1,32
 10000e4:	00078513          	mv	a0,a5
 10000e8:	1c0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000ec:	fe440793          	addi	a5,s0,-28
 10000f0:	06300593          	li	a1,99
 10000f4:	00078513          	mv	a0,a5
 10000f8:	1b0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 10000fc:	fe440793          	addi	a5,s0,-28
 1000100:	06800593          	li	a1,104
 1000104:	00078513          	mv	a0,a5
 1000108:	1a0000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100010c:	fe440793          	addi	a5,s0,-28
 1000110:	06100593          	li	a1,97
 1000114:	00078513          	mv	a0,a5
 1000118:	190000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100011c:	fe440793          	addi	a5,s0,-28
 1000120:	06f00593          	li	a1,111
 1000124:	00078513          	mv	a0,a5
 1000128:	180000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100012c:	fe440793          	addi	a5,s0,-28
 1000130:	00a00593          	li	a1,10
 1000134:	00078513          	mv	a0,a5
 1000138:	170000ef          	jal	10002a8 <_ZN4Uart5writeEh>
 100013c:	0200006f          	j	100015c <main+0x15c>
 1000140:	fe440793          	addi	a5,s0,-28
 1000144:	fe842583          	lw	a1,-24(s0)
 1000148:	00078513          	mv	a0,a5
 100014c:	2b0000ef          	jal	10003fc <_ZN4Uart12write_stringEPKc>
 1000150:	fef44783          	lbu	a5,-17(s0)
 1000154:	00178793          	addi	a5,a5,1
 1000158:	fef407a3          	sb	a5,-17(s0)
 100015c:	fef44703          	lbu	a4,-17(s0)
 1000160:	00900793          	li	a5,9
 1000164:	fce7fee3          	bgeu	a5,a4,1000140 <main+0x140>
 1000168:	00000793          	li	a5,0
 100016c:	00078513          	mv	a0,a5
 1000170:	01c12083          	lw	ra,28(sp)
 1000174:	01812403          	lw	s0,24(sp)
 1000178:	02010113          	addi	sp,sp,32
 100017c:	00008067          	ret

01000180 <_ZN4UartC1Em>:
 1000180:	fe010113          	addi	sp,sp,-32
 1000184:	00112e23          	sw	ra,28(sp)
 1000188:	00812c23          	sw	s0,24(sp)
 100018c:	02010413          	addi	s0,sp,32
 1000190:	fea42623          	sw	a0,-20(s0)
 1000194:	feb42423          	sw	a1,-24(s0)
 1000198:	fe842703          	lw	a4,-24(s0)
 100019c:	fec42783          	lw	a5,-20(s0)
 10001a0:	00e7a023          	sw	a4,0(a5)
 10001a4:	00000013          	nop
 10001a8:	01c12083          	lw	ra,28(sp)
 10001ac:	01812403          	lw	s0,24(sp)
 10001b0:	02010113          	addi	sp,sp,32
 10001b4:	00008067          	ret

010001b8 <_ZN4Uart9write_regEmm>:
 10001b8:	fe010113          	addi	sp,sp,-32
 10001bc:	00112e23          	sw	ra,28(sp)
 10001c0:	00812c23          	sw	s0,24(sp)
 10001c4:	02010413          	addi	s0,sp,32
 10001c8:	fea42623          	sw	a0,-20(s0)
 10001cc:	feb42423          	sw	a1,-24(s0)
 10001d0:	fec42223          	sw	a2,-28(s0)
 10001d4:	fec42783          	lw	a5,-20(s0)
 10001d8:	0007a703          	lw	a4,0(a5)
 10001dc:	fe842783          	lw	a5,-24(s0)
 10001e0:	00279793          	slli	a5,a5,0x2
 10001e4:	00f707b3          	add	a5,a4,a5
 10001e8:	fe442703          	lw	a4,-28(s0)
 10001ec:	00e7a023          	sw	a4,0(a5)
 10001f0:	00000013          	nop
 10001f4:	01c12083          	lw	ra,28(sp)
 10001f8:	01812403          	lw	s0,24(sp)
 10001fc:	02010113          	addi	sp,sp,32
 1000200:	00008067          	ret

01000204 <_ZN4Uart8read_regEm>:
 1000204:	fe010113          	addi	sp,sp,-32
 1000208:	00112e23          	sw	ra,28(sp)
 100020c:	00812c23          	sw	s0,24(sp)
 1000210:	02010413          	addi	s0,sp,32
 1000214:	fea42623          	sw	a0,-20(s0)
 1000218:	feb42423          	sw	a1,-24(s0)
 100021c:	fec42783          	lw	a5,-20(s0)
 1000220:	0007a703          	lw	a4,0(a5)
 1000224:	fe842783          	lw	a5,-24(s0)
 1000228:	00279793          	slli	a5,a5,0x2
 100022c:	00f707b3          	add	a5,a4,a5
 1000230:	0007a783          	lw	a5,0(a5)
 1000234:	00078513          	mv	a0,a5
 1000238:	01c12083          	lw	ra,28(sp)
 100023c:	01812403          	lw	s0,24(sp)
 1000240:	02010113          	addi	sp,sp,32
 1000244:	00008067          	ret

01000248 <_ZN4Uart4initEmm>:
 1000248:	fd010113          	addi	sp,sp,-48
 100024c:	02112623          	sw	ra,44(sp)
 1000250:	02812423          	sw	s0,40(sp)
 1000254:	03010413          	addi	s0,sp,48
 1000258:	fca42e23          	sw	a0,-36(s0)
 100025c:	fcb42c23          	sw	a1,-40(s0)
 1000260:	fcc42a23          	sw	a2,-44(s0)
 1000264:	fd442783          	lw	a5,-44(s0)
 1000268:	00479793          	slli	a5,a5,0x4
 100026c:	fd842703          	lw	a4,-40(s0)
 1000270:	02f757b3          	divu	a5,a4,a5
 1000274:	fff78793          	addi	a5,a5,-1
 1000278:	fef42623          	sw	a5,-20(s0)
 100027c:	fec42783          	lw	a5,-20(s0)
 1000280:	7ff7f793          	andi	a5,a5,2047
 1000284:	00078613          	mv	a2,a5
 1000288:	00100593          	li	a1,1
 100028c:	fdc42503          	lw	a0,-36(s0)
 1000290:	f29ff0ef          	jal	10001b8 <_ZN4Uart9write_regEmm>
 1000294:	00000013          	nop
 1000298:	02c12083          	lw	ra,44(sp)
 100029c:	02812403          	lw	s0,40(sp)
 10002a0:	03010113          	addi	sp,sp,48
 10002a4:	00008067          	ret

010002a8 <_ZN4Uart5writeEh>:
 10002a8:	fe010113          	addi	sp,sp,-32
 10002ac:	00112e23          	sw	ra,28(sp)
 10002b0:	00812c23          	sw	s0,24(sp)
 10002b4:	02010413          	addi	s0,sp,32
 10002b8:	fea42623          	sw	a0,-20(s0)
 10002bc:	00058793          	mv	a5,a1
 10002c0:	fef405a3          	sb	a5,-21(s0)
 10002c4:	00000013          	nop
 10002c8:	00300593          	li	a1,3
 10002cc:	fec42503          	lw	a0,-20(s0)
 10002d0:	f35ff0ef          	jal	1000204 <_ZN4Uart8read_regEm>
 10002d4:	00050793          	mv	a5,a0
 10002d8:	2007f793          	andi	a5,a5,512
 10002dc:	00f037b3          	snez	a5,a5
 10002e0:	0ff7f793          	zext.b	a5,a5
 10002e4:	fe0792e3          	bnez	a5,10002c8 <_ZN4Uart5writeEh+0x20>
 10002e8:	feb44783          	lbu	a5,-21(s0)
 10002ec:	00078613          	mv	a2,a5
 10002f0:	00200593          	li	a1,2
 10002f4:	fec42503          	lw	a0,-20(s0)
 10002f8:	ec1ff0ef          	jal	10001b8 <_ZN4Uart9write_regEmm>
 10002fc:	00000013          	nop
 1000300:	01c12083          	lw	ra,28(sp)
 1000304:	01812403          	lw	s0,24(sp)
 1000308:	02010113          	addi	sp,sp,32
 100030c:	00008067          	ret

01000310 <_ZN4Uart4readEv>:
 1000310:	fd010113          	addi	sp,sp,-48
 1000314:	02112623          	sw	ra,44(sp)
 1000318:	02812423          	sw	s0,40(sp)
 100031c:	03010413          	addi	s0,sp,48
 1000320:	fca42e23          	sw	a0,-36(s0)
 1000324:	00300593          	li	a1,3
 1000328:	fdc42503          	lw	a0,-36(s0)
 100032c:	ed9ff0ef          	jal	1000204 <_ZN4Uart8read_regEm>
 1000330:	fea42623          	sw	a0,-20(s0)
 1000334:	fec42783          	lw	a5,-20(s0)
 1000338:	1007f793          	andi	a5,a5,256
 100033c:	00078663          	beqz	a5,1000348 <_ZN4Uart4readEv+0x38>
 1000340:	fff00793          	li	a5,-1
 1000344:	01c0006f          	j	1000360 <_ZN4Uart4readEv+0x50>
 1000348:	fec42783          	lw	a5,-20(s0)
 100034c:	01079793          	slli	a5,a5,0x10
 1000350:	4107d793          	srai	a5,a5,0x10
 1000354:	0ff7f793          	zext.b	a5,a5
 1000358:	01079793          	slli	a5,a5,0x10
 100035c:	4107d793          	srai	a5,a5,0x10
 1000360:	00078513          	mv	a0,a5
 1000364:	02c12083          	lw	ra,44(sp)
 1000368:	02812403          	lw	s0,40(sp)
 100036c:	03010113          	addi	sp,sp,48
 1000370:	00008067          	ret

01000374 <_ZN4Uart10is_tx_fullEv>:
 1000374:	fe010113          	addi	sp,sp,-32
 1000378:	00112e23          	sw	ra,28(sp)
 100037c:	00812c23          	sw	s0,24(sp)
 1000380:	02010413          	addi	s0,sp,32
 1000384:	fea42623          	sw	a0,-20(s0)
 1000388:	00300593          	li	a1,3
 100038c:	fec42503          	lw	a0,-20(s0)
 1000390:	e75ff0ef          	jal	1000204 <_ZN4Uart8read_regEm>
 1000394:	00050793          	mv	a5,a0
 1000398:	2007f793          	andi	a5,a5,512
 100039c:	00f037b3          	snez	a5,a5
 10003a0:	0ff7f793          	zext.b	a5,a5
 10003a4:	00078513          	mv	a0,a5
 10003a8:	01c12083          	lw	ra,28(sp)
 10003ac:	01812403          	lw	s0,24(sp)
 10003b0:	02010113          	addi	sp,sp,32
 10003b4:	00008067          	ret

010003b8 <_ZN4Uart11is_rx_emptyEv>:
 10003b8:	fe010113          	addi	sp,sp,-32
 10003bc:	00112e23          	sw	ra,28(sp)
 10003c0:	00812c23          	sw	s0,24(sp)
 10003c4:	02010413          	addi	s0,sp,32
 10003c8:	fea42623          	sw	a0,-20(s0)
 10003cc:	00300593          	li	a1,3
 10003d0:	fec42503          	lw	a0,-20(s0)
 10003d4:	e31ff0ef          	jal	1000204 <_ZN4Uart8read_regEm>
 10003d8:	00050793          	mv	a5,a0
 10003dc:	1007f793          	andi	a5,a5,256
 10003e0:	00f037b3          	snez	a5,a5
 10003e4:	0ff7f793          	zext.b	a5,a5
 10003e8:	00078513          	mv	a0,a5
 10003ec:	01c12083          	lw	ra,28(sp)
 10003f0:	01812403          	lw	s0,24(sp)
 10003f4:	02010113          	addi	sp,sp,32
 10003f8:	00008067          	ret

010003fc <_ZN4Uart12write_stringEPKc>:
 10003fc:	fe010113          	addi	sp,sp,-32
 1000400:	00112e23          	sw	ra,28(sp)
 1000404:	00812c23          	sw	s0,24(sp)
 1000408:	02010413          	addi	s0,sp,32
 100040c:	fea42623          	sw	a0,-20(s0)
 1000410:	feb42423          	sw	a1,-24(s0)
 1000414:	0200006f          	j	1000434 <_ZN4Uart12write_stringEPKc+0x38>
 1000418:	fe842783          	lw	a5,-24(s0)
 100041c:	00178713          	addi	a4,a5,1
 1000420:	fee42423          	sw	a4,-24(s0)
 1000424:	0007c783          	lbu	a5,0(a5)
 1000428:	00078593          	mv	a1,a5
 100042c:	fec42503          	lw	a0,-20(s0)
 1000430:	e79ff0ef          	jal	10002a8 <_ZN4Uart5writeEh>
 1000434:	fe842783          	lw	a5,-24(s0)
 1000438:	0007c783          	lbu	a5,0(a5)
 100043c:	fc079ee3          	bnez	a5,1000418 <_ZN4Uart12write_stringEPKc+0x1c>
 1000440:	00000013          	nop
 1000444:	00000013          	nop
 1000448:	01c12083          	lw	ra,28(sp)
 100044c:	01812403          	lw	s0,24(sp)
 1000450:	02010113          	addi	sp,sp,32
 1000454:	00008067          	ret
 1000458:	6978                	.insn	2, 0x6978
 100045a:	206e                	.insn	2, 0x206e
 100045c:	6f616863          	bltu	sp,s6,1000b4c <_etext+0x6e4>
 1000460:	0a20                	.insn	2, 0x0a20
	...

01000463 <_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE>:
 1000463:	                                             .

01000464 <_ZNSt8__detail30__integer_to_chars_is_unsignedImEE>:
 1000464:	                                             .

01000465 <_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE>:
 1000465:	0001                                         ...
