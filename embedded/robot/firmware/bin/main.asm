
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <_ZN7CKodama5init_Ev>:
 8000188:	b510      	push	{r4, lr}
 800018a:	4604      	mov	r4, r0
 800018c:	f001 f98c 	bl	80014a8 <_ZN5CGPIO9gpio_initEv>
 8000190:	2800      	cmp	r0, #0
 8000192:	da03      	bge.n	800019c <_ZN7CKodama5init_Ev+0x14>
 8000194:	f5a0 501c 	sub.w	r0, r0, #9984	; 0x2700
 8000198:	3810      	subs	r0, #16
 800019a:	bd10      	pop	{r4, pc}
 800019c:	4620      	mov	r0, r4
 800019e:	f001 fa45 	bl	800162c <_ZN9CTerminal13terminal_initEv>
 80001a2:	2800      	cmp	r0, #0
 80001a4:	da03      	bge.n	80001ae <_ZN7CKodama5init_Ev+0x26>
 80001a6:	f5a0 409c 	sub.w	r0, r0, #19968	; 0x4e00
 80001aa:	3820      	subs	r0, #32
 80001ac:	bd10      	pop	{r4, pc}
 80001ae:	480e      	ldr	r0, [pc, #56]	; (80001e8 <_ZN7CKodama5init_Ev+0x60>)
 80001b0:	f000 fa18 	bl	80005e4 <_ZN6CTimer10timer_initEv>
 80001b4:	2800      	cmp	r0, #0
 80001b6:	da03      	bge.n	80001c0 <_ZN7CKodama5init_Ev+0x38>
 80001b8:	f5a0 40ea 	sub.w	r0, r0, #29952	; 0x7500
 80001bc:	3830      	subs	r0, #48	; 0x30
 80001be:	bd10      	pop	{r4, pc}
 80001c0:	4620      	mov	r0, r4
 80001c2:	f000 fd4b 	bl	8000c5c <_ZN8CSensors12sensors_initEv>
 80001c6:	2800      	cmp	r0, #0
 80001c8:	da03      	bge.n	80001d2 <_ZN7CKodama5init_Ev+0x4a>
 80001ca:	f5a0 401c 	sub.w	r0, r0, #39936	; 0x9c00
 80001ce:	3840      	subs	r0, #64	; 0x40
 80001d0:	bd10      	pop	{r4, pc}
 80001d2:	f504 70b8 	add.w	r0, r4, #368	; 0x170
 80001d6:	f000 fcb3 	bl	8000b40 <_ZN6CMotor10motor_initEv>
 80001da:	2800      	cmp	r0, #0
 80001dc:	bfbc      	itt	lt
 80001de:	f5a0 4043 	sublt.w	r0, r0, #49920	; 0xc300
 80001e2:	3850      	sublt	r0, #80	; 0x50
 80001e4:	bd10      	pop	{r4, pc}
 80001e6:	bf00      	nop
 80001e8:	200001f0 	.word	0x200001f0

080001ec <_ZN7CKodama4initEv>:
 80001ec:	b570      	push	{r4, r5, r6, lr}
 80001ee:	4605      	mov	r5, r0
 80001f0:	2400      	movs	r4, #0
 80001f2:	4628      	mov	r0, r5
 80001f4:	f7ff ffc8 	bl	8000188 <_ZN7CKodama5init_Ev>
 80001f8:	4606      	mov	r6, r0
 80001fa:	490a      	ldr	r1, [pc, #40]	; (8000224 <_ZN7CKodama4initEv+0x38>)
 80001fc:	4628      	mov	r0, r5
 80001fe:	4622      	mov	r2, r4
 8000200:	4633      	mov	r3, r6
 8000202:	f001 fb39 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8000206:	4628      	mov	r0, r5
 8000208:	b91e      	cbnz	r6, 8000212 <_ZN7CKodama4initEv+0x26>
 800020a:	4907      	ldr	r1, [pc, #28]	; (8000228 <_ZN7CKodama4initEv+0x3c>)
 800020c:	f001 fb34 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8000210:	e005      	b.n	800021e <_ZN7CKodama4initEv+0x32>
 8000212:	4906      	ldr	r1, [pc, #24]	; (800022c <_ZN7CKodama4initEv+0x40>)
 8000214:	3401      	adds	r4, #1
 8000216:	f001 fb2f 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 800021a:	2c08      	cmp	r4, #8
 800021c:	d1e9      	bne.n	80001f2 <_ZN7CKodama4initEv+0x6>
 800021e:	4630      	mov	r0, r6
 8000220:	bd70      	pop	{r4, r5, r6, pc}
 8000222:	bf00      	nop
 8000224:	08002d08 	.word	0x08002d08
 8000228:	08002d1d 	.word	0x08002d1d
 800022c:	08002d24 	.word	0x08002d24

08000230 <_ZN7CKodama5sleepEv>:
 8000230:	f500 70b8 	add.w	r0, r0, #368	; 0x170
 8000234:	f000 bc1c 	b.w	8000a70 <_ZN6CMotor11motor_sleepEv>

08000238 <_ZN7CKodama6wakeupEv>:
 8000238:	b510      	push	{r4, lr}
 800023a:	2100      	movs	r1, #0
 800023c:	f500 74b8 	add.w	r4, r0, #368	; 0x170
 8000240:	4620      	mov	r0, r4
 8000242:	460a      	mov	r2, r1
 8000244:	f000 fc76 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8000248:	4620      	mov	r0, r4
 800024a:	2101      	movs	r1, #1
 800024c:	2200      	movs	r2, #0
 800024e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000252:	f000 bc6f 	b.w	8000b34 <_ZN6CMotor9set_motorEml>

08000256 <_ZN7CKodama6set_dtEl>:
 8000256:	f8c0 1178 	str.w	r1, [r0, #376]	; 0x178
 800025a:	4770      	bx	lr

0800025c <_ZN7CKodama12rotate_robotEllPFlvE>:
 800025c:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000260:	f500 7798 	add.w	r7, r0, #304	; 0x130
 8000264:	4681      	mov	r9, r0
 8000266:	4638      	mov	r0, r7
 8000268:	4688      	mov	r8, r1
 800026a:	469a      	mov	sl, r3
 800026c:	4693      	mov	fp, r2
 800026e:	f000 fff5 	bl	800125c <_ZN4CIMU8imu_readEv>
 8000272:	4638      	mov	r0, r7
 8000274:	f001 f916 	bl	80014a4 <_ZN4CIMU14get_imu_resultEv>
 8000278:	6883      	ldr	r3, [r0, #8]
 800027a:	2500      	movs	r5, #0
 800027c:	4498      	add	r8, r3
 800027e:	4821      	ldr	r0, [pc, #132]	; (8000304 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 8000280:	210a      	movs	r1, #10
 8000282:	f000 fa07 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8000286:	f509 76b8 	add.w	r6, r9, #368	; 0x170
 800028a:	f1ba 0f00 	cmp.w	sl, #0
 800028e:	d111      	bne.n	80002b4 <_ZN7CKodama12rotate_robotEllPFlvE+0x58>
 8000290:	4638      	mov	r0, r7
 8000292:	f000 ffe3 	bl	800125c <_ZN4CIMU8imu_readEv>
 8000296:	4638      	mov	r0, r7
 8000298:	f001 f904 	bl	80014a4 <_ZN4CIMU14get_imu_resultEv>
 800029c:	6884      	ldr	r4, [r0, #8]
 800029e:	ebc4 0408 	rsb	r4, r4, r8
 80002a2:	2c00      	cmp	r4, #0
 80002a4:	bfcc      	ite	gt
 80002a6:	2301      	movgt	r3, #1
 80002a8:	f04f 33ff 	movle.w	r3, #4294967295	; 0xffffffff
 80002ac:	455d      	cmp	r5, fp
 80002ae:	da15      	bge.n	80002dc <_ZN7CKodama12rotate_robotEllPFlvE+0x80>
 80002b0:	3501      	adds	r5, #1
 80002b2:	e013      	b.n	80002dc <_ZN7CKodama12rotate_robotEllPFlvE+0x80>
 80002b4:	47d0      	blx	sl
 80002b6:	2800      	cmp	r0, #0
 80002b8:	d0ea      	beq.n	8000290 <_ZN7CKodama12rotate_robotEllPFlvE+0x34>
 80002ba:	2100      	movs	r1, #0
 80002bc:	4630      	mov	r0, r6
 80002be:	460a      	mov	r2, r1
 80002c0:	f000 fc38 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 80002c4:	4630      	mov	r0, r6
 80002c6:	2101      	movs	r1, #1
 80002c8:	2200      	movs	r2, #0
 80002ca:	f000 fc33 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 80002ce:	480d      	ldr	r0, [pc, #52]	; (8000304 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 80002d0:	2114      	movs	r1, #20
 80002d2:	b003      	add	sp, #12
 80002d4:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80002d8:	f000 b9dc 	b.w	8000694 <_ZN6CTimer8delay_msEm>
 80002dc:	fb03 f205 	mul.w	r2, r3, r5
 80002e0:	4630      	mov	r0, r6
 80002e2:	2100      	movs	r1, #0
 80002e4:	9301      	str	r3, [sp, #4]
 80002e6:	f000 fc25 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 80002ea:	9b01      	ldr	r3, [sp, #4]
 80002ec:	426a      	negs	r2, r5
 80002ee:	4630      	mov	r0, r6
 80002f0:	2101      	movs	r1, #1
 80002f2:	435a      	muls	r2, r3
 80002f4:	f000 fc1e 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 80002f8:	2c00      	cmp	r4, #0
 80002fa:	bfb8      	it	lt
 80002fc:	4264      	neglt	r4, r4
 80002fe:	2c31      	cmp	r4, #49	; 0x31
 8000300:	dcbd      	bgt.n	800027e <_ZN7CKodama12rotate_robotEllPFlvE+0x22>
 8000302:	e7da      	b.n	80002ba <_ZN7CKodama12rotate_robotEllPFlvE+0x5e>
 8000304:	200001f0 	.word	0x200001f0

08000308 <_ZN13CLinePositionC1Ev>:
 8000308:	f100 0308 	add.w	r3, r0, #8
 800030c:	f100 012c 	add.w	r1, r0, #44	; 0x2c
 8000310:	2200      	movs	r2, #0
 8000312:	f843 2b04 	str.w	r2, [r3], #4
 8000316:	428b      	cmp	r3, r1
 8000318:	d1fa      	bne.n	8000310 <_ZN13CLinePositionC1Ev+0x8>
 800031a:	2300      	movs	r3, #0
 800031c:	6042      	str	r2, [r0, #4]
 800031e:	7003      	strb	r3, [r0, #0]
 8000320:	4770      	bx	lr
	...

08000324 <_ZN13CLinePosition7processEP10sRGBResult>:
 8000324:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000328:	2300      	movs	r3, #0
 800032a:	f101 0834 	add.w	r8, r1, #52	; 0x34
 800032e:	ed2d 8b02 	vpush	{d8}
 8000332:	460d      	mov	r5, r1
 8000334:	4604      	mov	r4, r0
 8000336:	7003      	strb	r3, [r0, #0]
 8000338:	4641      	mov	r1, r8
 800033a:	461a      	mov	r2, r3
 800033c:	eb05 0043 	add.w	r0, r5, r3, lsl #1
 8000340:	f931 6f02 	ldrsh.w	r6, [r1, #2]!
 8000344:	f9b0 0036 	ldrsh.w	r0, [r0, #54]	; 0x36
 8000348:	4286      	cmp	r6, r0
 800034a:	bfb8      	it	lt
 800034c:	4613      	movlt	r3, r2
 800034e:	3201      	adds	r2, #1
 8000350:	2a09      	cmp	r2, #9
 8000352:	d1f3      	bne.n	800033c <_ZN13CLinePosition7processEP10sRGBResult+0x18>
 8000354:	eb05 0343 	add.w	r3, r5, r3, lsl #1
 8000358:	eddf 7a3b 	vldr	s15, [pc, #236]	; 8000448 <_ZN13CLinePosition7processEP10sRGBResult+0x124>
 800035c:	f9b3 3036 	ldrsh.w	r3, [r3, #54]	; 0x36
 8000360:	ee07 3a10 	vmov	s14, r3
 8000364:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000368:	eeb0 8a67 	vmov.f32	s16, s15
 800036c:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000370:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000374:	d563      	bpl.n	800043e <_ZN13CLinePosition7processEP10sRGBResult+0x11a>
 8000376:	f104 0608 	add.w	r6, r4, #8
 800037a:	eddf 8a34 	vldr	s17, [pc, #208]	; 800044c <_ZN13CLinePosition7processEP10sRGBResult+0x128>
 800037e:	f104 092c 	add.w	r9, r4, #44	; 0x2c
 8000382:	4637      	mov	r7, r6
 8000384:	f938 3f02 	ldrsh.w	r3, [r8, #2]!
 8000388:	4831      	ldr	r0, [pc, #196]	; (8000450 <_ZN13CLinePosition7processEP10sRGBResult+0x12c>)
 800038a:	425b      	negs	r3, r3
 800038c:	ee00 3a10 	vmov	s0, r3
 8000390:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
 8000394:	eca7 0a01 	vstmia	r7!, {s0}
 8000398:	f000 f8b2 	bl	8000500 <_ZN5CMath3absEf>
 800039c:	eef4 8ac0 	vcmpe.f32	s17, s0
 80003a0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80003a4:	d506      	bpl.n	80003b4 <_ZN13CLinePosition7processEP10sRGBResult+0x90>
 80003a6:	482a      	ldr	r0, [pc, #168]	; (8000450 <_ZN13CLinePosition7processEP10sRGBResult+0x12c>)
 80003a8:	ed17 0a01 	vldr	s0, [r7, #-4]
 80003ac:	f000 f8a8 	bl	8000500 <_ZN5CMath3absEf>
 80003b0:	eef0 8a40 	vmov.f32	s17, s0
 80003b4:	454f      	cmp	r7, r9
 80003b6:	d1e5      	bne.n	8000384 <_ZN13CLinePosition7processEP10sRGBResult+0x60>
 80003b8:	edd6 7a00 	vldr	s15, [r6]
 80003bc:	eec7 7aa8 	vdiv.f32	s15, s15, s17
 80003c0:	ece6 7a01 	vstmia	r6!, {s15}
 80003c4:	454e      	cmp	r6, r9
 80003c6:	d1f7      	bne.n	80003b8 <_ZN13CLinePosition7processEP10sRGBResult+0x94>
 80003c8:	2301      	movs	r3, #1
 80003ca:	7023      	strb	r3, [r4, #0]
 80003cc:	f9b5 3036 	ldrsh.w	r3, [r5, #54]	; 0x36
 80003d0:	eddf 7a1d 	vldr	s15, [pc, #116]	; 8000448 <_ZN13CLinePosition7processEP10sRGBResult+0x124>
 80003d4:	ee07 3a10 	vmov	s14, r3
 80003d8:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80003dc:	eeb4 7ac8 	vcmpe.f32	s14, s16
 80003e0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80003e4:	d501      	bpl.n	80003ea <_ZN13CLinePosition7processEP10sRGBResult+0xc6>
 80003e6:	4b1b      	ldr	r3, [pc, #108]	; (8000454 <_ZN13CLinePosition7processEP10sRGBResult+0x130>)
 80003e8:	e028      	b.n	800043c <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 80003ea:	f9b5 303c 	ldrsh.w	r3, [r5, #60]	; 0x3c
 80003ee:	ee07 3a10 	vmov	s14, r3
 80003f2:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80003f6:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80003fa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80003fe:	d502      	bpl.n	8000406 <_ZN13CLinePosition7processEP10sRGBResult+0xe2>
 8000400:	f04f 537e 	mov.w	r3, #1065353216	; 0x3f800000
 8000404:	e01a      	b.n	800043c <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 8000406:	f9b5 3038 	ldrsh.w	r3, [r5, #56]	; 0x38
 800040a:	ee07 3a10 	vmov	s14, r3
 800040e:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000412:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000416:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800041a:	d502      	bpl.n	8000422 <_ZN13CLinePosition7processEP10sRGBResult+0xfe>
 800041c:	f04f 433f 	mov.w	r3, #3204448256	; 0xbf000000
 8000420:	e00c      	b.n	800043c <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 8000422:	f9b5 303a 	ldrsh.w	r3, [r5, #58]	; 0x3a
 8000426:	ee07 3a10 	vmov	s14, r3
 800042a:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 800042e:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000432:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000436:	d502      	bpl.n	800043e <_ZN13CLinePosition7processEP10sRGBResult+0x11a>
 8000438:	f04f 537c 	mov.w	r3, #1056964608	; 0x3f000000
 800043c:	6063      	str	r3, [r4, #4]
 800043e:	ecbd 8b02 	vpop	{d8}
 8000442:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000446:	bf00      	nop
 8000448:	c2a00000 	.word	0xc2a00000
 800044c:	38d1b717 	.word	0x38d1b717
 8000450:	200001bc 	.word	0x200001bc
 8000454:	bf800000 	.word	0xbf800000

08000458 <_ZN13CLinePosition7on_lineEv>:
 8000458:	7800      	ldrb	r0, [r0, #0]
 800045a:	4770      	bx	lr

0800045c <_ZN13CLinePosition17get_line_positionEv>:
 800045c:	ed90 0a01 	vldr	s0, [r0, #4]
 8000460:	4770      	bx	lr

08000462 <_ZN4CPID4initEffff>:
 8000462:	eef0 7a00 	vmov.f32	s15, #0	; 0x40000000  2.0
 8000466:	ee70 0a20 	vadd.f32	s1, s0, s1
 800046a:	ee91 0a67 	vfnma.f32	s0, s2, s15
 800046e:	2300      	movs	r3, #0
 8000470:	6003      	str	r3, [r0, #0]
 8000472:	ee70 0a81 	vadd.f32	s1, s1, s2
 8000476:	6043      	str	r3, [r0, #4]
 8000478:	6083      	str	r3, [r0, #8]
 800047a:	edc0 0a03 	vstr	s1, [r0, #12]
 800047e:	ed80 0a04 	vstr	s0, [r0, #16]
 8000482:	ed80 1a05 	vstr	s2, [r0, #20]
 8000486:	6183      	str	r3, [r0, #24]
 8000488:	edc0 1a07 	vstr	s3, [r0, #28]
 800048c:	4770      	bx	lr

0800048e <_ZN4CPIDC1Effff>:
 800048e:	b510      	push	{r4, lr}
 8000490:	4604      	mov	r4, r0
 8000492:	f7ff ffe6 	bl	8000462 <_ZN4CPID4initEffff>
 8000496:	4620      	mov	r0, r4
 8000498:	bd10      	pop	{r4, pc}

0800049a <_ZN4CPID7processEf>:
 800049a:	edd0 7a00 	vldr	s15, [r0]
 800049e:	edd0 6a04 	vldr	s13, [r0, #16]
 80004a2:	ed90 7a01 	vldr	s14, [r0, #4]
 80004a6:	edc0 7a01 	vstr	s15, [r0, #4]
 80004aa:	ee67 7aa6 	vmul.f32	s15, s15, s13
 80004ae:	edd0 6a03 	vldr	s13, [r0, #12]
 80004b2:	ed80 7a02 	vstr	s14, [r0, #8]
 80004b6:	eee6 7a80 	vfma.f32	s15, s13, s0
 80004ba:	edd0 6a05 	vldr	s13, [r0, #20]
 80004be:	ed80 0a00 	vstr	s0, [r0]
 80004c2:	eee6 7a87 	vfma.f32	s15, s13, s14
 80004c6:	ed90 7a06 	vldr	s14, [r0, #24]
 80004ca:	ee77 7a87 	vadd.f32	s15, s15, s14
 80004ce:	ed90 7a07 	vldr	s14, [r0, #28]
 80004d2:	edc0 7a06 	vstr	s15, [r0, #24]
 80004d6:	eef4 7ac7 	vcmpe.f32	s15, s14
 80004da:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80004de:	bfc8      	it	gt
 80004e0:	ed80 7a06 	vstrgt	s14, [r0, #24]
 80004e4:	edd0 7a06 	vldr	s15, [r0, #24]
 80004e8:	eeb1 7a47 	vneg.f32	s14, s14
 80004ec:	eef4 7ac7 	vcmpe.f32	s15, s14
 80004f0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80004f4:	bf48      	it	mi
 80004f6:	ed80 7a06 	vstrmi	s14, [r0, #24]
 80004fa:	ed90 0a06 	vldr	s0, [r0, #24]
 80004fe:	4770      	bx	lr

08000500 <_ZN5CMath3absEf>:
 8000500:	eeb5 0ac0 	vcmpe.f32	s0, #0.0
 8000504:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000508:	bf48      	it	mi
 800050a:	eeb1 0a40 	vnegmi.f32	s0, s0
 800050e:	4770      	bx	lr

08000510 <_ZN5CMath4randEv>:
 8000510:	6803      	ldr	r3, [r0, #0]
 8000512:	490b      	ldr	r1, [pc, #44]	; (8000540 <_ZN5CMath4randEv+0x30>)
 8000514:	f243 0239 	movw	r2, #12345	; 0x3039
 8000518:	fb01 2203 	mla	r2, r1, r3, r2
 800051c:	6841      	ldr	r1, [r0, #4]
 800051e:	6002      	str	r2, [r0, #0]
 8000520:	f341 0300 	sbfx	r3, r1, #0, #1
 8000524:	f023 533f 	bic.w	r3, r3, #801112064	; 0x2fc00000
 8000528:	f423 137f 	bic.w	r3, r3, #4177920	; 0x3fc000
 800052c:	f423 537f 	bic.w	r3, r3, #16320	; 0x3fc0
 8000530:	f023 033e 	bic.w	r3, r3, #62	; 0x3e
 8000534:	ea83 0351 	eor.w	r3, r3, r1, lsr #1
 8000538:	6043      	str	r3, [r0, #4]
 800053a:	ea83 0002 	eor.w	r0, r3, r2
 800053e:	4770      	bx	lr
 8000540:	41c64e6d 	.word	0x41c64e6d

08000544 <_ZN5CMath3rndEv>:
 8000544:	b508      	push	{r3, lr}
 8000546:	f7ff ffe3 	bl	8000510 <_ZN5CMath4randEv>
 800054a:	4b09      	ldr	r3, [pc, #36]	; (8000570 <_ZN5CMath3rndEv+0x2c>)
 800054c:	fbb0 f2f3 	udiv	r2, r0, r3
 8000550:	fb02 0013 	mls	r0, r2, r3, r0
 8000554:	ee07 0a90 	vmov	s15, r0
 8000558:	ed9f 0a06 	vldr	s0, [pc, #24]	; 8000574 <_ZN5CMath3rndEv+0x30>
 800055c:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8000560:	eec7 7a80 	vdiv.f32	s15, s15, s0
 8000564:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8000568:	ee37 0ac0 	vsub.f32	s0, s15, s0
 800056c:	bd08      	pop	{r3, pc}
 800056e:	bf00      	nop
 8000570:	001e8480 	.word	0x001e8480
 8000574:	49742400 	.word	0x49742400

08000578 <TIM3_IRQHandler>:
 8000578:	2300      	movs	r3, #0
 800057a:	4a15      	ldr	r2, [pc, #84]	; (80005d0 <TIM3_IRQHandler+0x58>)
 800057c:	5cd1      	ldrb	r1, [r2, r3]
 800057e:	b111      	cbz	r1, 8000586 <TIM3_IRQHandler+0xe>
 8000580:	5cd1      	ldrb	r1, [r2, r3]
 8000582:	29ff      	cmp	r1, #255	; 0xff
 8000584:	d11e      	bne.n	80005c4 <TIM3_IRQHandler+0x4c>
 8000586:	4913      	ldr	r1, [pc, #76]	; (80005d4 <TIM3_IRQHandler+0x5c>)
 8000588:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
 800058c:	b128      	cbz	r0, 800059a <TIM3_IRQHandler+0x22>
 800058e:	f851 2023 	ldr.w	r2, [r1, r3, lsl #2]
 8000592:	3a01      	subs	r2, #1
 8000594:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000598:	e009      	b.n	80005ae <TIM3_IRQHandler+0x36>
 800059a:	480f      	ldr	r0, [pc, #60]	; (80005d8 <TIM3_IRQHandler+0x60>)
 800059c:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
 80005a0:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
 80005a4:	5cd2      	ldrb	r2, [r2, r3]
 80005a6:	b912      	cbnz	r2, 80005ae <TIM3_IRQHandler+0x36>
 80005a8:	4a09      	ldr	r2, [pc, #36]	; (80005d0 <TIM3_IRQHandler+0x58>)
 80005aa:	2101      	movs	r1, #1
 80005ac:	54d1      	strb	r1, [r2, r3]
 80005ae:	3301      	adds	r3, #1
 80005b0:	2b08      	cmp	r3, #8
 80005b2:	d1e2      	bne.n	800057a <TIM3_IRQHandler+0x2>
 80005b4:	4a09      	ldr	r2, [pc, #36]	; (80005dc <TIM3_IRQHandler+0x64>)
 80005b6:	480a      	ldr	r0, [pc, #40]	; (80005e0 <TIM3_IRQHandler+0x68>)
 80005b8:	6813      	ldr	r3, [r2, #0]
 80005ba:	2101      	movs	r1, #1
 80005bc:	3301      	adds	r3, #1
 80005be:	6013      	str	r3, [r2, #0]
 80005c0:	f002 b845 	b.w	800264e <TIM_ClearITPendingBit>
 80005c4:	5cd1      	ldrb	r1, [r2, r3]
 80005c6:	3101      	adds	r1, #1
 80005c8:	b2c9      	uxtb	r1, r1
 80005ca:	54d1      	strb	r1, [r2, r3]
 80005cc:	e7db      	b.n	8000586 <TIM3_IRQHandler+0xe>
 80005ce:	bf00      	nop
 80005d0:	200001e4 	.word	0x200001e4
 80005d4:	200001c4 	.word	0x200001c4
 80005d8:	200001f4 	.word	0x200001f4
 80005dc:	200001ec 	.word	0x200001ec
 80005e0:	40000400 	.word	0x40000400

080005e4 <_ZN6CTimer10timer_initEv>:
 80005e4:	b530      	push	{r4, r5, lr}
 80005e6:	4a1f      	ldr	r2, [pc, #124]	; (8000664 <_ZN6CTimer10timer_initEv+0x80>)
 80005e8:	2300      	movs	r3, #0
 80005ea:	b085      	sub	sp, #20
 80005ec:	6013      	str	r3, [r2, #0]
 80005ee:	491e      	ldr	r1, [pc, #120]	; (8000668 <_ZN6CTimer10timer_initEv+0x84>)
 80005f0:	f44f 6280 	mov.w	r2, #1024	; 0x400
 80005f4:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80005f8:	491c      	ldr	r1, [pc, #112]	; (800066c <_ZN6CTimer10timer_initEv+0x88>)
 80005fa:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80005fe:	4a1c      	ldr	r2, [pc, #112]	; (8000670 <_ZN6CTimer10timer_initEv+0x8c>)
 8000600:	2400      	movs	r4, #0
 8000602:	54d4      	strb	r4, [r2, r3]
 8000604:	3301      	adds	r3, #1
 8000606:	2b08      	cmp	r3, #8
 8000608:	d1f1      	bne.n	80005ee <_ZN6CTimer10timer_initEv+0xa>
 800060a:	4d1a      	ldr	r5, [pc, #104]	; (8000674 <_ZN6CTimer10timer_initEv+0x90>)
 800060c:	2002      	movs	r0, #2
 800060e:	2101      	movs	r1, #1
 8000610:	f001 ff22 	bl	8002458 <RCC_APB1PeriphClockCmd>
 8000614:	f44f 738c 	mov.w	r3, #280	; 0x118
 8000618:	f8ad 3004 	strh.w	r3, [sp, #4]
 800061c:	4628      	mov	r0, r5
 800061e:	2331      	movs	r3, #49	; 0x31
 8000620:	a901      	add	r1, sp, #4
 8000622:	9302      	str	r3, [sp, #8]
 8000624:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000628:	f8ad 400c 	strh.w	r4, [sp, #12]
 800062c:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000630:	f001 ff20 	bl	8002474 <TIM_TimeBaseInit>
 8000634:	4628      	mov	r0, r5
 8000636:	2101      	movs	r1, #1
 8000638:	f001 ff6c 	bl	8002514 <TIM_Cmd>
 800063c:	68eb      	ldr	r3, [r5, #12]
 800063e:	f043 0301 	orr.w	r3, r3, #1
 8000642:	60eb      	str	r3, [r5, #12]
 8000644:	231d      	movs	r3, #29
 8000646:	f88d 3000 	strb.w	r3, [sp]
 800064a:	4668      	mov	r0, sp
 800064c:	2301      	movs	r3, #1
 800064e:	f88d 4001 	strb.w	r4, [sp, #1]
 8000652:	f88d 3002 	strb.w	r3, [sp, #2]
 8000656:	f88d 3003 	strb.w	r3, [sp, #3]
 800065a:	f002 f931 	bl	80028c0 <NVIC_Init>
 800065e:	4620      	mov	r0, r4
 8000660:	b005      	add	sp, #20
 8000662:	bd30      	pop	{r4, r5, pc}
 8000664:	200001ec 	.word	0x200001ec
 8000668:	200001c4 	.word	0x200001c4
 800066c:	200001f4 	.word	0x200001f4
 8000670:	200001e4 	.word	0x200001e4
 8000674:	40000400 	.word	0x40000400

08000678 <_ZN6CTimer8get_timeEv>:
 8000678:	b082      	sub	sp, #8
 800067a:	b672      	cpsid	i
 800067c:	4b04      	ldr	r3, [pc, #16]	; (8000690 <_ZN6CTimer8get_timeEv+0x18>)
 800067e:	681b      	ldr	r3, [r3, #0]
 8000680:	9301      	str	r3, [sp, #4]
 8000682:	b662      	cpsie	i
 8000684:	230a      	movs	r3, #10
 8000686:	9801      	ldr	r0, [sp, #4]
 8000688:	fbb0 f0f3 	udiv	r0, r0, r3
 800068c:	b002      	add	sp, #8
 800068e:	4770      	bx	lr
 8000690:	200001ec 	.word	0x200001ec

08000694 <_ZN6CTimer8delay_msEm>:
 8000694:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000696:	460c      	mov	r4, r1
 8000698:	4605      	mov	r5, r0
 800069a:	f7ff ffed 	bl	8000678 <_ZN6CTimer8get_timeEv>
 800069e:	4420      	add	r0, r4
 80006a0:	9001      	str	r0, [sp, #4]
 80006a2:	4628      	mov	r0, r5
 80006a4:	9c01      	ldr	r4, [sp, #4]
 80006a6:	f7ff ffe7 	bl	8000678 <_ZN6CTimer8get_timeEv>
 80006aa:	4284      	cmp	r4, r0
 80006ac:	d902      	bls.n	80006b4 <_ZN6CTimer8delay_msEm+0x20>
 80006ae:	f002 f903 	bl	80028b8 <core_yield>
 80006b2:	e7f6      	b.n	80006a2 <_ZN6CTimer8delay_msEm+0xe>
 80006b4:	b003      	add	sp, #12
 80006b6:	bd30      	pop	{r4, r5, pc}

080006b8 <_ZN6CTimer22event_timer_set_periodEhm>:
 80006b8:	b672      	cpsid	i
 80006ba:	230a      	movs	r3, #10
 80006bc:	435a      	muls	r2, r3
 80006be:	4b05      	ldr	r3, [pc, #20]	; (80006d4 <_ZN6CTimer22event_timer_set_periodEhm+0x1c>)
 80006c0:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 80006c4:	4b04      	ldr	r3, [pc, #16]	; (80006d8 <_ZN6CTimer22event_timer_set_periodEhm+0x20>)
 80006c6:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 80006ca:	4b04      	ldr	r3, [pc, #16]	; (80006dc <_ZN6CTimer22event_timer_set_periodEhm+0x24>)
 80006cc:	2200      	movs	r2, #0
 80006ce:	545a      	strb	r2, [r3, r1]
 80006d0:	b662      	cpsie	i
 80006d2:	4770      	bx	lr
 80006d4:	200001c4 	.word	0x200001c4
 80006d8:	200001f4 	.word	0x200001f4
 80006dc:	200001e4 	.word	0x200001e4

080006e0 <_ZN6CTimer17event_timer_checkEh>:
 80006e0:	4b05      	ldr	r3, [pc, #20]	; (80006f8 <_ZN6CTimer17event_timer_checkEh+0x18>)
 80006e2:	5c5a      	ldrb	r2, [r3, r1]
 80006e4:	f002 00ff 	and.w	r0, r2, #255	; 0xff
 80006e8:	b12a      	cbz	r2, 80006f6 <_ZN6CTimer17event_timer_checkEh+0x16>
 80006ea:	b672      	cpsid	i
 80006ec:	5c58      	ldrb	r0, [r3, r1]
 80006ee:	2200      	movs	r2, #0
 80006f0:	b2c0      	uxtb	r0, r0
 80006f2:	545a      	strb	r2, [r3, r1]
 80006f4:	b662      	cpsie	i
 80006f6:	4770      	bx	lr
 80006f8:	200001e4 	.word	0x200001e4

080006fc <_ZN4CRGB8rgb_readEh>:
 80006fc:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000700:	4604      	mov	r4, r0
 8000702:	4689      	mov	r9, r1
 8000704:	f000 fb2c 	bl	8000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000708:	4620      	mov	r0, r4
 800070a:	2172      	movs	r1, #114	; 0x72
 800070c:	f000 fb52 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000710:	21b4      	movs	r1, #180	; 0xb4
 8000712:	4620      	mov	r0, r4
 8000714:	f000 fb4e 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000718:	4620      	mov	r0, r4
 800071a:	f000 fb21 	bl	8000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 800071e:	1d26      	adds	r6, r4, #4
 8000720:	4620      	mov	r0, r4
 8000722:	2173      	movs	r1, #115	; 0x73
 8000724:	f000 fb46 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000728:	1ce5      	adds	r5, r4, #3
 800072a:	4632      	mov	r2, r6
 800072c:	4620      	mov	r0, r4
 800072e:	2101      	movs	r1, #1
 8000730:	f104 0a42 	add.w	sl, r4, #66	; 0x42
 8000734:	f000 fb80 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000738:	f104 0754 	add.w	r7, r4, #84	; 0x54
 800073c:	4653      	mov	r3, sl
 800073e:	462a      	mov	r2, r5
 8000740:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000744:	f823 1f02 	strh.w	r1, [r3, #2]!
 8000748:	42bb      	cmp	r3, r7
 800074a:	d1f9      	bne.n	8000740 <_ZN4CRGB8rgb_readEh+0x44>
 800074c:	2101      	movs	r1, #1
 800074e:	4620      	mov	r0, r4
 8000750:	4632      	mov	r2, r6
 8000752:	f000 fb71 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000756:	4629      	mov	r1, r5
 8000758:	4653      	mov	r3, sl
 800075a:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 800075e:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 8000762:	42bb      	cmp	r3, r7
 8000764:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8000768:	801a      	strh	r2, [r3, #0]
 800076a:	d1f6      	bne.n	800075a <_ZN4CRGB8rgb_readEh+0x5e>
 800076c:	4632      	mov	r2, r6
 800076e:	4620      	mov	r0, r4
 8000770:	2101      	movs	r1, #1
 8000772:	f104 080c 	add.w	r8, r4, #12
 8000776:	f000 fb5f 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 800077a:	f104 0b1e 	add.w	fp, r4, #30
 800077e:	4643      	mov	r3, r8
 8000780:	462a      	mov	r2, r5
 8000782:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000786:	f823 1f02 	strh.w	r1, [r3, #2]!
 800078a:	455b      	cmp	r3, fp
 800078c:	d1f9      	bne.n	8000782 <_ZN4CRGB8rgb_readEh+0x86>
 800078e:	4632      	mov	r2, r6
 8000790:	4620      	mov	r0, r4
 8000792:	2101      	movs	r1, #1
 8000794:	f000 fb50 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000798:	462a      	mov	r2, r5
 800079a:	f838 3f02 	ldrh.w	r3, [r8, #2]!
 800079e:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 80007a2:	45d8      	cmp	r8, fp
 80007a4:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 80007a8:	f8a8 3000 	strh.w	r3, [r8]
 80007ac:	d1f5      	bne.n	800079a <_ZN4CRGB8rgb_readEh+0x9e>
 80007ae:	4632      	mov	r2, r6
 80007b0:	4620      	mov	r0, r4
 80007b2:	2101      	movs	r1, #1
 80007b4:	f000 fb40 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 80007b8:	f104 0830 	add.w	r8, r4, #48	; 0x30
 80007bc:	465b      	mov	r3, fp
 80007be:	462a      	mov	r2, r5
 80007c0:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 80007c4:	f823 1f02 	strh.w	r1, [r3, #2]!
 80007c8:	4543      	cmp	r3, r8
 80007ca:	d1f9      	bne.n	80007c0 <_ZN4CRGB8rgb_readEh+0xc4>
 80007cc:	4632      	mov	r2, r6
 80007ce:	4620      	mov	r0, r4
 80007d0:	2101      	movs	r1, #1
 80007d2:	f000 fb31 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 80007d6:	462a      	mov	r2, r5
 80007d8:	f83b 3f02 	ldrh.w	r3, [fp, #2]!
 80007dc:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 80007e0:	45c3      	cmp	fp, r8
 80007e2:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 80007e6:	f8ab 3000 	strh.w	r3, [fp]
 80007ea:	d1f5      	bne.n	80007d8 <_ZN4CRGB8rgb_readEh+0xdc>
 80007ec:	4632      	mov	r2, r6
 80007ee:	4620      	mov	r0, r4
 80007f0:	2101      	movs	r1, #1
 80007f2:	f000 fb21 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 80007f6:	4643      	mov	r3, r8
 80007f8:	462a      	mov	r2, r5
 80007fa:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 80007fe:	f823 1f02 	strh.w	r1, [r3, #2]!
 8000802:	4553      	cmp	r3, sl
 8000804:	d1f9      	bne.n	80007fa <_ZN4CRGB8rgb_readEh+0xfe>
 8000806:	4632      	mov	r2, r6
 8000808:	4620      	mov	r0, r4
 800080a:	2101      	movs	r1, #1
 800080c:	f000 fb14 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000810:	462a      	mov	r2, r5
 8000812:	f838 3f02 	ldrh.w	r3, [r8, #2]!
 8000816:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 800081a:	45d0      	cmp	r8, sl
 800081c:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000820:	f8a8 3000 	strh.w	r3, [r8]
 8000824:	d1f5      	bne.n	8000812 <_ZN4CRGB8rgb_readEh+0x116>
 8000826:	4632      	mov	r2, r6
 8000828:	4620      	mov	r0, r4
 800082a:	2101      	movs	r1, #1
 800082c:	f000 fb04 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000830:	f104 0866 	add.w	r8, r4, #102	; 0x66
 8000834:	463b      	mov	r3, r7
 8000836:	462a      	mov	r2, r5
 8000838:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 800083c:	f823 1f02 	strh.w	r1, [r3, #2]!
 8000840:	4543      	cmp	r3, r8
 8000842:	d1f9      	bne.n	8000838 <_ZN4CRGB8rgb_readEh+0x13c>
 8000844:	4620      	mov	r0, r4
 8000846:	2100      	movs	r1, #0
 8000848:	4632      	mov	r2, r6
 800084a:	f000 faf5 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 800084e:	f837 3f02 	ldrh.w	r3, [r7, #2]!
 8000852:	f815 2f01 	ldrb.w	r2, [r5, #1]!
 8000856:	4547      	cmp	r7, r8
 8000858:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 800085c:	803b      	strh	r3, [r7, #0]
 800085e:	d1f6      	bne.n	800084e <_ZN4CRGB8rgb_readEh+0x152>
 8000860:	4620      	mov	r0, r4
 8000862:	f000 fa92 	bl	8000d8a <_ZN8CRGB_I2C11rgb_i2cStopEv>
 8000866:	f1b9 0f00 	cmp.w	r9, #0
 800086a:	d027      	beq.n	80008bc <_ZN4CRGB8rgb_readEh+0x1c0>
 800086c:	2300      	movs	r3, #0
 800086e:	89e1      	ldrh	r1, [r4, #14]
 8000870:	f8b4 209e 	ldrh.w	r2, [r4, #158]	; 0x9e
 8000874:	440a      	add	r2, r1
 8000876:	f8a4 209e 	strh.w	r2, [r4, #158]	; 0x9e
 800087a:	8c21      	ldrh	r1, [r4, #32]
 800087c:	f8b4 20b0 	ldrh.w	r2, [r4, #176]	; 0xb0
 8000880:	440a      	add	r2, r1
 8000882:	f8a4 20b0 	strh.w	r2, [r4, #176]	; 0xb0
 8000886:	8e61      	ldrh	r1, [r4, #50]	; 0x32
 8000888:	f8b4 20c2 	ldrh.w	r2, [r4, #194]	; 0xc2
 800088c:	440a      	add	r2, r1
 800088e:	f8a4 20c2 	strh.w	r2, [r4, #194]	; 0xc2
 8000892:	f8b4 1056 	ldrh.w	r1, [r4, #86]	; 0x56
 8000896:	f8b4 20e6 	ldrh.w	r2, [r4, #230]	; 0xe6
 800089a:	440a      	add	r2, r1
 800089c:	f8a4 20e6 	strh.w	r2, [r4, #230]	; 0xe6
 80008a0:	f8b4 1044 	ldrh.w	r1, [r4, #68]	; 0x44
 80008a4:	f8b4 20d4 	ldrh.w	r2, [r4, #212]	; 0xd4
 80008a8:	3301      	adds	r3, #1
 80008aa:	440a      	add	r2, r1
 80008ac:	2b09      	cmp	r3, #9
 80008ae:	f8a4 20d4 	strh.w	r2, [r4, #212]	; 0xd4
 80008b2:	f104 0402 	add.w	r4, r4, #2
 80008b6:	d1da      	bne.n	800086e <_ZN4CRGB8rgb_readEh+0x172>
 80008b8:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80008bc:	4649      	mov	r1, r9
 80008be:	b672      	cpsid	i
 80008c0:	89e3      	ldrh	r3, [r4, #14]
 80008c2:	f8b4 009e 	ldrh.w	r0, [r4, #158]	; 0x9e
 80008c6:	f8b4 20b0 	ldrh.w	r2, [r4, #176]	; 0xb0
 80008ca:	f8b4 50c2 	ldrh.w	r5, [r4, #194]	; 0xc2
 80008ce:	f8b4 60e6 	ldrh.w	r6, [r4, #230]	; 0xe6
 80008d2:	1a18      	subs	r0, r3, r0
 80008d4:	8c23      	ldrh	r3, [r4, #32]
 80008d6:	1a9a      	subs	r2, r3, r2
 80008d8:	8e63      	ldrh	r3, [r4, #50]	; 0x32
 80008da:	1b5b      	subs	r3, r3, r5
 80008dc:	f8b4 5056 	ldrh.w	r5, [r4, #86]	; 0x56
 80008e0:	1bad      	subs	r5, r5, r6
 80008e2:	f8a4 5056 	strh.w	r5, [r4, #86]	; 0x56
 80008e6:	f8b4 60d4 	ldrh.w	r6, [r4, #212]	; 0xd4
 80008ea:	f8b4 5044 	ldrh.w	r5, [r4, #68]	; 0x44
 80008ee:	b280      	uxth	r0, r0
 80008f0:	b292      	uxth	r2, r2
 80008f2:	b29b      	uxth	r3, r3
 80008f4:	1bad      	subs	r5, r5, r6
 80008f6:	81e0      	strh	r0, [r4, #14]
 80008f8:	8422      	strh	r2, [r4, #32]
 80008fa:	8663      	strh	r3, [r4, #50]	; 0x32
 80008fc:	f8a4 5044 	strh.w	r5, [r4, #68]	; 0x44
 8000900:	b662      	cpsie	i
 8000902:	b200      	sxth	r0, r0
 8000904:	b212      	sxth	r2, r2
 8000906:	1885      	adds	r5, r0, r2
 8000908:	b21b      	sxth	r3, r3
 800090a:	18ed      	adds	r5, r5, r3
 800090c:	d011      	beq.n	8000932 <_ZN4CRGB8rgb_readEh+0x236>
 800090e:	ebc0 2000 	rsb	r0, r0, r0, lsl #8
 8000912:	ebc2 2202 	rsb	r2, r2, r2, lsl #8
 8000916:	fb90 f0f5 	sdiv	r0, r0, r5
 800091a:	fb92 f2f5 	sdiv	r2, r2, r5
 800091e:	ebc3 2303 	rsb	r3, r3, r3, lsl #8
 8000922:	f8a4 0068 	strh.w	r0, [r4, #104]	; 0x68
 8000926:	fb93 f3f5 	sdiv	r3, r3, r5
 800092a:	f8a4 207a 	strh.w	r2, [r4, #122]	; 0x7a
 800092e:	f8a4 308c 	strh.w	r3, [r4, #140]	; 0x8c
 8000932:	3101      	adds	r1, #1
 8000934:	2909      	cmp	r1, #9
 8000936:	f104 0402 	add.w	r4, r4, #2
 800093a:	d1c0      	bne.n	80008be <_ZN4CRGB8rgb_readEh+0x1c2>
 800093c:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

08000940 <_ZN4CRGB8rgb_initEv>:
 8000940:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000942:	4603      	mov	r3, r0
 8000944:	b085      	sub	sp, #20
 8000946:	4604      	mov	r4, r0
 8000948:	4606      	mov	r6, r0
 800094a:	2509      	movs	r5, #9
 800094c:	2200      	movs	r2, #0
 800094e:	3d01      	subs	r5, #1
 8000950:	81da      	strh	r2, [r3, #14]
 8000952:	841a      	strh	r2, [r3, #32]
 8000954:	865a      	strh	r2, [r3, #50]	; 0x32
 8000956:	f8a3 2056 	strh.w	r2, [r3, #86]	; 0x56
 800095a:	f8a3 2044 	strh.w	r2, [r3, #68]	; 0x44
 800095e:	f8a3 209e 	strh.w	r2, [r3, #158]	; 0x9e
 8000962:	f8a3 20b0 	strh.w	r2, [r3, #176]	; 0xb0
 8000966:	f8a3 20c2 	strh.w	r2, [r3, #194]	; 0xc2
 800096a:	f8a3 20e6 	strh.w	r2, [r3, #230]	; 0xe6
 800096e:	f8a3 20d4 	strh.w	r2, [r3, #212]	; 0xd4
 8000972:	f8a3 2068 	strh.w	r2, [r3, #104]	; 0x68
 8000976:	f8a3 207a 	strh.w	r2, [r3, #122]	; 0x7a
 800097a:	f8a3 208c 	strh.w	r2, [r3, #140]	; 0x8c
 800097e:	f103 0302 	add.w	r3, r3, #2
 8000982:	d1e3      	bne.n	800094c <_ZN4CRGB8rgb_initEv+0xc>
 8000984:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000988:	2208      	movs	r2, #8
 800098a:	851a      	strh	r2, [r3, #40]	; 0x28
 800098c:	4620      	mov	r0, r4
 800098e:	f000 fae9 	bl	8000f64 <_ZN8CRGB_I2C12rgb_i2c_initEv>
 8000992:	4620      	mov	r0, r4
 8000994:	2172      	movs	r1, #114	; 0x72
 8000996:	2281      	movs	r2, #129	; 0x81
 8000998:	23ff      	movs	r3, #255	; 0xff
 800099a:	f000 fa34 	bl	8000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 800099e:	4620      	mov	r0, r4
 80009a0:	2172      	movs	r1, #114	; 0x72
 80009a2:	2283      	movs	r2, #131	; 0x83
 80009a4:	23ff      	movs	r3, #255	; 0xff
 80009a6:	f000 fa2e 	bl	8000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 80009aa:	4620      	mov	r0, r4
 80009ac:	2172      	movs	r1, #114	; 0x72
 80009ae:	228d      	movs	r2, #141	; 0x8d
 80009b0:	462b      	mov	r3, r5
 80009b2:	f000 fa28 	bl	8000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 80009b6:	2172      	movs	r1, #114	; 0x72
 80009b8:	2280      	movs	r2, #128	; 0x80
 80009ba:	2303      	movs	r3, #3
 80009bc:	4620      	mov	r0, r4
 80009be:	f000 fa22 	bl	8000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 80009c2:	4620      	mov	r0, r4
 80009c4:	f000 fb1a 	bl	8000ffc <_ZN8CRGB_I2C29rgb_i2c_enable_only_proximityEv>
 80009c8:	228f      	movs	r2, #143	; 0x8f
 80009ca:	2323      	movs	r3, #35	; 0x23
 80009cc:	2172      	movs	r1, #114	; 0x72
 80009ce:	4620      	mov	r0, r4
 80009d0:	f000 fa19 	bl	8000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 80009d4:	4620      	mov	r0, r4
 80009d6:	f000 fb14 	bl	8001002 <_ZN8CRGB_I2C18rgb_i2c_enable_allEv>
 80009da:	af01      	add	r7, sp, #4
 80009dc:	4620      	mov	r0, r4
 80009de:	4629      	mov	r1, r5
 80009e0:	f7ff fe8c 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 80009e4:	463b      	mov	r3, r7
 80009e6:	4620      	mov	r0, r4
 80009e8:	2172      	movs	r1, #114	; 0x72
 80009ea:	2292      	movs	r2, #146	; 0x92
 80009ec:	f000 fa98 	bl	8000f20 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>
 80009f0:	462b      	mov	r3, r5
 80009f2:	5cfa      	ldrb	r2, [r7, r3]
 80009f4:	2a69      	cmp	r2, #105	; 0x69
 80009f6:	bf1c      	itt	ne
 80009f8:	2201      	movne	r2, #1
 80009fa:	409a      	lslne	r2, r3
 80009fc:	f103 0301 	add.w	r3, r3, #1
 8000a00:	bf18      	it	ne
 8000a02:	4315      	orrne	r5, r2
 8000a04:	2b09      	cmp	r3, #9
 8000a06:	d1f4      	bne.n	80009f2 <_ZN4CRGB8rgb_initEv+0xb2>
 8000a08:	2704      	movs	r7, #4
 8000a0a:	4620      	mov	r0, r4
 8000a0c:	2101      	movs	r1, #1
 8000a0e:	f7ff fe75 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 8000a12:	3f01      	subs	r7, #1
 8000a14:	d1f9      	bne.n	8000a0a <_ZN4CRGB8rgb_initEv+0xca>
 8000a16:	2109      	movs	r1, #9
 8000a18:	f9b6 309e 	ldrsh.w	r3, [r6, #158]	; 0x9e
 8000a1c:	089b      	lsrs	r3, r3, #2
 8000a1e:	f8a6 309e 	strh.w	r3, [r6, #158]	; 0x9e
 8000a22:	f9b6 30b0 	ldrsh.w	r3, [r6, #176]	; 0xb0
 8000a26:	089b      	lsrs	r3, r3, #2
 8000a28:	f8a6 30b0 	strh.w	r3, [r6, #176]	; 0xb0
 8000a2c:	f9b6 30c2 	ldrsh.w	r3, [r6, #194]	; 0xc2
 8000a30:	089b      	lsrs	r3, r3, #2
 8000a32:	f8a6 30c2 	strh.w	r3, [r6, #194]	; 0xc2
 8000a36:	f9b6 30e6 	ldrsh.w	r3, [r6, #230]	; 0xe6
 8000a3a:	089b      	lsrs	r3, r3, #2
 8000a3c:	f8a6 30e6 	strh.w	r3, [r6, #230]	; 0xe6
 8000a40:	f9b6 30d4 	ldrsh.w	r3, [r6, #212]	; 0xd4
 8000a44:	3901      	subs	r1, #1
 8000a46:	ea4f 0393 	mov.w	r3, r3, lsr #2
 8000a4a:	f8a6 30d4 	strh.w	r3, [r6, #212]	; 0xd4
 8000a4e:	f106 0602 	add.w	r6, r6, #2
 8000a52:	d1e1      	bne.n	8000a18 <_ZN4CRGB8rgb_initEv+0xd8>
 8000a54:	4620      	mov	r0, r4
 8000a56:	f7ff fe51 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 8000a5a:	b115      	cbz	r5, 8000a62 <_ZN4CRGB8rgb_initEv+0x122>
 8000a5c:	4802      	ldr	r0, [pc, #8]	; (8000a68 <_ZN4CRGB8rgb_initEv+0x128>)
 8000a5e:	1b40      	subs	r0, r0, r5
 8000a60:	e000      	b.n	8000a64 <_ZN4CRGB8rgb_initEv+0x124>
 8000a62:	4628      	mov	r0, r5
 8000a64:	b005      	add	sp, #20
 8000a66:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000a68:	fffffc18 	.word	0xfffffc18

08000a6c <_ZN4CRGB14get_rgb_resultEv>:
 8000a6c:	300e      	adds	r0, #14
 8000a6e:	4770      	bx	lr

08000a70 <_ZN6CMotor11motor_sleepEv>:
 8000a70:	4770      	bx	lr
	...

08000a74 <_ZN6CMotor7pwm_setEmm>:
 8000a74:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000a78:	b086      	sub	sp, #24
 8000a7a:	2370      	movs	r3, #112	; 0x70
 8000a7c:	9301      	str	r3, [sp, #4]
 8000a7e:	f8df 8070 	ldr.w	r8, [pc, #112]	; 8000af0 <_ZN6CMotor7pwm_setEmm+0x7c>
 8000a82:	4c1a      	ldr	r4, [pc, #104]	; (8000aec <_ZN6CMotor7pwm_setEmm+0x78>)
 8000a84:	f8d8 0000 	ldr.w	r0, [r8]
 8000a88:	2301      	movs	r3, #1
 8000a8a:	f8ad 3008 	strh.w	r3, [sp, #8]
 8000a8e:	2304      	movs	r3, #4
 8000a90:	f8ad 300a 	strh.w	r3, [sp, #10]
 8000a94:	f242 7710 	movw	r7, #10000	; 0x2710
 8000a98:	2302      	movs	r3, #2
 8000a9a:	fbb0 f0f7 	udiv	r0, r0, r7
 8000a9e:	3802      	subs	r0, #2
 8000aa0:	4616      	mov	r6, r2
 8000aa2:	f8ad 3010 	strh.w	r3, [sp, #16]
 8000aa6:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000aaa:	2300      	movs	r3, #0
 8000aac:	2564      	movs	r5, #100	; 0x64
 8000aae:	4341      	muls	r1, r0
 8000ab0:	fbb1 f0f5 	udiv	r0, r1, r5
 8000ab4:	a901      	add	r1, sp, #4
 8000ab6:	9003      	str	r0, [sp, #12]
 8000ab8:	4620      	mov	r0, r4
 8000aba:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000abe:	f8ad 2014 	strh.w	r2, [sp, #20]
 8000ac2:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000ac6:	f001 fd33 	bl	8002530 <TIM_OC1Init>
 8000aca:	f8d8 3000 	ldr.w	r3, [r8]
 8000ace:	fbb3 f3f7 	udiv	r3, r3, r7
 8000ad2:	4620      	mov	r0, r4
 8000ad4:	3b02      	subs	r3, #2
 8000ad6:	a901      	add	r1, sp, #4
 8000ad8:	fb03 f206 	mul.w	r2, r3, r6
 8000adc:	fbb2 f2f5 	udiv	r2, r2, r5
 8000ae0:	9203      	str	r2, [sp, #12]
 8000ae2:	f001 fd6b 	bl	80025bc <TIM_OC2Init>
 8000ae6:	b006      	add	sp, #24
 8000ae8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000aec:	40012c00 	.word	0x40012c00
 8000af0:	20000030 	.word	0x20000030

08000af4 <_ZN6CMotor13motor_refreshEv>:
 8000af4:	6802      	ldr	r2, [r0, #0]
 8000af6:	6841      	ldr	r1, [r0, #4]
 8000af8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000afc:	b510      	push	{r4, lr}
 8000afe:	2a00      	cmp	r2, #0
 8000b00:	f44f 4400 	mov.w	r4, #32768	; 0x8000
 8000b04:	bfce      	itee	gt
 8000b06:	851c      	strhgt	r4, [r3, #40]	; 0x28
 8000b08:	619c      	strle	r4, [r3, #24]
 8000b0a:	4252      	negle	r2, r2
 8000b0c:	4b08      	ldr	r3, [pc, #32]	; (8000b30 <_ZN6CMotor13motor_refreshEv+0x3c>)
 8000b0e:	2900      	cmp	r1, #0
 8000b10:	f04f 0420 	mov.w	r4, #32
 8000b14:	bfd6      	itet	le
 8000b16:	4249      	negle	r1, r1
 8000b18:	851c      	strhgt	r4, [r3, #40]	; 0x28
 8000b1a:	619c      	strle	r4, [r3, #24]
 8000b1c:	2964      	cmp	r1, #100	; 0x64
 8000b1e:	bfa8      	it	ge
 8000b20:	2164      	movge	r1, #100	; 0x64
 8000b22:	2a64      	cmp	r2, #100	; 0x64
 8000b24:	bfa8      	it	ge
 8000b26:	2264      	movge	r2, #100	; 0x64
 8000b28:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000b2c:	f7ff bfa2 	b.w	8000a74 <_ZN6CMotor7pwm_setEmm>
 8000b30:	48000400 	.word	0x48000400

08000b34 <_ZN6CMotor9set_motorEml>:
 8000b34:	2901      	cmp	r1, #1
 8000b36:	bf98      	it	ls
 8000b38:	f840 2021 	strls.w	r2, [r0, r1, lsl #2]
 8000b3c:	f7ff bfda 	b.w	8000af4 <_ZN6CMotor13motor_refreshEv>

08000b40 <_ZN6CMotor10motor_initEv>:
 8000b40:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000b44:	4e42      	ldr	r6, [pc, #264]	; (8000c50 <_ZN6CMotor10motor_initEv+0x110>)
 8000b46:	b087      	sub	sp, #28
 8000b48:	2400      	movs	r4, #0
 8000b4a:	2501      	movs	r5, #1
 8000b4c:	4680      	mov	r8, r0
 8000b4e:	2703      	movs	r7, #3
 8000b50:	f04f 0910 	mov.w	r9, #16
 8000b54:	4630      	mov	r0, r6
 8000b56:	a901      	add	r1, sp, #4
 8000b58:	f8cd 9004 	str.w	r9, [sp, #4]
 8000b5c:	f88d 5008 	strb.w	r5, [sp, #8]
 8000b60:	f88d 400a 	strb.w	r4, [sp, #10]
 8000b64:	f88d 7009 	strb.w	r7, [sp, #9]
 8000b68:	f88d 400b 	strb.w	r4, [sp, #11]
 8000b6c:	f001 ff74 	bl	8002a58 <GPIO_Init>
 8000b70:	f8a6 9028 	strh.w	r9, [r6, #40]	; 0x28
 8000b74:	2320      	movs	r3, #32
 8000b76:	4630      	mov	r0, r6
 8000b78:	a901      	add	r1, sp, #4
 8000b7a:	9301      	str	r3, [sp, #4]
 8000b7c:	f88d 5008 	strb.w	r5, [sp, #8]
 8000b80:	f88d 400a 	strb.w	r4, [sp, #10]
 8000b84:	f88d 7009 	strb.w	r7, [sp, #9]
 8000b88:	f88d 400b 	strb.w	r4, [sp, #11]
 8000b8c:	f001 ff64 	bl	8002a58 <GPIO_Init>
 8000b90:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000b94:	a901      	add	r1, sp, #4
 8000b96:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000b9a:	9301      	str	r3, [sp, #4]
 8000b9c:	f88d 5008 	strb.w	r5, [sp, #8]
 8000ba0:	f88d 400a 	strb.w	r4, [sp, #10]
 8000ba4:	f88d 7009 	strb.w	r7, [sp, #9]
 8000ba8:	f88d 400b 	strb.w	r4, [sp, #11]
 8000bac:	f001 ff54 	bl	8002a58 <GPIO_Init>
 8000bb0:	4629      	mov	r1, r5
 8000bb2:	f44f 6000 	mov.w	r0, #2048	; 0x800
 8000bb6:	f001 fc41 	bl	800243c <RCC_APB2PeriphClockCmd>
 8000bba:	4629      	mov	r1, r5
 8000bbc:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8000bc0:	f001 fc2e 	bl	8002420 <RCC_AHBPeriphClockCmd>
 8000bc4:	f44f 43c0 	mov.w	r3, #24576	; 0x6000
 8000bc8:	9301      	str	r3, [sp, #4]
 8000bca:	4630      	mov	r0, r6
 8000bcc:	2302      	movs	r3, #2
 8000bce:	a901      	add	r1, sp, #4
 8000bd0:	f88d 3008 	strb.w	r3, [sp, #8]
 8000bd4:	f88d 7009 	strb.w	r7, [sp, #9]
 8000bd8:	f001 ff3e 	bl	8002a58 <GPIO_Init>
 8000bdc:	4630      	mov	r0, r6
 8000bde:	210d      	movs	r1, #13
 8000be0:	2206      	movs	r2, #6
 8000be2:	f001 ff7f 	bl	8002ae4 <GPIO_PinAFConfig>
 8000be6:	4630      	mov	r0, r6
 8000be8:	210e      	movs	r1, #14
 8000bea:	2206      	movs	r2, #6
 8000bec:	f001 ff7a 	bl	8002ae4 <GPIO_PinAFConfig>
 8000bf0:	4e18      	ldr	r6, [pc, #96]	; (8000c54 <_ZN6CMotor10motor_initEv+0x114>)
 8000bf2:	4b19      	ldr	r3, [pc, #100]	; (8000c58 <_ZN6CMotor10motor_initEv+0x118>)
 8000bf4:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000bf8:	f242 7210 	movw	r2, #10000	; 0x2710
 8000bfc:	4630      	mov	r0, r6
 8000bfe:	a903      	add	r1, sp, #12
 8000c00:	681b      	ldr	r3, [r3, #0]
 8000c02:	fbb3 f3f2 	udiv	r3, r3, r2
 8000c06:	3b01      	subs	r3, #1
 8000c08:	9304      	str	r3, [sp, #16]
 8000c0a:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000c0e:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000c12:	f8ad 4016 	strh.w	r4, [sp, #22]
 8000c16:	f001 fc2d 	bl	8002474 <TIM_TimeBaseInit>
 8000c1a:	4622      	mov	r2, r4
 8000c1c:	4640      	mov	r0, r8
 8000c1e:	4621      	mov	r1, r4
 8000c20:	f7ff ff28 	bl	8000a74 <_ZN6CMotor7pwm_setEmm>
 8000c24:	4630      	mov	r0, r6
 8000c26:	4629      	mov	r1, r5
 8000c28:	f001 fc74 	bl	8002514 <TIM_Cmd>
 8000c2c:	4630      	mov	r0, r6
 8000c2e:	4629      	mov	r1, r5
 8000c30:	f001 fd02 	bl	8002638 <TIM_CtrlPWMOutputs>
 8000c34:	4640      	mov	r0, r8
 8000c36:	4621      	mov	r1, r4
 8000c38:	4622      	mov	r2, r4
 8000c3a:	f7ff ff7b 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8000c3e:	4640      	mov	r0, r8
 8000c40:	4629      	mov	r1, r5
 8000c42:	4622      	mov	r2, r4
 8000c44:	f7ff ff76 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8000c48:	4620      	mov	r0, r4
 8000c4a:	b007      	add	sp, #28
 8000c4c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8000c50:	48000400 	.word	0x48000400
 8000c54:	40012c00 	.word	0x40012c00
 8000c58:	20000030 	.word	0x20000030

08000c5c <_ZN8CSensors12sensors_initEv>:
 8000c5c:	b510      	push	{r4, lr}
 8000c5e:	4604      	mov	r4, r0
 8000c60:	4808      	ldr	r0, [pc, #32]	; (8000c84 <_ZN8CSensors12sensors_initEv+0x28>)
 8000c62:	f000 fa13 	bl	800108c <_ZN4CI2C4initEv>
 8000c66:	4620      	mov	r0, r4
 8000c68:	f7ff fe6a 	bl	8000940 <_ZN4CRGB8rgb_initEv>
 8000c6c:	b110      	cbz	r0, 8000c74 <_ZN8CSensors12sensors_initEv+0x18>
 8000c6e:	f5a0 707a 	sub.w	r0, r0, #1000	; 0x3e8
 8000c72:	bd10      	pop	{r4, pc}
 8000c74:	f504 7098 	add.w	r0, r4, #304	; 0x130
 8000c78:	f000 fb98 	bl	80013ac <_ZN4CIMU8imu_initEv>
 8000c7c:	b108      	cbz	r0, 8000c82 <_ZN8CSensors12sensors_initEv+0x26>
 8000c7e:	f5a0 60fa 	sub.w	r0, r0, #2000	; 0x7d0
 8000c82:	bd10      	pop	{r4, pc}
 8000c84:	20000214 	.word	0x20000214

08000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>:
 8000c88:	bf00      	nop
 8000c8a:	bf00      	nop
 8000c8c:	bf00      	nop
 8000c8e:	bf00      	nop
 8000c90:	4770      	bx	lr
	...

08000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>:
 8000c94:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000c96:	7803      	ldrb	r3, [r0, #0]
 8000c98:	9300      	str	r3, [sp, #0]
 8000c9a:	2401      	movs	r4, #1
 8000c9c:	4605      	mov	r5, r0
 8000c9e:	2703      	movs	r7, #3
 8000ca0:	2600      	movs	r6, #0
 8000ca2:	4669      	mov	r1, sp
 8000ca4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ca8:	f88d 6007 	strb.w	r6, [sp, #7]
 8000cac:	f88d 4004 	strb.w	r4, [sp, #4]
 8000cb0:	f88d 7005 	strb.w	r7, [sp, #5]
 8000cb4:	f88d 4006 	strb.w	r4, [sp, #6]
 8000cb8:	f001 fece 	bl	8002a58 <GPIO_Init>
 8000cbc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000cc0:	782a      	ldrb	r2, [r5, #0]
 8000cc2:	851a      	strh	r2, [r3, #40]	; 0x28
 8000cc4:	f88d 6007 	strb.w	r6, [sp, #7]
 8000cc8:	4e08      	ldr	r6, [pc, #32]	; (8000cec <_ZN8CRGB_I2C12RGBSetLowSDAEv+0x58>)
 8000cca:	9400      	str	r4, [sp, #0]
 8000ccc:	4630      	mov	r0, r6
 8000cce:	4669      	mov	r1, sp
 8000cd0:	f88d 4004 	strb.w	r4, [sp, #4]
 8000cd4:	f88d 7005 	strb.w	r7, [sp, #5]
 8000cd8:	f88d 4006 	strb.w	r4, [sp, #6]
 8000cdc:	f001 febc 	bl	8002a58 <GPIO_Init>
 8000ce0:	8534      	strh	r4, [r6, #40]	; 0x28
 8000ce2:	4628      	mov	r0, r5
 8000ce4:	f7ff ffd0 	bl	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8000ce8:	b003      	add	sp, #12
 8000cea:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000cec:	48000400 	.word	0x48000400

08000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>:
 8000cf0:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000cf2:	7803      	ldrb	r3, [r0, #0]
 8000cf4:	9300      	str	r3, [sp, #0]
 8000cf6:	2400      	movs	r4, #0
 8000cf8:	4605      	mov	r5, r0
 8000cfa:	2703      	movs	r7, #3
 8000cfc:	4669      	mov	r1, sp
 8000cfe:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000d02:	f88d 4004 	strb.w	r4, [sp, #4]
 8000d06:	f88d 4007 	strb.w	r4, [sp, #7]
 8000d0a:	f88d 7005 	strb.w	r7, [sp, #5]
 8000d0e:	f001 fea3 	bl	8002a58 <GPIO_Init>
 8000d12:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000d16:	782a      	ldrb	r2, [r5, #0]
 8000d18:	619a      	str	r2, [r3, #24]
 8000d1a:	f88d 4004 	strb.w	r4, [sp, #4]
 8000d1e:	f88d 4007 	strb.w	r4, [sp, #7]
 8000d22:	4c07      	ldr	r4, [pc, #28]	; (8000d40 <_ZN8CRGB_I2C13RGBSetHighSDAEv+0x50>)
 8000d24:	f88d 7005 	strb.w	r7, [sp, #5]
 8000d28:	2601      	movs	r6, #1
 8000d2a:	4620      	mov	r0, r4
 8000d2c:	4669      	mov	r1, sp
 8000d2e:	9600      	str	r6, [sp, #0]
 8000d30:	f001 fe92 	bl	8002a58 <GPIO_Init>
 8000d34:	61a6      	str	r6, [r4, #24]
 8000d36:	4628      	mov	r0, r5
 8000d38:	f7ff ffa6 	bl	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8000d3c:	b003      	add	sp, #12
 8000d3e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000d40:	48000400 	.word	0x48000400

08000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>:
 8000d44:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000d48:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000d4c:	851a      	strh	r2, [r3, #40]	; 0x28
 8000d4e:	f7ff bf9b 	b.w	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

08000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>:
 8000d52:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000d56:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000d5a:	619a      	str	r2, [r3, #24]
 8000d5c:	f7ff bf94 	b.w	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

08000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>:
 8000d60:	b510      	push	{r4, lr}
 8000d62:	4604      	mov	r4, r0
 8000d64:	f7ff fff5 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000d68:	4620      	mov	r0, r4
 8000d6a:	f7ff ffc1 	bl	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8000d6e:	4620      	mov	r0, r4
 8000d70:	f7ff ffef 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000d74:	4620      	mov	r0, r4
 8000d76:	f7ff ff8d 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000d7a:	4620      	mov	r0, r4
 8000d7c:	f7ff ffe2 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000d80:	4620      	mov	r0, r4
 8000d82:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000d86:	f7ff bfb3 	b.w	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>

08000d8a <_ZN8CRGB_I2C11rgb_i2cStopEv>:
 8000d8a:	b510      	push	{r4, lr}
 8000d8c:	4604      	mov	r4, r0
 8000d8e:	f7ff ffd9 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000d92:	4620      	mov	r0, r4
 8000d94:	f7ff ff7e 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000d98:	4620      	mov	r0, r4
 8000d9a:	f7ff ffda 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000d9e:	4620      	mov	r0, r4
 8000da0:	f7ff ff78 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000da4:	4620      	mov	r0, r4
 8000da6:	f7ff ffd4 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000daa:	4620      	mov	r0, r4
 8000dac:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000db0:	f7ff bf9e 	b.w	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>

08000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>:
 8000db4:	b570      	push	{r4, r5, r6, lr}
 8000db6:	4604      	mov	r4, r0
 8000db8:	460e      	mov	r6, r1
 8000dba:	2508      	movs	r5, #8
 8000dbc:	4620      	mov	r0, r4
 8000dbe:	f7ff ffc1 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000dc2:	0633      	lsls	r3, r6, #24
 8000dc4:	4620      	mov	r0, r4
 8000dc6:	d502      	bpl.n	8000dce <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1a>
 8000dc8:	f7ff ff92 	bl	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8000dcc:	e001      	b.n	8000dd2 <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1e>
 8000dce:	f7ff ff61 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000dd2:	4620      	mov	r0, r4
 8000dd4:	3d01      	subs	r5, #1
 8000dd6:	f7ff ffbc 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000dda:	0076      	lsls	r6, r6, #1
 8000ddc:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000de0:	b2f6      	uxtb	r6, r6
 8000de2:	d1eb      	bne.n	8000dbc <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x8>
 8000de4:	4620      	mov	r0, r4
 8000de6:	f7ff ffad 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000dea:	4620      	mov	r0, r4
 8000dec:	f7ff ff80 	bl	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8000df0:	4620      	mov	r0, r4
 8000df2:	f7ff ffae 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000df6:	4620      	mov	r0, r4
 8000df8:	f7ff ffa4 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000dfc:	4620      	mov	r0, r4
 8000dfe:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000e02:	f7ff bf41 	b.w	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

08000e06 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>:
 8000e06:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000e08:	4604      	mov	r4, r0
 8000e0a:	460f      	mov	r7, r1
 8000e0c:	4616      	mov	r6, r2
 8000e0e:	461d      	mov	r5, r3
 8000e10:	f7ff ffa6 	bl	8000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000e14:	4620      	mov	r0, r4
 8000e16:	4639      	mov	r1, r7
 8000e18:	f7ff ffcc 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000e1c:	4620      	mov	r0, r4
 8000e1e:	4631      	mov	r1, r6
 8000e20:	f7ff ffc8 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000e24:	4620      	mov	r0, r4
 8000e26:	4629      	mov	r1, r5
 8000e28:	f7ff ffc4 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000e2c:	4620      	mov	r0, r4
 8000e2e:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000e32:	f7ff bfaa 	b.w	8000d8a <_ZN8CRGB_I2C11rgb_i2cStopEv>
	...

08000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>:
 8000e38:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000e3c:	1e57      	subs	r7, r2, #1
 8000e3e:	4605      	mov	r5, r0
 8000e40:	4689      	mov	r9, r1
 8000e42:	4614      	mov	r4, r2
 8000e44:	f102 0808 	add.w	r8, r2, #8
 8000e48:	463b      	mov	r3, r7
 8000e4a:	2200      	movs	r2, #0
 8000e4c:	f803 2f01 	strb.w	r2, [r3, #1]!
 8000e50:	4543      	cmp	r3, r8
 8000e52:	d1fa      	bne.n	8000e4a <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x12>
 8000e54:	4628      	mov	r0, r5
 8000e56:	f7ff ff75 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000e5a:	4628      	mov	r0, r5
 8000e5c:	f7ff ff48 	bl	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8000e60:	2608      	movs	r6, #8
 8000e62:	463b      	mov	r3, r7
 8000e64:	f813 2f01 	ldrb.w	r2, [r3, #1]!
 8000e68:	0052      	lsls	r2, r2, #1
 8000e6a:	4543      	cmp	r3, r8
 8000e6c:	701a      	strb	r2, [r3, #0]
 8000e6e:	d1f9      	bne.n	8000e64 <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x2c>
 8000e70:	4628      	mov	r0, r5
 8000e72:	f7ff ff6e 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000e76:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000e7a:	8a1b      	ldrh	r3, [r3, #16]
 8000e7c:	b29b      	uxth	r3, r3
 8000e7e:	07d9      	lsls	r1, r3, #31
 8000e80:	bf42      	ittt	mi
 8000e82:	7822      	ldrbmi	r2, [r4, #0]
 8000e84:	f042 0201 	orrmi.w	r2, r2, #1
 8000e88:	7022      	strbmi	r2, [r4, #0]
 8000e8a:	079a      	lsls	r2, r3, #30
 8000e8c:	bf42      	ittt	mi
 8000e8e:	7862      	ldrbmi	r2, [r4, #1]
 8000e90:	f042 0201 	orrmi.w	r2, r2, #1
 8000e94:	7062      	strbmi	r2, [r4, #1]
 8000e96:	0758      	lsls	r0, r3, #29
 8000e98:	bf42      	ittt	mi
 8000e9a:	78a2      	ldrbmi	r2, [r4, #2]
 8000e9c:	f042 0201 	orrmi.w	r2, r2, #1
 8000ea0:	70a2      	strbmi	r2, [r4, #2]
 8000ea2:	0719      	lsls	r1, r3, #28
 8000ea4:	bf42      	ittt	mi
 8000ea6:	78e2      	ldrbmi	r2, [r4, #3]
 8000ea8:	f042 0201 	orrmi.w	r2, r2, #1
 8000eac:	70e2      	strbmi	r2, [r4, #3]
 8000eae:	06da      	lsls	r2, r3, #27
 8000eb0:	bf42      	ittt	mi
 8000eb2:	7922      	ldrbmi	r2, [r4, #4]
 8000eb4:	f042 0201 	orrmi.w	r2, r2, #1
 8000eb8:	7122      	strbmi	r2, [r4, #4]
 8000eba:	0698      	lsls	r0, r3, #26
 8000ebc:	bf42      	ittt	mi
 8000ebe:	7962      	ldrbmi	r2, [r4, #5]
 8000ec0:	f042 0201 	orrmi.w	r2, r2, #1
 8000ec4:	7162      	strbmi	r2, [r4, #5]
 8000ec6:	0659      	lsls	r1, r3, #25
 8000ec8:	bf42      	ittt	mi
 8000eca:	79a2      	ldrbmi	r2, [r4, #6]
 8000ecc:	f042 0201 	orrmi.w	r2, r2, #1
 8000ed0:	71a2      	strbmi	r2, [r4, #6]
 8000ed2:	061a      	lsls	r2, r3, #24
 8000ed4:	bf42      	ittt	mi
 8000ed6:	79e3      	ldrbmi	r3, [r4, #7]
 8000ed8:	f043 0301 	orrmi.w	r3, r3, #1
 8000edc:	71e3      	strbmi	r3, [r4, #7]
 8000ede:	4b0f      	ldr	r3, [pc, #60]	; (8000f1c <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0xe4>)
 8000ee0:	8a1b      	ldrh	r3, [r3, #16]
 8000ee2:	07db      	lsls	r3, r3, #31
 8000ee4:	bf42      	ittt	mi
 8000ee6:	7a23      	ldrbmi	r3, [r4, #8]
 8000ee8:	f043 0301 	orrmi.w	r3, r3, #1
 8000eec:	7223      	strbmi	r3, [r4, #8]
 8000eee:	4628      	mov	r0, r5
 8000ef0:	f7ff ff28 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000ef4:	3e01      	subs	r6, #1
 8000ef6:	d1b4      	bne.n	8000e62 <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x2a>
 8000ef8:	f1b9 0f00 	cmp.w	r9, #0
 8000efc:	d002      	beq.n	8000f04 <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0xcc>
 8000efe:	4628      	mov	r0, r5
 8000f00:	f7ff fec8 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000f04:	4628      	mov	r0, r5
 8000f06:	f7ff ff24 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000f0a:	4628      	mov	r0, r5
 8000f0c:	f7ff ff1a 	bl	8000d44 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8000f10:	4628      	mov	r0, r5
 8000f12:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000f16:	f7ff beb7 	b.w	8000c88 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8000f1a:	bf00      	nop
 8000f1c:	48000400 	.word	0x48000400

08000f20 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>:
 8000f20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000f22:	4604      	mov	r4, r0
 8000f24:	460d      	mov	r5, r1
 8000f26:	4617      	mov	r7, r2
 8000f28:	461e      	mov	r6, r3
 8000f2a:	f7ff ff19 	bl	8000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000f2e:	4620      	mov	r0, r4
 8000f30:	4629      	mov	r1, r5
 8000f32:	f7ff ff3f 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000f36:	4639      	mov	r1, r7
 8000f38:	4620      	mov	r0, r4
 8000f3a:	f7ff ff3b 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000f3e:	4620      	mov	r0, r4
 8000f40:	f7ff ff0e 	bl	8000d60 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000f44:	4620      	mov	r0, r4
 8000f46:	f045 0101 	orr.w	r1, r5, #1
 8000f4a:	f7ff ff33 	bl	8000db4 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000f4e:	4620      	mov	r0, r4
 8000f50:	4632      	mov	r2, r6
 8000f52:	2100      	movs	r1, #0
 8000f54:	f7ff ff70 	bl	8000e38 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000f58:	4620      	mov	r0, r4
 8000f5a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000f5e:	f7ff bf14 	b.w	8000d8a <_ZN8CRGB_I2C11rgb_i2cStopEv>
	...

08000f64 <_ZN8CRGB_I2C12rgb_i2c_initEv>:
 8000f64:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 8000f68:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8000f6c:	2400      	movs	r4, #0
 8000f6e:	4605      	mov	r5, r0
 8000f70:	2601      	movs	r6, #1
 8000f72:	2703      	movs	r7, #3
 8000f74:	6003      	str	r3, [r0, #0]
 8000f76:	4669      	mov	r1, sp
 8000f78:	f44f 7380 	mov.w	r3, #256	; 0x100
 8000f7c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f80:	9300      	str	r3, [sp, #0]
 8000f82:	f88d 4006 	strb.w	r4, [sp, #6]
 8000f86:	f88d 4007 	strb.w	r4, [sp, #7]
 8000f8a:	f04f 08ff 	mov.w	r8, #255	; 0xff
 8000f8e:	f88d 6004 	strb.w	r6, [sp, #4]
 8000f92:	f88d 7005 	strb.w	r7, [sp, #5]
 8000f96:	f001 fd5f 	bl	8002a58 <GPIO_Init>
 8000f9a:	4669      	mov	r1, sp
 8000f9c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000fa0:	f88d 4004 	strb.w	r4, [sp, #4]
 8000fa4:	f88d 4007 	strb.w	r4, [sp, #7]
 8000fa8:	f8cd 8000 	str.w	r8, [sp]
 8000fac:	f88d 7005 	strb.w	r7, [sp, #5]
 8000fb0:	f001 fd52 	bl	8002a58 <GPIO_Init>
 8000fb4:	4641      	mov	r1, r8
 8000fb6:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000fba:	f001 fd8f 	bl	8002adc <GPIO_SetBits>
 8000fbe:	f88d 4004 	strb.w	r4, [sp, #4]
 8000fc2:	f88d 4007 	strb.w	r4, [sp, #7]
 8000fc6:	4c0c      	ldr	r4, [pc, #48]	; (8000ff8 <_ZN8CRGB_I2C12rgb_i2c_initEv+0x94>)
 8000fc8:	9600      	str	r6, [sp, #0]
 8000fca:	4620      	mov	r0, r4
 8000fcc:	4669      	mov	r1, sp
 8000fce:	f88d 7005 	strb.w	r7, [sp, #5]
 8000fd2:	f001 fd41 	bl	8002a58 <GPIO_Init>
 8000fd6:	4631      	mov	r1, r6
 8000fd8:	4620      	mov	r0, r4
 8000fda:	f001 fd7f 	bl	8002adc <GPIO_SetBits>
 8000fde:	4628      	mov	r0, r5
 8000fe0:	f7ff feb7 	bl	8000d52 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8000fe4:	4628      	mov	r0, r5
 8000fe6:	f7ff fe55 	bl	8000c94 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8000fea:	4628      	mov	r0, r5
 8000fec:	f7ff fe80 	bl	8000cf0 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8000ff0:	b002      	add	sp, #8
 8000ff2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000ff6:	bf00      	nop
 8000ff8:	48000400 	.word	0x48000400

08000ffc <_ZN8CRGB_I2C29rgb_i2c_enable_only_proximityEv>:
 8000ffc:	2300      	movs	r3, #0
 8000ffe:	6003      	str	r3, [r0, #0]
 8001000:	4770      	bx	lr

08001002 <_ZN8CRGB_I2C18rgb_i2c_enable_allEv>:
 8001002:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8001006:	6003      	str	r3, [r0, #0]
 8001008:	4770      	bx	lr

0800100a <_ZN4CI2C5delayEv>:
 800100a:	230b      	movs	r3, #11
 800100c:	3b01      	subs	r3, #1
 800100e:	d001      	beq.n	8001014 <_ZN4CI2C5delayEv+0xa>
 8001010:	bf00      	nop
 8001012:	e7fb      	b.n	800100c <_ZN4CI2C5delayEv+0x2>
 8001014:	4770      	bx	lr
	...

08001018 <_ZN4CI2C9SetLowSDAEv>:
 8001018:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800101a:	4c0c      	ldr	r4, [pc, #48]	; (800104c <_ZN4CI2C9SetLowSDAEv+0x34>)
 800101c:	2301      	movs	r3, #1
 800101e:	2203      	movs	r2, #3
 8001020:	4606      	mov	r6, r0
 8001022:	2580      	movs	r5, #128	; 0x80
 8001024:	f88d 3004 	strb.w	r3, [sp, #4]
 8001028:	f88d 3006 	strb.w	r3, [sp, #6]
 800102c:	4620      	mov	r0, r4
 800102e:	2300      	movs	r3, #0
 8001030:	4669      	mov	r1, sp
 8001032:	f88d 2005 	strb.w	r2, [sp, #5]
 8001036:	f88d 3007 	strb.w	r3, [sp, #7]
 800103a:	9500      	str	r5, [sp, #0]
 800103c:	f001 fd0c 	bl	8002a58 <GPIO_Init>
 8001040:	8525      	strh	r5, [r4, #40]	; 0x28
 8001042:	4630      	mov	r0, r6
 8001044:	f7ff ffe1 	bl	800100a <_ZN4CI2C5delayEv>
 8001048:	b002      	add	sp, #8
 800104a:	bd70      	pop	{r4, r5, r6, pc}
 800104c:	48000400 	.word	0x48000400

08001050 <_ZN4CI2C10SetHighSDAEv>:
 8001050:	4b05      	ldr	r3, [pc, #20]	; (8001068 <_ZN4CI2C10SetHighSDAEv+0x18>)
 8001052:	681a      	ldr	r2, [r3, #0]
 8001054:	f422 4240 	bic.w	r2, r2, #49152	; 0xc000
 8001058:	601a      	str	r2, [r3, #0]
 800105a:	681a      	ldr	r2, [r3, #0]
 800105c:	601a      	str	r2, [r3, #0]
 800105e:	2280      	movs	r2, #128	; 0x80
 8001060:	619a      	str	r2, [r3, #24]
 8001062:	f7ff bfd2 	b.w	800100a <_ZN4CI2C5delayEv>
 8001066:	bf00      	nop
 8001068:	48000400 	.word	0x48000400

0800106c <_ZN4CI2C9SetLowSCLEv>:
 800106c:	4b02      	ldr	r3, [pc, #8]	; (8001078 <_ZN4CI2C9SetLowSCLEv+0xc>)
 800106e:	2240      	movs	r2, #64	; 0x40
 8001070:	851a      	strh	r2, [r3, #40]	; 0x28
 8001072:	f7ff bfca 	b.w	800100a <_ZN4CI2C5delayEv>
 8001076:	bf00      	nop
 8001078:	48000400 	.word	0x48000400

0800107c <_ZN4CI2C10SetHighSCLEv>:
 800107c:	4b02      	ldr	r3, [pc, #8]	; (8001088 <_ZN4CI2C10SetHighSCLEv+0xc>)
 800107e:	2240      	movs	r2, #64	; 0x40
 8001080:	619a      	str	r2, [r3, #24]
 8001082:	f7ff bfc2 	b.w	800100a <_ZN4CI2C5delayEv>
 8001086:	bf00      	nop
 8001088:	48000400 	.word	0x48000400

0800108c <_ZN4CI2C4initEv>:
 800108c:	b513      	push	{r0, r1, r4, lr}
 800108e:	4604      	mov	r4, r0
 8001090:	2101      	movs	r1, #1
 8001092:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001096:	f001 f9c3 	bl	8002420 <RCC_AHBPeriphClockCmd>
 800109a:	23c0      	movs	r3, #192	; 0xc0
 800109c:	9300      	str	r3, [sp, #0]
 800109e:	2301      	movs	r3, #1
 80010a0:	2203      	movs	r2, #3
 80010a2:	4669      	mov	r1, sp
 80010a4:	f88d 3004 	strb.w	r3, [sp, #4]
 80010a8:	f88d 3006 	strb.w	r3, [sp, #6]
 80010ac:	4809      	ldr	r0, [pc, #36]	; (80010d4 <_ZN4CI2C4initEv+0x48>)
 80010ae:	f88d 2005 	strb.w	r2, [sp, #5]
 80010b2:	2300      	movs	r3, #0
 80010b4:	f88d 3007 	strb.w	r3, [sp, #7]
 80010b8:	f001 fcce 	bl	8002a58 <GPIO_Init>
 80010bc:	4620      	mov	r0, r4
 80010be:	f7ff ffdd 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 80010c2:	4620      	mov	r0, r4
 80010c4:	f7ff ffa8 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 80010c8:	4620      	mov	r0, r4
 80010ca:	f7ff ffc1 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 80010ce:	b002      	add	sp, #8
 80010d0:	bd10      	pop	{r4, pc}
 80010d2:	bf00      	nop
 80010d4:	48000400 	.word	0x48000400

080010d8 <_ZN4CI2C5StartEv>:
 80010d8:	b510      	push	{r4, lr}
 80010da:	4604      	mov	r4, r0
 80010dc:	f7ff ffce 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 80010e0:	4620      	mov	r0, r4
 80010e2:	f7ff ffb5 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 80010e6:	4620      	mov	r0, r4
 80010e8:	f7ff ffc8 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 80010ec:	4620      	mov	r0, r4
 80010ee:	f7ff ff93 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 80010f2:	4620      	mov	r0, r4
 80010f4:	f7ff ffba 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 80010f8:	4620      	mov	r0, r4
 80010fa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010fe:	f7ff bfa7 	b.w	8001050 <_ZN4CI2C10SetHighSDAEv>

08001102 <_ZN4CI2C4StopEv>:
 8001102:	b510      	push	{r4, lr}
 8001104:	4604      	mov	r4, r0
 8001106:	f7ff ffb1 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 800110a:	4620      	mov	r0, r4
 800110c:	f7ff ff84 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 8001110:	4620      	mov	r0, r4
 8001112:	f7ff ffb3 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 8001116:	4620      	mov	r0, r4
 8001118:	f7ff ff7e 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 800111c:	4620      	mov	r0, r4
 800111e:	f7ff ffad 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 8001122:	4620      	mov	r0, r4
 8001124:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001128:	f7ff bf92 	b.w	8001050 <_ZN4CI2C10SetHighSDAEv>

0800112c <_ZN4CI2C5WriteEh>:
 800112c:	b570      	push	{r4, r5, r6, lr}
 800112e:	4604      	mov	r4, r0
 8001130:	460e      	mov	r6, r1
 8001132:	2508      	movs	r5, #8
 8001134:	4620      	mov	r0, r4
 8001136:	f7ff ff99 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 800113a:	0633      	lsls	r3, r6, #24
 800113c:	4620      	mov	r0, r4
 800113e:	d502      	bpl.n	8001146 <_ZN4CI2C5WriteEh+0x1a>
 8001140:	f7ff ff86 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 8001144:	e001      	b.n	800114a <_ZN4CI2C5WriteEh+0x1e>
 8001146:	f7ff ff67 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 800114a:	4620      	mov	r0, r4
 800114c:	3d01      	subs	r5, #1
 800114e:	f7ff ff95 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 8001152:	0076      	lsls	r6, r6, #1
 8001154:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001158:	b2f6      	uxtb	r6, r6
 800115a:	d1eb      	bne.n	8001134 <_ZN4CI2C5WriteEh+0x8>
 800115c:	4620      	mov	r0, r4
 800115e:	f7ff ff85 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 8001162:	4620      	mov	r0, r4
 8001164:	f7ff ff74 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 8001168:	4620      	mov	r0, r4
 800116a:	f7ff ff87 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 800116e:	4b07      	ldr	r3, [pc, #28]	; (800118c <_ZN4CI2C5WriteEh+0x60>)
 8001170:	8a1d      	ldrh	r5, [r3, #16]
 8001172:	4620      	mov	r0, r4
 8001174:	f7ff ff7a 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 8001178:	b2ad      	uxth	r5, r5
 800117a:	4620      	mov	r0, r4
 800117c:	f7ff ff45 	bl	800100a <_ZN4CI2C5delayEv>
 8001180:	f085 0080 	eor.w	r0, r5, #128	; 0x80
 8001184:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8001188:	bd70      	pop	{r4, r5, r6, pc}
 800118a:	bf00      	nop
 800118c:	48000400 	.word	0x48000400

08001190 <_ZN4CI2C9write_regEhhh>:
 8001190:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001192:	4604      	mov	r4, r0
 8001194:	460f      	mov	r7, r1
 8001196:	4616      	mov	r6, r2
 8001198:	461d      	mov	r5, r3
 800119a:	f7ff ff9d 	bl	80010d8 <_ZN4CI2C5StartEv>
 800119e:	4639      	mov	r1, r7
 80011a0:	4620      	mov	r0, r4
 80011a2:	f7ff ffc3 	bl	800112c <_ZN4CI2C5WriteEh>
 80011a6:	4631      	mov	r1, r6
 80011a8:	4620      	mov	r0, r4
 80011aa:	f7ff ffbf 	bl	800112c <_ZN4CI2C5WriteEh>
 80011ae:	4620      	mov	r0, r4
 80011b0:	4629      	mov	r1, r5
 80011b2:	f7ff ffbb 	bl	800112c <_ZN4CI2C5WriteEh>
 80011b6:	4620      	mov	r0, r4
 80011b8:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 80011bc:	f7ff bfa1 	b.w	8001102 <_ZN4CI2C4StopEv>

080011c0 <_ZN4CI2C4ReadEh>:
 80011c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80011c2:	4605      	mov	r5, r0
 80011c4:	460f      	mov	r7, r1
 80011c6:	f7ff ff51 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 80011ca:	2608      	movs	r6, #8
 80011cc:	2400      	movs	r4, #0
 80011ce:	4628      	mov	r0, r5
 80011d0:	f7ff ff54 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 80011d4:	4b10      	ldr	r3, [pc, #64]	; (8001218 <_ZN4CI2C4ReadEh+0x58>)
 80011d6:	8a1b      	ldrh	r3, [r3, #16]
 80011d8:	0064      	lsls	r4, r4, #1
 80011da:	061b      	lsls	r3, r3, #24
 80011dc:	b2e4      	uxtb	r4, r4
 80011de:	4628      	mov	r0, r5
 80011e0:	f106 36ff 	add.w	r6, r6, #4294967295	; 0xffffffff
 80011e4:	bf48      	it	mi
 80011e6:	f044 0401 	orrmi.w	r4, r4, #1
 80011ea:	f7ff ff3f 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 80011ee:	f016 06ff 	ands.w	r6, r6, #255	; 0xff
 80011f2:	d1ec      	bne.n	80011ce <_ZN4CI2C4ReadEh+0xe>
 80011f4:	4628      	mov	r0, r5
 80011f6:	b117      	cbz	r7, 80011fe <_ZN4CI2C4ReadEh+0x3e>
 80011f8:	f7ff ff0e 	bl	8001018 <_ZN4CI2C9SetLowSDAEv>
 80011fc:	e001      	b.n	8001202 <_ZN4CI2C4ReadEh+0x42>
 80011fe:	f7ff ff27 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 8001202:	4628      	mov	r0, r5
 8001204:	f7ff ff3a 	bl	800107c <_ZN4CI2C10SetHighSCLEv>
 8001208:	4628      	mov	r0, r5
 800120a:	f7ff ff2f 	bl	800106c <_ZN4CI2C9SetLowSCLEv>
 800120e:	4628      	mov	r0, r5
 8001210:	f7ff ff1e 	bl	8001050 <_ZN4CI2C10SetHighSDAEv>
 8001214:	4620      	mov	r0, r4
 8001216:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001218:	48000400 	.word	0x48000400

0800121c <_ZN4CI2C8read_regEhh>:
 800121c:	b570      	push	{r4, r5, r6, lr}
 800121e:	4604      	mov	r4, r0
 8001220:	460d      	mov	r5, r1
 8001222:	4616      	mov	r6, r2
 8001224:	f7ff ff58 	bl	80010d8 <_ZN4CI2C5StartEv>
 8001228:	4629      	mov	r1, r5
 800122a:	4620      	mov	r0, r4
 800122c:	f7ff ff7e 	bl	800112c <_ZN4CI2C5WriteEh>
 8001230:	4631      	mov	r1, r6
 8001232:	4620      	mov	r0, r4
 8001234:	f7ff ff7a 	bl	800112c <_ZN4CI2C5WriteEh>
 8001238:	4620      	mov	r0, r4
 800123a:	f7ff ff4d 	bl	80010d8 <_ZN4CI2C5StartEv>
 800123e:	f045 0101 	orr.w	r1, r5, #1
 8001242:	4620      	mov	r0, r4
 8001244:	f7ff ff72 	bl	800112c <_ZN4CI2C5WriteEh>
 8001248:	2100      	movs	r1, #0
 800124a:	4620      	mov	r0, r4
 800124c:	f7ff ffb8 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001250:	4605      	mov	r5, r0
 8001252:	4620      	mov	r0, r4
 8001254:	f7ff ff55 	bl	8001102 <_ZN4CI2C4StopEv>
 8001258:	4628      	mov	r0, r5
 800125a:	bd70      	pop	{r4, r5, r6, pc}

0800125c <_ZN4CIMU8imu_readEv>:
 800125c:	b570      	push	{r4, r5, r6, lr}
 800125e:	4c52      	ldr	r4, [pc, #328]	; (80013a8 <_ZN4CIMU8imu_readEv+0x14c>)
 8001260:	4605      	mov	r5, r0
 8001262:	4620      	mov	r0, r4
 8001264:	f7ff ff38 	bl	80010d8 <_ZN4CI2C5StartEv>
 8001268:	4620      	mov	r0, r4
 800126a:	21d4      	movs	r1, #212	; 0xd4
 800126c:	f7ff ff5e 	bl	800112c <_ZN4CI2C5WriteEh>
 8001270:	21a8      	movs	r1, #168	; 0xa8
 8001272:	4620      	mov	r0, r4
 8001274:	f7ff ff5a 	bl	800112c <_ZN4CI2C5WriteEh>
 8001278:	4620      	mov	r0, r4
 800127a:	f7ff ff2d 	bl	80010d8 <_ZN4CI2C5StartEv>
 800127e:	4620      	mov	r0, r4
 8001280:	21d5      	movs	r1, #213	; 0xd5
 8001282:	f7ff ff53 	bl	800112c <_ZN4CI2C5WriteEh>
 8001286:	4620      	mov	r0, r4
 8001288:	2101      	movs	r1, #1
 800128a:	f7ff ff99 	bl	80011c0 <_ZN4CI2C4ReadEh>
 800128e:	2101      	movs	r1, #1
 8001290:	b286      	uxth	r6, r0
 8001292:	4620      	mov	r0, r4
 8001294:	f7ff ff94 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001298:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 800129c:	b200      	sxth	r0, r0
 800129e:	6268      	str	r0, [r5, #36]	; 0x24
 80012a0:	2101      	movs	r1, #1
 80012a2:	4620      	mov	r0, r4
 80012a4:	f7ff ff8c 	bl	80011c0 <_ZN4CI2C4ReadEh>
 80012a8:	2101      	movs	r1, #1
 80012aa:	b286      	uxth	r6, r0
 80012ac:	4620      	mov	r0, r4
 80012ae:	f7ff ff87 	bl	80011c0 <_ZN4CI2C4ReadEh>
 80012b2:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 80012b6:	b200      	sxth	r0, r0
 80012b8:	62a8      	str	r0, [r5, #40]	; 0x28
 80012ba:	2101      	movs	r1, #1
 80012bc:	4620      	mov	r0, r4
 80012be:	f7ff ff7f 	bl	80011c0 <_ZN4CI2C4ReadEh>
 80012c2:	2100      	movs	r1, #0
 80012c4:	b286      	uxth	r6, r0
 80012c6:	4620      	mov	r0, r4
 80012c8:	f7ff ff7a 	bl	80011c0 <_ZN4CI2C4ReadEh>
 80012cc:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 80012d0:	b200      	sxth	r0, r0
 80012d2:	62e8      	str	r0, [r5, #44]	; 0x2c
 80012d4:	4620      	mov	r0, r4
 80012d6:	f7ff ff14 	bl	8001102 <_ZN4CI2C4StopEv>
 80012da:	4620      	mov	r0, r4
 80012dc:	f7ff fefc 	bl	80010d8 <_ZN4CI2C5StartEv>
 80012e0:	4620      	mov	r0, r4
 80012e2:	213c      	movs	r1, #60	; 0x3c
 80012e4:	f7ff ff22 	bl	800112c <_ZN4CI2C5WriteEh>
 80012e8:	21a8      	movs	r1, #168	; 0xa8
 80012ea:	4620      	mov	r0, r4
 80012ec:	f7ff ff1e 	bl	800112c <_ZN4CI2C5WriteEh>
 80012f0:	4620      	mov	r0, r4
 80012f2:	f7ff fef1 	bl	80010d8 <_ZN4CI2C5StartEv>
 80012f6:	4620      	mov	r0, r4
 80012f8:	213d      	movs	r1, #61	; 0x3d
 80012fa:	f7ff ff17 	bl	800112c <_ZN4CI2C5WriteEh>
 80012fe:	4620      	mov	r0, r4
 8001300:	2101      	movs	r1, #1
 8001302:	f7ff ff5d 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001306:	2101      	movs	r1, #1
 8001308:	b286      	uxth	r6, r0
 800130a:	4620      	mov	r0, r4
 800130c:	f7ff ff58 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001310:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001314:	b200      	sxth	r0, r0
 8001316:	6328      	str	r0, [r5, #48]	; 0x30
 8001318:	2101      	movs	r1, #1
 800131a:	4620      	mov	r0, r4
 800131c:	f7ff ff50 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001320:	2101      	movs	r1, #1
 8001322:	b286      	uxth	r6, r0
 8001324:	4620      	mov	r0, r4
 8001326:	f7ff ff4b 	bl	80011c0 <_ZN4CI2C4ReadEh>
 800132a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 800132e:	b200      	sxth	r0, r0
 8001330:	6368      	str	r0, [r5, #52]	; 0x34
 8001332:	2101      	movs	r1, #1
 8001334:	4620      	mov	r0, r4
 8001336:	f7ff ff43 	bl	80011c0 <_ZN4CI2C4ReadEh>
 800133a:	2100      	movs	r1, #0
 800133c:	b286      	uxth	r6, r0
 800133e:	4620      	mov	r0, r4
 8001340:	f7ff ff3e 	bl	80011c0 <_ZN4CI2C4ReadEh>
 8001344:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001348:	b200      	sxth	r0, r0
 800134a:	63a8      	str	r0, [r5, #56]	; 0x38
 800134c:	4620      	mov	r0, r4
 800134e:	f7ff fed8 	bl	8001102 <_ZN4CI2C4StopEv>
 8001352:	6aaa      	ldr	r2, [r5, #40]	; 0x28
 8001354:	686b      	ldr	r3, [r5, #4]
 8001356:	6ae8      	ldr	r0, [r5, #44]	; 0x2c
 8001358:	1a9b      	subs	r3, r3, r2
 800135a:	68ea      	ldr	r2, [r5, #12]
 800135c:	26c8      	movs	r6, #200	; 0xc8
 800135e:	fb93 f3f6 	sdiv	r3, r3, r6
 8001362:	441a      	add	r2, r3
 8001364:	6beb      	ldr	r3, [r5, #60]	; 0x3c
 8001366:	60ea      	str	r2, [r5, #12]
 8001368:	2164      	movs	r1, #100	; 0x64
 800136a:	4359      	muls	r1, r3
 800136c:	f640 14e2 	movw	r4, #2530	; 0x9e2
 8001370:	434a      	muls	r2, r1
 8001372:	682b      	ldr	r3, [r5, #0]
 8001374:	fb92 f2f4 	sdiv	r2, r2, r4
 8001378:	61aa      	str	r2, [r5, #24]
 800137a:	6a6a      	ldr	r2, [r5, #36]	; 0x24
 800137c:	1a9b      	subs	r3, r3, r2
 800137e:	692a      	ldr	r2, [r5, #16]
 8001380:	fb93 f3f6 	sdiv	r3, r3, r6
 8001384:	441a      	add	r2, r3
 8001386:	612a      	str	r2, [r5, #16]
 8001388:	434a      	muls	r2, r1
 800138a:	fb92 f2f4 	sdiv	r2, r2, r4
 800138e:	61ea      	str	r2, [r5, #28]
 8001390:	68aa      	ldr	r2, [r5, #8]
 8001392:	1a12      	subs	r2, r2, r0
 8001394:	fb92 f0f6 	sdiv	r0, r2, r6
 8001398:	696a      	ldr	r2, [r5, #20]
 800139a:	1883      	adds	r3, r0, r2
 800139c:	616b      	str	r3, [r5, #20]
 800139e:	434b      	muls	r3, r1
 80013a0:	fb93 f3f4 	sdiv	r3, r3, r4
 80013a4:	622b      	str	r3, [r5, #32]
 80013a6:	bd70      	pop	{r4, r5, r6, pc}
 80013a8:	20000214 	.word	0x20000214

080013ac <_ZN4CIMU8imu_initEv>:
 80013ac:	230a      	movs	r3, #10
 80013ae:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80013b2:	63c3      	str	r3, [r0, #60]	; 0x3c
 80013b4:	2300      	movs	r3, #0
 80013b6:	4604      	mov	r4, r0
 80013b8:	6003      	str	r3, [r0, #0]
 80013ba:	6043      	str	r3, [r0, #4]
 80013bc:	6083      	str	r3, [r0, #8]
 80013be:	60c3      	str	r3, [r0, #12]
 80013c0:	6103      	str	r3, [r0, #16]
 80013c2:	6143      	str	r3, [r0, #20]
 80013c4:	f242 7511 	movw	r5, #10001	; 0x2711
 80013c8:	3d01      	subs	r5, #1
 80013ca:	d001      	beq.n	80013d0 <_ZN4CIMU8imu_initEv+0x24>
 80013cc:	bf00      	nop
 80013ce:	e7fb      	b.n	80013c8 <_ZN4CIMU8imu_initEv+0x1c>
 80013d0:	4832      	ldr	r0, [pc, #200]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 80013d2:	21d4      	movs	r1, #212	; 0xd4
 80013d4:	220f      	movs	r2, #15
 80013d6:	f7ff ff21 	bl	800121c <_ZN4CI2C8read_regEhh>
 80013da:	28d4      	cmp	r0, #212	; 0xd4
 80013dc:	4606      	mov	r6, r0
 80013de:	d155      	bne.n	800148c <_ZN4CIMU8imu_initEv+0xe0>
 80013e0:	482e      	ldr	r0, [pc, #184]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 80013e2:	213c      	movs	r1, #60	; 0x3c
 80013e4:	220f      	movs	r2, #15
 80013e6:	f7ff ff19 	bl	800121c <_ZN4CI2C8read_regEhh>
 80013ea:	2849      	cmp	r0, #73	; 0x49
 80013ec:	d152      	bne.n	8001494 <_ZN4CIMU8imu_initEv+0xe8>
 80013ee:	4631      	mov	r1, r6
 80013f0:	482a      	ldr	r0, [pc, #168]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 80013f2:	2220      	movs	r2, #32
 80013f4:	23ff      	movs	r3, #255	; 0xff
 80013f6:	f7ff fecb 	bl	8001190 <_ZN4CI2C9write_regEhhh>
 80013fa:	4631      	mov	r1, r6
 80013fc:	4827      	ldr	r0, [pc, #156]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 80013fe:	4e28      	ldr	r6, [pc, #160]	; (80014a0 <_ZN4CIMU8imu_initEv+0xf4>)
 8001400:	2223      	movs	r2, #35	; 0x23
 8001402:	2310      	movs	r3, #16
 8001404:	f7ff fec4 	bl	8001190 <_ZN4CI2C9write_regEhhh>
 8001408:	4824      	ldr	r0, [pc, #144]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 800140a:	213c      	movs	r1, #60	; 0x3c
 800140c:	221f      	movs	r2, #31
 800140e:	462b      	mov	r3, r5
 8001410:	f7ff febe 	bl	8001190 <_ZN4CI2C9write_regEhhh>
 8001414:	4821      	ldr	r0, [pc, #132]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 8001416:	213c      	movs	r1, #60	; 0x3c
 8001418:	2220      	movs	r2, #32
 800141a:	2367      	movs	r3, #103	; 0x67
 800141c:	f7ff feb8 	bl	8001190 <_ZN4CI2C9write_regEhhh>
 8001420:	481e      	ldr	r0, [pc, #120]	; (800149c <_ZN4CIMU8imu_initEv+0xf0>)
 8001422:	213c      	movs	r1, #60	; 0x3c
 8001424:	2221      	movs	r2, #33	; 0x21
 8001426:	462b      	mov	r3, r5
 8001428:	f7ff feb2 	bl	8001190 <_ZN4CI2C9write_regEhhh>
 800142c:	3e01      	subs	r6, #1
 800142e:	d001      	beq.n	8001434 <_ZN4CIMU8imu_initEv+0x88>
 8001430:	bf00      	nop
 8001432:	e7fb      	b.n	800142c <_ZN4CIMU8imu_initEv+0x80>
 8001434:	4620      	mov	r0, r4
 8001436:	f7ff ff11 	bl	800125c <_ZN4CIMU8imu_readEv>
 800143a:	2564      	movs	r5, #100	; 0x64
 800143c:	4637      	mov	r7, r6
 800143e:	46b0      	mov	r8, r6
 8001440:	2365      	movs	r3, #101	; 0x65
 8001442:	3b01      	subs	r3, #1
 8001444:	d001      	beq.n	800144a <_ZN4CIMU8imu_initEv+0x9e>
 8001446:	bf00      	nop
 8001448:	e7fb      	b.n	8001442 <_ZN4CIMU8imu_initEv+0x96>
 800144a:	4620      	mov	r0, r4
 800144c:	f7ff ff06 	bl	800125c <_ZN4CIMU8imu_readEv>
 8001450:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8001452:	4498      	add	r8, r3
 8001454:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001456:	441f      	add	r7, r3
 8001458:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 800145a:	3d01      	subs	r5, #1
 800145c:	441e      	add	r6, r3
 800145e:	d1ef      	bne.n	8001440 <_ZN4CIMU8imu_initEv+0x94>
 8001460:	2264      	movs	r2, #100	; 0x64
 8001462:	6325      	str	r5, [r4, #48]	; 0x30
 8001464:	fb98 f3f2 	sdiv	r3, r8, r2
 8001468:	fb97 f7f2 	sdiv	r7, r7, r2
 800146c:	fb96 f6f2 	sdiv	r6, r6, r2
 8001470:	6023      	str	r3, [r4, #0]
 8001472:	6067      	str	r7, [r4, #4]
 8001474:	60a6      	str	r6, [r4, #8]
 8001476:	6365      	str	r5, [r4, #52]	; 0x34
 8001478:	63a5      	str	r5, [r4, #56]	; 0x38
 800147a:	6265      	str	r5, [r4, #36]	; 0x24
 800147c:	62a5      	str	r5, [r4, #40]	; 0x28
 800147e:	62e5      	str	r5, [r4, #44]	; 0x2c
 8001480:	61a5      	str	r5, [r4, #24]
 8001482:	61e5      	str	r5, [r4, #28]
 8001484:	6225      	str	r5, [r4, #32]
 8001486:	4628      	mov	r0, r5
 8001488:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800148c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8001490:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001494:	f06f 0001 	mvn.w	r0, #1
 8001498:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800149c:	20000214 	.word	0x20000214
 80014a0:	000186a1 	.word	0x000186a1

080014a4 <_ZN4CIMU14get_imu_resultEv>:
 80014a4:	3018      	adds	r0, #24
 80014a6:	4770      	bx	lr

080014a8 <_ZN5CGPIO9gpio_initEv>:
 80014a8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80014ac:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80014b0:	b087      	sub	sp, #28
 80014b2:	2101      	movs	r1, #1
 80014b4:	f000 ffb4 	bl	8002420 <RCC_AHBPeriphClockCmd>
 80014b8:	4f44      	ldr	r7, [pc, #272]	; (80015cc <_ZN5CGPIO9gpio_initEv+0x124>)
 80014ba:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80014be:	2101      	movs	r1, #1
 80014c0:	f000 ffae 	bl	8002420 <RCC_AHBPeriphClockCmd>
 80014c4:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 80014c8:	2101      	movs	r1, #1
 80014ca:	2400      	movs	r4, #0
 80014cc:	f000 ffa8 	bl	8002420 <RCC_AHBPeriphClockCmd>
 80014d0:	2501      	movs	r5, #1
 80014d2:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80014d6:	2603      	movs	r6, #3
 80014d8:	4638      	mov	r0, r7
 80014da:	a902      	add	r1, sp, #8
 80014dc:	f88d 600d 	strb.w	r6, [sp, #13]
 80014e0:	f8cd 8008 	str.w	r8, [sp, #8]
 80014e4:	f88d 500c 	strb.w	r5, [sp, #12]
 80014e8:	f88d 400e 	strb.w	r4, [sp, #14]
 80014ec:	f88d 400f 	strb.w	r4, [sp, #15]
 80014f0:	f001 fab2 	bl	8002a58 <GPIO_Init>
 80014f4:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 80014f8:	4638      	mov	r0, r7
 80014fa:	a902      	add	r1, sp, #8
 80014fc:	9302      	str	r3, [sp, #8]
 80014fe:	f88d 600d 	strb.w	r6, [sp, #13]
 8001502:	f88d 400c 	strb.w	r4, [sp, #12]
 8001506:	f88d 400f 	strb.w	r4, [sp, #15]
 800150a:	f001 faa5 	bl	8002a58 <GPIO_Init>
 800150e:	f44f 5382 	mov.w	r3, #4160	; 0x1040
 8001512:	a902      	add	r1, sp, #8
 8001514:	482e      	ldr	r0, [pc, #184]	; (80015d0 <_ZN5CGPIO9gpio_initEv+0x128>)
 8001516:	9302      	str	r3, [sp, #8]
 8001518:	f88d 400c 	strb.w	r4, [sp, #12]
 800151c:	f88d 500f 	strb.w	r5, [sp, #15]
 8001520:	f001 fa9a 	bl	8002a58 <GPIO_Init>
 8001524:	4628      	mov	r0, r5
 8001526:	4629      	mov	r1, r5
 8001528:	f000 ff88 	bl	800243c <RCC_APB2PeriphClockCmd>
 800152c:	f04f 0b10 	mov.w	fp, #16
 8001530:	2106      	movs	r1, #6
 8001532:	2002      	movs	r0, #2
 8001534:	f001 fb1e 	bl	8002b74 <SYSCFG_EXTILineConfig>
 8001538:	f04f 0a06 	mov.w	sl, #6
 800153c:	eb0d 000b 	add.w	r0, sp, fp
 8001540:	260f      	movs	r6, #15
 8001542:	f8cd a010 	str.w	sl, [sp, #16]
 8001546:	f88d 4014 	strb.w	r4, [sp, #20]
 800154a:	f88d b015 	strb.w	fp, [sp, #21]
 800154e:	f88d 5016 	strb.w	r5, [sp, #22]
 8001552:	f001 f9ef 	bl	8002934 <EXTI_Init>
 8001556:	2317      	movs	r3, #23
 8001558:	a801      	add	r0, sp, #4
 800155a:	f88d 3004 	strb.w	r3, [sp, #4]
 800155e:	f88d 6005 	strb.w	r6, [sp, #5]
 8001562:	f88d 6006 	strb.w	r6, [sp, #6]
 8001566:	f88d 5007 	strb.w	r5, [sp, #7]
 800156a:	f001 f9a9 	bl	80028c0 <NVIC_Init>
 800156e:	210c      	movs	r1, #12
 8001570:	2002      	movs	r0, #2
 8001572:	f001 faff 	bl	8002b74 <SYSCFG_EXTILineConfig>
 8001576:	f04f 090c 	mov.w	r9, #12
 800157a:	eb0d 000b 	add.w	r0, sp, fp
 800157e:	f8cd 9010 	str.w	r9, [sp, #16]
 8001582:	f88d 4014 	strb.w	r4, [sp, #20]
 8001586:	f88d b015 	strb.w	fp, [sp, #21]
 800158a:	f88d 5016 	strb.w	r5, [sp, #22]
 800158e:	f001 f9d1 	bl	8002934 <EXTI_Init>
 8001592:	2328      	movs	r3, #40	; 0x28
 8001594:	a801      	add	r0, sp, #4
 8001596:	f88d 3004 	strb.w	r3, [sp, #4]
 800159a:	f88d 6005 	strb.w	r6, [sp, #5]
 800159e:	f88d 6006 	strb.w	r6, [sp, #6]
 80015a2:	f88d 5007 	strb.w	r5, [sp, #7]
 80015a6:	f001 f98b 	bl	80028c0 <NVIC_Init>
 80015aa:	4650      	mov	r0, sl
 80015ac:	f001 fa48 	bl	8002a40 <EXTI_ClearITPendingBit>
 80015b0:	4648      	mov	r0, r9
 80015b2:	f001 fa45 	bl	8002a40 <EXTI_ClearITPendingBit>
 80015b6:	4b07      	ldr	r3, [pc, #28]	; (80015d4 <_ZN5CGPIO9gpio_initEv+0x12c>)
 80015b8:	601c      	str	r4, [r3, #0]
 80015ba:	4b07      	ldr	r3, [pc, #28]	; (80015d8 <_ZN5CGPIO9gpio_initEv+0x130>)
 80015bc:	4620      	mov	r0, r4
 80015be:	601c      	str	r4, [r3, #0]
 80015c0:	f8c7 8018 	str.w	r8, [r7, #24]
 80015c4:	b007      	add	sp, #28
 80015c6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80015ca:	bf00      	nop
 80015cc:	48000400 	.word	0x48000400
 80015d0:	48000800 	.word	0x48000800
 80015d4:	20000218 	.word	0x20000218
 80015d8:	2000021c 	.word	0x2000021c

080015dc <_ZN5CGPIO7gpio_onEm>:
 80015dc:	4b01      	ldr	r3, [pc, #4]	; (80015e4 <_ZN5CGPIO7gpio_onEm+0x8>)
 80015de:	6199      	str	r1, [r3, #24]
 80015e0:	4770      	bx	lr
 80015e2:	bf00      	nop
 80015e4:	48000400 	.word	0x48000400

080015e8 <_ZN5CGPIO8gpio_offEm>:
 80015e8:	4b01      	ldr	r3, [pc, #4]	; (80015f0 <_ZN5CGPIO8gpio_offEm+0x8>)
 80015ea:	b289      	uxth	r1, r1
 80015ec:	8519      	strh	r1, [r3, #40]	; 0x28
 80015ee:	4770      	bx	lr
 80015f0:	48000400 	.word	0x48000400

080015f4 <_ZN5CGPIO7gpio_inEm>:
 80015f4:	4b02      	ldr	r3, [pc, #8]	; (8001600 <_ZN5CGPIO7gpio_inEm+0xc>)
 80015f6:	8a18      	ldrh	r0, [r3, #16]
 80015f8:	b280      	uxth	r0, r0
 80015fa:	ea21 0000 	bic.w	r0, r1, r0
 80015fe:	4770      	bx	lr
 8001600:	48000400 	.word	0x48000400

08001604 <EXTI9_5_IRQHandler>:
 8001604:	4a03      	ldr	r2, [pc, #12]	; (8001614 <EXTI9_5_IRQHandler+0x10>)
 8001606:	6813      	ldr	r3, [r2, #0]
 8001608:	2006      	movs	r0, #6
 800160a:	3301      	adds	r3, #1
 800160c:	6013      	str	r3, [r2, #0]
 800160e:	f001 ba17 	b.w	8002a40 <EXTI_ClearITPendingBit>
 8001612:	bf00      	nop
 8001614:	20000218 	.word	0x20000218

08001618 <EXTI15_10_IRQHandler>:
 8001618:	4a03      	ldr	r2, [pc, #12]	; (8001628 <EXTI15_10_IRQHandler+0x10>)
 800161a:	6813      	ldr	r3, [r2, #0]
 800161c:	200c      	movs	r0, #12
 800161e:	3301      	adds	r3, #1
 8001620:	6013      	str	r3, [r2, #0]
 8001622:	f001 ba0d 	b.w	8002a40 <EXTI_ClearITPendingBit>
 8001626:	bf00      	nop
 8001628:	2000021c 	.word	0x2000021c

0800162c <_ZN9CTerminal13terminal_initEv>:
 800162c:	b530      	push	{r4, r5, lr}
 800162e:	4a2f      	ldr	r2, [pc, #188]	; (80016ec <_ZN9CTerminal13terminal_initEv+0xc0>)
 8001630:	2300      	movs	r3, #0
 8001632:	6013      	str	r3, [r2, #0]
 8001634:	4a2e      	ldr	r2, [pc, #184]	; (80016f0 <_ZN9CTerminal13terminal_initEv+0xc4>)
 8001636:	b08b      	sub	sp, #44	; 0x2c
 8001638:	6013      	str	r3, [r2, #0]
 800163a:	4a2e      	ldr	r2, [pc, #184]	; (80016f4 <_ZN9CTerminal13terminal_initEv+0xc8>)
 800163c:	2400      	movs	r4, #0
 800163e:	54d4      	strb	r4, [r2, r3]
 8001640:	3301      	adds	r3, #1
 8001642:	2b10      	cmp	r3, #16
 8001644:	d1f9      	bne.n	800163a <_ZN9CTerminal13terminal_initEv+0xe>
 8001646:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800164a:	2101      	movs	r1, #1
 800164c:	f000 fee8 	bl	8002420 <RCC_AHBPeriphClockCmd>
 8001650:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001654:	2101      	movs	r1, #1
 8001656:	f000 fef1 	bl	800243c <RCC_APB2PeriphClockCmd>
 800165a:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 800165e:	9302      	str	r3, [sp, #8]
 8001660:	2302      	movs	r3, #2
 8001662:	f88d 300c 	strb.w	r3, [sp, #12]
 8001666:	a902      	add	r1, sp, #8
 8001668:	2303      	movs	r3, #3
 800166a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800166e:	f88d 300d 	strb.w	r3, [sp, #13]
 8001672:	f88d 400e 	strb.w	r4, [sp, #14]
 8001676:	f88d 400f 	strb.w	r4, [sp, #15]
 800167a:	f001 f9ed 	bl	8002a58 <GPIO_Init>
 800167e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001682:	2109      	movs	r1, #9
 8001684:	2207      	movs	r2, #7
 8001686:	f001 fa2d 	bl	8002ae4 <GPIO_PinAFConfig>
 800168a:	2207      	movs	r2, #7
 800168c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001690:	210a      	movs	r1, #10
 8001692:	f001 fa27 	bl	8002ae4 <GPIO_PinAFConfig>
 8001696:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 800169a:	9304      	str	r3, [sp, #16]
 800169c:	a904      	add	r1, sp, #16
 800169e:	230c      	movs	r3, #12
 80016a0:	4815      	ldr	r0, [pc, #84]	; (80016f8 <_ZN9CTerminal13terminal_initEv+0xcc>)
 80016a2:	9308      	str	r3, [sp, #32]
 80016a4:	9405      	str	r4, [sp, #20]
 80016a6:	9406      	str	r4, [sp, #24]
 80016a8:	9407      	str	r4, [sp, #28]
 80016aa:	9409      	str	r4, [sp, #36]	; 0x24
 80016ac:	f000 ffd4 	bl	8002658 <USART_Init>
 80016b0:	4811      	ldr	r0, [pc, #68]	; (80016f8 <_ZN9CTerminal13terminal_initEv+0xcc>)
 80016b2:	2101      	movs	r1, #1
 80016b4:	f001 f832 	bl	800271c <USART_Cmd>
 80016b8:	2201      	movs	r2, #1
 80016ba:	4910      	ldr	r1, [pc, #64]	; (80016fc <_ZN9CTerminal13terminal_initEv+0xd0>)
 80016bc:	480e      	ldr	r0, [pc, #56]	; (80016f8 <_ZN9CTerminal13terminal_initEv+0xcc>)
 80016be:	f001 f83d 	bl	800273c <USART_ITConfig>
 80016c2:	2501      	movs	r5, #1
 80016c4:	2325      	movs	r3, #37	; 0x25
 80016c6:	a801      	add	r0, sp, #4
 80016c8:	f88d 3004 	strb.w	r3, [sp, #4]
 80016cc:	f88d 4005 	strb.w	r4, [sp, #5]
 80016d0:	f88d 4006 	strb.w	r4, [sp, #6]
 80016d4:	f88d 5007 	strb.w	r5, [sp, #7]
 80016d8:	f001 f8f2 	bl	80028c0 <NVIC_Init>
 80016dc:	4806      	ldr	r0, [pc, #24]	; (80016f8 <_ZN9CTerminal13terminal_initEv+0xcc>)
 80016de:	4629      	mov	r1, r5
 80016e0:	f001 f81c 	bl	800271c <USART_Cmd>
 80016e4:	4620      	mov	r0, r4
 80016e6:	b00b      	add	sp, #44	; 0x2c
 80016e8:	bd30      	pop	{r4, r5, pc}
 80016ea:	bf00      	nop
 80016ec:	20000220 	.word	0x20000220
 80016f0:	20000234 	.word	0x20000234
 80016f4:	20000224 	.word	0x20000224
 80016f8:	40013800 	.word	0x40013800
 80016fc:	00050105 	.word	0x00050105

08001700 <USART1_IRQHandler>:
 8001700:	b508      	push	{r3, lr}
 8001702:	480d      	ldr	r0, [pc, #52]	; (8001738 <USART1_IRQHandler+0x38>)
 8001704:	490d      	ldr	r1, [pc, #52]	; (800173c <USART1_IRQHandler+0x3c>)
 8001706:	f001 f833 	bl	8002770 <USART_GetITStatus>
 800170a:	b178      	cbz	r0, 800172c <USART1_IRQHandler+0x2c>
 800170c:	480a      	ldr	r0, [pc, #40]	; (8001738 <USART1_IRQHandler+0x38>)
 800170e:	f001 f810 	bl	8002732 <USART_ReceiveData>
 8001712:	4b0b      	ldr	r3, [pc, #44]	; (8001740 <USART1_IRQHandler+0x40>)
 8001714:	490b      	ldr	r1, [pc, #44]	; (8001744 <USART1_IRQHandler+0x44>)
 8001716:	681a      	ldr	r2, [r3, #0]
 8001718:	b2c0      	uxtb	r0, r0
 800171a:	5488      	strb	r0, [r1, r2]
 800171c:	681a      	ldr	r2, [r3, #0]
 800171e:	3201      	adds	r2, #1
 8001720:	601a      	str	r2, [r3, #0]
 8001722:	681a      	ldr	r2, [r3, #0]
 8001724:	2a0f      	cmp	r2, #15
 8001726:	bf84      	itt	hi
 8001728:	2200      	movhi	r2, #0
 800172a:	601a      	strhi	r2, [r3, #0]
 800172c:	4802      	ldr	r0, [pc, #8]	; (8001738 <USART1_IRQHandler+0x38>)
 800172e:	4903      	ldr	r1, [pc, #12]	; (800173c <USART1_IRQHandler+0x3c>)
 8001730:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001734:	f001 b83a 	b.w	80027ac <USART_ClearITPendingBit>
 8001738:	40013800 	.word	0x40013800
 800173c:	00050105 	.word	0x00050105
 8001740:	20000220 	.word	0x20000220
 8001744:	20000224 	.word	0x20000224

08001748 <_ZN9CTerminal7putcharEc>:
 8001748:	4b04      	ldr	r3, [pc, #16]	; (800175c <_ZN9CTerminal7putcharEc+0x14>)
 800174a:	69da      	ldr	r2, [r3, #28]
 800174c:	0612      	lsls	r2, r2, #24
 800174e:	d401      	bmi.n	8001754 <_ZN9CTerminal7putcharEc+0xc>
 8001750:	bf00      	nop
 8001752:	e7f9      	b.n	8001748 <_ZN9CTerminal7putcharEc>
 8001754:	b289      	uxth	r1, r1
 8001756:	8519      	strh	r1, [r3, #40]	; 0x28
 8001758:	4770      	bx	lr
 800175a:	bf00      	nop
 800175c:	40013800 	.word	0x40013800

08001760 <_ZN9CTerminal4putsEPc>:
 8001760:	b538      	push	{r3, r4, r5, lr}
 8001762:	4605      	mov	r5, r0
 8001764:	1e4c      	subs	r4, r1, #1
 8001766:	f814 1f01 	ldrb.w	r1, [r4, #1]!
 800176a:	b119      	cbz	r1, 8001774 <_ZN9CTerminal4putsEPc+0x14>
 800176c:	4628      	mov	r0, r5
 800176e:	f7ff ffeb 	bl	8001748 <_ZN9CTerminal7putcharEc>
 8001772:	e7f8      	b.n	8001766 <_ZN9CTerminal4putsEPc+0x6>
 8001774:	2001      	movs	r0, #1
 8001776:	bd38      	pop	{r3, r4, r5, pc}

08001778 <_ZN9CTerminal4putiEl>:
 8001778:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 800177a:	1e0b      	subs	r3, r1, #0
 800177c:	f04f 0200 	mov.w	r2, #0
 8001780:	bfba      	itte	lt
 8001782:	425b      	neglt	r3, r3
 8001784:	2501      	movlt	r5, #1
 8001786:	4615      	movge	r5, r2
 8001788:	f88d 200f 	strb.w	r2, [sp, #15]
 800178c:	210a      	movs	r1, #10
 800178e:	220a      	movs	r2, #10
 8001790:	ac01      	add	r4, sp, #4
 8001792:	fb93 f6f2 	sdiv	r6, r3, r2
 8001796:	fb02 3316 	mls	r3, r2, r6, r3
 800179a:	3330      	adds	r3, #48	; 0x30
 800179c:	550b      	strb	r3, [r1, r4]
 800179e:	1e4a      	subs	r2, r1, #1
 80017a0:	4633      	mov	r3, r6
 80017a2:	b10e      	cbz	r6, 80017a8 <_ZN9CTerminal4putiEl+0x30>
 80017a4:	4611      	mov	r1, r2
 80017a6:	e7f2      	b.n	800178e <_ZN9CTerminal4putiEl+0x16>
 80017a8:	b12d      	cbz	r5, 80017b6 <_ZN9CTerminal4putiEl+0x3e>
 80017aa:	ab04      	add	r3, sp, #16
 80017ac:	4413      	add	r3, r2
 80017ae:	212d      	movs	r1, #45	; 0x2d
 80017b0:	f803 1c0c 	strb.w	r1, [r3, #-12]
 80017b4:	4611      	mov	r1, r2
 80017b6:	4421      	add	r1, r4
 80017b8:	f7ff ffd2 	bl	8001760 <_ZN9CTerminal4putsEPc>
 80017bc:	b004      	add	sp, #16
 80017be:	bd70      	pop	{r4, r5, r6, pc}

080017c0 <_ZN9CTerminal5putuiEm>:
 80017c0:	b530      	push	{r4, r5, lr}
 80017c2:	b085      	sub	sp, #20
 80017c4:	2300      	movs	r3, #0
 80017c6:	f88d 300f 	strb.w	r3, [sp, #15]
 80017ca:	220a      	movs	r2, #10
 80017cc:	230a      	movs	r3, #10
 80017ce:	ac01      	add	r4, sp, #4
 80017d0:	fbb1 f5f3 	udiv	r5, r1, r3
 80017d4:	fb03 1315 	mls	r3, r3, r5, r1
 80017d8:	3330      	adds	r3, #48	; 0x30
 80017da:	5513      	strb	r3, [r2, r4]
 80017dc:	4629      	mov	r1, r5
 80017de:	1e53      	subs	r3, r2, #1
 80017e0:	b10d      	cbz	r5, 80017e6 <_ZN9CTerminal5putuiEm+0x26>
 80017e2:	461a      	mov	r2, r3
 80017e4:	e7f2      	b.n	80017cc <_ZN9CTerminal5putuiEm+0xc>
 80017e6:	18a1      	adds	r1, r4, r2
 80017e8:	f7ff ffba 	bl	8001760 <_ZN9CTerminal4putsEPc>
 80017ec:	b005      	add	sp, #20
 80017ee:	bd30      	pop	{r4, r5, pc}

080017f0 <_ZN9CTerminal4putxEm>:
 80017f0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80017f2:	2300      	movs	r3, #0
 80017f4:	f88d 300f 	strb.w	r3, [sp, #15]
 80017f8:	220a      	movs	r2, #10
 80017fa:	f001 030f 	and.w	r3, r1, #15
 80017fe:	2b09      	cmp	r3, #9
 8001800:	ac01      	add	r4, sp, #4
 8001802:	bfd4      	ite	le
 8001804:	3330      	addle	r3, #48	; 0x30
 8001806:	3357      	addgt	r3, #87	; 0x57
 8001808:	0909      	lsrs	r1, r1, #4
 800180a:	54a3      	strb	r3, [r4, r2]
 800180c:	f102 33ff 	add.w	r3, r2, #4294967295	; 0xffffffff
 8001810:	d001      	beq.n	8001816 <_ZN9CTerminal4putxEm+0x26>
 8001812:	461a      	mov	r2, r3
 8001814:	e7f1      	b.n	80017fa <_ZN9CTerminal4putxEm+0xa>
 8001816:	18a1      	adds	r1, r4, r2
 8001818:	f7ff ffa2 	bl	8001760 <_ZN9CTerminal4putsEPc>
 800181c:	b004      	add	sp, #16
 800181e:	bd10      	pop	{r4, pc}

08001820 <_ZN9CTerminal4putfEfj>:
 8001820:	b538      	push	{r3, r4, r5, lr}
 8001822:	2200      	movs	r2, #0
 8001824:	4605      	mov	r5, r0
 8001826:	2301      	movs	r3, #1
 8001828:	428a      	cmp	r2, r1
 800182a:	d003      	beq.n	8001834 <_ZN9CTerminal4putfEfj+0x14>
 800182c:	200a      	movs	r0, #10
 800182e:	4343      	muls	r3, r0
 8001830:	3201      	adds	r2, #1
 8001832:	e7f9      	b.n	8001828 <_ZN9CTerminal4putfEfj+0x8>
 8001834:	eebd 7ac0 	vcvt.s32.f32	s14, s0
 8001838:	4628      	mov	r0, r5
 800183a:	eef8 7ac7 	vcvt.f32.s32	s15, s14
 800183e:	ee17 1a10 	vmov	r1, s14
 8001842:	ee30 0a67 	vsub.f32	s0, s0, s15
 8001846:	ee07 3a90 	vmov	s15, r3
 800184a:	eef8 7a67 	vcvt.f32.u32	s15, s15
 800184e:	ee20 0a27 	vmul.f32	s0, s0, s15
 8001852:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8001856:	ee17 4a90 	vmov	r4, s15
 800185a:	f7ff ff8d 	bl	8001778 <_ZN9CTerminal4putiEl>
 800185e:	4628      	mov	r0, r5
 8001860:	212e      	movs	r1, #46	; 0x2e
 8001862:	f7ff ff71 	bl	8001748 <_ZN9CTerminal7putcharEc>
 8001866:	ea84 71e4 	eor.w	r1, r4, r4, asr #31
 800186a:	4628      	mov	r0, r5
 800186c:	eba1 71e4 	sub.w	r1, r1, r4, asr #31
 8001870:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001874:	f7ff bf80 	b.w	8001778 <_ZN9CTerminal4putiEl>

08001878 <_ZN9CTerminal6printfEPKcz>:
 8001878:	b40e      	push	{r1, r2, r3}
 800187a:	b577      	push	{r0, r1, r2, r4, r5, r6, lr}
 800187c:	ab07      	add	r3, sp, #28
 800187e:	4604      	mov	r4, r0
 8001880:	f853 6b04 	ldr.w	r6, [r3], #4
 8001884:	9301      	str	r3, [sp, #4]
 8001886:	2500      	movs	r5, #0
 8001888:	5d71      	ldrb	r1, [r6, r5]
 800188a:	2900      	cmp	r1, #0
 800188c:	d054      	beq.n	8001938 <_ZN9CTerminal6printfEPKcz+0xc0>
 800188e:	2925      	cmp	r1, #37	; 0x25
 8001890:	d004      	beq.n	800189c <_ZN9CTerminal6printfEPKcz+0x24>
 8001892:	4620      	mov	r0, r4
 8001894:	f7ff ff58 	bl	8001748 <_ZN9CTerminal7putcharEc>
 8001898:	3501      	adds	r5, #1
 800189a:	e7f5      	b.n	8001888 <_ZN9CTerminal6printfEPKcz+0x10>
 800189c:	1973      	adds	r3, r6, r5
 800189e:	7859      	ldrb	r1, [r3, #1]
 80018a0:	2969      	cmp	r1, #105	; 0x69
 80018a2:	d016      	beq.n	80018d2 <_ZN9CTerminal6printfEPKcz+0x5a>
 80018a4:	d807      	bhi.n	80018b6 <_ZN9CTerminal6printfEPKcz+0x3e>
 80018a6:	2963      	cmp	r1, #99	; 0x63
 80018a8:	d02b      	beq.n	8001902 <_ZN9CTerminal6printfEPKcz+0x8a>
 80018aa:	2966      	cmp	r1, #102	; 0x66
 80018ac:	d031      	beq.n	8001912 <_ZN9CTerminal6printfEPKcz+0x9a>
 80018ae:	2925      	cmp	r1, #37	; 0x25
 80018b0:	d140      	bne.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 80018b2:	4620      	mov	r0, r4
 80018b4:	e02a      	b.n	800190c <_ZN9CTerminal6printfEPKcz+0x94>
 80018b6:	2975      	cmp	r1, #117	; 0x75
 80018b8:	d013      	beq.n	80018e2 <_ZN9CTerminal6printfEPKcz+0x6a>
 80018ba:	2978      	cmp	r1, #120	; 0x78
 80018bc:	d019      	beq.n	80018f2 <_ZN9CTerminal6printfEPKcz+0x7a>
 80018be:	2973      	cmp	r1, #115	; 0x73
 80018c0:	d138      	bne.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 80018c2:	9b01      	ldr	r3, [sp, #4]
 80018c4:	4620      	mov	r0, r4
 80018c6:	1d1a      	adds	r2, r3, #4
 80018c8:	6819      	ldr	r1, [r3, #0]
 80018ca:	9201      	str	r2, [sp, #4]
 80018cc:	f7ff ff48 	bl	8001760 <_ZN9CTerminal4putsEPc>
 80018d0:	e030      	b.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 80018d2:	9b01      	ldr	r3, [sp, #4]
 80018d4:	4620      	mov	r0, r4
 80018d6:	1d1a      	adds	r2, r3, #4
 80018d8:	6819      	ldr	r1, [r3, #0]
 80018da:	9201      	str	r2, [sp, #4]
 80018dc:	f7ff ff4c 	bl	8001778 <_ZN9CTerminal4putiEl>
 80018e0:	e028      	b.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 80018e2:	9b01      	ldr	r3, [sp, #4]
 80018e4:	4620      	mov	r0, r4
 80018e6:	1d1a      	adds	r2, r3, #4
 80018e8:	6819      	ldr	r1, [r3, #0]
 80018ea:	9201      	str	r2, [sp, #4]
 80018ec:	f7ff ff68 	bl	80017c0 <_ZN9CTerminal5putuiEm>
 80018f0:	e020      	b.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 80018f2:	9b01      	ldr	r3, [sp, #4]
 80018f4:	4620      	mov	r0, r4
 80018f6:	1d1a      	adds	r2, r3, #4
 80018f8:	6819      	ldr	r1, [r3, #0]
 80018fa:	9201      	str	r2, [sp, #4]
 80018fc:	f7ff ff78 	bl	80017f0 <_ZN9CTerminal4putxEm>
 8001900:	e018      	b.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001902:	9b01      	ldr	r3, [sp, #4]
 8001904:	1d1a      	adds	r2, r3, #4
 8001906:	7819      	ldrb	r1, [r3, #0]
 8001908:	9201      	str	r2, [sp, #4]
 800190a:	4620      	mov	r0, r4
 800190c:	f7ff ff1c 	bl	8001748 <_ZN9CTerminal7putcharEc>
 8001910:	e010      	b.n	8001934 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001912:	9b01      	ldr	r3, [sp, #4]
 8001914:	3307      	adds	r3, #7
 8001916:	f023 0307 	bic.w	r3, r3, #7
 800191a:	f103 0208 	add.w	r2, r3, #8
 800191e:	e9d3 0100 	ldrd	r0, r1, [r3]
 8001922:	9201      	str	r2, [sp, #4]
 8001924:	f001 f994 	bl	8002c50 <__aeabi_d2f>
 8001928:	2103      	movs	r1, #3
 800192a:	ee00 0a10 	vmov	s0, r0
 800192e:	4620      	mov	r0, r4
 8001930:	f7ff ff76 	bl	8001820 <_ZN9CTerminal4putfEfj>
 8001934:	3502      	adds	r5, #2
 8001936:	e7a7      	b.n	8001888 <_ZN9CTerminal6printfEPKcz+0x10>
 8001938:	b003      	add	sp, #12
 800193a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800193e:	b003      	add	sp, #12
 8001940:	4770      	bx	lr

08001942 <_ZN10MathVectorILj9EE4initEv>:
 8001942:	f100 0324 	add.w	r3, r0, #36	; 0x24
 8001946:	2200      	movs	r2, #0
 8001948:	f840 2b04 	str.w	r2, [r0], #4
 800194c:	4298      	cmp	r0, r3
 800194e:	d1fa      	bne.n	8001946 <_ZN10MathVectorILj9EE4initEv+0x4>
 8001950:	4770      	bx	lr

08001952 <_ZN10MathVectorILj3EE3mixERS0_f>:
 8001952:	f100 030c 	add.w	r3, r0, #12
 8001956:	ecf1 7a01 	vldmia	r1!, {s15}
 800195a:	edd0 6a00 	vldr	s13, [r0]
 800195e:	eeb7 7a00 	vmov.f32	s14, #112	; 0x3f800000  1.0
 8001962:	ee37 7a40 	vsub.f32	s14, s14, s0
 8001966:	ee60 7a27 	vmul.f32	s15, s0, s15
 800196a:	eee7 7a26 	vfma.f32	s15, s14, s13
 800196e:	ece0 7a01 	vstmia	r0!, {s15}
 8001972:	4298      	cmp	r0, r3
 8001974:	d1ef      	bne.n	8001956 <_ZN10MathVectorILj3EE3mixERS0_f+0x4>
 8001976:	4770      	bx	lr

08001978 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE>:
 8001978:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800197a:	eddf 6a18 	vldr	s13, [pc, #96]	; 80019dc <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE+0x64>
 800197e:	f8d0 e300 	ldr.w	lr, [r0, #768]	; 0x300
 8001982:	2600      	movs	r6, #0
 8001984:	4603      	mov	r3, r0
 8001986:	4634      	mov	r4, r6
 8001988:	4574      	cmp	r4, lr
 800198a:	d01b      	beq.n	80019c4 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE+0x4c>
 800198c:	2524      	movs	r5, #36	; 0x24
 800198e:	eddf 7a14 	vldr	s15, [pc, #80]	; 80019e0 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE+0x68>
 8001992:	460f      	mov	r7, r1
 8001994:	fb05 3504 	mla	r5, r5, r4, r3
 8001998:	f101 0024 	add.w	r0, r1, #36	; 0x24
 800199c:	ecb7 7a01 	vldmia	r7!, {s14}
 80019a0:	ecb5 6a01 	vldmia	r5!, {s12}
 80019a4:	ee37 7a46 	vsub.f32	s14, s14, s12
 80019a8:	4287      	cmp	r7, r0
 80019aa:	eee7 7a07 	vfma.f32	s15, s14, s14
 80019ae:	d1f5      	bne.n	800199c <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE+0x24>
 80019b0:	eef4 7ae6 	vcmpe.f32	s15, s13
 80019b4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80019b8:	bf44      	itt	mi
 80019ba:	4626      	movmi	r6, r4
 80019bc:	eef0 6a67 	vmovmi.f32	s13, s15
 80019c0:	3401      	adds	r4, #1
 80019c2:	e7e1      	b.n	8001988 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE+0x10>
 80019c4:	f503 7310 	add.w	r3, r3, #576	; 0x240
 80019c8:	210c      	movs	r1, #12
 80019ca:	4610      	mov	r0, r2
 80019cc:	fb01 3106 	mla	r1, r1, r6, r3
 80019d0:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 80019d4:	f7ff ffbd 	bl	8001952 <_ZN10MathVectorILj3EE3mixERS0_f>
 80019d8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80019da:	bf00      	nop
 80019dc:	4cbebc20 	.word	0x4cbebc20
 80019e0:	00000000 	.word	0x00000000

080019e4 <_ZN21CLearningLineFollower3runEv>:
 80019e4:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80019e8:	2308      	movs	r3, #8
 80019ea:	ed2d 8b06 	vpush	{d8-d10}
 80019ee:	f100 05a0 	add.w	r5, r0, #160	; 0xa0
 80019f2:	f8c0 33a0 	str.w	r3, [r0, #928]	; 0x3a0
 80019f6:	4bd5      	ldr	r3, [pc, #852]	; (8001d4c <_ZN21CLearningLineFollower3runEv+0x368>)
 80019f8:	f8c0 33a4 	str.w	r3, [r0, #932]	; 0x3a4
 80019fc:	4604      	mov	r4, r0
 80019fe:	f500 7838 	add.w	r8, r0, #736	; 0x2e0
 8001a02:	462e      	mov	r6, r5
 8001a04:	f106 0724 	add.w	r7, r6, #36	; 0x24
 8001a08:	48d1      	ldr	r0, [pc, #836]	; (8001d50 <_ZN21CLearningLineFollower3runEv+0x36c>)
 8001a0a:	f7fe fd9b 	bl	8000544 <_ZN5CMath3rndEv>
 8001a0e:	eca6 0a01 	vstmia	r6!, {s0}
 8001a12:	42be      	cmp	r6, r7
 8001a14:	d1f8      	bne.n	8001a08 <_ZN21CLearningLineFollower3runEv+0x24>
 8001a16:	4546      	cmp	r6, r8
 8001a18:	d1f4      	bne.n	8001a04 <_ZN21CLearningLineFollower3runEv+0x20>
 8001a1a:	4623      	mov	r3, r4
 8001a1c:	f104 02c0 	add.w	r2, r4, #192	; 0xc0
 8001a20:	eddf 8acc 	vldr	s17, [pc, #816]	; 8001d54 <_ZN21CLearningLineFollower3runEv+0x370>
 8001a24:	330c      	adds	r3, #12
 8001a26:	edc3 8ab5 	vstr	s17, [r3, #724]	; 0x2d4
 8001a2a:	edc3 8ab6 	vstr	s17, [r3, #728]	; 0x2d8
 8001a2e:	edc3 8ab7 	vstr	s17, [r3, #732]	; 0x2dc
 8001a32:	4293      	cmp	r3, r2
 8001a34:	d1f4      	bne.n	8001a20 <_ZN21CLearningLineFollower3runEv+0x3c>
 8001a36:	2300      	movs	r3, #0
 8001a38:	f104 0758 	add.w	r7, r4, #88	; 0x58
 8001a3c:	6523      	str	r3, [r4, #80]	; 0x50
 8001a3e:	6563      	str	r3, [r4, #84]	; 0x54
 8001a40:	4638      	mov	r0, r7
 8001a42:	f104 097c 	add.w	r9, r4, #124	; 0x7c
 8001a46:	f7ff ff7c 	bl	8001942 <_ZN10MathVectorILj9EE4initEv>
 8001a4a:	4648      	mov	r0, r9
 8001a4c:	f7ff ff79 	bl	8001942 <_ZN10MathVectorILj9EE4initEv>
 8001a50:	eebf aa00 	vmov.f32	s20, #240	; 0xbf800000 -1.0
 8001a54:	edc4 8aea 	vstr	s17, [r4, #936]	; 0x3a8
 8001a58:	edc4 8aeb 	vstr	s17, [r4, #940]	; 0x3ac
 8001a5c:	edc4 8aec 	vstr	s17, [r4, #944]	; 0x3b0
 8001a60:	2100      	movs	r1, #0
 8001a62:	48bd      	ldr	r0, [pc, #756]	; (8001d58 <_ZN21CLearningLineFollower3runEv+0x374>)
 8001a64:	f7fe fe4a 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 8001a68:	48bb      	ldr	r0, [pc, #748]	; (8001d58 <_ZN21CLearningLineFollower3runEv+0x374>)
 8001a6a:	f7fe ffff 	bl	8000a6c <_ZN4CRGB14get_rgb_resultEv>
 8001a6e:	4601      	mov	r1, r0
 8001a70:	4620      	mov	r0, r4
 8001a72:	f7fe fc57 	bl	8000324 <_ZN13CLinePosition7processEP10sRGBResult>
 8001a76:	4620      	mov	r0, r4
 8001a78:	f7fe fcf0 	bl	800045c <_ZN13CLinePosition17get_line_positionEv>
 8001a7c:	f104 034c 	add.w	r3, r4, #76	; 0x4c
 8001a80:	f104 022c 	add.w	r2, r4, #44	; 0x2c
 8001a84:	f853 1d04 	ldr.w	r1, [r3, #-4]!
 8001a88:	6059      	str	r1, [r3, #4]
 8001a8a:	4293      	cmp	r3, r2
 8001a8c:	d1fa      	bne.n	8001a84 <_ZN21CLearningLineFollower3runEv+0xa0>
 8001a8e:	ed84 0a0b 	vstr	s0, [r4, #44]	; 0x2c
 8001a92:	463e      	mov	r6, r7
 8001a94:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
 8001a96:	f104 0e7c 	add.w	lr, r4, #124	; 0x7c
 8001a9a:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
 8001a9e:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
 8001aa0:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
 8001aa4:	6833      	ldr	r3, [r6, #0]
 8001aa6:	f8ce 3000 	str.w	r3, [lr]
 8001aaa:	f104 0e2c 	add.w	lr, r4, #44	; 0x2c
 8001aae:	e8be 000f 	ldmia.w	lr!, {r0, r1, r2, r3}
 8001ab2:	46bc      	mov	ip, r7
 8001ab4:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 8001ab8:	e8be 000f 	ldmia.w	lr!, {r0, r1, r2, r3}
 8001abc:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 8001ac0:	f8de 3000 	ldr.w	r3, [lr]
 8001ac4:	6033      	str	r3, [r6, #0]
 8001ac6:	f504 766a 	add.w	r6, r4, #936	; 0x3a8
 8001aca:	4632      	mov	r2, r6
 8001acc:	4628      	mov	r0, r5
 8001ace:	4639      	mov	r1, r7
 8001ad0:	f7ff ff52 	bl	8001978 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE>
 8001ad4:	6d63      	ldr	r3, [r4, #84]	; 0x54
 8001ad6:	6523      	str	r3, [r4, #80]	; 0x50
 8001ad8:	489d      	ldr	r0, [pc, #628]	; (8001d50 <_ZN21CLearningLineFollower3runEv+0x36c>)
 8001ada:	f7fe fd19 	bl	8000510 <_ZN5CMath4randEv>
 8001ade:	2364      	movs	r3, #100	; 0x64
 8001ae0:	fbb0 f2f3 	udiv	r2, r0, r3
 8001ae4:	fb02 0013 	mls	r0, r2, r3, r0
 8001ae8:	2813      	cmp	r0, #19
 8001aea:	d80b      	bhi.n	8001b04 <_ZN21CLearningLineFollower3runEv+0x120>
 8001aec:	4898      	ldr	r0, [pc, #608]	; (8001d50 <_ZN21CLearningLineFollower3runEv+0x36c>)
 8001aee:	f7fe fd0f 	bl	8000510 <_ZN5CMath4randEv>
 8001af2:	f04f 0a03 	mov.w	sl, #3
 8001af6:	fbb0 fafa 	udiv	sl, r0, sl
 8001afa:	eb0a 0a4a 	add.w	sl, sl, sl, lsl #1
 8001afe:	ebca 0a00 	rsb	sl, sl, r0
 8001b02:	e012      	b.n	8001b2a <_ZN21CLearningLineFollower3runEv+0x146>
 8001b04:	f04f 0a00 	mov.w	sl, #0
 8001b08:	4632      	mov	r2, r6
 8001b0a:	4653      	mov	r3, sl
 8001b0c:	eb04 018a 	add.w	r1, r4, sl, lsl #2
 8001b10:	ecb2 7a01 	vldmia	r2!, {s14}
 8001b14:	edd1 7aea 	vldr	s15, [r1, #936]	; 0x3a8
 8001b18:	eeb4 7a67 	vcmp.f32	s14, s15
 8001b1c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001b20:	bfc8      	it	gt
 8001b22:	469a      	movgt	sl, r3
 8001b24:	3301      	adds	r3, #1
 8001b26:	2b03      	cmp	r3, #3
 8001b28:	d1f0      	bne.n	8001b0c <_ZN21CLearningLineFollower3runEv+0x128>
 8001b2a:	f1ba 0f01 	cmp.w	sl, #1
 8001b2e:	f8c4 a054 	str.w	sl, [r4, #84]	; 0x54
 8001b32:	d014      	beq.n	8001b5e <_ZN21CLearningLineFollower3runEv+0x17a>
 8001b34:	d30b      	bcc.n	8001b4e <_ZN21CLearningLineFollower3runEv+0x16a>
 8001b36:	f1ba 0f02 	cmp.w	sl, #2
 8001b3a:	d11a      	bne.n	8001b72 <_ZN21CLearningLineFollower3runEv+0x18e>
 8001b3c:	4887      	ldr	r0, [pc, #540]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b3e:	2100      	movs	r1, #0
 8001b40:	2221      	movs	r2, #33	; 0x21
 8001b42:	f7fe fff7 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001b46:	4885      	ldr	r0, [pc, #532]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b48:	2101      	movs	r1, #1
 8001b4a:	2200      	movs	r2, #0
 8001b4c:	e00f      	b.n	8001b6e <_ZN21CLearningLineFollower3runEv+0x18a>
 8001b4e:	4883      	ldr	r0, [pc, #524]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b50:	2100      	movs	r1, #0
 8001b52:	2221      	movs	r2, #33	; 0x21
 8001b54:	f7fe ffee 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001b58:	4880      	ldr	r0, [pc, #512]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b5a:	2101      	movs	r1, #1
 8001b5c:	e006      	b.n	8001b6c <_ZN21CLearningLineFollower3runEv+0x188>
 8001b5e:	2100      	movs	r1, #0
 8001b60:	487e      	ldr	r0, [pc, #504]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b62:	460a      	mov	r2, r1
 8001b64:	f7fe ffe6 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001b68:	487c      	ldr	r0, [pc, #496]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001b6a:	4651      	mov	r1, sl
 8001b6c:	2221      	movs	r2, #33	; 0x21
 8001b6e:	f7fe ffe1 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001b72:	487b      	ldr	r0, [pc, #492]	; (8001d60 <_ZN21CLearningLineFollower3runEv+0x37c>)
 8001b74:	2132      	movs	r1, #50	; 0x32
 8001b76:	f7fe fd8d 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001b7a:	2100      	movs	r1, #0
 8001b7c:	4876      	ldr	r0, [pc, #472]	; (8001d58 <_ZN21CLearningLineFollower3runEv+0x374>)
 8001b7e:	f7fe fdbd 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 8001b82:	4875      	ldr	r0, [pc, #468]	; (8001d58 <_ZN21CLearningLineFollower3runEv+0x374>)
 8001b84:	f7fe ff72 	bl	8000a6c <_ZN4CRGB14get_rgb_resultEv>
 8001b88:	4601      	mov	r1, r0
 8001b8a:	4620      	mov	r0, r4
 8001b8c:	f7fe fbca 	bl	8000324 <_ZN13CLinePosition7processEP10sRGBResult>
 8001b90:	4620      	mov	r0, r4
 8001b92:	f7fe fc63 	bl	800045c <_ZN13CLinePosition17get_line_positionEv>
 8001b96:	486e      	ldr	r0, [pc, #440]	; (8001d50 <_ZN21CLearningLineFollower3runEv+0x36c>)
 8001b98:	f7fe fcb2 	bl	8000500 <_ZN5CMath3absEf>
 8001b9c:	eef7 9a00 	vmov.f32	s19, #112	; 0x3f800000  1.0
 8001ba0:	f8d4 b054 	ldr.w	fp, [r4, #84]	; 0x54
 8001ba4:	f8d4 a050 	ldr.w	sl, [r4, #80]	; 0x50
 8001ba8:	ee39 0ac0 	vsub.f32	s0, s19, s0
 8001bac:	eef6 7a00 	vmov.f32	s15, #96	; 0x3f000000  0.5
 8001bb0:	4628      	mov	r0, r5
 8001bb2:	4639      	mov	r1, r7
 8001bb4:	4632      	mov	r2, r6
 8001bb6:	eb04 0b8b 	add.w	fp, r4, fp, lsl #2
 8001bba:	ee30 9a67 	vsub.f32	s18, s0, s15
 8001bbe:	f7ff fedb 	bl	8001978 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE>
 8001bc2:	edd4 7aea 	vldr	s15, [r4, #936]	; 0x3a8
 8001bc6:	ed9b 8aea 	vldr	s16, [fp, #936]	; 0x3a8
 8001bca:	eeb4 8a67 	vcmp.f32	s16, s15
 8001bce:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001bd2:	bf48      	it	mi
 8001bd4:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001bd8:	edd4 7aeb 	vldr	s15, [r4, #940]	; 0x3ac
 8001bdc:	eeb4 8a67 	vcmp.f32	s16, s15
 8001be0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001be4:	bf48      	it	mi
 8001be6:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001bea:	edd4 7aec 	vldr	s15, [r4, #944]	; 0x3b0
 8001bee:	eeb4 8a67 	vcmp.f32	s16, s15
 8001bf2:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001bf6:	4628      	mov	r0, r5
 8001bf8:	4649      	mov	r1, r9
 8001bfa:	4632      	mov	r2, r6
 8001bfc:	bf48      	it	mi
 8001bfe:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001c02:	f7ff feb9 	bl	8001978 <_ZN17AssociativeMemoryILi9ELi3ELi16EE4loadER10MathVectorILj9EERS1_ILj3EE>
 8001c06:	eddf 7a57 	vldr	s15, [pc, #348]	; 8001d64 <_ZN21CLearningLineFollower3runEv+0x380>
 8001c0a:	f8d4 03a0 	ldr.w	r0, [r4, #928]	; 0x3a0
 8001c0e:	eddf 6a56 	vldr	s13, [pc, #344]	; 8001d68 <_ZN21CLearningLineFollower3runEv+0x384>
 8001c12:	eeb0 7a49 	vmov.f32	s14, s18
 8001c16:	eea8 7a27 	vfma.f32	s14, s16, s15
 8001c1a:	eb04 0a8a 	add.w	sl, r4, sl, lsl #2
 8001c1e:	2100      	movs	r1, #0
 8001c20:	46ae      	mov	lr, r5
 8001c22:	ed8a 7aea 	vstr	s14, [sl, #936]	; 0x3a8
 8001c26:	460a      	mov	r2, r1
 8001c28:	4282      	cmp	r2, r0
 8001c2a:	f104 037c 	add.w	r3, r4, #124	; 0x7c
 8001c2e:	d018      	beq.n	8001c62 <_ZN21CLearningLineFollower3runEv+0x27e>
 8001c30:	eddf 7a48 	vldr	s15, [pc, #288]	; 8001d54 <_ZN21CLearningLineFollower3runEv+0x370>
 8001c34:	46f4      	mov	ip, lr
 8001c36:	ecb3 7a01 	vldmia	r3!, {s14}
 8001c3a:	ecbc 6a01 	vldmia	ip!, {s12}
 8001c3e:	ee37 7a46 	vsub.f32	s14, s14, s12
 8001c42:	42ab      	cmp	r3, r5
 8001c44:	eee7 7a07 	vfma.f32	s15, s14, s14
 8001c48:	d1f5      	bne.n	8001c36 <_ZN21CLearningLineFollower3runEv+0x252>
 8001c4a:	eef4 7ae6 	vcmpe.f32	s15, s13
 8001c4e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001c52:	bf44      	itt	mi
 8001c54:	4611      	movmi	r1, r2
 8001c56:	eef0 6a67 	vmovmi.f32	s13, s15
 8001c5a:	3201      	adds	r2, #1
 8001c5c:	f10e 0e24 	add.w	lr, lr, #36	; 0x24
 8001c60:	e7e2      	b.n	8001c28 <_ZN21CLearningLineFollower3runEv+0x244>
 8001c62:	280f      	cmp	r0, #15
 8001c64:	f04f 0224 	mov.w	r2, #36	; 0x24
 8001c68:	d81a      	bhi.n	8001ca0 <_ZN21CLearningLineFollower3runEv+0x2bc>
 8001c6a:	fb02 4200 	mla	r2, r2, r0, r4
 8001c6e:	32a0      	adds	r2, #160	; 0xa0
 8001c70:	ecf3 7a01 	vldmia	r3!, {s15}
 8001c74:	ed92 7a00 	vldr	s14, [r2]
 8001c78:	eee7 7a28 	vfma.f32	s15, s14, s17
 8001c7c:	42ab      	cmp	r3, r5
 8001c7e:	ece2 7a01 	vstmia	r2!, {s15}
 8001c82:	d1f5      	bne.n	8001c70 <_ZN21CLearningLineFollower3runEv+0x28c>
 8001c84:	230c      	movs	r3, #12
 8001c86:	fb03 8000 	mla	r0, r3, r0, r8
 8001c8a:	4631      	mov	r1, r6
 8001c8c:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8001c90:	f7ff fe5f 	bl	8001952 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001c94:	f8d4 33a0 	ldr.w	r3, [r4, #928]	; 0x3a0
 8001c98:	3301      	adds	r3, #1
 8001c9a:	f8c4 33a0 	str.w	r3, [r4, #928]	; 0x3a0
 8001c9e:	e01a      	b.n	8001cd6 <_ZN21CLearningLineFollower3runEv+0x2f2>
 8001ca0:	fb02 4201 	mla	r2, r2, r1, r4
 8001ca4:	edd4 6ae9 	vldr	s13, [r4, #932]	; 0x3a4
 8001ca8:	32a0      	adds	r2, #160	; 0xa0
 8001caa:	ecf3 7a01 	vldmia	r3!, {s15}
 8001cae:	ed92 6a00 	vldr	s12, [r2]
 8001cb2:	ee39 7ae6 	vsub.f32	s14, s19, s13
 8001cb6:	ee66 7aa7 	vmul.f32	s15, s13, s15
 8001cba:	42ab      	cmp	r3, r5
 8001cbc:	eee7 7a06 	vfma.f32	s15, s14, s12
 8001cc0:	ece2 7a01 	vstmia	r2!, {s15}
 8001cc4:	d1f1      	bne.n	8001caa <_ZN21CLearningLineFollower3runEv+0x2c6>
 8001cc6:	200c      	movs	r0, #12
 8001cc8:	fb00 8001 	mla	r0, r0, r1, r8
 8001ccc:	ed94 0ae9 	vldr	s0, [r4, #932]	; 0x3a4
 8001cd0:	4631      	mov	r1, r6
 8001cd2:	f7ff fe3e 	bl	8001952 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001cd6:	4620      	mov	r0, r4
 8001cd8:	f7fe fbbe 	bl	8000458 <_ZN13CLinePosition7on_lineEv>
 8001cdc:	4606      	mov	r6, r0
 8001cde:	b9f0      	cbnz	r0, 8001d1e <_ZN21CLearningLineFollower3runEv+0x33a>
 8001ce0:	481e      	ldr	r0, [pc, #120]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001ce2:	4631      	mov	r1, r6
 8001ce4:	f06f 0220 	mvn.w	r2, #32
 8001ce8:	f7fe ff24 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001cec:	f06f 0220 	mvn.w	r2, #32
 8001cf0:	481a      	ldr	r0, [pc, #104]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001cf2:	2101      	movs	r1, #1
 8001cf4:	f7fe ff1e 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001cf8:	4819      	ldr	r0, [pc, #100]	; (8001d60 <_ZN21CLearningLineFollower3runEv+0x37c>)
 8001cfa:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8001cfe:	f7fe fcc9 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001d02:	4816      	ldr	r0, [pc, #88]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001d04:	4631      	mov	r1, r6
 8001d06:	4632      	mov	r2, r6
 8001d08:	f7fe ff14 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001d0c:	4813      	ldr	r0, [pc, #76]	; (8001d5c <_ZN21CLearningLineFollower3runEv+0x378>)
 8001d0e:	2101      	movs	r1, #1
 8001d10:	4632      	mov	r2, r6
 8001d12:	f7fe ff0f 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001d16:	4812      	ldr	r0, [pc, #72]	; (8001d60 <_ZN21CLearningLineFollower3runEv+0x37c>)
 8001d18:	2164      	movs	r1, #100	; 0x64
 8001d1a:	f7fe fcbb 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001d1e:	ed9f 0a13 	vldr	s0, [pc, #76]	; 8001d6c <_ZN21CLearningLineFollower3runEv+0x388>
 8001d22:	eddf 7a13 	vldr	s15, [pc, #76]	; 8001d70 <_ZN21CLearningLineFollower3runEv+0x38c>
 8001d26:	480c      	ldr	r0, [pc, #48]	; (8001d58 <_ZN21CLearningLineFollower3runEv+0x374>)
 8001d28:	4912      	ldr	r1, [pc, #72]	; (8001d74 <_ZN21CLearningLineFollower3runEv+0x390>)
 8001d2a:	ee29 9a00 	vmul.f32	s18, s18, s0
 8001d2e:	eeaa 9a27 	vfma.f32	s18, s20, s15
 8001d32:	eddf 7a11 	vldr	s15, [pc, #68]	; 8001d78 <_ZN21CLearningLineFollower3runEv+0x394>
 8001d36:	ee69 7a27 	vmul.f32	s15, s18, s15
 8001d3a:	eeb0 aa49 	vmov.f32	s20, s18
 8001d3e:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8001d42:	ee17 2a90 	vmov	r2, s15
 8001d46:	f7ff fd97 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8001d4a:	e689      	b.n	8001a60 <_ZN21CLearningLineFollower3runEv+0x7c>
 8001d4c:	3dcccccd 	.word	0x3dcccccd
 8001d50:	200001bc 	.word	0x200001bc
 8001d54:	00000000 	.word	0x00000000
 8001d58:	20000038 	.word	0x20000038
 8001d5c:	200001a8 	.word	0x200001a8
 8001d60:	200001f0 	.word	0x200001f0
 8001d64:	3f666666 	.word	0x3f666666
 8001d68:	4cbebc20 	.word	0x4cbebc20
 8001d6c:	3c23d70a 	.word	0x3c23d70a
 8001d70:	3f7d70a4 	.word	0x3f7d70a4
 8001d74:	08002d48 	.word	0x08002d48
 8001d78:	447a0000 	.word	0x447a0000

08001d7c <_ZN5CDemo4initEv>:
 8001d7c:	4770      	bx	lr
	...

08001d80 <_ZN5CDemo10blink_taskEv>:
 8001d80:	b508      	push	{r3, lr}
 8001d82:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001d86:	480a      	ldr	r0, [pc, #40]	; (8001db0 <_ZN5CDemo10blink_taskEv+0x30>)
 8001d88:	f7ff fc28 	bl	80015dc <_ZN5CGPIO7gpio_onEm>
 8001d8c:	4809      	ldr	r0, [pc, #36]	; (8001db4 <_ZN5CDemo10blink_taskEv+0x34>)
 8001d8e:	f7fe fc73 	bl	8000678 <_ZN6CTimer8get_timeEv>
 8001d92:	4909      	ldr	r1, [pc, #36]	; (8001db8 <_ZN5CDemo10blink_taskEv+0x38>)
 8001d94:	4602      	mov	r2, r0
 8001d96:	4806      	ldr	r0, [pc, #24]	; (8001db0 <_ZN5CDemo10blink_taskEv+0x30>)
 8001d98:	f7ff fd6e 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8001d9c:	4805      	ldr	r0, [pc, #20]	; (8001db4 <_ZN5CDemo10blink_taskEv+0x34>)
 8001d9e:	210a      	movs	r1, #10
 8001da0:	f7fe fc78 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001da4:	4802      	ldr	r0, [pc, #8]	; (8001db0 <_ZN5CDemo10blink_taskEv+0x30>)
 8001da6:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001daa:	f7ff fc1d 	bl	80015e8 <_ZN5CGPIO8gpio_offEm>
 8001dae:	e7e8      	b.n	8001d82 <_ZN5CDemo10blink_taskEv+0x2>
 8001db0:	20000038 	.word	0x20000038
 8001db4:	200001f0 	.word	0x200001f0
 8001db8:	08002d30 	.word	0x08002d30

08001dbc <_ZN5CDemo10moves_taskEv>:
 8001dbc:	b570      	push	{r4, r5, r6, lr}
 8001dbe:	4c1c      	ldr	r4, [pc, #112]	; (8001e30 <_ZN5CDemo10moves_taskEv+0x74>)
 8001dc0:	4d1c      	ldr	r5, [pc, #112]	; (8001e34 <_ZN5CDemo10moves_taskEv+0x78>)
 8001dc2:	4620      	mov	r0, r4
 8001dc4:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001dc8:	2232      	movs	r2, #50	; 0x32
 8001dca:	2300      	movs	r3, #0
 8001dcc:	f7fe fa46 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001dd0:	4620      	mov	r0, r4
 8001dd2:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001dd6:	2232      	movs	r2, #50	; 0x32
 8001dd8:	2300      	movs	r3, #0
 8001dda:	f7fe fa3f 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001dde:	4620      	mov	r0, r4
 8001de0:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001de4:	2232      	movs	r2, #50	; 0x32
 8001de6:	2300      	movs	r3, #0
 8001de8:	f7fe fa38 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001dec:	4620      	mov	r0, r4
 8001dee:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001df2:	2232      	movs	r2, #50	; 0x32
 8001df4:	2300      	movs	r3, #0
 8001df6:	f7fe fa31 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001dfa:	4620      	mov	r0, r4
 8001dfc:	4629      	mov	r1, r5
 8001dfe:	2232      	movs	r2, #50	; 0x32
 8001e00:	2300      	movs	r3, #0
 8001e02:	f7fe fa2b 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001e06:	4620      	mov	r0, r4
 8001e08:	4629      	mov	r1, r5
 8001e0a:	2232      	movs	r2, #50	; 0x32
 8001e0c:	2300      	movs	r3, #0
 8001e0e:	f7fe fa25 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001e12:	4620      	mov	r0, r4
 8001e14:	4629      	mov	r1, r5
 8001e16:	2232      	movs	r2, #50	; 0x32
 8001e18:	2300      	movs	r3, #0
 8001e1a:	f7fe fa1f 	bl	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001e1e:	4620      	mov	r0, r4
 8001e20:	4629      	mov	r1, r5
 8001e22:	2232      	movs	r2, #50	; 0x32
 8001e24:	2300      	movs	r3, #0
 8001e26:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001e2a:	f7fe ba17 	b.w	800025c <_ZN7CKodama12rotate_robotEllPFlvE>
 8001e2e:	bf00      	nop
 8001e30:	20000038 	.word	0x20000038
 8001e34:	fffffc7c 	.word	0xfffffc7c

08001e38 <_ZN5CDemo24basic_line_follower_taskEv>:
 8001e38:	b510      	push	{r4, lr}
 8001e3a:	b094      	sub	sp, #80	; 0x50
 8001e3c:	a809      	add	r0, sp, #36	; 0x24
 8001e3e:	f7fe fa63 	bl	8000308 <_ZN13CLinePositionC1Ev>
 8001e42:	a801      	add	r0, sp, #4
 8001e44:	eeb2 0a04 	vmov.f32	s0, #36	; 0x41200000  10.0
 8001e48:	eddf 0a38 	vldr	s1, [pc, #224]	; 8001f2c <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 8001e4c:	eddf 1a38 	vldr	s3, [pc, #224]	; 8001f30 <_ZN5CDemo24basic_line_follower_taskEv+0xf8>
 8001e50:	eeb2 1a00 	vmov.f32	s2, #32	; 0x41000000  8.0
 8001e54:	f7fe fb1b 	bl	800048e <_ZN4CPIDC1Effff>
 8001e58:	4836      	ldr	r0, [pc, #216]	; (8001f34 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8001e5a:	2100      	movs	r1, #0
 8001e5c:	220a      	movs	r2, #10
 8001e5e:	f7fe fc2b 	bl	80006b8 <_ZN6CTimer22event_timer_set_periodEhm>
 8001e62:	4834      	ldr	r0, [pc, #208]	; (8001f34 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8001e64:	2100      	movs	r1, #0
 8001e66:	f7fe fc3b 	bl	80006e0 <_ZN6CTimer17event_timer_checkEh>
 8001e6a:	2800      	cmp	r0, #0
 8001e6c:	d0f9      	beq.n	8001e62 <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8001e6e:	2100      	movs	r1, #0
 8001e70:	4831      	ldr	r0, [pc, #196]	; (8001f38 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 8001e72:	f7fe fc43 	bl	80006fc <_ZN4CRGB8rgb_readEh>
 8001e76:	4830      	ldr	r0, [pc, #192]	; (8001f38 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 8001e78:	f7fe fdf8 	bl	8000a6c <_ZN4CRGB14get_rgb_resultEv>
 8001e7c:	4601      	mov	r1, r0
 8001e7e:	a809      	add	r0, sp, #36	; 0x24
 8001e80:	f7fe fa50 	bl	8000324 <_ZN13CLinePosition7processEP10sRGBResult>
 8001e84:	a809      	add	r0, sp, #36	; 0x24
 8001e86:	f7fe fae7 	bl	8000458 <_ZN13CLinePosition7on_lineEv>
 8001e8a:	4604      	mov	r4, r0
 8001e8c:	a809      	add	r0, sp, #36	; 0x24
 8001e8e:	f7fe fae5 	bl	800045c <_ZN13CLinePosition17get_line_positionEv>
 8001e92:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8001f3c <_ZN5CDemo24basic_line_follower_taskEv+0x104>
 8001e96:	4828      	ldr	r0, [pc, #160]	; (8001f38 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 8001e98:	4929      	ldr	r1, [pc, #164]	; (8001f40 <_ZN5CDemo24basic_line_follower_taskEv+0x108>)
 8001e9a:	ee20 0a27 	vmul.f32	s0, s0, s15
 8001e9e:	4622      	mov	r2, r4
 8001ea0:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8001ea4:	ee17 3a90 	vmov	r3, s15
 8001ea8:	f7ff fce6 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8001eac:	a809      	add	r0, sp, #36	; 0x24
 8001eae:	f7fe fad3 	bl	8000458 <_ZN13CLinePosition7on_lineEv>
 8001eb2:	4604      	mov	r4, r0
 8001eb4:	b1d0      	cbz	r0, 8001eec <_ZN5CDemo24basic_line_follower_taskEv+0xb4>
 8001eb6:	a809      	add	r0, sp, #36	; 0x24
 8001eb8:	f7fe fad0 	bl	800045c <_ZN13CLinePosition17get_line_positionEv>
 8001ebc:	eddf 7a1b 	vldr	s15, [pc, #108]	; 8001f2c <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 8001ec0:	a801      	add	r0, sp, #4
 8001ec2:	ee37 0ac0 	vsub.f32	s0, s15, s0
 8001ec6:	f7fe fae8 	bl	800049a <_ZN4CPID7processEf>
 8001eca:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8001ece:	481d      	ldr	r0, [pc, #116]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001ed0:	ee17 4a90 	vmov	r4, s15
 8001ed4:	2100      	movs	r1, #0
 8001ed6:	f104 0219 	add.w	r2, r4, #25
 8001eda:	f7fe fe2b 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001ede:	4819      	ldr	r0, [pc, #100]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001ee0:	2101      	movs	r1, #1
 8001ee2:	f1c4 0219 	rsb	r2, r4, #25
 8001ee6:	f7fe fe25 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001eea:	e7ba      	b.n	8001e62 <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8001eec:	4621      	mov	r1, r4
 8001eee:	4815      	ldr	r0, [pc, #84]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001ef0:	f06f 0218 	mvn.w	r2, #24
 8001ef4:	f7fe fe1e 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001ef8:	f06f 0218 	mvn.w	r2, #24
 8001efc:	4811      	ldr	r0, [pc, #68]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001efe:	2101      	movs	r1, #1
 8001f00:	f7fe fe18 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001f04:	480b      	ldr	r0, [pc, #44]	; (8001f34 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8001f06:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8001f0a:	f7fe fbc3 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001f0e:	4621      	mov	r1, r4
 8001f10:	4622      	mov	r2, r4
 8001f12:	480c      	ldr	r0, [pc, #48]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001f14:	f7fe fe0e 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001f18:	480a      	ldr	r0, [pc, #40]	; (8001f44 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8001f1a:	2101      	movs	r1, #1
 8001f1c:	4622      	mov	r2, r4
 8001f1e:	f7fe fe09 	bl	8000b34 <_ZN6CMotor9set_motorEml>
 8001f22:	4804      	ldr	r0, [pc, #16]	; (8001f34 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8001f24:	2164      	movs	r1, #100	; 0x64
 8001f26:	f7fe fbb5 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8001f2a:	e79a      	b.n	8001e62 <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8001f2c:	00000000 	.word	0x00000000
 8001f30:	42c80000 	.word	0x42c80000
 8001f34:	200001f0 	.word	0x200001f0
 8001f38:	20000038 	.word	0x20000038
 8001f3c:	447a0000 	.word	0x447a0000
 8001f40:	08002d45 	.word	0x08002d45
 8001f44:	200001a8 	.word	0x200001a8

08001f48 <_ZN5CDemo3runEj>:
 8001f48:	2902      	cmp	r1, #2
 8001f4a:	b508      	push	{r3, lr}
 8001f4c:	d007      	beq.n	8001f5e <_ZN5CDemo3runEj+0x16>
 8001f4e:	2903      	cmp	r1, #3
 8001f50:	d007      	beq.n	8001f62 <_ZN5CDemo3runEj+0x1a>
 8001f52:	2901      	cmp	r1, #1
 8001f54:	d10a      	bne.n	8001f6c <_ZN5CDemo3runEj+0x24>
 8001f56:	f7ff ff31 	bl	8001dbc <_ZN5CDemo10moves_taskEv>
 8001f5a:	f7ff ff11 	bl	8001d80 <_ZN5CDemo10blink_taskEv>
 8001f5e:	f7ff ff6b 	bl	8001e38 <_ZN5CDemo24basic_line_follower_taskEv>
 8001f62:	4803      	ldr	r0, [pc, #12]	; (8001f70 <_ZN5CDemo3runEj+0x28>)
 8001f64:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001f68:	f7ff bd3c 	b.w	80019e4 <_ZN21CLearningLineFollower3runEv>
 8001f6c:	bd08      	pop	{r3, pc}
 8001f6e:	bf00      	nop
 8001f70:	20000238 	.word	0x20000238
 8001f74:	00000000 	.word	0x00000000

08001f78 <main>:
 8001f78:	b530      	push	{r4, r5, lr}
 8001f7a:	b08f      	sub	sp, #60	; 0x3c
 8001f7c:	f000 fc9e 	bl	80028bc <sytem_clock_init>
 8001f80:	4863      	ldr	r0, [pc, #396]	; (8002110 <main+0x198>)
 8001f82:	f7fe f933 	bl	80001ec <_ZN7CKodama4initEv>
 8001f86:	210a      	movs	r1, #10
 8001f88:	4861      	ldr	r0, [pc, #388]	; (8002110 <main+0x198>)
 8001f8a:	f7fe f964 	bl	8000256 <_ZN7CKodama6set_dtEl>
 8001f8e:	a548      	add	r5, pc, #288	; (adr r5, 80020b0 <main+0x138>)
 8001f90:	e9d5 4500 	ldrd	r4, r5, [r5]
 8001f94:	485e      	ldr	r0, [pc, #376]	; (8002110 <main+0x198>)
 8001f96:	f7fe f94b 	bl	8000230 <_ZN7CKodama5sleepEv>
 8001f9a:	2204      	movs	r2, #4
 8001f9c:	2308      	movs	r3, #8
 8001f9e:	9300      	str	r3, [sp, #0]
 8001fa0:	485b      	ldr	r0, [pc, #364]	; (8002110 <main+0x198>)
 8001fa2:	495c      	ldr	r1, [pc, #368]	; (8002114 <main+0x19c>)
 8001fa4:	4613      	mov	r3, r2
 8001fa6:	f7ff fc67 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8001faa:	4859      	ldr	r0, [pc, #356]	; (8002110 <main+0x198>)
 8001fac:	495a      	ldr	r1, [pc, #360]	; (8002118 <main+0x1a0>)
 8001fae:	4622      	mov	r2, r4
 8001fb0:	462b      	mov	r3, r5
 8001fb2:	f7ff fc61 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8001fb6:	4b59      	ldr	r3, [pc, #356]	; (800211c <main+0x1a4>)
 8001fb8:	4855      	ldr	r0, [pc, #340]	; (8002110 <main+0x198>)
 8001fba:	4959      	ldr	r1, [pc, #356]	; (8002120 <main+0x1a8>)
 8001fbc:	2200      	movs	r2, #0
 8001fbe:	e9cd 2300 	strd	r2, r3, [sp]
 8001fc2:	a33d      	add	r3, pc, #244	; (adr r3, 80020b8 <main+0x140>)
 8001fc4:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001fc8:	e9cd 2302 	strd	r2, r3, [sp, #8]
 8001fcc:	a33c      	add	r3, pc, #240	; (adr r3, 80020c0 <main+0x148>)
 8001fce:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001fd2:	e9cd 2306 	strd	r2, r3, [sp, #24]
 8001fd6:	a33c      	add	r3, pc, #240	; (adr r3, 80020c8 <main+0x150>)
 8001fd8:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001fdc:	e9cd 2308 	strd	r2, r3, [sp, #32]
 8001fe0:	a33b      	add	r3, pc, #236	; (adr r3, 80020d0 <main+0x158>)
 8001fe2:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001fe6:	e9cd 230a 	strd	r2, r3, [sp, #40]	; 0x28
 8001fea:	a33b      	add	r3, pc, #236	; (adr r3, 80020d8 <main+0x160>)
 8001fec:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001ff0:	e9cd 4504 	strd	r4, r5, [sp, #16]
 8001ff4:	e9cd 230c 	strd	r2, r3, [sp, #48]	; 0x30
 8001ff8:	2200      	movs	r2, #0
 8001ffa:	2300      	movs	r3, #0
 8001ffc:	f7ff fc3c 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8002000:	4b48      	ldr	r3, [pc, #288]	; (8002124 <main+0x1ac>)
 8002002:	4843      	ldr	r0, [pc, #268]	; (8002110 <main+0x198>)
 8002004:	4946      	ldr	r1, [pc, #280]	; (8002120 <main+0x1a8>)
 8002006:	2200      	movs	r2, #0
 8002008:	e9cd 2300 	strd	r2, r3, [sp]
 800200c:	a334      	add	r3, pc, #208	; (adr r3, 80020e0 <main+0x168>)
 800200e:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002012:	e9cd 2302 	strd	r2, r3, [sp, #8]
 8002016:	a334      	add	r3, pc, #208	; (adr r3, 80020e8 <main+0x170>)
 8002018:	e9d3 2300 	ldrd	r2, r3, [r3]
 800201c:	e9cd 2304 	strd	r2, r3, [sp, #16]
 8002020:	a333      	add	r3, pc, #204	; (adr r3, 80020f0 <main+0x178>)
 8002022:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002026:	e9cd 2306 	strd	r2, r3, [sp, #24]
 800202a:	a333      	add	r3, pc, #204	; (adr r3, 80020f8 <main+0x180>)
 800202c:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002030:	e9cd 2308 	strd	r2, r3, [sp, #32]
 8002034:	a332      	add	r3, pc, #200	; (adr r3, 8002100 <main+0x188>)
 8002036:	e9d3 2300 	ldrd	r2, r3, [r3]
 800203a:	e9cd 230a 	strd	r2, r3, [sp, #40]	; 0x28
 800203e:	a332      	add	r3, pc, #200	; (adr r3, 8002108 <main+0x190>)
 8002040:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002044:	e9cd 230c 	strd	r2, r3, [sp, #48]	; 0x30
 8002048:	2200      	movs	r2, #0
 800204a:	f04f 4300 	mov.w	r3, #2147483648	; 0x80000000
 800204e:	f7ff fc13 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 8002052:	482f      	ldr	r0, [pc, #188]	; (8002110 <main+0x198>)
 8002054:	f44f 5180 	mov.w	r1, #4096	; 0x1000
 8002058:	f7ff facc 	bl	80015f4 <_ZN5CGPIO7gpio_inEm>
 800205c:	b148      	cbz	r0, 8002072 <main+0xfa>
 800205e:	482c      	ldr	r0, [pc, #176]	; (8002110 <main+0x198>)
 8002060:	f7fe f8ea 	bl	8000238 <_ZN7CKodama6wakeupEv>
 8002064:	4830      	ldr	r0, [pc, #192]	; (8002128 <main+0x1b0>)
 8002066:	f7ff fe89 	bl	8001d7c <_ZN5CDemo4initEv>
 800206a:	482f      	ldr	r0, [pc, #188]	; (8002128 <main+0x1b0>)
 800206c:	2103      	movs	r1, #3
 800206e:	f7ff ff6b 	bl	8001f48 <_ZN5CDemo3runEj>
 8002072:	4827      	ldr	r0, [pc, #156]	; (8002110 <main+0x198>)
 8002074:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8002078:	f7ff fab0 	bl	80015dc <_ZN5CGPIO7gpio_onEm>
 800207c:	482b      	ldr	r0, [pc, #172]	; (800212c <main+0x1b4>)
 800207e:	210a      	movs	r1, #10
 8002080:	f7fe fb08 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8002084:	4822      	ldr	r0, [pc, #136]	; (8002110 <main+0x198>)
 8002086:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800208a:	f7ff faad 	bl	80015e8 <_ZN5CGPIO8gpio_offEm>
 800208e:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8002092:	4826      	ldr	r0, [pc, #152]	; (800212c <main+0x1b4>)
 8002094:	f7fe fafe 	bl	8000694 <_ZN6CTimer8delay_msEm>
 8002098:	4824      	ldr	r0, [pc, #144]	; (800212c <main+0x1b4>)
 800209a:	f7fe faed 	bl	8000678 <_ZN6CTimer8get_timeEv>
 800209e:	4924      	ldr	r1, [pc, #144]	; (8002130 <main+0x1b8>)
 80020a0:	4602      	mov	r2, r0
 80020a2:	481b      	ldr	r0, [pc, #108]	; (8002110 <main+0x198>)
 80020a4:	f7ff fbe8 	bl	8001878 <_ZN9CTerminal6printfEPKcz>
 80020a8:	e7d3      	b.n	8002052 <main+0xda>
 80020aa:	bf00      	nop
 80020ac:	f3af 8000 	nop.w
 80020b0:	60000000 	.word	0x60000000
 80020b4:	400921fb 	.word	0x400921fb
 80020b8:	00000000 	.word	0x00000000
 80020bc:	3fbf9ad0 	.word	0x3fbf9ad0
 80020c0:	20000000 	.word	0x20000000
 80020c4:	40406251 	.word	0x40406251
 80020c8:	60000000 	.word	0x60000000
 80020cc:	40934a45 	.word	0x40934a45
 80020d0:	c0000000 	.word	0xc0000000
 80020d4:	4016cccc 	.word	0x4016cccc
 80020d8:	a0000000 	.word	0xa0000000
 80020dc:	4016e147 	.word	0x4016e147
 80020e0:	00000000 	.word	0x00000000
 80020e4:	bfbf9ad0 	.word	0xbfbf9ad0
 80020e8:	60000000 	.word	0x60000000
 80020ec:	c00921fb 	.word	0xc00921fb
 80020f0:	20000000 	.word	0x20000000
 80020f4:	c0406251 	.word	0xc0406251
 80020f8:	60000000 	.word	0x60000000
 80020fc:	c0934a45 	.word	0xc0934a45
 8002100:	c0000000 	.word	0xc0000000
 8002104:	c016cccc 	.word	0xc016cccc
 8002108:	a0000000 	.word	0xa0000000
 800210c:	c016e147 	.word	0xc016e147
 8002110:	20000038 	.word	0x20000038
 8002114:	08002d4d 	.word	0x08002d4d
 8002118:	08002d6d 	.word	0x08002d6d
 800211c:	3ff00000 	.word	0x3ff00000
 8002120:	08002d7f 	.word	0x08002d7f
 8002124:	bff00000 	.word	0xbff00000
 8002128:	200005f0 	.word	0x200005f0
 800212c:	200001f0 	.word	0x200001f0
 8002130:	08002d98 	.word	0x08002d98

08002134 <RCC_GetClocksFreq>:
 8002134:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8002138:	4f9b      	ldr	r7, [pc, #620]	; (80023a8 <RCC_GetClocksFreq+0x274>)
 800213a:	687b      	ldr	r3, [r7, #4]
 800213c:	f003 030c 	and.w	r3, r3, #12
 8002140:	2b04      	cmp	r3, #4
 8002142:	d005      	beq.n	8002150 <RCC_GetClocksFreq+0x1c>
 8002144:	2b08      	cmp	r3, #8
 8002146:	d006      	beq.n	8002156 <RCC_GetClocksFreq+0x22>
 8002148:	4a98      	ldr	r2, [pc, #608]	; (80023ac <RCC_GetClocksFreq+0x278>)
 800214a:	6002      	str	r2, [r0, #0]
 800214c:	b9b3      	cbnz	r3, 800217c <RCC_GetClocksFreq+0x48>
 800214e:	e016      	b.n	800217e <RCC_GetClocksFreq+0x4a>
 8002150:	4b96      	ldr	r3, [pc, #600]	; (80023ac <RCC_GetClocksFreq+0x278>)
 8002152:	6003      	str	r3, [r0, #0]
 8002154:	e012      	b.n	800217c <RCC_GetClocksFreq+0x48>
 8002156:	687b      	ldr	r3, [r7, #4]
 8002158:	6879      	ldr	r1, [r7, #4]
 800215a:	f3c3 4383 	ubfx	r3, r3, #18, #4
 800215e:	1c9a      	adds	r2, r3, #2
 8002160:	03cb      	lsls	r3, r1, #15
 8002162:	bf49      	itett	mi
 8002164:	6afb      	ldrmi	r3, [r7, #44]	; 0x2c
 8002166:	4b92      	ldrpl	r3, [pc, #584]	; (80023b0 <RCC_GetClocksFreq+0x27c>)
 8002168:	4990      	ldrmi	r1, [pc, #576]	; (80023ac <RCC_GetClocksFreq+0x278>)
 800216a:	f003 030f 	andmi.w	r3, r3, #15
 800216e:	bf44      	itt	mi
 8002170:	3301      	addmi	r3, #1
 8002172:	fbb1 f3f3 	udivmi	r3, r1, r3
 8002176:	4353      	muls	r3, r2
 8002178:	6003      	str	r3, [r0, #0]
 800217a:	e000      	b.n	800217e <RCC_GetClocksFreq+0x4a>
 800217c:	2300      	movs	r3, #0
 800217e:	687a      	ldr	r2, [r7, #4]
 8002180:	4e8c      	ldr	r6, [pc, #560]	; (80023b4 <RCC_GetClocksFreq+0x280>)
 8002182:	f8df c234 	ldr.w	ip, [pc, #564]	; 80023b8 <RCC_GetClocksFreq+0x284>
 8002186:	f3c2 1203 	ubfx	r2, r2, #4, #4
 800218a:	5cb4      	ldrb	r4, [r6, r2]
 800218c:	6802      	ldr	r2, [r0, #0]
 800218e:	b2e4      	uxtb	r4, r4
 8002190:	fa22 f104 	lsr.w	r1, r2, r4
 8002194:	6041      	str	r1, [r0, #4]
 8002196:	687d      	ldr	r5, [r7, #4]
 8002198:	f3c5 2502 	ubfx	r5, r5, #8, #3
 800219c:	5d75      	ldrb	r5, [r6, r5]
 800219e:	fa21 fe05 	lsr.w	lr, r1, r5
 80021a2:	f8c0 e008 	str.w	lr, [r0, #8]
 80021a6:	687d      	ldr	r5, [r7, #4]
 80021a8:	f3c5 25c2 	ubfx	r5, r5, #11, #3
 80021ac:	5d75      	ldrb	r5, [r6, r5]
 80021ae:	b2ed      	uxtb	r5, r5
 80021b0:	40e9      	lsrs	r1, r5
 80021b2:	60c1      	str	r1, [r0, #12]
 80021b4:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 80021b6:	f3c6 1804 	ubfx	r8, r6, #4, #5
 80021ba:	f008 060f 	and.w	r6, r8, #15
 80021be:	f018 0f10 	tst.w	r8, #16
 80021c2:	f83c 6016 	ldrh.w	r6, [ip, r6, lsl #1]
 80021c6:	46e0      	mov	r8, ip
 80021c8:	b2b6      	uxth	r6, r6
 80021ca:	d004      	beq.n	80021d6 <RCC_GetClocksFreq+0xa2>
 80021cc:	b11e      	cbz	r6, 80021d6 <RCC_GetClocksFreq+0xa2>
 80021ce:	fbb3 f6f6 	udiv	r6, r3, r6
 80021d2:	6106      	str	r6, [r0, #16]
 80021d4:	e000      	b.n	80021d8 <RCC_GetClocksFreq+0xa4>
 80021d6:	6102      	str	r2, [r0, #16]
 80021d8:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 80021da:	f3c6 2c44 	ubfx	ip, r6, #9, #5
 80021de:	f00c 060f 	and.w	r6, ip, #15
 80021e2:	f01c 0f10 	tst.w	ip, #16
 80021e6:	f838 6016 	ldrh.w	r6, [r8, r6, lsl #1]
 80021ea:	b2b6      	uxth	r6, r6
 80021ec:	d004      	beq.n	80021f8 <RCC_GetClocksFreq+0xc4>
 80021ee:	b11e      	cbz	r6, 80021f8 <RCC_GetClocksFreq+0xc4>
 80021f0:	fbb3 f6f6 	udiv	r6, r3, r6
 80021f4:	6146      	str	r6, [r0, #20]
 80021f6:	e000      	b.n	80021fa <RCC_GetClocksFreq+0xc6>
 80021f8:	6142      	str	r2, [r0, #20]
 80021fa:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80021fc:	06f6      	lsls	r6, r6, #27
 80021fe:	bf5a      	itte	pl
 8002200:	4e6a      	ldrpl	r6, [pc, #424]	; (80023ac <RCC_GetClocksFreq+0x278>)
 8002202:	6186      	strpl	r6, [r0, #24]
 8002204:	6182      	strmi	r2, [r0, #24]
 8002206:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002208:	06b6      	lsls	r6, r6, #26
 800220a:	bf5a      	itte	pl
 800220c:	4e67      	ldrpl	r6, [pc, #412]	; (80023ac <RCC_GetClocksFreq+0x278>)
 800220e:	61c6      	strpl	r6, [r0, #28]
 8002210:	61c2      	strmi	r2, [r0, #28]
 8002212:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002214:	0676      	lsls	r6, r6, #25
 8002216:	bf5a      	itte	pl
 8002218:	4e64      	ldrpl	r6, [pc, #400]	; (80023ac <RCC_GetClocksFreq+0x278>)
 800221a:	6206      	strpl	r6, [r0, #32]
 800221c:	6202      	strmi	r2, [r0, #32]
 800221e:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002220:	05f6      	lsls	r6, r6, #23
 8002222:	d506      	bpl.n	8002232 <RCC_GetClocksFreq+0xfe>
 8002224:	429a      	cmp	r2, r3
 8002226:	d104      	bne.n	8002232 <RCC_GetClocksFreq+0xfe>
 8002228:	42a5      	cmp	r5, r4
 800222a:	d102      	bne.n	8002232 <RCC_GetClocksFreq+0xfe>
 800222c:	0056      	lsls	r6, r2, #1
 800222e:	6246      	str	r6, [r0, #36]	; 0x24
 8002230:	e000      	b.n	8002234 <RCC_GetClocksFreq+0x100>
 8002232:	6241      	str	r1, [r0, #36]	; 0x24
 8002234:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002236:	04f6      	lsls	r6, r6, #19
 8002238:	d506      	bpl.n	8002248 <RCC_GetClocksFreq+0x114>
 800223a:	429a      	cmp	r2, r3
 800223c:	d104      	bne.n	8002248 <RCC_GetClocksFreq+0x114>
 800223e:	42a5      	cmp	r5, r4
 8002240:	d102      	bne.n	8002248 <RCC_GetClocksFreq+0x114>
 8002242:	0056      	lsls	r6, r2, #1
 8002244:	6286      	str	r6, [r0, #40]	; 0x28
 8002246:	e000      	b.n	800224a <RCC_GetClocksFreq+0x116>
 8002248:	6281      	str	r1, [r0, #40]	; 0x28
 800224a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800224c:	05b6      	lsls	r6, r6, #22
 800224e:	d506      	bpl.n	800225e <RCC_GetClocksFreq+0x12a>
 8002250:	429a      	cmp	r2, r3
 8002252:	d104      	bne.n	800225e <RCC_GetClocksFreq+0x12a>
 8002254:	42a5      	cmp	r5, r4
 8002256:	d102      	bne.n	800225e <RCC_GetClocksFreq+0x12a>
 8002258:	0056      	lsls	r6, r2, #1
 800225a:	62c6      	str	r6, [r0, #44]	; 0x2c
 800225c:	e000      	b.n	8002260 <RCC_GetClocksFreq+0x12c>
 800225e:	62c1      	str	r1, [r0, #44]	; 0x2c
 8002260:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002262:	0576      	lsls	r6, r6, #21
 8002264:	d506      	bpl.n	8002274 <RCC_GetClocksFreq+0x140>
 8002266:	429a      	cmp	r2, r3
 8002268:	d104      	bne.n	8002274 <RCC_GetClocksFreq+0x140>
 800226a:	42a5      	cmp	r5, r4
 800226c:	d102      	bne.n	8002274 <RCC_GetClocksFreq+0x140>
 800226e:	0056      	lsls	r6, r2, #1
 8002270:	64c6      	str	r6, [r0, #76]	; 0x4c
 8002272:	e000      	b.n	8002276 <RCC_GetClocksFreq+0x142>
 8002274:	64c1      	str	r1, [r0, #76]	; 0x4c
 8002276:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002278:	0536      	lsls	r6, r6, #20
 800227a:	d506      	bpl.n	800228a <RCC_GetClocksFreq+0x156>
 800227c:	429a      	cmp	r2, r3
 800227e:	d104      	bne.n	800228a <RCC_GetClocksFreq+0x156>
 8002280:	42a5      	cmp	r5, r4
 8002282:	d102      	bne.n	800228a <RCC_GetClocksFreq+0x156>
 8002284:	0056      	lsls	r6, r2, #1
 8002286:	6506      	str	r6, [r0, #80]	; 0x50
 8002288:	e000      	b.n	800228c <RCC_GetClocksFreq+0x158>
 800228a:	6501      	str	r1, [r0, #80]	; 0x50
 800228c:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800228e:	04b6      	lsls	r6, r6, #18
 8002290:	d506      	bpl.n	80022a0 <RCC_GetClocksFreq+0x16c>
 8002292:	429a      	cmp	r2, r3
 8002294:	d104      	bne.n	80022a0 <RCC_GetClocksFreq+0x16c>
 8002296:	42a5      	cmp	r5, r4
 8002298:	d102      	bne.n	80022a0 <RCC_GetClocksFreq+0x16c>
 800229a:	0056      	lsls	r6, r2, #1
 800229c:	6546      	str	r6, [r0, #84]	; 0x54
 800229e:	e000      	b.n	80022a2 <RCC_GetClocksFreq+0x16e>
 80022a0:	6501      	str	r1, [r0, #80]	; 0x50
 80022a2:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80022a4:	0436      	lsls	r6, r6, #16
 80022a6:	d506      	bpl.n	80022b6 <RCC_GetClocksFreq+0x182>
 80022a8:	429a      	cmp	r2, r3
 80022aa:	d104      	bne.n	80022b6 <RCC_GetClocksFreq+0x182>
 80022ac:	42a5      	cmp	r5, r4
 80022ae:	d102      	bne.n	80022b6 <RCC_GetClocksFreq+0x182>
 80022b0:	0053      	lsls	r3, r2, #1
 80022b2:	6583      	str	r3, [r0, #88]	; 0x58
 80022b4:	e000      	b.n	80022b8 <RCC_GetClocksFreq+0x184>
 80022b6:	6581      	str	r1, [r0, #88]	; 0x58
 80022b8:	6b3c      	ldr	r4, [r7, #48]	; 0x30
 80022ba:	4b3b      	ldr	r3, [pc, #236]	; (80023a8 <RCC_GetClocksFreq+0x274>)
 80022bc:	07a4      	lsls	r4, r4, #30
 80022be:	d101      	bne.n	80022c4 <RCC_GetClocksFreq+0x190>
 80022c0:	6381      	str	r1, [r0, #56]	; 0x38
 80022c2:	e015      	b.n	80022f0 <RCC_GetClocksFreq+0x1bc>
 80022c4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80022c6:	f001 0103 	and.w	r1, r1, #3
 80022ca:	2901      	cmp	r1, #1
 80022cc:	d101      	bne.n	80022d2 <RCC_GetClocksFreq+0x19e>
 80022ce:	6382      	str	r2, [r0, #56]	; 0x38
 80022d0:	e00e      	b.n	80022f0 <RCC_GetClocksFreq+0x1bc>
 80022d2:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80022d4:	f001 0103 	and.w	r1, r1, #3
 80022d8:	2902      	cmp	r1, #2
 80022da:	d102      	bne.n	80022e2 <RCC_GetClocksFreq+0x1ae>
 80022dc:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80022e0:	e005      	b.n	80022ee <RCC_GetClocksFreq+0x1ba>
 80022e2:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80022e4:	f003 0303 	and.w	r3, r3, #3
 80022e8:	2b03      	cmp	r3, #3
 80022ea:	d101      	bne.n	80022f0 <RCC_GetClocksFreq+0x1bc>
 80022ec:	4b2f      	ldr	r3, [pc, #188]	; (80023ac <RCC_GetClocksFreq+0x278>)
 80022ee:	6383      	str	r3, [r0, #56]	; 0x38
 80022f0:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80022f2:	4b2d      	ldr	r3, [pc, #180]	; (80023a8 <RCC_GetClocksFreq+0x274>)
 80022f4:	f411 3f40 	tst.w	r1, #196608	; 0x30000
 80022f8:	d102      	bne.n	8002300 <RCC_GetClocksFreq+0x1cc>
 80022fa:	f8c0 e03c 	str.w	lr, [r0, #60]	; 0x3c
 80022fe:	e018      	b.n	8002332 <RCC_GetClocksFreq+0x1fe>
 8002300:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002302:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002306:	f5b1 3f80 	cmp.w	r1, #65536	; 0x10000
 800230a:	d101      	bne.n	8002310 <RCC_GetClocksFreq+0x1dc>
 800230c:	63c2      	str	r2, [r0, #60]	; 0x3c
 800230e:	e010      	b.n	8002332 <RCC_GetClocksFreq+0x1fe>
 8002310:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002312:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002316:	f5b1 3f00 	cmp.w	r1, #131072	; 0x20000
 800231a:	d102      	bne.n	8002322 <RCC_GetClocksFreq+0x1ee>
 800231c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002320:	e006      	b.n	8002330 <RCC_GetClocksFreq+0x1fc>
 8002322:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002324:	f403 3340 	and.w	r3, r3, #196608	; 0x30000
 8002328:	f5b3 3f40 	cmp.w	r3, #196608	; 0x30000
 800232c:	d101      	bne.n	8002332 <RCC_GetClocksFreq+0x1fe>
 800232e:	4b1f      	ldr	r3, [pc, #124]	; (80023ac <RCC_GetClocksFreq+0x278>)
 8002330:	63c3      	str	r3, [r0, #60]	; 0x3c
 8002332:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8002334:	4b1c      	ldr	r3, [pc, #112]	; (80023a8 <RCC_GetClocksFreq+0x274>)
 8002336:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 800233a:	d102      	bne.n	8002342 <RCC_GetClocksFreq+0x20e>
 800233c:	f8c0 e040 	str.w	lr, [r0, #64]	; 0x40
 8002340:	e018      	b.n	8002374 <RCC_GetClocksFreq+0x240>
 8002342:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002344:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002348:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 800234c:	d101      	bne.n	8002352 <RCC_GetClocksFreq+0x21e>
 800234e:	6402      	str	r2, [r0, #64]	; 0x40
 8002350:	e010      	b.n	8002374 <RCC_GetClocksFreq+0x240>
 8002352:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002354:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002358:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 800235c:	d102      	bne.n	8002364 <RCC_GetClocksFreq+0x230>
 800235e:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002362:	e006      	b.n	8002372 <RCC_GetClocksFreq+0x23e>
 8002364:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002366:	f403 2340 	and.w	r3, r3, #786432	; 0xc0000
 800236a:	f5b3 2f40 	cmp.w	r3, #786432	; 0xc0000
 800236e:	d101      	bne.n	8002374 <RCC_GetClocksFreq+0x240>
 8002370:	4b0e      	ldr	r3, [pc, #56]	; (80023ac <RCC_GetClocksFreq+0x278>)
 8002372:	6403      	str	r3, [r0, #64]	; 0x40
 8002374:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8002376:	4b0c      	ldr	r3, [pc, #48]	; (80023a8 <RCC_GetClocksFreq+0x274>)
 8002378:	f411 1f40 	tst.w	r1, #3145728	; 0x300000
 800237c:	d102      	bne.n	8002384 <RCC_GetClocksFreq+0x250>
 800237e:	f8c0 e044 	str.w	lr, [r0, #68]	; 0x44
 8002382:	e023      	b.n	80023cc <RCC_GetClocksFreq+0x298>
 8002384:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002386:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 800238a:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 800238e:	d101      	bne.n	8002394 <RCC_GetClocksFreq+0x260>
 8002390:	6442      	str	r2, [r0, #68]	; 0x44
 8002392:	e01b      	b.n	80023cc <RCC_GetClocksFreq+0x298>
 8002394:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002396:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 800239a:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 800239e:	d10d      	bne.n	80023bc <RCC_GetClocksFreq+0x288>
 80023a0:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80023a4:	e011      	b.n	80023ca <RCC_GetClocksFreq+0x296>
 80023a6:	bf00      	nop
 80023a8:	40021000 	.word	0x40021000
 80023ac:	007a1200 	.word	0x007a1200
 80023b0:	003d0900 	.word	0x003d0900
 80023b4:	20000020 	.word	0x20000020
 80023b8:	20000000 	.word	0x20000000
 80023bc:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80023be:	f403 1340 	and.w	r3, r3, #3145728	; 0x300000
 80023c2:	f5b3 1f40 	cmp.w	r3, #3145728	; 0x300000
 80023c6:	d101      	bne.n	80023cc <RCC_GetClocksFreq+0x298>
 80023c8:	4b13      	ldr	r3, [pc, #76]	; (8002418 <RCC_GetClocksFreq+0x2e4>)
 80023ca:	6443      	str	r3, [r0, #68]	; 0x44
 80023cc:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80023ce:	4b13      	ldr	r3, [pc, #76]	; (800241c <RCC_GetClocksFreq+0x2e8>)
 80023d0:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80023d4:	d103      	bne.n	80023de <RCC_GetClocksFreq+0x2aa>
 80023d6:	f8c0 e048 	str.w	lr, [r0, #72]	; 0x48
 80023da:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80023de:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80023e0:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80023e4:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80023e8:	d102      	bne.n	80023f0 <RCC_GetClocksFreq+0x2bc>
 80023ea:	6482      	str	r2, [r0, #72]	; 0x48
 80023ec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80023f0:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80023f2:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 80023f6:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 80023fa:	d102      	bne.n	8002402 <RCC_GetClocksFreq+0x2ce>
 80023fc:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002400:	e006      	b.n	8002410 <RCC_GetClocksFreq+0x2dc>
 8002402:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002404:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8002408:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 800240c:	d101      	bne.n	8002412 <RCC_GetClocksFreq+0x2de>
 800240e:	4b02      	ldr	r3, [pc, #8]	; (8002418 <RCC_GetClocksFreq+0x2e4>)
 8002410:	6483      	str	r3, [r0, #72]	; 0x48
 8002412:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8002416:	bf00      	nop
 8002418:	007a1200 	.word	0x007a1200
 800241c:	40021000 	.word	0x40021000

08002420 <RCC_AHBPeriphClockCmd>:
 8002420:	bf00      	nop
 8002422:	bf00      	nop
 8002424:	4b04      	ldr	r3, [pc, #16]	; (8002438 <RCC_AHBPeriphClockCmd+0x18>)
 8002426:	695a      	ldr	r2, [r3, #20]
 8002428:	b109      	cbz	r1, 800242e <RCC_AHBPeriphClockCmd+0xe>
 800242a:	4310      	orrs	r0, r2
 800242c:	e001      	b.n	8002432 <RCC_AHBPeriphClockCmd+0x12>
 800242e:	ea22 0000 	bic.w	r0, r2, r0
 8002432:	6158      	str	r0, [r3, #20]
 8002434:	4770      	bx	lr
 8002436:	bf00      	nop
 8002438:	40021000 	.word	0x40021000

0800243c <RCC_APB2PeriphClockCmd>:
 800243c:	bf00      	nop
 800243e:	bf00      	nop
 8002440:	4b04      	ldr	r3, [pc, #16]	; (8002454 <RCC_APB2PeriphClockCmd+0x18>)
 8002442:	699a      	ldr	r2, [r3, #24]
 8002444:	b109      	cbz	r1, 800244a <RCC_APB2PeriphClockCmd+0xe>
 8002446:	4310      	orrs	r0, r2
 8002448:	e001      	b.n	800244e <RCC_APB2PeriphClockCmd+0x12>
 800244a:	ea22 0000 	bic.w	r0, r2, r0
 800244e:	6198      	str	r0, [r3, #24]
 8002450:	4770      	bx	lr
 8002452:	bf00      	nop
 8002454:	40021000 	.word	0x40021000

08002458 <RCC_APB1PeriphClockCmd>:
 8002458:	bf00      	nop
 800245a:	bf00      	nop
 800245c:	4b04      	ldr	r3, [pc, #16]	; (8002470 <RCC_APB1PeriphClockCmd+0x18>)
 800245e:	69da      	ldr	r2, [r3, #28]
 8002460:	b109      	cbz	r1, 8002466 <RCC_APB1PeriphClockCmd+0xe>
 8002462:	4310      	orrs	r0, r2
 8002464:	e001      	b.n	800246a <RCC_APB1PeriphClockCmd+0x12>
 8002466:	ea22 0000 	bic.w	r0, r2, r0
 800246a:	61d8      	str	r0, [r3, #28]
 800246c:	4770      	bx	lr
 800246e:	bf00      	nop
 8002470:	40021000 	.word	0x40021000

08002474 <TIM_TimeBaseInit>:
 8002474:	bf00      	nop
 8002476:	bf00      	nop
 8002478:	bf00      	nop
 800247a:	4a24      	ldr	r2, [pc, #144]	; (800250c <TIM_TimeBaseInit+0x98>)
 800247c:	8803      	ldrh	r3, [r0, #0]
 800247e:	4290      	cmp	r0, r2
 8002480:	b29b      	uxth	r3, r3
 8002482:	d012      	beq.n	80024aa <TIM_TimeBaseInit+0x36>
 8002484:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8002488:	4290      	cmp	r0, r2
 800248a:	d00e      	beq.n	80024aa <TIM_TimeBaseInit+0x36>
 800248c:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8002490:	d00b      	beq.n	80024aa <TIM_TimeBaseInit+0x36>
 8002492:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8002496:	4290      	cmp	r0, r2
 8002498:	d007      	beq.n	80024aa <TIM_TimeBaseInit+0x36>
 800249a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800249e:	4290      	cmp	r0, r2
 80024a0:	d003      	beq.n	80024aa <TIM_TimeBaseInit+0x36>
 80024a2:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 80024a6:	4290      	cmp	r0, r2
 80024a8:	d103      	bne.n	80024b2 <TIM_TimeBaseInit+0x3e>
 80024aa:	884a      	ldrh	r2, [r1, #2]
 80024ac:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80024b0:	4313      	orrs	r3, r2
 80024b2:	4a17      	ldr	r2, [pc, #92]	; (8002510 <TIM_TimeBaseInit+0x9c>)
 80024b4:	4290      	cmp	r0, r2
 80024b6:	d008      	beq.n	80024ca <TIM_TimeBaseInit+0x56>
 80024b8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80024bc:	4290      	cmp	r0, r2
 80024be:	bf1f      	itttt	ne
 80024c0:	f423 7340 	bicne.w	r3, r3, #768	; 0x300
 80024c4:	890a      	ldrhne	r2, [r1, #8]
 80024c6:	b29b      	uxthne	r3, r3
 80024c8:	4313      	orrne	r3, r2
 80024ca:	8003      	strh	r3, [r0, #0]
 80024cc:	684b      	ldr	r3, [r1, #4]
 80024ce:	62c3      	str	r3, [r0, #44]	; 0x2c
 80024d0:	880b      	ldrh	r3, [r1, #0]
 80024d2:	8503      	strh	r3, [r0, #40]	; 0x28
 80024d4:	4b0d      	ldr	r3, [pc, #52]	; (800250c <TIM_TimeBaseInit+0x98>)
 80024d6:	4298      	cmp	r0, r3
 80024d8:	d013      	beq.n	8002502 <TIM_TimeBaseInit+0x8e>
 80024da:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80024de:	4298      	cmp	r0, r3
 80024e0:	d00f      	beq.n	8002502 <TIM_TimeBaseInit+0x8e>
 80024e2:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 80024e6:	4298      	cmp	r0, r3
 80024e8:	d00b      	beq.n	8002502 <TIM_TimeBaseInit+0x8e>
 80024ea:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80024ee:	4298      	cmp	r0, r3
 80024f0:	d007      	beq.n	8002502 <TIM_TimeBaseInit+0x8e>
 80024f2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80024f6:	4298      	cmp	r0, r3
 80024f8:	d003      	beq.n	8002502 <TIM_TimeBaseInit+0x8e>
 80024fa:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80024fe:	4298      	cmp	r0, r3
 8002500:	d101      	bne.n	8002506 <TIM_TimeBaseInit+0x92>
 8002502:	894b      	ldrh	r3, [r1, #10]
 8002504:	8603      	strh	r3, [r0, #48]	; 0x30
 8002506:	2301      	movs	r3, #1
 8002508:	6143      	str	r3, [r0, #20]
 800250a:	4770      	bx	lr
 800250c:	40012c00 	.word	0x40012c00
 8002510:	40001000 	.word	0x40001000

08002514 <TIM_Cmd>:
 8002514:	bf00      	nop
 8002516:	bf00      	nop
 8002518:	8803      	ldrh	r3, [r0, #0]
 800251a:	b119      	cbz	r1, 8002524 <TIM_Cmd+0x10>
 800251c:	b29b      	uxth	r3, r3
 800251e:	f043 0301 	orr.w	r3, r3, #1
 8002522:	e003      	b.n	800252c <TIM_Cmd+0x18>
 8002524:	f023 0301 	bic.w	r3, r3, #1
 8002528:	041b      	lsls	r3, r3, #16
 800252a:	0c1b      	lsrs	r3, r3, #16
 800252c:	8003      	strh	r3, [r0, #0]
 800252e:	4770      	bx	lr

08002530 <TIM_OC1Init>:
 8002530:	b570      	push	{r4, r5, r6, lr}
 8002532:	bf00      	nop
 8002534:	bf00      	nop
 8002536:	bf00      	nop
 8002538:	bf00      	nop
 800253a:	6a03      	ldr	r3, [r0, #32]
 800253c:	680d      	ldr	r5, [r1, #0]
 800253e:	f023 0301 	bic.w	r3, r3, #1
 8002542:	6203      	str	r3, [r0, #32]
 8002544:	6a03      	ldr	r3, [r0, #32]
 8002546:	6844      	ldr	r4, [r0, #4]
 8002548:	6982      	ldr	r2, [r0, #24]
 800254a:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 800254e:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 8002552:	4315      	orrs	r5, r2
 8002554:	898a      	ldrh	r2, [r1, #12]
 8002556:	f023 0302 	bic.w	r3, r3, #2
 800255a:	4313      	orrs	r3, r2
 800255c:	888a      	ldrh	r2, [r1, #4]
 800255e:	4313      	orrs	r3, r2
 8002560:	4a15      	ldr	r2, [pc, #84]	; (80025b8 <TIM_OC1Init+0x88>)
 8002562:	4290      	cmp	r0, r2
 8002564:	d00f      	beq.n	8002586 <TIM_OC1Init+0x56>
 8002566:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 800256a:	4290      	cmp	r0, r2
 800256c:	d00b      	beq.n	8002586 <TIM_OC1Init+0x56>
 800256e:	f502 6240 	add.w	r2, r2, #3072	; 0xc00
 8002572:	4290      	cmp	r0, r2
 8002574:	d007      	beq.n	8002586 <TIM_OC1Init+0x56>
 8002576:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800257a:	4290      	cmp	r0, r2
 800257c:	d003      	beq.n	8002586 <TIM_OC1Init+0x56>
 800257e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8002582:	4290      	cmp	r0, r2
 8002584:	d111      	bne.n	80025aa <TIM_OC1Init+0x7a>
 8002586:	bf00      	nop
 8002588:	bf00      	nop
 800258a:	bf00      	nop
 800258c:	bf00      	nop
 800258e:	89ca      	ldrh	r2, [r1, #14]
 8002590:	88ce      	ldrh	r6, [r1, #6]
 8002592:	f023 0308 	bic.w	r3, r3, #8
 8002596:	4313      	orrs	r3, r2
 8002598:	8a0a      	ldrh	r2, [r1, #16]
 800259a:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 800259e:	4314      	orrs	r4, r2
 80025a0:	8a4a      	ldrh	r2, [r1, #18]
 80025a2:	f023 0304 	bic.w	r3, r3, #4
 80025a6:	4333      	orrs	r3, r6
 80025a8:	4314      	orrs	r4, r2
 80025aa:	688a      	ldr	r2, [r1, #8]
 80025ac:	6044      	str	r4, [r0, #4]
 80025ae:	6185      	str	r5, [r0, #24]
 80025b0:	6342      	str	r2, [r0, #52]	; 0x34
 80025b2:	6203      	str	r3, [r0, #32]
 80025b4:	bd70      	pop	{r4, r5, r6, pc}
 80025b6:	bf00      	nop
 80025b8:	40012c00 	.word	0x40012c00

080025bc <TIM_OC2Init>:
 80025bc:	b570      	push	{r4, r5, r6, lr}
 80025be:	bf00      	nop
 80025c0:	bf00      	nop
 80025c2:	bf00      	nop
 80025c4:	bf00      	nop
 80025c6:	6a03      	ldr	r3, [r0, #32]
 80025c8:	680d      	ldr	r5, [r1, #0]
 80025ca:	898e      	ldrh	r6, [r1, #12]
 80025cc:	f023 0310 	bic.w	r3, r3, #16
 80025d0:	6203      	str	r3, [r0, #32]
 80025d2:	6a03      	ldr	r3, [r0, #32]
 80025d4:	6844      	ldr	r4, [r0, #4]
 80025d6:	6982      	ldr	r2, [r0, #24]
 80025d8:	f022 7280 	bic.w	r2, r2, #16777216	; 0x1000000
 80025dc:	f422 42e6 	bic.w	r2, r2, #29440	; 0x7300
 80025e0:	ea42 2505 	orr.w	r5, r2, r5, lsl #8
 80025e4:	f023 0220 	bic.w	r2, r3, #32
 80025e8:	888b      	ldrh	r3, [r1, #4]
 80025ea:	4333      	orrs	r3, r6
 80025ec:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
 80025f0:	4a10      	ldr	r2, [pc, #64]	; (8002634 <TIM_OC2Init+0x78>)
 80025f2:	4290      	cmp	r0, r2
 80025f4:	d003      	beq.n	80025fe <TIM_OC2Init+0x42>
 80025f6:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80025fa:	4290      	cmp	r0, r2
 80025fc:	d114      	bne.n	8002628 <TIM_OC2Init+0x6c>
 80025fe:	bf00      	nop
 8002600:	bf00      	nop
 8002602:	bf00      	nop
 8002604:	bf00      	nop
 8002606:	89ca      	ldrh	r2, [r1, #14]
 8002608:	8a0e      	ldrh	r6, [r1, #16]
 800260a:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 800260e:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 8002612:	88ca      	ldrh	r2, [r1, #6]
 8002614:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8002618:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 800261c:	8a4a      	ldrh	r2, [r1, #18]
 800261e:	f424 6440 	bic.w	r4, r4, #3072	; 0xc00
 8002622:	4332      	orrs	r2, r6
 8002624:	ea44 0482 	orr.w	r4, r4, r2, lsl #2
 8002628:	688a      	ldr	r2, [r1, #8]
 800262a:	6044      	str	r4, [r0, #4]
 800262c:	6185      	str	r5, [r0, #24]
 800262e:	6382      	str	r2, [r0, #56]	; 0x38
 8002630:	6203      	str	r3, [r0, #32]
 8002632:	bd70      	pop	{r4, r5, r6, pc}
 8002634:	40012c00 	.word	0x40012c00

08002638 <TIM_CtrlPWMOutputs>:
 8002638:	bf00      	nop
 800263a:	bf00      	nop
 800263c:	6c43      	ldr	r3, [r0, #68]	; 0x44
 800263e:	b111      	cbz	r1, 8002646 <TIM_CtrlPWMOutputs+0xe>
 8002640:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 8002644:	e001      	b.n	800264a <TIM_CtrlPWMOutputs+0x12>
 8002646:	f3c3 030e 	ubfx	r3, r3, #0, #15
 800264a:	6443      	str	r3, [r0, #68]	; 0x44
 800264c:	4770      	bx	lr

0800264e <TIM_ClearITPendingBit>:
 800264e:	bf00      	nop
 8002650:	43c9      	mvns	r1, r1
 8002652:	b289      	uxth	r1, r1
 8002654:	6101      	str	r1, [r0, #16]
 8002656:	4770      	bx	lr

08002658 <USART_Init>:
 8002658:	b530      	push	{r4, r5, lr}
 800265a:	4604      	mov	r4, r0
 800265c:	b099      	sub	sp, #100	; 0x64
 800265e:	460d      	mov	r5, r1
 8002660:	bf00      	nop
 8002662:	bf00      	nop
 8002664:	bf00      	nop
 8002666:	bf00      	nop
 8002668:	bf00      	nop
 800266a:	bf00      	nop
 800266c:	bf00      	nop
 800266e:	6803      	ldr	r3, [r0, #0]
 8002670:	f023 0301 	bic.w	r3, r3, #1
 8002674:	6003      	str	r3, [r0, #0]
 8002676:	6843      	ldr	r3, [r0, #4]
 8002678:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 800267c:	688b      	ldr	r3, [r1, #8]
 800267e:	68c9      	ldr	r1, [r1, #12]
 8002680:	4313      	orrs	r3, r2
 8002682:	6043      	str	r3, [r0, #4]
 8002684:	686a      	ldr	r2, [r5, #4]
 8002686:	6803      	ldr	r3, [r0, #0]
 8002688:	4311      	orrs	r1, r2
 800268a:	692a      	ldr	r2, [r5, #16]
 800268c:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8002690:	430a      	orrs	r2, r1
 8002692:	f023 030c 	bic.w	r3, r3, #12
 8002696:	4313      	orrs	r3, r2
 8002698:	6003      	str	r3, [r0, #0]
 800269a:	6883      	ldr	r3, [r0, #8]
 800269c:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 80026a0:	696b      	ldr	r3, [r5, #20]
 80026a2:	4313      	orrs	r3, r2
 80026a4:	6083      	str	r3, [r0, #8]
 80026a6:	a801      	add	r0, sp, #4
 80026a8:	f7ff fd44 	bl	8002134 <RCC_GetClocksFreq>
 80026ac:	4b17      	ldr	r3, [pc, #92]	; (800270c <USART_Init+0xb4>)
 80026ae:	429c      	cmp	r4, r3
 80026b0:	d101      	bne.n	80026b6 <USART_Init+0x5e>
 80026b2:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 80026b4:	e00e      	b.n	80026d4 <USART_Init+0x7c>
 80026b6:	4b16      	ldr	r3, [pc, #88]	; (8002710 <USART_Init+0xb8>)
 80026b8:	429c      	cmp	r4, r3
 80026ba:	d101      	bne.n	80026c0 <USART_Init+0x68>
 80026bc:	9b10      	ldr	r3, [sp, #64]	; 0x40
 80026be:	e009      	b.n	80026d4 <USART_Init+0x7c>
 80026c0:	4b14      	ldr	r3, [pc, #80]	; (8002714 <USART_Init+0xbc>)
 80026c2:	429c      	cmp	r4, r3
 80026c4:	d101      	bne.n	80026ca <USART_Init+0x72>
 80026c6:	9b11      	ldr	r3, [sp, #68]	; 0x44
 80026c8:	e004      	b.n	80026d4 <USART_Init+0x7c>
 80026ca:	4b13      	ldr	r3, [pc, #76]	; (8002718 <USART_Init+0xc0>)
 80026cc:	429c      	cmp	r4, r3
 80026ce:	bf0c      	ite	eq
 80026d0:	9b12      	ldreq	r3, [sp, #72]	; 0x48
 80026d2:	9b13      	ldrne	r3, [sp, #76]	; 0x4c
 80026d4:	6822      	ldr	r2, [r4, #0]
 80026d6:	6829      	ldr	r1, [r5, #0]
 80026d8:	f412 4f00 	tst.w	r2, #32768	; 0x8000
 80026dc:	bf18      	it	ne
 80026de:	005b      	lslne	r3, r3, #1
 80026e0:	fbb3 f2f1 	udiv	r2, r3, r1
 80026e4:	fb01 3312 	mls	r3, r1, r2, r3
 80026e8:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
 80026ec:	6823      	ldr	r3, [r4, #0]
 80026ee:	bf28      	it	cs
 80026f0:	3201      	addcs	r2, #1
 80026f2:	041b      	lsls	r3, r3, #16
 80026f4:	bf41      	itttt	mi
 80026f6:	f64f 73f0 	movwmi	r3, #65520	; 0xfff0
 80026fa:	f3c2 0142 	ubfxmi	r1, r2, #1, #3
 80026fe:	4013      	andmi	r3, r2
 8002700:	ea41 0203 	orrmi.w	r2, r1, r3
 8002704:	b292      	uxth	r2, r2
 8002706:	81a2      	strh	r2, [r4, #12]
 8002708:	b019      	add	sp, #100	; 0x64
 800270a:	bd30      	pop	{r4, r5, pc}
 800270c:	40013800 	.word	0x40013800
 8002710:	40004400 	.word	0x40004400
 8002714:	40004800 	.word	0x40004800
 8002718:	40004c00 	.word	0x40004c00

0800271c <USART_Cmd>:
 800271c:	bf00      	nop
 800271e:	bf00      	nop
 8002720:	6803      	ldr	r3, [r0, #0]
 8002722:	b111      	cbz	r1, 800272a <USART_Cmd+0xe>
 8002724:	f043 0301 	orr.w	r3, r3, #1
 8002728:	e001      	b.n	800272e <USART_Cmd+0x12>
 800272a:	f023 0301 	bic.w	r3, r3, #1
 800272e:	6003      	str	r3, [r0, #0]
 8002730:	4770      	bx	lr

08002732 <USART_ReceiveData>:
 8002732:	bf00      	nop
 8002734:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8002736:	f3c0 0008 	ubfx	r0, r0, #0, #9
 800273a:	4770      	bx	lr

0800273c <USART_ITConfig>:
 800273c:	b510      	push	{r4, lr}
 800273e:	bf00      	nop
 8002740:	bf00      	nop
 8002742:	bf00      	nop
 8002744:	f3c1 2407 	ubfx	r4, r1, #8, #8
 8002748:	2301      	movs	r3, #1
 800274a:	b2c9      	uxtb	r1, r1
 800274c:	2c02      	cmp	r4, #2
 800274e:	fa03 f301 	lsl.w	r3, r3, r1
 8002752:	d101      	bne.n	8002758 <USART_ITConfig+0x1c>
 8002754:	3004      	adds	r0, #4
 8002756:	e002      	b.n	800275e <USART_ITConfig+0x22>
 8002758:	2c03      	cmp	r4, #3
 800275a:	bf08      	it	eq
 800275c:	3008      	addeq	r0, #8
 800275e:	b112      	cbz	r2, 8002766 <USART_ITConfig+0x2a>
 8002760:	6802      	ldr	r2, [r0, #0]
 8002762:	4313      	orrs	r3, r2
 8002764:	e002      	b.n	800276c <USART_ITConfig+0x30>
 8002766:	6802      	ldr	r2, [r0, #0]
 8002768:	ea22 0303 	bic.w	r3, r2, r3
 800276c:	6003      	str	r3, [r0, #0]
 800276e:	bd10      	pop	{r4, pc}

08002770 <USART_GetITStatus>:
 8002770:	b510      	push	{r4, lr}
 8002772:	bf00      	nop
 8002774:	bf00      	nop
 8002776:	f3c1 2207 	ubfx	r2, r1, #8, #8
 800277a:	b2cc      	uxtb	r4, r1
 800277c:	2301      	movs	r3, #1
 800277e:	2a01      	cmp	r2, #1
 8002780:	fa03 f304 	lsl.w	r3, r3, r4
 8002784:	d101      	bne.n	800278a <USART_GetITStatus+0x1a>
 8002786:	6802      	ldr	r2, [r0, #0]
 8002788:	e003      	b.n	8002792 <USART_GetITStatus+0x22>
 800278a:	2a02      	cmp	r2, #2
 800278c:	bf0c      	ite	eq
 800278e:	6842      	ldreq	r2, [r0, #4]
 8002790:	6882      	ldrne	r2, [r0, #8]
 8002792:	4013      	ands	r3, r2
 8002794:	69c2      	ldr	r2, [r0, #28]
 8002796:	b13b      	cbz	r3, 80027a8 <USART_GetITStatus+0x38>
 8002798:	0c09      	lsrs	r1, r1, #16
 800279a:	2301      	movs	r3, #1
 800279c:	408b      	lsls	r3, r1
 800279e:	4213      	tst	r3, r2
 80027a0:	bf14      	ite	ne
 80027a2:	2001      	movne	r0, #1
 80027a4:	2000      	moveq	r0, #0
 80027a6:	bd10      	pop	{r4, pc}
 80027a8:	4618      	mov	r0, r3
 80027aa:	bd10      	pop	{r4, pc}

080027ac <USART_ClearITPendingBit>:
 80027ac:	bf00      	nop
 80027ae:	bf00      	nop
 80027b0:	2301      	movs	r3, #1
 80027b2:	0c09      	lsrs	r1, r1, #16
 80027b4:	408b      	lsls	r3, r1
 80027b6:	6203      	str	r3, [r0, #32]
 80027b8:	4770      	bx	lr
	...

080027bc <SystemInit>:
 80027bc:	4a39      	ldr	r2, [pc, #228]	; (80028a4 <SystemInit+0xe8>)
 80027be:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 80027c2:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 80027c6:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 80027ca:	4b37      	ldr	r3, [pc, #220]	; (80028a8 <SystemInit+0xec>)
 80027cc:	681a      	ldr	r2, [r3, #0]
 80027ce:	f042 0201 	orr.w	r2, r2, #1
 80027d2:	601a      	str	r2, [r3, #0]
 80027d4:	6859      	ldr	r1, [r3, #4]
 80027d6:	4a35      	ldr	r2, [pc, #212]	; (80028ac <SystemInit+0xf0>)
 80027d8:	400a      	ands	r2, r1
 80027da:	605a      	str	r2, [r3, #4]
 80027dc:	681a      	ldr	r2, [r3, #0]
 80027de:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80027e2:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80027e6:	601a      	str	r2, [r3, #0]
 80027e8:	681a      	ldr	r2, [r3, #0]
 80027ea:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80027ee:	601a      	str	r2, [r3, #0]
 80027f0:	685a      	ldr	r2, [r3, #4]
 80027f2:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 80027f6:	605a      	str	r2, [r3, #4]
 80027f8:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80027fa:	f022 020f 	bic.w	r2, r2, #15
 80027fe:	62da      	str	r2, [r3, #44]	; 0x2c
 8002800:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002802:	4a2b      	ldr	r2, [pc, #172]	; (80028b0 <SystemInit+0xf4>)
 8002804:	b082      	sub	sp, #8
 8002806:	400a      	ands	r2, r1
 8002808:	631a      	str	r2, [r3, #48]	; 0x30
 800280a:	2200      	movs	r2, #0
 800280c:	609a      	str	r2, [r3, #8]
 800280e:	9200      	str	r2, [sp, #0]
 8002810:	9201      	str	r2, [sp, #4]
 8002812:	681a      	ldr	r2, [r3, #0]
 8002814:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8002818:	601a      	str	r2, [r3, #0]
 800281a:	681a      	ldr	r2, [r3, #0]
 800281c:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8002820:	9201      	str	r2, [sp, #4]
 8002822:	9a00      	ldr	r2, [sp, #0]
 8002824:	3201      	adds	r2, #1
 8002826:	9200      	str	r2, [sp, #0]
 8002828:	9a01      	ldr	r2, [sp, #4]
 800282a:	b91a      	cbnz	r2, 8002834 <SystemInit+0x78>
 800282c:	9a00      	ldr	r2, [sp, #0]
 800282e:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002832:	d1f2      	bne.n	800281a <SystemInit+0x5e>
 8002834:	681a      	ldr	r2, [r3, #0]
 8002836:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 800283a:	bf18      	it	ne
 800283c:	2201      	movne	r2, #1
 800283e:	9201      	str	r2, [sp, #4]
 8002840:	9a01      	ldr	r2, [sp, #4]
 8002842:	2a01      	cmp	r2, #1
 8002844:	d005      	beq.n	8002852 <SystemInit+0x96>
 8002846:	4b17      	ldr	r3, [pc, #92]	; (80028a4 <SystemInit+0xe8>)
 8002848:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800284c:	609a      	str	r2, [r3, #8]
 800284e:	b002      	add	sp, #8
 8002850:	4770      	bx	lr
 8002852:	4a18      	ldr	r2, [pc, #96]	; (80028b4 <SystemInit+0xf8>)
 8002854:	2112      	movs	r1, #18
 8002856:	6011      	str	r1, [r2, #0]
 8002858:	685a      	ldr	r2, [r3, #4]
 800285a:	605a      	str	r2, [r3, #4]
 800285c:	685a      	ldr	r2, [r3, #4]
 800285e:	605a      	str	r2, [r3, #4]
 8002860:	685a      	ldr	r2, [r3, #4]
 8002862:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8002866:	605a      	str	r2, [r3, #4]
 8002868:	685a      	ldr	r2, [r3, #4]
 800286a:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 800286e:	605a      	str	r2, [r3, #4]
 8002870:	685a      	ldr	r2, [r3, #4]
 8002872:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8002876:	605a      	str	r2, [r3, #4]
 8002878:	681a      	ldr	r2, [r3, #0]
 800287a:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 800287e:	601a      	str	r2, [r3, #0]
 8002880:	6819      	ldr	r1, [r3, #0]
 8002882:	4a09      	ldr	r2, [pc, #36]	; (80028a8 <SystemInit+0xec>)
 8002884:	0189      	lsls	r1, r1, #6
 8002886:	d5fb      	bpl.n	8002880 <SystemInit+0xc4>
 8002888:	6851      	ldr	r1, [r2, #4]
 800288a:	f021 0103 	bic.w	r1, r1, #3
 800288e:	6051      	str	r1, [r2, #4]
 8002890:	6851      	ldr	r1, [r2, #4]
 8002892:	f041 0102 	orr.w	r1, r1, #2
 8002896:	6051      	str	r1, [r2, #4]
 8002898:	685a      	ldr	r2, [r3, #4]
 800289a:	f002 020c 	and.w	r2, r2, #12
 800289e:	2a08      	cmp	r2, #8
 80028a0:	d1fa      	bne.n	8002898 <SystemInit+0xdc>
 80028a2:	e7d0      	b.n	8002846 <SystemInit+0x8a>
 80028a4:	e000ed00 	.word	0xe000ed00
 80028a8:	40021000 	.word	0x40021000
 80028ac:	f87fc00c 	.word	0xf87fc00c
 80028b0:	ff00fccc 	.word	0xff00fccc
 80028b4:	40022000 	.word	0x40022000

080028b8 <core_yield>:
 80028b8:	bf00      	nop
 80028ba:	4770      	bx	lr

080028bc <sytem_clock_init>:
 80028bc:	f7ff bf7e 	b.w	80027bc <SystemInit>

080028c0 <NVIC_Init>:
 80028c0:	b510      	push	{r4, lr}
 80028c2:	bf00      	nop
 80028c4:	bf00      	nop
 80028c6:	bf00      	nop
 80028c8:	78c2      	ldrb	r2, [r0, #3]
 80028ca:	7803      	ldrb	r3, [r0, #0]
 80028cc:	b312      	cbz	r2, 8002914 <NVIC_Init+0x54>
 80028ce:	4a17      	ldr	r2, [pc, #92]	; (800292c <NVIC_Init+0x6c>)
 80028d0:	68d1      	ldr	r1, [r2, #12]
 80028d2:	7842      	ldrb	r2, [r0, #1]
 80028d4:	43c9      	mvns	r1, r1
 80028d6:	f3c1 2102 	ubfx	r1, r1, #8, #3
 80028da:	f1c1 0404 	rsb	r4, r1, #4
 80028de:	b2e4      	uxtb	r4, r4
 80028e0:	40a2      	lsls	r2, r4
 80028e2:	b2d4      	uxtb	r4, r2
 80028e4:	220f      	movs	r2, #15
 80028e6:	410a      	asrs	r2, r1
 80028e8:	7881      	ldrb	r1, [r0, #2]
 80028ea:	400a      	ands	r2, r1
 80028ec:	4322      	orrs	r2, r4
 80028ee:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 80028f2:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 80028f6:	0112      	lsls	r2, r2, #4
 80028f8:	b2d2      	uxtb	r2, r2
 80028fa:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80028fe:	7803      	ldrb	r3, [r0, #0]
 8002900:	2201      	movs	r2, #1
 8002902:	0959      	lsrs	r1, r3, #5
 8002904:	f003 031f 	and.w	r3, r3, #31
 8002908:	fa02 f303 	lsl.w	r3, r2, r3
 800290c:	4a08      	ldr	r2, [pc, #32]	; (8002930 <NVIC_Init+0x70>)
 800290e:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8002912:	bd10      	pop	{r4, pc}
 8002914:	095a      	lsrs	r2, r3, #5
 8002916:	2101      	movs	r1, #1
 8002918:	f003 031f 	and.w	r3, r3, #31
 800291c:	4099      	lsls	r1, r3
 800291e:	f102 0320 	add.w	r3, r2, #32
 8002922:	4a03      	ldr	r2, [pc, #12]	; (8002930 <NVIC_Init+0x70>)
 8002924:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8002928:	bd10      	pop	{r4, pc}
 800292a:	bf00      	nop
 800292c:	e000ed00 	.word	0xe000ed00
 8002930:	e000e100 	.word	0xe000e100

08002934 <EXTI_Init>:
 8002934:	b570      	push	{r4, r5, r6, lr}
 8002936:	bf00      	nop
 8002938:	bf00      	nop
 800293a:	bf00      	nop
 800293c:	bf00      	nop
 800293e:	7982      	ldrb	r2, [r0, #6]
 8002940:	6803      	ldr	r3, [r0, #0]
 8002942:	7904      	ldrb	r4, [r0, #4]
 8002944:	2a00      	cmp	r2, #0
 8002946:	d064      	beq.n	8002a12 <EXTI_Init+0xde>
 8002948:	f023 011f 	bic.w	r1, r3, #31
 800294c:	f101 4180 	add.w	r1, r1, #1073741824	; 0x40000000
 8002950:	f501 3182 	add.w	r1, r1, #66560	; 0x10400
 8002954:	f003 021f 	and.w	r2, r3, #31
 8002958:	680d      	ldr	r5, [r1, #0]
 800295a:	2301      	movs	r3, #1
 800295c:	fa03 f202 	lsl.w	r2, r3, r2
 8002960:	ea25 0202 	bic.w	r2, r5, r2
 8002964:	600a      	str	r2, [r1, #0]
 8002966:	6802      	ldr	r2, [r0, #0]
 8002968:	4d32      	ldr	r5, [pc, #200]	; (8002a34 <EXTI_Init+0x100>)
 800296a:	f022 061f 	bic.w	r6, r2, #31
 800296e:	f002 021f 	and.w	r2, r2, #31
 8002972:	5971      	ldr	r1, [r6, r5]
 8002974:	fa03 f202 	lsl.w	r2, r3, r2
 8002978:	ea21 0202 	bic.w	r2, r1, r2
 800297c:	5172      	str	r2, [r6, r5]
 800297e:	6801      	ldr	r1, [r0, #0]
 8002980:	f104 4280 	add.w	r2, r4, #1073741824	; 0x40000000
 8002984:	f502 3282 	add.w	r2, r2, #66560	; 0x10400
 8002988:	f021 041f 	bic.w	r4, r1, #31
 800298c:	f001 011f 	and.w	r1, r1, #31
 8002990:	5915      	ldr	r5, [r2, r4]
 8002992:	fa03 f101 	lsl.w	r1, r3, r1
 8002996:	4329      	orrs	r1, r5
 8002998:	5111      	str	r1, [r2, r4]
 800299a:	6802      	ldr	r2, [r0, #0]
 800299c:	4d26      	ldr	r5, [pc, #152]	; (8002a38 <EXTI_Init+0x104>)
 800299e:	f022 041f 	bic.w	r4, r2, #31
 80029a2:	f002 021f 	and.w	r2, r2, #31
 80029a6:	5961      	ldr	r1, [r4, r5]
 80029a8:	fa03 f202 	lsl.w	r2, r3, r2
 80029ac:	ea21 0202 	bic.w	r2, r1, r2
 80029b0:	5162      	str	r2, [r4, r5]
 80029b2:	6802      	ldr	r2, [r0, #0]
 80029b4:	4c21      	ldr	r4, [pc, #132]	; (8002a3c <EXTI_Init+0x108>)
 80029b6:	f022 061f 	bic.w	r6, r2, #31
 80029ba:	f002 021f 	and.w	r2, r2, #31
 80029be:	5931      	ldr	r1, [r6, r4]
 80029c0:	fa03 f202 	lsl.w	r2, r3, r2
 80029c4:	ea21 0202 	bic.w	r2, r1, r2
 80029c8:	7941      	ldrb	r1, [r0, #5]
 80029ca:	5132      	str	r2, [r6, r4]
 80029cc:	2910      	cmp	r1, #16
 80029ce:	6802      	ldr	r2, [r0, #0]
 80029d0:	d112      	bne.n	80029f8 <EXTI_Init+0xc4>
 80029d2:	f022 011f 	bic.w	r1, r2, #31
 80029d6:	f002 021f 	and.w	r2, r2, #31
 80029da:	594e      	ldr	r6, [r1, r5]
 80029dc:	fa03 f202 	lsl.w	r2, r3, r2
 80029e0:	4332      	orrs	r2, r6
 80029e2:	514a      	str	r2, [r1, r5]
 80029e4:	6802      	ldr	r2, [r0, #0]
 80029e6:	f022 011f 	bic.w	r1, r2, #31
 80029ea:	f002 021f 	and.w	r2, r2, #31
 80029ee:	5908      	ldr	r0, [r1, r4]
 80029f0:	4093      	lsls	r3, r2
 80029f2:	4303      	orrs	r3, r0
 80029f4:	510b      	str	r3, [r1, r4]
 80029f6:	bd70      	pop	{r4, r5, r6, pc}
 80029f8:	f101 4180 	add.w	r1, r1, #1073741824	; 0x40000000
 80029fc:	f022 001f 	bic.w	r0, r2, #31
 8002a00:	f501 3182 	add.w	r1, r1, #66560	; 0x10400
 8002a04:	f002 021f 	and.w	r2, r2, #31
 8002a08:	580c      	ldr	r4, [r1, r0]
 8002a0a:	4093      	lsls	r3, r2
 8002a0c:	4323      	orrs	r3, r4
 8002a0e:	500b      	str	r3, [r1, r0]
 8002a10:	bd70      	pop	{r4, r5, r6, pc}
 8002a12:	f104 4280 	add.w	r2, r4, #1073741824	; 0x40000000
 8002a16:	f502 3282 	add.w	r2, r2, #66560	; 0x10400
 8002a1a:	f023 041f 	bic.w	r4, r3, #31
 8002a1e:	2001      	movs	r0, #1
 8002a20:	5911      	ldr	r1, [r2, r4]
 8002a22:	f003 031f 	and.w	r3, r3, #31
 8002a26:	fa00 f303 	lsl.w	r3, r0, r3
 8002a2a:	ea21 0303 	bic.w	r3, r1, r3
 8002a2e:	5113      	str	r3, [r2, r4]
 8002a30:	bd70      	pop	{r4, r5, r6, pc}
 8002a32:	bf00      	nop
 8002a34:	40010404 	.word	0x40010404
 8002a38:	40010408 	.word	0x40010408
 8002a3c:	4001040c 	.word	0x4001040c

08002a40 <EXTI_ClearITPendingBit>:
 8002a40:	f020 011f 	bic.w	r1, r0, #31
 8002a44:	2301      	movs	r3, #1
 8002a46:	f000 001f 	and.w	r0, r0, #31
 8002a4a:	4a02      	ldr	r2, [pc, #8]	; (8002a54 <EXTI_ClearITPendingBit+0x14>)
 8002a4c:	4083      	lsls	r3, r0
 8002a4e:	508b      	str	r3, [r1, r2]
 8002a50:	4770      	bx	lr
 8002a52:	bf00      	nop
 8002a54:	40010414 	.word	0x40010414

08002a58 <GPIO_Init>:
 8002a58:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002a5a:	bf00      	nop
 8002a5c:	bf00      	nop
 8002a5e:	bf00      	nop
 8002a60:	bf00      	nop
 8002a62:	2300      	movs	r3, #0
 8002a64:	680e      	ldr	r6, [r1, #0]
 8002a66:	461c      	mov	r4, r3
 8002a68:	2501      	movs	r5, #1
 8002a6a:	40a5      	lsls	r5, r4
 8002a6c:	ea05 0e06 	and.w	lr, r5, r6
 8002a70:	45ae      	cmp	lr, r5
 8002a72:	d12d      	bne.n	8002ad0 <GPIO_Init+0x78>
 8002a74:	790f      	ldrb	r7, [r1, #4]
 8002a76:	1e7a      	subs	r2, r7, #1
 8002a78:	2a01      	cmp	r2, #1
 8002a7a:	d817      	bhi.n	8002aac <GPIO_Init+0x54>
 8002a7c:	bf00      	nop
 8002a7e:	2203      	movs	r2, #3
 8002a80:	6885      	ldr	r5, [r0, #8]
 8002a82:	409a      	lsls	r2, r3
 8002a84:	ea25 0202 	bic.w	r2, r5, r2
 8002a88:	6082      	str	r2, [r0, #8]
 8002a8a:	794d      	ldrb	r5, [r1, #5]
 8002a8c:	6882      	ldr	r2, [r0, #8]
 8002a8e:	409d      	lsls	r5, r3
 8002a90:	4315      	orrs	r5, r2
 8002a92:	6085      	str	r5, [r0, #8]
 8002a94:	bf00      	nop
 8002a96:	8882      	ldrh	r2, [r0, #4]
 8002a98:	b292      	uxth	r2, r2
 8002a9a:	ea22 020e 	bic.w	r2, r2, lr
 8002a9e:	8082      	strh	r2, [r0, #4]
 8002aa0:	798a      	ldrb	r2, [r1, #6]
 8002aa2:	8885      	ldrh	r5, [r0, #4]
 8002aa4:	40a2      	lsls	r2, r4
 8002aa6:	432a      	orrs	r2, r5
 8002aa8:	b292      	uxth	r2, r2
 8002aaa:	8082      	strh	r2, [r0, #4]
 8002aac:	2203      	movs	r2, #3
 8002aae:	6805      	ldr	r5, [r0, #0]
 8002ab0:	409a      	lsls	r2, r3
 8002ab2:	43d2      	mvns	r2, r2
 8002ab4:	4015      	ands	r5, r2
 8002ab6:	6005      	str	r5, [r0, #0]
 8002ab8:	6805      	ldr	r5, [r0, #0]
 8002aba:	409f      	lsls	r7, r3
 8002abc:	432f      	orrs	r7, r5
 8002abe:	6007      	str	r7, [r0, #0]
 8002ac0:	68c7      	ldr	r7, [r0, #12]
 8002ac2:	4017      	ands	r7, r2
 8002ac4:	79ca      	ldrb	r2, [r1, #7]
 8002ac6:	fa02 f503 	lsl.w	r5, r2, r3
 8002aca:	ea47 0205 	orr.w	r2, r7, r5
 8002ace:	60c2      	str	r2, [r0, #12]
 8002ad0:	3401      	adds	r4, #1
 8002ad2:	2c10      	cmp	r4, #16
 8002ad4:	f103 0302 	add.w	r3, r3, #2
 8002ad8:	d1c6      	bne.n	8002a68 <GPIO_Init+0x10>
 8002ada:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002adc <GPIO_SetBits>:
 8002adc:	bf00      	nop
 8002ade:	bf00      	nop
 8002ae0:	6181      	str	r1, [r0, #24]
 8002ae2:	4770      	bx	lr

08002ae4 <GPIO_PinAFConfig>:
 8002ae4:	b510      	push	{r4, lr}
 8002ae6:	bf00      	nop
 8002ae8:	bf00      	nop
 8002aea:	bf00      	nop
 8002aec:	f001 0307 	and.w	r3, r1, #7
 8002af0:	08c9      	lsrs	r1, r1, #3
 8002af2:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002af6:	009b      	lsls	r3, r3, #2
 8002af8:	6a04      	ldr	r4, [r0, #32]
 8002afa:	210f      	movs	r1, #15
 8002afc:	4099      	lsls	r1, r3
 8002afe:	ea24 0101 	bic.w	r1, r4, r1
 8002b02:	6201      	str	r1, [r0, #32]
 8002b04:	6a01      	ldr	r1, [r0, #32]
 8002b06:	409a      	lsls	r2, r3
 8002b08:	430a      	orrs	r2, r1
 8002b0a:	6202      	str	r2, [r0, #32]
 8002b0c:	bd10      	pop	{r4, pc}

08002b0e <Default_Handler>:
 8002b0e:	4668      	mov	r0, sp
 8002b10:	f020 0107 	bic.w	r1, r0, #7
 8002b14:	468d      	mov	sp, r1
 8002b16:	b501      	push	{r0, lr}
 8002b18:	bf00      	nop
 8002b1a:	e8bd 4001 	ldmia.w	sp!, {r0, lr}
 8002b1e:	4685      	mov	sp, r0
 8002b20:	4770      	bx	lr

08002b22 <HardFault_Handler>:
 8002b22:	bf00      	nop
 8002b24:	e7fd      	b.n	8002b22 <HardFault_Handler>
	...

08002b28 <_reset_init>:
 8002b28:	490e      	ldr	r1, [pc, #56]	; (8002b64 <_reset_init+0x3c>)
 8002b2a:	4b0f      	ldr	r3, [pc, #60]	; (8002b68 <_reset_init+0x40>)
 8002b2c:	1a5b      	subs	r3, r3, r1
 8002b2e:	109b      	asrs	r3, r3, #2
 8002b30:	2200      	movs	r2, #0
 8002b32:	429a      	cmp	r2, r3
 8002b34:	d006      	beq.n	8002b44 <_reset_init+0x1c>
 8002b36:	480d      	ldr	r0, [pc, #52]	; (8002b6c <_reset_init+0x44>)
 8002b38:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
 8002b3c:	f841 0022 	str.w	r0, [r1, r2, lsl #2]
 8002b40:	3201      	adds	r2, #1
 8002b42:	e7f6      	b.n	8002b32 <_reset_init+0xa>
 8002b44:	4a0a      	ldr	r2, [pc, #40]	; (8002b70 <_reset_init+0x48>)
 8002b46:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8002b4a:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8002b4e:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8002b52:	f502 720c 	add.w	r2, r2, #560	; 0x230
 8002b56:	6853      	ldr	r3, [r2, #4]
 8002b58:	f023 4340 	bic.w	r3, r3, #3221225472	; 0xc0000000
 8002b5c:	6053      	str	r3, [r2, #4]
 8002b5e:	f7ff ba0b 	b.w	8001f78 <main>
 8002b62:	bf00      	nop
 8002b64:	20000000 	.word	0x20000000
 8002b68:	20000034 	.word	0x20000034
 8002b6c:	08002da8 	.word	0x08002da8
 8002b70:	e000ed00 	.word	0xe000ed00

08002b74 <SYSCFG_EXTILineConfig>:
 8002b74:	b510      	push	{r4, lr}
 8002b76:	bf00      	nop
 8002b78:	bf00      	nop
 8002b7a:	f001 0303 	and.w	r3, r1, #3
 8002b7e:	f001 01fc 	and.w	r1, r1, #252	; 0xfc
 8002b82:	f101 4180 	add.w	r1, r1, #1073741824	; 0x40000000
 8002b86:	f501 3180 	add.w	r1, r1, #65536	; 0x10000
 8002b8a:	009b      	lsls	r3, r3, #2
 8002b8c:	688c      	ldr	r4, [r1, #8]
 8002b8e:	220f      	movs	r2, #15
 8002b90:	409a      	lsls	r2, r3
 8002b92:	ea24 0202 	bic.w	r2, r4, r2
 8002b96:	608a      	str	r2, [r1, #8]
 8002b98:	688a      	ldr	r2, [r1, #8]
 8002b9a:	4098      	lsls	r0, r3
 8002b9c:	4310      	orrs	r0, r2
 8002b9e:	6088      	str	r0, [r1, #8]
 8002ba0:	bd10      	pop	{r4, pc}
	...

08002ba4 <scheduler>:
 8002ba4:	b570      	push	{r4, r5, r6, lr}
 8002ba6:	2200      	movs	r2, #0
 8002ba8:	4611      	mov	r1, r2
 8002baa:	4b15      	ldr	r3, [pc, #84]	; (8002c00 <scheduler+0x5c>)
 8002bac:	200c      	movs	r0, #12
 8002bae:	fb00 f401 	mul.w	r4, r0, r1
 8002bb2:	191e      	adds	r6, r3, r4
 8002bb4:	6875      	ldr	r5, [r6, #4]
 8002bb6:	f015 0f02 	tst.w	r5, #2
 8002bba:	461d      	mov	r5, r3
 8002bbc:	d10a      	bne.n	8002bd4 <scheduler+0x30>
 8002bbe:	6876      	ldr	r6, [r6, #4]
 8002bc0:	07f6      	lsls	r6, r6, #31
 8002bc2:	d507      	bpl.n	8002bd4 <scheduler+0x30>
 8002bc4:	4350      	muls	r0, r2
 8002bc6:	5b1c      	ldrh	r4, [r3, r4]
 8002bc8:	5a18      	ldrh	r0, [r3, r0]
 8002bca:	b2a4      	uxth	r4, r4
 8002bcc:	b280      	uxth	r0, r0
 8002bce:	4284      	cmp	r4, r0
 8002bd0:	bf38      	it	cc
 8002bd2:	460a      	movcc	r2, r1
 8002bd4:	200c      	movs	r0, #12
 8002bd6:	4348      	muls	r0, r1
 8002bd8:	5a1c      	ldrh	r4, [r3, r0]
 8002bda:	b2a4      	uxth	r4, r4
 8002bdc:	b11c      	cbz	r4, 8002be6 <scheduler+0x42>
 8002bde:	5a1c      	ldrh	r4, [r3, r0]
 8002be0:	3c01      	subs	r4, #1
 8002be2:	b2a4      	uxth	r4, r4
 8002be4:	521c      	strh	r4, [r3, r0]
 8002be6:	3101      	adds	r1, #1
 8002be8:	2906      	cmp	r1, #6
 8002bea:	d1de      	bne.n	8002baa <scheduler+0x6>
 8002bec:	230c      	movs	r3, #12
 8002bee:	4353      	muls	r3, r2
 8002bf0:	18e9      	adds	r1, r5, r3
 8002bf2:	8849      	ldrh	r1, [r1, #2]
 8002bf4:	b289      	uxth	r1, r1
 8002bf6:	52e9      	strh	r1, [r5, r3]
 8002bf8:	4b02      	ldr	r3, [pc, #8]	; (8002c04 <scheduler+0x60>)
 8002bfa:	601a      	str	r2, [r3, #0]
 8002bfc:	bd70      	pop	{r4, r5, r6, pc}
 8002bfe:	bf00      	nop
 8002c00:	200006b0 	.word	0x200006b0
 8002c04:	200006f8 	.word	0x200006f8

08002c08 <SysTick_Handler>:
 8002c08:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002c0c:	f3ef 8308 	mrs	r3, MSP
 8002c10:	4c0d      	ldr	r4, [pc, #52]	; (8002c48 <SysTick_Handler+0x40>)
 8002c12:	4d0e      	ldr	r5, [pc, #56]	; (8002c4c <SysTick_Handler+0x44>)
 8002c14:	6822      	ldr	r2, [r4, #0]
 8002c16:	3201      	adds	r2, #1
 8002c18:	bf1d      	ittte	ne
 8002c1a:	6822      	ldrne	r2, [r4, #0]
 8002c1c:	210c      	movne	r1, #12
 8002c1e:	fb01 5202 	mlane	r2, r1, r2, r5
 8002c22:	2300      	moveq	r3, #0
 8002c24:	bf14      	ite	ne
 8002c26:	6093      	strne	r3, [r2, #8]
 8002c28:	6023      	streq	r3, [r4, #0]
 8002c2a:	f7ff ffbb 	bl	8002ba4 <scheduler>
 8002c2e:	6822      	ldr	r2, [r4, #0]
 8002c30:	230c      	movs	r3, #12
 8002c32:	fb03 5302 	mla	r3, r3, r2, r5
 8002c36:	689a      	ldr	r2, [r3, #8]
 8002c38:	f06f 0306 	mvn.w	r3, #6
 8002c3c:	469e      	mov	lr, r3
 8002c3e:	f382 8808 	msr	MSP, r2
 8002c42:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002c46:	4770      	bx	lr
 8002c48:	200006f8 	.word	0x200006f8
 8002c4c:	200006b0 	.word	0x200006b0

08002c50 <__aeabi_d2f>:
 8002c50:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8002c54:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
 8002c58:	bf24      	itt	cs
 8002c5a:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
 8002c5e:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
 8002c62:	d90d      	bls.n	8002c80 <__aeabi_d2f+0x30>
 8002c64:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
 8002c68:	ea4f 02c0 	mov.w	r2, r0, lsl #3
 8002c6c:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
 8002c70:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
 8002c74:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
 8002c78:	bf08      	it	eq
 8002c7a:	f020 0001 	biceq.w	r0, r0, #1
 8002c7e:	4770      	bx	lr
 8002c80:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
 8002c84:	d121      	bne.n	8002cca <__aeabi_d2f+0x7a>
 8002c86:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
 8002c8a:	bfbc      	itt	lt
 8002c8c:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
 8002c90:	4770      	bxlt	lr
 8002c92:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 8002c96:	ea4f 5252 	mov.w	r2, r2, lsr #21
 8002c9a:	f1c2 0218 	rsb	r2, r2, #24
 8002c9e:	f1c2 0c20 	rsb	ip, r2, #32
 8002ca2:	fa10 f30c 	lsls.w	r3, r0, ip
 8002ca6:	fa20 f002 	lsr.w	r0, r0, r2
 8002caa:	bf18      	it	ne
 8002cac:	f040 0001 	orrne.w	r0, r0, #1
 8002cb0:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 8002cb4:	ea4f 23d3 	mov.w	r3, r3, lsr #11
 8002cb8:	fa03 fc0c 	lsl.w	ip, r3, ip
 8002cbc:	ea40 000c 	orr.w	r0, r0, ip
 8002cc0:	fa23 f302 	lsr.w	r3, r3, r2
 8002cc4:	ea4f 0343 	mov.w	r3, r3, lsl #1
 8002cc8:	e7cc      	b.n	8002c64 <__aeabi_d2f+0x14>
 8002cca:	ea7f 5362 	mvns.w	r3, r2, asr #21
 8002cce:	d107      	bne.n	8002ce0 <__aeabi_d2f+0x90>
 8002cd0:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
 8002cd4:	bf1e      	ittt	ne
 8002cd6:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
 8002cda:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
 8002cde:	4770      	bxne	lr
 8002ce0:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
 8002ce4:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
 8002ce8:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
 8002cec:	4770      	bx	lr
 8002cee:	bf00      	nop

08002cf0 <_init>:
 8002cf0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002cf2:	bf00      	nop
 8002cf4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002cf6:	bc08      	pop	{r3}
 8002cf8:	469e      	mov	lr, r3
 8002cfa:	4770      	bx	lr

08002cfc <_fini>:
 8002cfc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002cfe:	bf00      	nop
 8002d00:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002d02:	bc08      	pop	{r3}
 8002d04:	469e      	mov	lr, r3
 8002d06:	4770      	bx	lr
 8002d08:	61646f6b 	.word	0x61646f6b
 8002d0c:	6920616d 	.word	0x6920616d
 8002d10:	2074696e 	.word	0x2074696e
 8002d14:	25206925 	.word	0x25206925
 8002d18:	203a2069 	.word	0x203a2069
 8002d1c:	4f5b2000 	.word	0x4f5b2000
 8002d20:	000a5d4b 	.word	0x000a5d4b
 8002d24:	41465b20 	.word	0x41465b20
 8002d28:	44454c49 	.word	0x44454c49
 8002d2c:	000a0a5d 	.word	0x000a0a5d
 8002d30:	74737973 	.word	0x74737973
 8002d34:	74206d65 	.word	0x74206d65
 8002d38:	20656d69 	.word	0x20656d69
 8002d3c:	5b207525 	.word	0x5b207525
 8002d40:	0a5d736d 	.word	0x0a5d736d
 8002d44:	20692500 	.word	0x20692500
 8002d48:	0a206925 	.word	0x0a206925
 8002d4c:	00          	.byte	0x00
 8002d4d:	74          	.byte	0x74
 8002d4e:	7365      	.short	0x7365
 8002d50:	676e6974 	.word	0x676e6974
 8002d54:	6d756e20 	.word	0x6d756e20
 8002d58:	20726562 	.word	0x20726562
 8002d5c:	6e697270 	.word	0x6e697270
 8002d60:	75252074 	.word	0x75252074
 8002d64:	20752520 	.word	0x20752520
 8002d68:	0a3a7525 	.word	0x0a3a7525
 8002d6c:	6f6c6600 	.word	0x6f6c6600
 8002d70:	6e207461 	.word	0x6e207461
 8002d74:	65626d75 	.word	0x65626d75
 8002d78:	66252072 	.word	0x66252072
 8002d7c:	25000a20 	.word	0x25000a20
 8002d80:	66252066 	.word	0x66252066
 8002d84:	20662520 	.word	0x20662520
 8002d88:	25206625 	.word	0x25206625
 8002d8c:	66252066 	.word	0x66252066
 8002d90:	20662520 	.word	0x20662520
 8002d94:	000a6625 	.word	0x000a6625
 8002d98:	656c6469 	.word	0x656c6469
 8002d9c:	0a752520 	.word	0x0a752520
 8002da0:	00000000 	.word	0x00000000

08002da4 <__EH_FRAME_BEGIN__>:
 8002da4:	00000000                                ....
