
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

01000000 <main>:
 1000000:	fe010113          	addi	sp,sp,-32
 1000004:	00112e23          	sw	ra,28(sp)
 1000008:	00812c23          	sw	s0,24(sp)
 100000c:	02010413          	addi	s0,sp,32
 1000010:	fec40793          	addi	a5,s0,-20
 1000014:	020035b7          	lui	a1,0x2003
 1000018:	00078513          	mv	a0,a5
 100001c:	090000ef          	jal	10000ac <_ZN9SpiDriverC1Em>
 1000020:	fec40513          	addi	a0,s0,-20
 1000024:	000f47b7          	lui	a5,0xf4
 1000028:	24078713          	addi	a4,a5,576 # f4240 <_ebss+0xf4240>
 100002c:	05f5e7b7          	lui	a5,0x5f5e
 1000030:	10078693          	addi	a3,a5,256 # 5f5e100 <_etext+0x4f5dd20>
 1000034:	00000613          	li	a2,0
 1000038:	00000593          	li	a1,0
 100003c:	148000ef          	jal	1000184 <_ZN9SpiDriver4initEhhmm>
 1000040:	fec40793          	addi	a5,s0,-20
 1000044:	00200593          	li	a1,2
 1000048:	00078513          	mv	a0,a5
 100004c:	1dc000ef          	jal	1000228 <_ZN9SpiDriver12select_slaveEh>
 1000050:	fec40793          	addi	a5,s0,-20
 1000054:	05500593          	li	a1,85
 1000058:	00078513          	mv	a0,a5
 100005c:	214000ef          	jal	1000270 <_ZN9SpiDriver5writeEh>
 1000060:	fec40713          	addi	a4,s0,-20
 1000064:	010007b7          	lui	a5,0x1000
 1000068:	3d878593          	addi	a1,a5,984 # 10003d8 <_ZN9SpiDriver12write_stringEPKc+0x5c>
 100006c:	00070513          	mv	a0,a4
 1000070:	30c000ef          	jal	100037c <_ZN9SpiDriver12write_stringEPKc>
 1000074:	fec40793          	addi	a5,s0,-20
 1000078:	0ff00593          	li	a1,255
 100007c:	00078513          	mv	a0,a5
 1000080:	1f0000ef          	jal	1000270 <_ZN9SpiDriver5writeEh>
 1000084:	fec40793          	addi	a5,s0,-20
 1000088:	00300593          	li	a1,3
 100008c:	00078513          	mv	a0,a5
 1000090:	198000ef          	jal	1000228 <_ZN9SpiDriver12select_slaveEh>
 1000094:	00000793          	li	a5,0
 1000098:	00078513          	mv	a0,a5
 100009c:	01c12083          	lw	ra,28(sp)
 10000a0:	01812403          	lw	s0,24(sp)
 10000a4:	02010113          	addi	sp,sp,32
 10000a8:	00008067          	ret

010000ac <_ZN9SpiDriverC1Em>:
 10000ac:	fe010113          	addi	sp,sp,-32
 10000b0:	00112e23          	sw	ra,28(sp)
 10000b4:	00812c23          	sw	s0,24(sp)
 10000b8:	02010413          	addi	s0,sp,32
 10000bc:	fea42623          	sw	a0,-20(s0)
 10000c0:	feb42423          	sw	a1,-24(s0)
 10000c4:	fe842703          	lw	a4,-24(s0)
 10000c8:	fec42783          	lw	a5,-20(s0)
 10000cc:	00e7a023          	sw	a4,0(a5)
 10000d0:	00000013          	nop
 10000d4:	01c12083          	lw	ra,28(sp)
 10000d8:	01812403          	lw	s0,24(sp)
 10000dc:	02010113          	addi	sp,sp,32
 10000e0:	00008067          	ret

010000e4 <_ZN9SpiDriver9write_regEmm>:
 10000e4:	fe010113          	addi	sp,sp,-32
 10000e8:	00112e23          	sw	ra,28(sp)
 10000ec:	00812c23          	sw	s0,24(sp)
 10000f0:	02010413          	addi	s0,sp,32
 10000f4:	fea42623          	sw	a0,-20(s0)
 10000f8:	feb42423          	sw	a1,-24(s0)
 10000fc:	fec42223          	sw	a2,-28(s0)
 1000100:	fec42783          	lw	a5,-20(s0)
 1000104:	0007a703          	lw	a4,0(a5)
 1000108:	fe842683          	lw	a3,-24(s0)
 100010c:	3dffd7b7          	lui	a5,0x3dffd
 1000110:	00f687b3          	add	a5,a3,a5
 1000114:	00279793          	slli	a5,a5,0x2
 1000118:	00f707b3          	add	a5,a4,a5
 100011c:	fe442703          	lw	a4,-28(s0)
 1000120:	00e7a023          	sw	a4,0(a5) # 3dffd000 <_etext+0x3cffcc20>
 1000124:	00000013          	nop
 1000128:	01c12083          	lw	ra,28(sp)
 100012c:	01812403          	lw	s0,24(sp)
 1000130:	02010113          	addi	sp,sp,32
 1000134:	00008067          	ret

01000138 <_ZN9SpiDriver8read_regEm>:
 1000138:	fe010113          	addi	sp,sp,-32
 100013c:	00112e23          	sw	ra,28(sp)
 1000140:	00812c23          	sw	s0,24(sp)
 1000144:	02010413          	addi	s0,sp,32
 1000148:	fea42623          	sw	a0,-20(s0)
 100014c:	feb42423          	sw	a1,-24(s0)
 1000150:	fec42783          	lw	a5,-20(s0)
 1000154:	0007a703          	lw	a4,0(a5)
 1000158:	fe842683          	lw	a3,-24(s0)
 100015c:	3dffd7b7          	lui	a5,0x3dffd
 1000160:	00f687b3          	add	a5,a3,a5
 1000164:	00279793          	slli	a5,a5,0x2
 1000168:	00f707b3          	add	a5,a4,a5
 100016c:	0007a783          	lw	a5,0(a5) # 3dffd000 <_etext+0x3cffcc20>
 1000170:	00078513          	mv	a0,a5
 1000174:	01c12083          	lw	ra,28(sp)
 1000178:	01812403          	lw	s0,24(sp)
 100017c:	02010113          	addi	sp,sp,32
 1000180:	00008067          	ret

01000184 <_ZN9SpiDriver4initEhhmm>:
 1000184:	fd010113          	addi	sp,sp,-48
 1000188:	02112623          	sw	ra,44(sp)
 100018c:	02812423          	sw	s0,40(sp)
 1000190:	03010413          	addi	s0,sp,48
 1000194:	fca42e23          	sw	a0,-36(s0)
 1000198:	00058793          	mv	a5,a1
 100019c:	fcd42a23          	sw	a3,-44(s0)
 10001a0:	fce42823          	sw	a4,-48(s0)
 10001a4:	fcf40da3          	sb	a5,-37(s0)
 10001a8:	00060793          	mv	a5,a2
 10001ac:	fcf40d23          	sb	a5,-38(s0)
 10001b0:	fd042783          	lw	a5,-48(s0)
 10001b4:	00179793          	slli	a5,a5,0x1
 10001b8:	fd442703          	lw	a4,-44(s0)
 10001bc:	02f757b3          	divu	a5,a4,a5
 10001c0:	fff78793          	addi	a5,a5,-1
 10001c4:	fef42623          	sw	a5,-20(s0)
 10001c8:	fda44783          	lbu	a5,-38(s0)
 10001cc:	01179713          	slli	a4,a5,0x11
 10001d0:	000207b7          	lui	a5,0x20
 10001d4:	00f77733          	and	a4,a4,a5
 10001d8:	fdb44783          	lbu	a5,-37(s0)
 10001dc:	01079693          	slli	a3,a5,0x10
 10001e0:	000107b7          	lui	a5,0x10
 10001e4:	00f6f7b3          	and	a5,a3,a5
 10001e8:	00f76733          	or	a4,a4,a5
 10001ec:	fec42783          	lw	a5,-20(s0)
 10001f0:	01079793          	slli	a5,a5,0x10
 10001f4:	0107d793          	srli	a5,a5,0x10
 10001f8:	00f767b3          	or	a5,a4,a5
 10001fc:	fef42423          	sw	a5,-24(s0)
 1000200:	fe842603          	lw	a2,-24(s0)
 1000204:	020037b7          	lui	a5,0x2003
 1000208:	00378593          	addi	a1,a5,3 # 2003003 <_etext+0x1002c23>
 100020c:	fdc42503          	lw	a0,-36(s0)
 1000210:	ed5ff0ef          	jal	10000e4 <_ZN9SpiDriver9write_regEmm>
 1000214:	00000013          	nop
 1000218:	02c12083          	lw	ra,44(sp)
 100021c:	02812403          	lw	s0,40(sp)
 1000220:	03010113          	addi	sp,sp,48
 1000224:	00008067          	ret

01000228 <_ZN9SpiDriver12select_slaveEh>:
 1000228:	fe010113          	addi	sp,sp,-32
 100022c:	00112e23          	sw	ra,28(sp)
 1000230:	00812c23          	sw	s0,24(sp)
 1000234:	02010413          	addi	s0,sp,32
 1000238:	fea42623          	sw	a0,-20(s0)
 100023c:	00058793          	mv	a5,a1
 1000240:	fef405a3          	sb	a5,-21(s0)
 1000244:	feb44783          	lbu	a5,-21(s0)
 1000248:	00078613          	mv	a2,a5
 100024c:	020037b7          	lui	a5,0x2003
 1000250:	00178593          	addi	a1,a5,1 # 2003001 <_etext+0x1002c21>
 1000254:	fec42503          	lw	a0,-20(s0)
 1000258:	e8dff0ef          	jal	10000e4 <_ZN9SpiDriver9write_regEmm>
 100025c:	00000013          	nop
 1000260:	01c12083          	lw	ra,28(sp)
 1000264:	01812403          	lw	s0,24(sp)
 1000268:	02010113          	addi	sp,sp,32
 100026c:	00008067          	ret

01000270 <_ZN9SpiDriver5writeEh>:
 1000270:	fe010113          	addi	sp,sp,-32
 1000274:	00112e23          	sw	ra,28(sp)
 1000278:	00812c23          	sw	s0,24(sp)
 100027c:	02010413          	addi	s0,sp,32
 1000280:	fea42623          	sw	a0,-20(s0)
 1000284:	00058793          	mv	a5,a1
 1000288:	fef405a3          	sb	a5,-21(s0)
 100028c:	00000013          	nop
 1000290:	fec42503          	lw	a0,-20(s0)
 1000294:	0a4000ef          	jal	1000338 <_ZN9SpiDriver8is_readyEv>
 1000298:	00050793          	mv	a5,a0
 100029c:	0017c793          	xori	a5,a5,1
 10002a0:	0ff7f793          	zext.b	a5,a5
 10002a4:	fe0796e3          	bnez	a5,1000290 <_ZN9SpiDriver5writeEh+0x20>
 10002a8:	feb44783          	lbu	a5,-21(s0)
 10002ac:	00078613          	mv	a2,a5
 10002b0:	020037b7          	lui	a5,0x2003
 10002b4:	00278593          	addi	a1,a5,2 # 2003002 <_etext+0x1002c22>
 10002b8:	fec42503          	lw	a0,-20(s0)
 10002bc:	e29ff0ef          	jal	10000e4 <_ZN9SpiDriver9write_regEmm>
 10002c0:	00000013          	nop
 10002c4:	01c12083          	lw	ra,28(sp)
 10002c8:	01812403          	lw	s0,24(sp)
 10002cc:	02010113          	addi	sp,sp,32
 10002d0:	00008067          	ret

010002d4 <_ZN9SpiDriver4readEv>:
 10002d4:	fd010113          	addi	sp,sp,-48
 10002d8:	02112623          	sw	ra,44(sp)
 10002dc:	02812423          	sw	s0,40(sp)
 10002e0:	03010413          	addi	s0,sp,48
 10002e4:	fca42e23          	sw	a0,-36(s0)
 10002e8:	020035b7          	lui	a1,0x2003
 10002ec:	fdc42503          	lw	a0,-36(s0)
 10002f0:	e49ff0ef          	jal	1000138 <_ZN9SpiDriver8read_regEm>
 10002f4:	fea42623          	sw	a0,-20(s0)
 10002f8:	fec42783          	lw	a5,-20(s0)
 10002fc:	1007f793          	andi	a5,a5,256
 1000300:	00079663          	bnez	a5,100030c <_ZN9SpiDriver4readEv+0x38>
 1000304:	fff00793          	li	a5,-1
 1000308:	01c0006f          	j	1000324 <_ZN9SpiDriver4readEv+0x50>
 100030c:	fec42783          	lw	a5,-20(s0)
 1000310:	01079793          	slli	a5,a5,0x10
 1000314:	4107d793          	srai	a5,a5,0x10
 1000318:	0ff7f793          	zext.b	a5,a5
 100031c:	01079793          	slli	a5,a5,0x10
 1000320:	4107d793          	srai	a5,a5,0x10
 1000324:	00078513          	mv	a0,a5
 1000328:	02c12083          	lw	ra,44(sp)
 100032c:	02812403          	lw	s0,40(sp)
 1000330:	03010113          	addi	sp,sp,48
 1000334:	00008067          	ret

01000338 <_ZN9SpiDriver8is_readyEv>:
 1000338:	fe010113          	addi	sp,sp,-32
 100033c:	00112e23          	sw	ra,28(sp)
 1000340:	00812c23          	sw	s0,24(sp)
 1000344:	02010413          	addi	s0,sp,32
 1000348:	fea42623          	sw	a0,-20(s0)
 100034c:	020035b7          	lui	a1,0x2003
 1000350:	fec42503          	lw	a0,-20(s0)
 1000354:	de5ff0ef          	jal	1000138 <_ZN9SpiDriver8read_regEm>
 1000358:	00050793          	mv	a5,a0
 100035c:	1007f793          	andi	a5,a5,256
 1000360:	00f037b3          	snez	a5,a5
 1000364:	0ff7f793          	zext.b	a5,a5
 1000368:	00078513          	mv	a0,a5
 100036c:	01c12083          	lw	ra,28(sp)
 1000370:	01812403          	lw	s0,24(sp)
 1000374:	02010113          	addi	sp,sp,32
 1000378:	00008067          	ret

0100037c <_ZN9SpiDriver12write_stringEPKc>:
 100037c:	fe010113          	addi	sp,sp,-32
 1000380:	00112e23          	sw	ra,28(sp)
 1000384:	00812c23          	sw	s0,24(sp)
 1000388:	02010413          	addi	s0,sp,32
 100038c:	fea42623          	sw	a0,-20(s0)
 1000390:	feb42423          	sw	a1,-24(s0)
 1000394:	0200006f          	j	10003b4 <_ZN9SpiDriver12write_stringEPKc+0x38>
 1000398:	fe842783          	lw	a5,-24(s0)
 100039c:	00178713          	addi	a4,a5,1
 10003a0:	fee42423          	sw	a4,-24(s0)
 10003a4:	0007c783          	lbu	a5,0(a5)
 10003a8:	00078593          	mv	a1,a5
 10003ac:	fec42503          	lw	a0,-20(s0)
 10003b0:	ec1ff0ef          	jal	1000270 <_ZN9SpiDriver5writeEh>
 10003b4:	fe842783          	lw	a5,-24(s0)
 10003b8:	0007c783          	lbu	a5,0(a5)
 10003bc:	fc079ee3          	bnez	a5,1000398 <_ZN9SpiDriver12write_stringEPKc+0x1c>
 10003c0:	00000013          	nop
 10003c4:	00000013          	nop
 10003c8:	01c12083          	lw	ra,28(sp)
 10003cc:	01812403          	lw	s0,24(sp)
 10003d0:	02010113          	addi	sp,sp,32
 10003d4:	00008067          	ret
 10003d8:	6548                	.insn	2, 0x6548
 10003da:	6c6c                	.insn	2, 0x6c6c
 10003dc:	0000006f          	j	10003dc <_ZN9SpiDriver12write_stringEPKc+0x60>
