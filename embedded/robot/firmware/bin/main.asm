
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <_ZN7CKodama5init_Ev>:
 8000188:	b510      	push	{r4, lr}
 800018a:	4604      	mov	r4, r0
 800018c:	f001 faf8 	bl	8001780 <_ZN5CGPIO9gpio_initEv>
 8000190:	2800      	cmp	r0, #0
 8000192:	da03      	bge.n	800019c <_ZN7CKodama5init_Ev+0x14>
 8000194:	f5a0 501c 	sub.w	r0, r0, #9984	; 0x2700
 8000198:	3810      	subs	r0, #16
 800019a:	bd10      	pop	{r4, pc}
 800019c:	4620      	mov	r0, r4
 800019e:	f001 fb8b 	bl	80018b8 <_ZN9CTerminal13terminal_initEv>
 80001a2:	2800      	cmp	r0, #0
 80001a4:	da03      	bge.n	80001ae <_ZN7CKodama5init_Ev+0x26>
 80001a6:	f5a0 409c 	sub.w	r0, r0, #19968	; 0x4e00
 80001aa:	3820      	subs	r0, #32
 80001ac:	bd10      	pop	{r4, pc}
 80001ae:	480e      	ldr	r0, [pc, #56]	; (80001e8 <_ZN7CKodama5init_Ev+0x60>)
 80001b0:	f000 fc4c 	bl	8000a4c <_ZN6CTimer10timer_initEv>
 80001b4:	2800      	cmp	r0, #0
 80001b6:	da03      	bge.n	80001c0 <_ZN7CKodama5init_Ev+0x38>
 80001b8:	f5a0 40ea 	sub.w	r0, r0, #29952	; 0x7500
 80001bc:	3830      	subs	r0, #48	; 0x30
 80001be:	bd10      	pop	{r4, pc}
 80001c0:	4620      	mov	r0, r4
 80001c2:	f000 ff19 	bl	8000ff8 <_ZN8CSensors12sensors_initEv>
 80001c6:	2800      	cmp	r0, #0
 80001c8:	da03      	bge.n	80001d2 <_ZN7CKodama5init_Ev+0x4a>
 80001ca:	f5a0 401c 	sub.w	r0, r0, #39936	; 0x9c00
 80001ce:	3840      	subs	r0, #64	; 0x40
 80001d0:	bd10      	pop	{r4, pc}
 80001d2:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
 80001d6:	f000 feff 	bl	8000fd8 <_ZN6CMotor10motor_initEv>
 80001da:	2800      	cmp	r0, #0
 80001dc:	bfbc      	itt	lt
 80001de:	f5a0 4043 	sublt.w	r0, r0, #49920	; 0xc300
 80001e2:	3850      	sublt	r0, #80	; 0x50
 80001e4:	bd10      	pop	{r4, pc}
 80001e6:	bf00      	nop
 80001e8:	20000144 	.word	0x20000144

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
 8000202:	f001 fc99 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 8000206:	4628      	mov	r0, r5
 8000208:	b91e      	cbnz	r6, 8000212 <_ZN7CKodama4initEv+0x26>
 800020a:	4907      	ldr	r1, [pc, #28]	; (8000228 <_ZN7CKodama4initEv+0x3c>)
 800020c:	f001 fc94 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 8000210:	e005      	b.n	800021e <_ZN7CKodama4initEv+0x32>
 8000212:	4906      	ldr	r1, [pc, #24]	; (800022c <_ZN7CKodama4initEv+0x40>)
 8000214:	3401      	adds	r4, #1
 8000216:	f001 fc8f 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 800021a:	2c08      	cmp	r4, #8
 800021c:	d1e9      	bne.n	80001f2 <_ZN7CKodama4initEv+0x6>
 800021e:	4630      	mov	r0, r6
 8000220:	bd70      	pop	{r4, r5, r6, pc}
 8000222:	bf00      	nop
 8000224:	08002f84 	.word	0x08002f84
 8000228:	08002f99 	.word	0x08002f99
 800022c:	08002fa0 	.word	0x08002fa0

08000230 <_ZN7CKodama5sleepEv>:
 8000230:	b510      	push	{r4, lr}
 8000232:	2108      	movs	r1, #8
 8000234:	4604      	mov	r4, r0
 8000236:	f001 fb03 	bl	8001840 <_ZN5CGPIO8gpio_offEm>
 800023a:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
 800023e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000242:	f000 be2d 	b.w	8000ea0 <_ZN6CMotor11motor_sleepEv>

08000246 <_ZN7CKodama6wakeupEv>:
 8000246:	b510      	push	{r4, lr}
 8000248:	2108      	movs	r1, #8
 800024a:	4604      	mov	r4, r0
 800024c:	34c4      	adds	r4, #196	; 0xc4
 800024e:	f001 fae9 	bl	8001824 <_ZN5CGPIO7gpio_onEm>
 8000252:	2100      	movs	r1, #0
 8000254:	4620      	mov	r0, r4
 8000256:	460a      	mov	r2, r1
 8000258:	f000 feb8 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 800025c:	4620      	mov	r0, r4
 800025e:	2101      	movs	r1, #1
 8000260:	2200      	movs	r2, #0
 8000262:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000266:	f000 beb1 	b.w	8000fcc <_ZN6CMotor9set_motorEml>

0800026a <_ZN7CKodama6set_dtEl>:
 800026a:	f8c0 10cc 	str.w	r1, [r0, #204]	; 0xcc
 800026e:	4770      	bx	lr

08000270 <_ZN7CKodama12rotate_robotEllPFlvE>:
 8000270:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000274:	f100 0784 	add.w	r7, r0, #132	; 0x84
 8000278:	4681      	mov	r9, r0
 800027a:	4638      	mov	r0, r7
 800027c:	4688      	mov	r8, r1
 800027e:	469a      	mov	sl, r3
 8000280:	4693      	mov	fp, r2
 8000282:	f001 f957 	bl	8001534 <_ZN4CIMU8imu_readEv>
 8000286:	4638      	mov	r0, r7
 8000288:	f001 fa78 	bl	800177c <_ZN4CIMU14get_imu_resultEv>
 800028c:	6883      	ldr	r3, [r0, #8]
 800028e:	2500      	movs	r5, #0
 8000290:	4498      	add	r8, r3
 8000292:	4821      	ldr	r0, [pc, #132]	; (8000318 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 8000294:	210a      	movs	r1, #10
 8000296:	f000 fc31 	bl	8000afc <_ZN6CTimer8delay_msEm>
 800029a:	f109 06c4 	add.w	r6, r9, #196	; 0xc4
 800029e:	f1ba 0f00 	cmp.w	sl, #0
 80002a2:	d111      	bne.n	80002c8 <_ZN7CKodama12rotate_robotEllPFlvE+0x58>
 80002a4:	4638      	mov	r0, r7
 80002a6:	f001 f945 	bl	8001534 <_ZN4CIMU8imu_readEv>
 80002aa:	4638      	mov	r0, r7
 80002ac:	f001 fa66 	bl	800177c <_ZN4CIMU14get_imu_resultEv>
 80002b0:	6884      	ldr	r4, [r0, #8]
 80002b2:	ebc4 0408 	rsb	r4, r4, r8
 80002b6:	2c00      	cmp	r4, #0
 80002b8:	bfcc      	ite	gt
 80002ba:	2301      	movgt	r3, #1
 80002bc:	f04f 33ff 	movle.w	r3, #4294967295	; 0xffffffff
 80002c0:	455d      	cmp	r5, fp
 80002c2:	da15      	bge.n	80002f0 <_ZN7CKodama12rotate_robotEllPFlvE+0x80>
 80002c4:	3501      	adds	r5, #1
 80002c6:	e013      	b.n	80002f0 <_ZN7CKodama12rotate_robotEllPFlvE+0x80>
 80002c8:	47d0      	blx	sl
 80002ca:	2800      	cmp	r0, #0
 80002cc:	d0ea      	beq.n	80002a4 <_ZN7CKodama12rotate_robotEllPFlvE+0x34>
 80002ce:	2100      	movs	r1, #0
 80002d0:	4630      	mov	r0, r6
 80002d2:	460a      	mov	r2, r1
 80002d4:	f000 fe7a 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 80002d8:	4630      	mov	r0, r6
 80002da:	2101      	movs	r1, #1
 80002dc:	2200      	movs	r2, #0
 80002de:	f000 fe75 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 80002e2:	480d      	ldr	r0, [pc, #52]	; (8000318 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 80002e4:	2114      	movs	r1, #20
 80002e6:	b003      	add	sp, #12
 80002e8:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80002ec:	f000 bc06 	b.w	8000afc <_ZN6CTimer8delay_msEm>
 80002f0:	fb03 f205 	mul.w	r2, r3, r5
 80002f4:	4630      	mov	r0, r6
 80002f6:	2100      	movs	r1, #0
 80002f8:	9301      	str	r3, [sp, #4]
 80002fa:	f000 fe67 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 80002fe:	9b01      	ldr	r3, [sp, #4]
 8000300:	426a      	negs	r2, r5
 8000302:	4630      	mov	r0, r6
 8000304:	2101      	movs	r1, #1
 8000306:	435a      	muls	r2, r3
 8000308:	f000 fe60 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 800030c:	2c00      	cmp	r4, #0
 800030e:	bfb8      	it	lt
 8000310:	4264      	neglt	r4, r4
 8000312:	2c31      	cmp	r4, #49	; 0x31
 8000314:	dcbd      	bgt.n	8000292 <_ZN7CKodama12rotate_robotEllPFlvE+0x22>
 8000316:	e7da      	b.n	80002ce <_ZN7CKodama12rotate_robotEllPFlvE+0x5e>
 8000318:	20000144 	.word	0x20000144

0800031c <_ZN5CWifiC1Ev>:
 800031c:	4770      	bx	lr

0800031e <_ZN5CWifiD1Ev>:
 800031e:	4770      	bx	lr

08000320 <_ZN5CWifi12esp8266_sendEPc>:
 8000320:	b510      	push	{r4, lr}
 8000322:	1e4c      	subs	r4, r1, #1
 8000324:	f814 1f01 	ldrb.w	r1, [r4, #1]!
 8000328:	b119      	cbz	r1, 8000332 <_ZN5CWifi12esp8266_sendEPc+0x12>
 800032a:	4802      	ldr	r0, [pc, #8]	; (8000334 <_ZN5CWifi12esp8266_sendEPc+0x14>)
 800032c:	f001 fb44 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8000330:	e7f8      	b.n	8000324 <_ZN5CWifi12esp8266_sendEPc+0x4>
 8000332:	bd10      	pop	{r4, pc}
 8000334:	20000038 	.word	0x20000038

08000338 <_ZN5CWifi17esp8266_send_uintEj>:
 8000338:	b530      	push	{r4, r5, lr}
 800033a:	b085      	sub	sp, #20
 800033c:	2300      	movs	r3, #0
 800033e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000342:	220a      	movs	r2, #10
 8000344:	230a      	movs	r3, #10
 8000346:	ac01      	add	r4, sp, #4
 8000348:	fbb1 f5f3 	udiv	r5, r1, r3
 800034c:	fb03 1315 	mls	r3, r3, r5, r1
 8000350:	3330      	adds	r3, #48	; 0x30
 8000352:	5513      	strb	r3, [r2, r4]
 8000354:	4629      	mov	r1, r5
 8000356:	1e53      	subs	r3, r2, #1
 8000358:	b10d      	cbz	r5, 800035e <_ZN5CWifi17esp8266_send_uintEj+0x26>
 800035a:	461a      	mov	r2, r3
 800035c:	e7f2      	b.n	8000344 <_ZN5CWifi17esp8266_send_uintEj+0xc>
 800035e:	18a1      	adds	r1, r4, r2
 8000360:	f7ff ffde 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000364:	b005      	add	sp, #20
 8000366:	bd30      	pop	{r4, r5, pc}

08000368 <_ZN5CWifi19esp8266_find_streamEPcjj>:
 8000368:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800036a:	4815      	ldr	r0, [pc, #84]	; (80003c0 <_ZN5CWifi19esp8266_find_streamEPcjj+0x58>)
 800036c:	461d      	mov	r5, r3
 800036e:	460e      	mov	r6, r1
 8000370:	4617      	mov	r7, r2
 8000372:	f000 fbb5 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 8000376:	4405      	add	r5, r0
 8000378:	4812      	ldr	r0, [pc, #72]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 800037a:	f001 fa8b 	bl	8001894 <_ZN9CTerminal12clear_bufferEv>
 800037e:	2400      	movs	r4, #0
 8000380:	4810      	ldr	r0, [pc, #64]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 8000382:	f001 fb25 	bl	80019d0 <_ZN9CTerminal6ischarEv>
 8000386:	f64f 73ff 	movw	r3, #65535	; 0xffff
 800038a:	4298      	cmp	r0, r3
 800038c:	d00d      	beq.n	80003aa <_ZN5CWifi19esp8266_find_streamEPcjj+0x42>
 800038e:	5d33      	ldrb	r3, [r6, r4]
 8000390:	4298      	cmp	r0, r3
 8000392:	d109      	bne.n	80003a8 <_ZN5CWifi19esp8266_find_streamEPcjj+0x40>
 8000394:	1e7b      	subs	r3, r7, #1
 8000396:	429c      	cmp	r4, r3
 8000398:	d201      	bcs.n	800039e <_ZN5CWifi19esp8266_find_streamEPcjj+0x36>
 800039a:	3401      	adds	r4, #1
 800039c:	e005      	b.n	80003aa <_ZN5CWifi19esp8266_find_streamEPcjj+0x42>
 800039e:	4809      	ldr	r0, [pc, #36]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 80003a0:	f001 fa78 	bl	8001894 <_ZN9CTerminal12clear_bufferEv>
 80003a4:	2001      	movs	r0, #1
 80003a6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80003a8:	2400      	movs	r4, #0
 80003aa:	4805      	ldr	r0, [pc, #20]	; (80003c0 <_ZN5CWifi19esp8266_find_streamEPcjj+0x58>)
 80003ac:	f000 fb98 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 80003b0:	42a8      	cmp	r0, r5
 80003b2:	d3e5      	bcc.n	8000380 <_ZN5CWifi19esp8266_find_streamEPcjj+0x18>
 80003b4:	4803      	ldr	r0, [pc, #12]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 80003b6:	f001 fa6d 	bl	8001894 <_ZN9CTerminal12clear_bufferEv>
 80003ba:	2000      	movs	r0, #0
 80003bc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80003be:	bf00      	nop
 80003c0:	20000144 	.word	0x20000144
 80003c4:	20000038 	.word	0x20000038

080003c8 <_ZN5CWifi12esp8266_initEv>:
 80003c8:	b510      	push	{r4, lr}
 80003ca:	2300      	movs	r3, #0
 80003cc:	4604      	mov	r4, r0
 80003ce:	f640 31b8 	movw	r1, #3000	; 0xbb8
 80003d2:	6003      	str	r3, [r0, #0]
 80003d4:	4822      	ldr	r0, [pc, #136]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003d6:	f000 fb91 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80003da:	7923      	ldrb	r3, [r4, #4]
 80003dc:	2b01      	cmp	r3, #1
 80003de:	bf0c      	ite	eq
 80003e0:	4920      	ldreq	r1, [pc, #128]	; (8000464 <_ZN5CWifi12esp8266_initEv+0x9c>)
 80003e2:	4921      	ldrne	r1, [pc, #132]	; (8000468 <_ZN5CWifi12esp8266_initEv+0xa0>)
 80003e4:	4620      	mov	r0, r4
 80003e6:	f7ff ff9b 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80003ea:	481d      	ldr	r0, [pc, #116]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003ec:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 80003f0:	f000 fb84 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80003f4:	4620      	mov	r0, r4
 80003f6:	491d      	ldr	r1, [pc, #116]	; (800046c <_ZN5CWifi12esp8266_initEv+0xa4>)
 80003f8:	f7ff ff92 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80003fc:	4818      	ldr	r0, [pc, #96]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003fe:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 8000402:	f000 fb7b 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8000406:	4620      	mov	r0, r4
 8000408:	4919      	ldr	r1, [pc, #100]	; (8000470 <_ZN5CWifi12esp8266_initEv+0xa8>)
 800040a:	f7ff ff89 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800040e:	4620      	mov	r0, r4
 8000410:	4918      	ldr	r1, [pc, #96]	; (8000474 <_ZN5CWifi12esp8266_initEv+0xac>)
 8000412:	f7ff ff85 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000416:	4620      	mov	r0, r4
 8000418:	4917      	ldr	r1, [pc, #92]	; (8000478 <_ZN5CWifi12esp8266_initEv+0xb0>)
 800041a:	f7ff ff81 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800041e:	4620      	mov	r0, r4
 8000420:	4916      	ldr	r1, [pc, #88]	; (800047c <_ZN5CWifi12esp8266_initEv+0xb4>)
 8000422:	f7ff ff7d 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000426:	4620      	mov	r0, r4
 8000428:	4915      	ldr	r1, [pc, #84]	; (8000480 <_ZN5CWifi12esp8266_initEv+0xb8>)
 800042a:	f7ff ff79 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800042e:	4620      	mov	r0, r4
 8000430:	4914      	ldr	r1, [pc, #80]	; (8000484 <_ZN5CWifi12esp8266_initEv+0xbc>)
 8000432:	2202      	movs	r2, #2
 8000434:	f644 6320 	movw	r3, #20000	; 0x4e20
 8000438:	f7ff ff96 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 800043c:	b158      	cbz	r0, 8000456 <_ZN5CWifi12esp8266_initEv+0x8e>
 800043e:	7923      	ldrb	r3, [r4, #4]
 8000440:	2b01      	cmp	r3, #1
 8000442:	d10b      	bne.n	800045c <_ZN5CWifi12esp8266_initEv+0x94>
 8000444:	4620      	mov	r0, r4
 8000446:	4910      	ldr	r1, [pc, #64]	; (8000488 <_ZN5CWifi12esp8266_initEv+0xc0>)
 8000448:	f7ff ff6a 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800044c:	4804      	ldr	r0, [pc, #16]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 800044e:	21c8      	movs	r1, #200	; 0xc8
 8000450:	f000 fb54 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8000454:	e002      	b.n	800045c <_ZN5CWifi12esp8266_initEv+0x94>
 8000456:	f06f 0001 	mvn.w	r0, #1
 800045a:	bd10      	pop	{r4, pc}
 800045c:	2000      	movs	r0, #0
 800045e:	bd10      	pop	{r4, pc}
 8000460:	20000144 	.word	0x20000144
 8000464:	08002fac 	.word	0x08002fac
 8000468:	08002fba 	.word	0x08002fba
 800046c:	08002fc8 	.word	0x08002fc8
 8000470:	08002fd6 	.word	0x08002fd6
 8000474:	08002fe1 	.word	0x08002fe1
 8000478:	08003030 	.word	0x08003030
 800047c:	08002feb 	.word	0x08002feb
 8000480:	08002ffa 	.word	0x08002ffa
 8000484:	08003052 	.word	0x08003052
 8000488:	08002ffe 	.word	0x08002ffe

0800048c <_ZN5CWifi4initEh>:
 800048c:	b510      	push	{r4, lr}
 800048e:	2264      	movs	r2, #100	; 0x64
 8000490:	4604      	mov	r4, r0
 8000492:	7101      	strb	r1, [r0, #4]
 8000494:	4809      	ldr	r0, [pc, #36]	; (80004bc <_ZN5CWifi4initEh+0x30>)
 8000496:	2102      	movs	r1, #2
 8000498:	f001 fc64 	bl	8001d64 <_ZN5CILED9i_led_setEjj>
 800049c:	4620      	mov	r0, r4
 800049e:	f7ff ff93 	bl	80003c8 <_ZN5CWifi12esp8266_initEv>
 80004a2:	4604      	mov	r4, r0
 80004a4:	4805      	ldr	r0, [pc, #20]	; (80004bc <_ZN5CWifi4initEh+0x30>)
 80004a6:	b91c      	cbnz	r4, 80004b0 <_ZN5CWifi4initEh+0x24>
 80004a8:	2102      	movs	r1, #2
 80004aa:	f44f 7296 	mov.w	r2, #300	; 0x12c
 80004ae:	e001      	b.n	80004b4 <_ZN5CWifi4initEh+0x28>
 80004b0:	2103      	movs	r1, #3
 80004b2:	2208      	movs	r2, #8
 80004b4:	f001 fc56 	bl	8001d64 <_ZN5CILED9i_led_setEjj>
 80004b8:	4620      	mov	r0, r4
 80004ba:	bd10      	pop	{r4, pc}
 80004bc:	20000198 	.word	0x20000198

080004c0 <_ZN5CWifi23esp8266_get_nonblockingEPcjj>:
 80004c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80004c2:	4617      	mov	r7, r2
 80004c4:	461d      	mov	r5, r3
 80004c6:	460c      	mov	r4, r1
 80004c8:	460a      	mov	r2, r1
 80004ca:	19cb      	adds	r3, r1, r7
 80004cc:	429a      	cmp	r2, r3
 80004ce:	d003      	beq.n	80004d8 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x18>
 80004d0:	2100      	movs	r1, #0
 80004d2:	f802 1b01 	strb.w	r1, [r2], #1
 80004d6:	e7f9      	b.n	80004cc <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0xc>
 80004d8:	4815      	ldr	r0, [pc, #84]	; (8000530 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x70>)
 80004da:	f000 fb01 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 80004de:	1946      	adds	r6, r0, r5
 80004e0:	b944      	cbnz	r4, 80004f4 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x34>
 80004e2:	4629      	mov	r1, r5
 80004e4:	4812      	ldr	r0, [pc, #72]	; (8000530 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x70>)
 80004e6:	f000 fb09 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80004ea:	4812      	ldr	r0, [pc, #72]	; (8000534 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x74>)
 80004ec:	f001 f9d2 	bl	8001894 <_ZN9CTerminal12clear_bufferEv>
 80004f0:	4620      	mov	r0, r4
 80004f2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80004f4:	2500      	movs	r5, #0
 80004f6:	480f      	ldr	r0, [pc, #60]	; (8000534 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x74>)
 80004f8:	f001 fa6a 	bl	80019d0 <_ZN9CTerminal6ischarEv>
 80004fc:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000500:	4298      	cmp	r0, r3
 8000502:	bf1c      	itt	ne
 8000504:	5560      	strbne	r0, [r4, r5]
 8000506:	3501      	addne	r5, #1
 8000508:	4809      	ldr	r0, [pc, #36]	; (8000530 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x70>)
 800050a:	f000 fae9 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 800050e:	42bd      	cmp	r5, r7
 8000510:	d207      	bcs.n	8000522 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x62>
 8000512:	4286      	cmp	r6, r0
 8000514:	d8ef      	bhi.n	80004f6 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x36>
 8000516:	42b0      	cmp	r0, r6
 8000518:	bf94      	ite	ls
 800051a:	4628      	movls	r0, r5
 800051c:	f04f 30ff 	movhi.w	r0, #4294967295	; 0xffffffff
 8000520:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000522:	42b0      	cmp	r0, r6
 8000524:	bf94      	ite	ls
 8000526:	f06f 0001 	mvnls.w	r0, #1
 800052a:	f04f 30ff 	movhi.w	r0, #4294967295	; 0xffffffff
 800052e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000530:	20000144 	.word	0x20000144
 8000534:	20000038 	.word	0x20000038

08000538 <_ZN5CWifi7connectEPcjS0_jS0_j>:
 8000538:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800053c:	ae08      	add	r6, sp, #32
 800053e:	e896 01c0 	ldmia.w	r6, {r6, r7, r8}
 8000542:	4691      	mov	r9, r2
 8000544:	461d      	mov	r5, r3
 8000546:	4604      	mov	r4, r0
 8000548:	468a      	mov	sl, r1
 800054a:	463b      	mov	r3, r7
 800054c:	eb07 0208 	add.w	r2, r7, r8
 8000550:	4293      	cmp	r3, r2
 8000552:	d003      	beq.n	800055c <_ZN5CWifi7connectEPcjS0_jS0_j+0x24>
 8000554:	2100      	movs	r1, #0
 8000556:	f803 1b01 	strb.w	r1, [r3], #1
 800055a:	e7f9      	b.n	8000550 <_ZN5CWifi7connectEPcjS0_jS0_j+0x18>
 800055c:	6823      	ldr	r3, [r4, #0]
 800055e:	2b01      	cmp	r3, #1
 8000560:	d02a      	beq.n	80005b8 <_ZN5CWifi7connectEPcjS0_jS0_j+0x80>
 8000562:	4620      	mov	r0, r4
 8000564:	494b      	ldr	r1, [pc, #300]	; (8000694 <_ZN5CWifi7connectEPcjS0_jS0_j+0x15c>)
 8000566:	f7ff fedb 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800056a:	484b      	ldr	r0, [pc, #300]	; (8000698 <_ZN5CWifi7connectEPcjS0_jS0_j+0x160>)
 800056c:	2164      	movs	r1, #100	; 0x64
 800056e:	f000 fac5 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8000572:	4620      	mov	r0, r4
 8000574:	4949      	ldr	r1, [pc, #292]	; (800069c <_ZN5CWifi7connectEPcjS0_jS0_j+0x164>)
 8000576:	f7ff fed3 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800057a:	4620      	mov	r0, r4
 800057c:	4651      	mov	r1, sl
 800057e:	f7ff fecf 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000582:	4620      	mov	r0, r4
 8000584:	4946      	ldr	r1, [pc, #280]	; (80006a0 <_ZN5CWifi7connectEPcjS0_jS0_j+0x168>)
 8000586:	f7ff fecb 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800058a:	4620      	mov	r0, r4
 800058c:	4649      	mov	r1, r9
 800058e:	f7ff fed3 	bl	8000338 <_ZN5CWifi17esp8266_send_uintEj>
 8000592:	4620      	mov	r0, r4
 8000594:	4943      	ldr	r1, [pc, #268]	; (80006a4 <_ZN5CWifi7connectEPcjS0_jS0_j+0x16c>)
 8000596:	f7ff fec3 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800059a:	4620      	mov	r0, r4
 800059c:	4942      	ldr	r1, [pc, #264]	; (80006a8 <_ZN5CWifi7connectEPcjS0_jS0_j+0x170>)
 800059e:	2207      	movs	r2, #7
 80005a0:	f240 53dc 	movw	r3, #1500	; 0x5dc
 80005a4:	f7ff fee0 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 80005a8:	b920      	cbnz	r0, 80005b4 <_ZN5CWifi7connectEPcjS0_jS0_j+0x7c>
 80005aa:	6020      	str	r0, [r4, #0]
 80005ac:	f06f 0002 	mvn.w	r0, #2
 80005b0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80005b4:	2301      	movs	r3, #1
 80005b6:	6023      	str	r3, [r4, #0]
 80005b8:	4620      	mov	r0, r4
 80005ba:	493c      	ldr	r1, [pc, #240]	; (80006ac <_ZN5CWifi7connectEPcjS0_jS0_j+0x174>)
 80005bc:	f7ff feb0 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80005c0:	4620      	mov	r0, r4
 80005c2:	4631      	mov	r1, r6
 80005c4:	f7ff feb8 	bl	8000338 <_ZN5CWifi17esp8266_send_uintEj>
 80005c8:	4620      	mov	r0, r4
 80005ca:	4936      	ldr	r1, [pc, #216]	; (80006a4 <_ZN5CWifi7connectEPcjS0_jS0_j+0x16c>)
 80005cc:	f7ff fea8 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80005d0:	4620      	mov	r0, r4
 80005d2:	4937      	ldr	r1, [pc, #220]	; (80006b0 <_ZN5CWifi7connectEPcjS0_jS0_j+0x178>)
 80005d4:	2201      	movs	r2, #1
 80005d6:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 80005da:	f7ff fec5 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 80005de:	4681      	mov	r9, r0
 80005e0:	b108      	cbz	r0, 80005e6 <_ZN5CWifi7connectEPcjS0_jS0_j+0xae>
 80005e2:	442e      	add	r6, r5
 80005e4:	e00d      	b.n	8000602 <_ZN5CWifi7connectEPcjS0_jS0_j+0xca>
 80005e6:	4620      	mov	r0, r4
 80005e8:	492a      	ldr	r1, [pc, #168]	; (8000694 <_ZN5CWifi7connectEPcjS0_jS0_j+0x15c>)
 80005ea:	f7ff fe99 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80005ee:	482a      	ldr	r0, [pc, #168]	; (8000698 <_ZN5CWifi7connectEPcjS0_jS0_j+0x160>)
 80005f0:	2164      	movs	r1, #100	; 0x64
 80005f2:	f000 fa83 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80005f6:	f8c4 9000 	str.w	r9, [r4]
 80005fa:	f06f 0003 	mvn.w	r0, #3
 80005fe:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000602:	42b5      	cmp	r5, r6
 8000604:	d005      	beq.n	8000612 <_ZN5CWifi7connectEPcjS0_jS0_j+0xda>
 8000606:	482b      	ldr	r0, [pc, #172]	; (80006b4 <_ZN5CWifi7connectEPcjS0_jS0_j+0x17c>)
 8000608:	f815 1b01 	ldrb.w	r1, [r5], #1
 800060c:	f001 f9d4 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8000610:	e7f7      	b.n	8000602 <_ZN5CWifi7connectEPcjS0_jS0_j+0xca>
 8000612:	4620      	mov	r0, r4
 8000614:	4928      	ldr	r1, [pc, #160]	; (80006b8 <_ZN5CWifi7connectEPcjS0_jS0_j+0x180>)
 8000616:	2207      	movs	r2, #7
 8000618:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 800061c:	f7ff fea4 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 8000620:	4605      	mov	r5, r0
 8000622:	4620      	mov	r0, r4
 8000624:	b95d      	cbnz	r5, 800063e <_ZN5CWifi7connectEPcjS0_jS0_j+0x106>
 8000626:	491b      	ldr	r1, [pc, #108]	; (8000694 <_ZN5CWifi7connectEPcjS0_jS0_j+0x15c>)
 8000628:	f7ff fe7a 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800062c:	481a      	ldr	r0, [pc, #104]	; (8000698 <_ZN5CWifi7connectEPcjS0_jS0_j+0x160>)
 800062e:	2164      	movs	r1, #100	; 0x64
 8000630:	f000 fa64 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8000634:	6025      	str	r5, [r4, #0]
 8000636:	f06f 0004 	mvn.w	r0, #4
 800063a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800063e:	491f      	ldr	r1, [pc, #124]	; (80006bc <_ZN5CWifi7connectEPcjS0_jS0_j+0x184>)
 8000640:	2205      	movs	r2, #5
 8000642:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8000646:	f7ff fe8f 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 800064a:	4605      	mov	r5, r0
 800064c:	b960      	cbnz	r0, 8000668 <_ZN5CWifi7connectEPcjS0_jS0_j+0x130>
 800064e:	4620      	mov	r0, r4
 8000650:	4910      	ldr	r1, [pc, #64]	; (8000694 <_ZN5CWifi7connectEPcjS0_jS0_j+0x15c>)
 8000652:	f7ff fe65 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000656:	4810      	ldr	r0, [pc, #64]	; (8000698 <_ZN5CWifi7connectEPcjS0_jS0_j+0x160>)
 8000658:	2164      	movs	r1, #100	; 0x64
 800065a:	f000 fa4f 	bl	8000afc <_ZN6CTimer8delay_msEm>
 800065e:	6025      	str	r5, [r4, #0]
 8000660:	f06f 0005 	mvn.w	r0, #5
 8000664:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000668:	2500      	movs	r5, #0
 800066a:	4812      	ldr	r0, [pc, #72]	; (80006b4 <_ZN5CWifi7connectEPcjS0_jS0_j+0x17c>)
 800066c:	f001 f9cc 	bl	8001a08 <_ZN9CTerminal7getcharEv>
 8000670:	b2c0      	uxtb	r0, r0
 8000672:	283a      	cmp	r0, #58	; 0x3a
 8000674:	d005      	beq.n	8000682 <_ZN5CWifi7connectEPcjS0_jS0_j+0x14a>
 8000676:	230a      	movs	r3, #10
 8000678:	fb03 0005 	mla	r0, r3, r5, r0
 800067c:	f1a0 0530 	sub.w	r5, r0, #48	; 0x30
 8000680:	e7f3      	b.n	800066a <_ZN5CWifi7connectEPcjS0_jS0_j+0x132>
 8000682:	4620      	mov	r0, r4
 8000684:	4639      	mov	r1, r7
 8000686:	4642      	mov	r2, r8
 8000688:	2314      	movs	r3, #20
 800068a:	f7ff ff19 	bl	80004c0 <_ZN5CWifi23esp8266_get_nonblockingEPcjj>
 800068e:	4628      	mov	r0, r5
 8000690:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000694:	08003012 	.word	0x08003012
 8000698:	20000144 	.word	0x20000144
 800069c:	08003020 	.word	0x08003020
 80006a0:	08003034 	.word	0x08003034
 80006a4:	08002ffb 	.word	0x08002ffb
 80006a8:	08003037 	.word	0x08003037
 80006ac:	0800303f 	.word	0x0800303f
 80006b0:	0800304b 	.word	0x0800304b
 80006b4:	20000038 	.word	0x20000038
 80006b8:	0800304d 	.word	0x0800304d
 80006bc:	08003055 	.word	0x08003055

080006c0 <_ZN5CWifi17connect_send_dataEjPhj>:
 80006c0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80006c2:	4605      	mov	r5, r0
 80006c4:	b099      	sub	sp, #100	; 0x64
 80006c6:	4811      	ldr	r0, [pc, #68]	; (800070c <_ZN5CWifi17connect_send_dataEjPhj+0x4c>)
 80006c8:	460f      	mov	r7, r1
 80006ca:	461c      	mov	r4, r3
 80006cc:	4616      	mov	r6, r2
 80006ce:	f001 fbd9 	bl	8001e84 <_ZN9CUniqueID13get_unique_idEv>
 80006d2:	4b0f      	ldr	r3, [pc, #60]	; (8000710 <_ZN5CWifi17connect_send_dataEjPhj+0x50>)
 80006d4:	9005      	str	r0, [sp, #20]
 80006d6:	9306      	str	r3, [sp, #24]
 80006d8:	9707      	str	r7, [sp, #28]
 80006da:	2100      	movs	r1, #0
 80006dc:	42a1      	cmp	r1, r4
 80006de:	d005      	beq.n	80006ec <_ZN5CWifi17connect_send_dataEjPhj+0x2c>
 80006e0:	ab05      	add	r3, sp, #20
 80006e2:	440b      	add	r3, r1
 80006e4:	5c72      	ldrb	r2, [r6, r1]
 80006e6:	731a      	strb	r2, [r3, #12]
 80006e8:	3101      	adds	r1, #1
 80006ea:	e7f7      	b.n	80006dc <_ZN5CWifi17connect_send_dataEjPhj+0x1c>
 80006ec:	2400      	movs	r4, #0
 80006ee:	234c      	movs	r3, #76	; 0x4c
 80006f0:	e88d 0018 	stmia.w	sp, {r3, r4}
 80006f4:	9402      	str	r4, [sp, #8]
 80006f6:	4628      	mov	r0, r5
 80006f8:	4906      	ldr	r1, [pc, #24]	; (8000714 <_ZN5CWifi17connect_send_dataEjPhj+0x54>)
 80006fa:	f240 72da 	movw	r2, #2010	; 0x7da
 80006fe:	ab05      	add	r3, sp, #20
 8000700:	f7ff ff1a 	bl	8000538 <_ZN5CWifi7connectEPcjS0_jS0_j>
 8000704:	4620      	mov	r0, r4
 8000706:	b019      	add	sp, #100	; 0x64
 8000708:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800070a:	bf00      	nop
 800070c:	20000038 	.word	0x20000038
 8000710:	cafe2357 	.word	0xcafe2357
 8000714:	0800305b 	.word	0x0800305b

08000718 <_ZN5CWifi11client_demoEv>:
 8000718:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800071a:	4604      	mov	r4, r0
 800071c:	4813      	ldr	r0, [pc, #76]	; (800076c <_ZN5CWifi11client_demoEv+0x54>)
 800071e:	f000 f9df 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 8000722:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8000726:	fbb0 f0f3 	udiv	r0, r0, r3
 800072a:	4b11      	ldr	r3, [pc, #68]	; (8000770 <_ZN5CWifi11client_demoEv+0x58>)
 800072c:	9001      	str	r0, [sp, #4]
 800072e:	9302      	str	r3, [sp, #8]
 8000730:	4810      	ldr	r0, [pc, #64]	; (8000774 <_ZN5CWifi11client_demoEv+0x5c>)
 8000732:	4b11      	ldr	r3, [pc, #68]	; (8000778 <_ZN5CWifi11client_demoEv+0x60>)
 8000734:	9303      	str	r3, [sp, #12]
 8000736:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800073a:	f001 f873 	bl	8001824 <_ZN5CGPIO7gpio_onEm>
 800073e:	aa01      	add	r2, sp, #4
 8000740:	4620      	mov	r0, r4
 8000742:	2100      	movs	r1, #0
 8000744:	230c      	movs	r3, #12
 8000746:	f7ff ffbb 	bl	80006c0 <_ZN5CWifi17connect_send_dataEjPhj>
 800074a:	aa01      	add	r2, sp, #4
 800074c:	230c      	movs	r3, #12
 800074e:	4620      	mov	r0, r4
 8000750:	2100      	movs	r1, #0
 8000752:	f7ff ffb5 	bl	80006c0 <_ZN5CWifi17connect_send_dataEjPhj>
 8000756:	4807      	ldr	r0, [pc, #28]	; (8000774 <_ZN5CWifi11client_demoEv+0x5c>)
 8000758:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800075c:	f001 f870 	bl	8001840 <_ZN5CGPIO8gpio_offEm>
 8000760:	4802      	ldr	r0, [pc, #8]	; (800076c <_ZN5CWifi11client_demoEv+0x54>)
 8000762:	2164      	movs	r1, #100	; 0x64
 8000764:	f000 f9ca 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8000768:	e7d8      	b.n	800071c <_ZN5CWifi11client_demoEv+0x4>
 800076a:	bf00      	nop
 800076c:	20000144 	.word	0x20000144
 8000770:	cafecafe 	.word	0xcafecafe
 8000774:	20000038 	.word	0x20000038
 8000778:	0004cb2f 	.word	0x0004cb2f

0800077c <_ZN13CLinePositionC1Ev>:
 800077c:	2200      	movs	r2, #0
 800077e:	6082      	str	r2, [r0, #8]
 8000780:	60c2      	str	r2, [r0, #12]
 8000782:	6102      	str	r2, [r0, #16]
 8000784:	6142      	str	r2, [r0, #20]
 8000786:	6042      	str	r2, [r0, #4]
 8000788:	2200      	movs	r2, #0
 800078a:	7002      	strb	r2, [r0, #0]
 800078c:	4770      	bx	lr
	...

08000790 <_ZN13CLinePosition7processEP10sRGBResult>:
 8000790:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000794:	2300      	movs	r3, #0
 8000796:	f101 0816 	add.w	r8, r1, #22
 800079a:	ed2d 8b02 	vpush	{d8}
 800079e:	460d      	mov	r5, r1
 80007a0:	4604      	mov	r4, r0
 80007a2:	7003      	strb	r3, [r0, #0]
 80007a4:	4641      	mov	r1, r8
 80007a6:	461a      	mov	r2, r3
 80007a8:	f103 000c 	add.w	r0, r3, #12
 80007ac:	f931 6f02 	ldrsh.w	r6, [r1, #2]!
 80007b0:	f935 0010 	ldrsh.w	r0, [r5, r0, lsl #1]
 80007b4:	4286      	cmp	r6, r0
 80007b6:	bfb8      	it	lt
 80007b8:	4613      	movlt	r3, r2
 80007ba:	3201      	adds	r2, #1
 80007bc:	2a04      	cmp	r2, #4
 80007be:	d1f3      	bne.n	80007a8 <_ZN13CLinePosition7processEP10sRGBResult+0x18>
 80007c0:	330c      	adds	r3, #12
 80007c2:	eddf 7a3b 	vldr	s15, [pc, #236]	; 80008b0 <_ZN13CLinePosition7processEP10sRGBResult+0x120>
 80007c6:	f935 3013 	ldrsh.w	r3, [r5, r3, lsl #1]
 80007ca:	ee07 3a10 	vmov	s14, r3
 80007ce:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80007d2:	eeb0 8a67 	vmov.f32	s16, s15
 80007d6:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80007da:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80007de:	d563      	bpl.n	80008a8 <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 80007e0:	f104 0608 	add.w	r6, r4, #8
 80007e4:	eddf 8a33 	vldr	s17, [pc, #204]	; 80008b4 <_ZN13CLinePosition7processEP10sRGBResult+0x124>
 80007e8:	f104 0918 	add.w	r9, r4, #24
 80007ec:	4637      	mov	r7, r6
 80007ee:	f938 3f02 	ldrsh.w	r3, [r8, #2]!
 80007f2:	4831      	ldr	r0, [pc, #196]	; (80008b8 <_ZN13CLinePosition7processEP10sRGBResult+0x128>)
 80007f4:	425b      	negs	r3, r3
 80007f6:	ee00 3a10 	vmov	s0, r3
 80007fa:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
 80007fe:	eca7 0a01 	vstmia	r7!, {s0}
 8000802:	f000 f8b1 	bl	8000968 <_ZN5CMath3absEf>
 8000806:	eef4 8ac0 	vcmpe.f32	s17, s0
 800080a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800080e:	d506      	bpl.n	800081e <_ZN13CLinePosition7processEP10sRGBResult+0x8e>
 8000810:	4829      	ldr	r0, [pc, #164]	; (80008b8 <_ZN13CLinePosition7processEP10sRGBResult+0x128>)
 8000812:	ed17 0a01 	vldr	s0, [r7, #-4]
 8000816:	f000 f8a7 	bl	8000968 <_ZN5CMath3absEf>
 800081a:	eef0 8a40 	vmov.f32	s17, s0
 800081e:	454f      	cmp	r7, r9
 8000820:	d1e5      	bne.n	80007ee <_ZN13CLinePosition7processEP10sRGBResult+0x5e>
 8000822:	edd6 7a00 	vldr	s15, [r6]
 8000826:	eec7 7aa8 	vdiv.f32	s15, s15, s17
 800082a:	ece6 7a01 	vstmia	r6!, {s15}
 800082e:	454e      	cmp	r6, r9
 8000830:	d1f7      	bne.n	8000822 <_ZN13CLinePosition7processEP10sRGBResult+0x92>
 8000832:	2301      	movs	r3, #1
 8000834:	7023      	strb	r3, [r4, #0]
 8000836:	f9b5 3018 	ldrsh.w	r3, [r5, #24]
 800083a:	eddf 7a1d 	vldr	s15, [pc, #116]	; 80008b0 <_ZN13CLinePosition7processEP10sRGBResult+0x120>
 800083e:	ee07 3a10 	vmov	s14, r3
 8000842:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000846:	eeb4 7ac8 	vcmpe.f32	s14, s16
 800084a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800084e:	d501      	bpl.n	8000854 <_ZN13CLinePosition7processEP10sRGBResult+0xc4>
 8000850:	4b1a      	ldr	r3, [pc, #104]	; (80008bc <_ZN13CLinePosition7processEP10sRGBResult+0x12c>)
 8000852:	e028      	b.n	80008a6 <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 8000854:	f9b5 301e 	ldrsh.w	r3, [r5, #30]
 8000858:	ee07 3a10 	vmov	s14, r3
 800085c:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000860:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000864:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000868:	d502      	bpl.n	8000870 <_ZN13CLinePosition7processEP10sRGBResult+0xe0>
 800086a:	f04f 537e 	mov.w	r3, #1065353216	; 0x3f800000
 800086e:	e01a      	b.n	80008a6 <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 8000870:	f9b5 301a 	ldrsh.w	r3, [r5, #26]
 8000874:	ee07 3a10 	vmov	s14, r3
 8000878:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 800087c:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000880:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000884:	d502      	bpl.n	800088c <_ZN13CLinePosition7processEP10sRGBResult+0xfc>
 8000886:	f04f 433f 	mov.w	r3, #3204448256	; 0xbf000000
 800088a:	e00c      	b.n	80008a6 <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 800088c:	f9b5 301c 	ldrsh.w	r3, [r5, #28]
 8000890:	ee07 3a10 	vmov	s14, r3
 8000894:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000898:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800089c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80008a0:	d502      	bpl.n	80008a8 <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 80008a2:	f04f 537c 	mov.w	r3, #1056964608	; 0x3f000000
 80008a6:	6063      	str	r3, [r4, #4]
 80008a8:	ecbd 8b02 	vpop	{d8}
 80008ac:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80008b0:	c2a00000 	.word	0xc2a00000
 80008b4:	38d1b717 	.word	0x38d1b717
 80008b8:	20000110 	.word	0x20000110
 80008bc:	bf800000 	.word	0xbf800000

080008c0 <_ZN13CLinePosition7on_lineEv>:
 80008c0:	7800      	ldrb	r0, [r0, #0]
 80008c2:	4770      	bx	lr

080008c4 <_ZN13CLinePosition17get_line_positionEv>:
 80008c4:	ed90 0a01 	vldr	s0, [r0, #4]
 80008c8:	4770      	bx	lr

080008ca <_ZN4CPID4initEffff>:
 80008ca:	eef0 7a00 	vmov.f32	s15, #0	; 0x40000000  2.0
 80008ce:	ee70 0a20 	vadd.f32	s1, s0, s1
 80008d2:	ee91 0a67 	vfnma.f32	s0, s2, s15
 80008d6:	2300      	movs	r3, #0
 80008d8:	6003      	str	r3, [r0, #0]
 80008da:	ee70 0a81 	vadd.f32	s1, s1, s2
 80008de:	6043      	str	r3, [r0, #4]
 80008e0:	6083      	str	r3, [r0, #8]
 80008e2:	edc0 0a03 	vstr	s1, [r0, #12]
 80008e6:	ed80 0a04 	vstr	s0, [r0, #16]
 80008ea:	ed80 1a05 	vstr	s2, [r0, #20]
 80008ee:	6183      	str	r3, [r0, #24]
 80008f0:	edc0 1a07 	vstr	s3, [r0, #28]
 80008f4:	4770      	bx	lr

080008f6 <_ZN4CPIDC1Effff>:
 80008f6:	b510      	push	{r4, lr}
 80008f8:	4604      	mov	r4, r0
 80008fa:	f7ff ffe6 	bl	80008ca <_ZN4CPID4initEffff>
 80008fe:	4620      	mov	r0, r4
 8000900:	bd10      	pop	{r4, pc}

08000902 <_ZN4CPID7processEf>:
 8000902:	edd0 7a00 	vldr	s15, [r0]
 8000906:	edd0 6a04 	vldr	s13, [r0, #16]
 800090a:	ed90 7a01 	vldr	s14, [r0, #4]
 800090e:	edc0 7a01 	vstr	s15, [r0, #4]
 8000912:	ee67 7aa6 	vmul.f32	s15, s15, s13
 8000916:	edd0 6a03 	vldr	s13, [r0, #12]
 800091a:	ed80 7a02 	vstr	s14, [r0, #8]
 800091e:	eee6 7a80 	vfma.f32	s15, s13, s0
 8000922:	edd0 6a05 	vldr	s13, [r0, #20]
 8000926:	ed80 0a00 	vstr	s0, [r0]
 800092a:	eee6 7a87 	vfma.f32	s15, s13, s14
 800092e:	ed90 7a06 	vldr	s14, [r0, #24]
 8000932:	ee77 7a87 	vadd.f32	s15, s15, s14
 8000936:	ed90 7a07 	vldr	s14, [r0, #28]
 800093a:	edc0 7a06 	vstr	s15, [r0, #24]
 800093e:	eef4 7ac7 	vcmpe.f32	s15, s14
 8000942:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000946:	bfc8      	it	gt
 8000948:	ed80 7a06 	vstrgt	s14, [r0, #24]
 800094c:	edd0 7a06 	vldr	s15, [r0, #24]
 8000950:	eeb1 7a47 	vneg.f32	s14, s14
 8000954:	eef4 7ac7 	vcmpe.f32	s15, s14
 8000958:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800095c:	bf48      	it	mi
 800095e:	ed80 7a06 	vstrmi	s14, [r0, #24]
 8000962:	ed90 0a06 	vldr	s0, [r0, #24]
 8000966:	4770      	bx	lr

08000968 <_ZN5CMath3absEf>:
 8000968:	eeb5 0ac0 	vcmpe.f32	s0, #0.0
 800096c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000970:	bf48      	it	mi
 8000972:	eeb1 0a40 	vnegmi.f32	s0, s0
 8000976:	4770      	bx	lr

08000978 <_ZN5CMath4randEv>:
 8000978:	6803      	ldr	r3, [r0, #0]
 800097a:	490b      	ldr	r1, [pc, #44]	; (80009a8 <_ZN5CMath4randEv+0x30>)
 800097c:	f243 0239 	movw	r2, #12345	; 0x3039
 8000980:	fb01 2203 	mla	r2, r1, r3, r2
 8000984:	6841      	ldr	r1, [r0, #4]
 8000986:	6002      	str	r2, [r0, #0]
 8000988:	f341 0300 	sbfx	r3, r1, #0, #1
 800098c:	f023 533f 	bic.w	r3, r3, #801112064	; 0x2fc00000
 8000990:	f423 137f 	bic.w	r3, r3, #4177920	; 0x3fc000
 8000994:	f423 537f 	bic.w	r3, r3, #16320	; 0x3fc0
 8000998:	f023 033e 	bic.w	r3, r3, #62	; 0x3e
 800099c:	ea83 0351 	eor.w	r3, r3, r1, lsr #1
 80009a0:	6043      	str	r3, [r0, #4]
 80009a2:	ea83 0002 	eor.w	r0, r3, r2
 80009a6:	4770      	bx	lr
 80009a8:	41c64e6d 	.word	0x41c64e6d

080009ac <_ZN5CMath3rndEv>:
 80009ac:	b508      	push	{r3, lr}
 80009ae:	f7ff ffe3 	bl	8000978 <_ZN5CMath4randEv>
 80009b2:	4b09      	ldr	r3, [pc, #36]	; (80009d8 <_ZN5CMath3rndEv+0x2c>)
 80009b4:	fbb0 f2f3 	udiv	r2, r0, r3
 80009b8:	fb02 0013 	mls	r0, r2, r3, r0
 80009bc:	ee07 0a90 	vmov	s15, r0
 80009c0:	ed9f 0a06 	vldr	s0, [pc, #24]	; 80009dc <_ZN5CMath3rndEv+0x30>
 80009c4:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 80009c8:	eec7 7a80 	vdiv.f32	s15, s15, s0
 80009cc:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 80009d0:	ee37 0ac0 	vsub.f32	s0, s15, s0
 80009d4:	bd08      	pop	{r3, pc}
 80009d6:	bf00      	nop
 80009d8:	001e8480 	.word	0x001e8480
 80009dc:	49742400 	.word	0x49742400

080009e0 <TIM3_IRQHandler>:
 80009e0:	2300      	movs	r3, #0
 80009e2:	4a15      	ldr	r2, [pc, #84]	; (8000a38 <TIM3_IRQHandler+0x58>)
 80009e4:	5cd1      	ldrb	r1, [r2, r3]
 80009e6:	b111      	cbz	r1, 80009ee <TIM3_IRQHandler+0xe>
 80009e8:	5cd1      	ldrb	r1, [r2, r3]
 80009ea:	29ff      	cmp	r1, #255	; 0xff
 80009ec:	d11e      	bne.n	8000a2c <TIM3_IRQHandler+0x4c>
 80009ee:	4913      	ldr	r1, [pc, #76]	; (8000a3c <TIM3_IRQHandler+0x5c>)
 80009f0:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
 80009f4:	b128      	cbz	r0, 8000a02 <TIM3_IRQHandler+0x22>
 80009f6:	f851 2023 	ldr.w	r2, [r1, r3, lsl #2]
 80009fa:	3a01      	subs	r2, #1
 80009fc:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000a00:	e009      	b.n	8000a16 <TIM3_IRQHandler+0x36>
 8000a02:	480f      	ldr	r0, [pc, #60]	; (8000a40 <TIM3_IRQHandler+0x60>)
 8000a04:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
 8000a08:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
 8000a0c:	5cd2      	ldrb	r2, [r2, r3]
 8000a0e:	b912      	cbnz	r2, 8000a16 <TIM3_IRQHandler+0x36>
 8000a10:	4a09      	ldr	r2, [pc, #36]	; (8000a38 <TIM3_IRQHandler+0x58>)
 8000a12:	2101      	movs	r1, #1
 8000a14:	54d1      	strb	r1, [r2, r3]
 8000a16:	3301      	adds	r3, #1
 8000a18:	2b08      	cmp	r3, #8
 8000a1a:	d1e2      	bne.n	80009e2 <TIM3_IRQHandler+0x2>
 8000a1c:	4a09      	ldr	r2, [pc, #36]	; (8000a44 <TIM3_IRQHandler+0x64>)
 8000a1e:	480a      	ldr	r0, [pc, #40]	; (8000a48 <TIM3_IRQHandler+0x68>)
 8000a20:	6813      	ldr	r3, [r2, #0]
 8000a22:	2101      	movs	r1, #1
 8000a24:	3301      	adds	r3, #1
 8000a26:	6013      	str	r3, [r2, #0]
 8000a28:	f001 bfec 	b.w	8002a04 <TIM_ClearITPendingBit>
 8000a2c:	5cd1      	ldrb	r1, [r2, r3]
 8000a2e:	3101      	adds	r1, #1
 8000a30:	b2c9      	uxtb	r1, r1
 8000a32:	54d1      	strb	r1, [r2, r3]
 8000a34:	e7db      	b.n	80009ee <TIM3_IRQHandler+0xe>
 8000a36:	bf00      	nop
 8000a38:	20000138 	.word	0x20000138
 8000a3c:	20000118 	.word	0x20000118
 8000a40:	20000148 	.word	0x20000148
 8000a44:	20000140 	.word	0x20000140
 8000a48:	40000400 	.word	0x40000400

08000a4c <_ZN6CTimer10timer_initEv>:
 8000a4c:	b530      	push	{r4, r5, lr}
 8000a4e:	4a1f      	ldr	r2, [pc, #124]	; (8000acc <_ZN6CTimer10timer_initEv+0x80>)
 8000a50:	2300      	movs	r3, #0
 8000a52:	b085      	sub	sp, #20
 8000a54:	6013      	str	r3, [r2, #0]
 8000a56:	491e      	ldr	r1, [pc, #120]	; (8000ad0 <_ZN6CTimer10timer_initEv+0x84>)
 8000a58:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8000a5c:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000a60:	491c      	ldr	r1, [pc, #112]	; (8000ad4 <_ZN6CTimer10timer_initEv+0x88>)
 8000a62:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000a66:	4a1c      	ldr	r2, [pc, #112]	; (8000ad8 <_ZN6CTimer10timer_initEv+0x8c>)
 8000a68:	2400      	movs	r4, #0
 8000a6a:	54d4      	strb	r4, [r2, r3]
 8000a6c:	3301      	adds	r3, #1
 8000a6e:	2b08      	cmp	r3, #8
 8000a70:	d1f1      	bne.n	8000a56 <_ZN6CTimer10timer_initEv+0xa>
 8000a72:	4d1a      	ldr	r5, [pc, #104]	; (8000adc <_ZN6CTimer10timer_initEv+0x90>)
 8000a74:	2002      	movs	r0, #2
 8000a76:	2101      	movs	r1, #1
 8000a78:	f001 ff0c 	bl	8002894 <RCC_APB1PeriphClockCmd>
 8000a7c:	f44f 738c 	mov.w	r3, #280	; 0x118
 8000a80:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000a84:	4628      	mov	r0, r5
 8000a86:	2331      	movs	r3, #49	; 0x31
 8000a88:	a901      	add	r1, sp, #4
 8000a8a:	9302      	str	r3, [sp, #8]
 8000a8c:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000a90:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000a94:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000a98:	f001 ff0a 	bl	80028b0 <TIM_TimeBaseInit>
 8000a9c:	4628      	mov	r0, r5
 8000a9e:	2101      	movs	r1, #1
 8000aa0:	f001 ff56 	bl	8002950 <TIM_Cmd>
 8000aa4:	68eb      	ldr	r3, [r5, #12]
 8000aa6:	f043 0301 	orr.w	r3, r3, #1
 8000aaa:	60eb      	str	r3, [r5, #12]
 8000aac:	231d      	movs	r3, #29
 8000aae:	f88d 3000 	strb.w	r3, [sp]
 8000ab2:	4668      	mov	r0, sp
 8000ab4:	2301      	movs	r3, #1
 8000ab6:	f88d 4001 	strb.w	r4, [sp, #1]
 8000aba:	f88d 3002 	strb.w	r3, [sp, #2]
 8000abe:	f88d 3003 	strb.w	r3, [sp, #3]
 8000ac2:	f002 f8d9 	bl	8002c78 <NVIC_Init>
 8000ac6:	4620      	mov	r0, r4
 8000ac8:	b005      	add	sp, #20
 8000aca:	bd30      	pop	{r4, r5, pc}
 8000acc:	20000140 	.word	0x20000140
 8000ad0:	20000118 	.word	0x20000118
 8000ad4:	20000148 	.word	0x20000148
 8000ad8:	20000138 	.word	0x20000138
 8000adc:	40000400 	.word	0x40000400

08000ae0 <_ZN6CTimer8get_timeEv>:
 8000ae0:	b082      	sub	sp, #8
 8000ae2:	b672      	cpsid	i
 8000ae4:	4b04      	ldr	r3, [pc, #16]	; (8000af8 <_ZN6CTimer8get_timeEv+0x18>)
 8000ae6:	681b      	ldr	r3, [r3, #0]
 8000ae8:	9301      	str	r3, [sp, #4]
 8000aea:	b662      	cpsie	i
 8000aec:	230a      	movs	r3, #10
 8000aee:	9801      	ldr	r0, [sp, #4]
 8000af0:	fbb0 f0f3 	udiv	r0, r0, r3
 8000af4:	b002      	add	sp, #8
 8000af6:	4770      	bx	lr
 8000af8:	20000140 	.word	0x20000140

08000afc <_ZN6CTimer8delay_msEm>:
 8000afc:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000afe:	460c      	mov	r4, r1
 8000b00:	4605      	mov	r5, r0
 8000b02:	f7ff ffed 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 8000b06:	4420      	add	r0, r4
 8000b08:	9001      	str	r0, [sp, #4]
 8000b0a:	4628      	mov	r0, r5
 8000b0c:	9c01      	ldr	r4, [sp, #4]
 8000b0e:	f7ff ffe7 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 8000b12:	4284      	cmp	r4, r0
 8000b14:	d902      	bls.n	8000b1c <_ZN6CTimer8delay_msEm+0x20>
 8000b16:	f002 f8ab 	bl	8002c70 <core_yield>
 8000b1a:	e7f6      	b.n	8000b0a <_ZN6CTimer8delay_msEm+0xe>
 8000b1c:	b003      	add	sp, #12
 8000b1e:	bd30      	pop	{r4, r5, pc}

08000b20 <_ZN6CTimer22event_timer_set_periodEhm>:
 8000b20:	b672      	cpsid	i
 8000b22:	230a      	movs	r3, #10
 8000b24:	435a      	muls	r2, r3
 8000b26:	4b05      	ldr	r3, [pc, #20]	; (8000b3c <_ZN6CTimer22event_timer_set_periodEhm+0x1c>)
 8000b28:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 8000b2c:	4b04      	ldr	r3, [pc, #16]	; (8000b40 <_ZN6CTimer22event_timer_set_periodEhm+0x20>)
 8000b2e:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 8000b32:	4b04      	ldr	r3, [pc, #16]	; (8000b44 <_ZN6CTimer22event_timer_set_periodEhm+0x24>)
 8000b34:	2200      	movs	r2, #0
 8000b36:	545a      	strb	r2, [r3, r1]
 8000b38:	b662      	cpsie	i
 8000b3a:	4770      	bx	lr
 8000b3c:	20000118 	.word	0x20000118
 8000b40:	20000148 	.word	0x20000148
 8000b44:	20000138 	.word	0x20000138

08000b48 <_ZN6CTimer17event_timer_checkEh>:
 8000b48:	4b05      	ldr	r3, [pc, #20]	; (8000b60 <_ZN6CTimer17event_timer_checkEh+0x18>)
 8000b4a:	5c5a      	ldrb	r2, [r3, r1]
 8000b4c:	f002 00ff 	and.w	r0, r2, #255	; 0xff
 8000b50:	b12a      	cbz	r2, 8000b5e <_ZN6CTimer17event_timer_checkEh+0x16>
 8000b52:	b672      	cpsid	i
 8000b54:	5c58      	ldrb	r0, [r3, r1]
 8000b56:	2200      	movs	r2, #0
 8000b58:	b2c0      	uxtb	r0, r0
 8000b5a:	545a      	strb	r2, [r3, r1]
 8000b5c:	b662      	cpsie	i
 8000b5e:	4770      	bx	lr
 8000b60:	20000138 	.word	0x20000138

08000b64 <_ZN4CRGB8rgb_readEh>:
 8000b64:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8000b68:	4604      	mov	r4, r0
 8000b6a:	4688      	mov	r8, r1
 8000b6c:	f000 fae0 	bl	8001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000b70:	4620      	mov	r0, r4
 8000b72:	2172      	movs	r1, #114	; 0x72
 8000b74:	f000 fb06 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000b78:	21b4      	movs	r1, #180	; 0xb4
 8000b7a:	4620      	mov	r0, r4
 8000b7c:	f000 fb02 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000b80:	4620      	mov	r0, r4
 8000b82:	f000 fad5 	bl	8001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000b86:	4620      	mov	r0, r4
 8000b88:	2173      	movs	r1, #115	; 0x73
 8000b8a:	f000 fafb 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000b8e:	4620      	mov	r0, r4
 8000b90:	2101      	movs	r1, #1
 8000b92:	4622      	mov	r2, r4
 8000b94:	f000 fb37 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b98:	7823      	ldrb	r3, [r4, #0]
 8000b9a:	83a3      	strh	r3, [r4, #28]
 8000b9c:	7863      	ldrb	r3, [r4, #1]
 8000b9e:	83e3      	strh	r3, [r4, #30]
 8000ba0:	78a3      	ldrb	r3, [r4, #2]
 8000ba2:	8423      	strh	r3, [r4, #32]
 8000ba4:	78e3      	ldrb	r3, [r4, #3]
 8000ba6:	8463      	strh	r3, [r4, #34]	; 0x22
 8000ba8:	2101      	movs	r1, #1
 8000baa:	4620      	mov	r0, r4
 8000bac:	4622      	mov	r2, r4
 8000bae:	f104 091a 	add.w	r9, r4, #26
 8000bb2:	1e65      	subs	r5, r4, #1
 8000bb4:	f000 fb27 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000bb8:	1ca6      	adds	r6, r4, #2
 8000bba:	f104 0722 	add.w	r7, r4, #34	; 0x22
 8000bbe:	4629      	mov	r1, r5
 8000bc0:	464b      	mov	r3, r9
 8000bc2:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 8000bc6:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 8000bca:	42bb      	cmp	r3, r7
 8000bcc:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8000bd0:	801a      	strh	r2, [r3, #0]
 8000bd2:	d1f6      	bne.n	8000bc2 <_ZN4CRGB8rgb_readEh+0x5e>
 8000bd4:	4620      	mov	r0, r4
 8000bd6:	2101      	movs	r1, #1
 8000bd8:	4622      	mov	r2, r4
 8000bda:	f000 fb14 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000bde:	7823      	ldrb	r3, [r4, #0]
 8000be0:	80a3      	strh	r3, [r4, #4]
 8000be2:	7863      	ldrb	r3, [r4, #1]
 8000be4:	80e3      	strh	r3, [r4, #6]
 8000be6:	78a3      	ldrb	r3, [r4, #2]
 8000be8:	8123      	strh	r3, [r4, #8]
 8000bea:	78e3      	ldrb	r3, [r4, #3]
 8000bec:	8163      	strh	r3, [r4, #10]
 8000bee:	2101      	movs	r1, #1
 8000bf0:	4620      	mov	r0, r4
 8000bf2:	4622      	mov	r2, r4
 8000bf4:	f000 fb07 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000bf8:	f104 0a0a 	add.w	sl, r4, #10
 8000bfc:	4633      	mov	r3, r6
 8000bfe:	4629      	mov	r1, r5
 8000c00:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 8000c04:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 8000c08:	4553      	cmp	r3, sl
 8000c0a:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8000c0e:	801a      	strh	r2, [r3, #0]
 8000c10:	d1f6      	bne.n	8000c00 <_ZN4CRGB8rgb_readEh+0x9c>
 8000c12:	4620      	mov	r0, r4
 8000c14:	2101      	movs	r1, #1
 8000c16:	4622      	mov	r2, r4
 8000c18:	f000 faf5 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c1c:	7823      	ldrb	r3, [r4, #0]
 8000c1e:	81a3      	strh	r3, [r4, #12]
 8000c20:	7863      	ldrb	r3, [r4, #1]
 8000c22:	81e3      	strh	r3, [r4, #14]
 8000c24:	78a3      	ldrb	r3, [r4, #2]
 8000c26:	8223      	strh	r3, [r4, #16]
 8000c28:	78e3      	ldrb	r3, [r4, #3]
 8000c2a:	8263      	strh	r3, [r4, #18]
 8000c2c:	4622      	mov	r2, r4
 8000c2e:	4620      	mov	r0, r4
 8000c30:	2101      	movs	r1, #1
 8000c32:	f000 fae8 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c36:	f104 0612 	add.w	r6, r4, #18
 8000c3a:	462a      	mov	r2, r5
 8000c3c:	f83a 3f02 	ldrh.w	r3, [sl, #2]!
 8000c40:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000c44:	45b2      	cmp	sl, r6
 8000c46:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000c4a:	f8aa 3000 	strh.w	r3, [sl]
 8000c4e:	d1f5      	bne.n	8000c3c <_ZN4CRGB8rgb_readEh+0xd8>
 8000c50:	4620      	mov	r0, r4
 8000c52:	2101      	movs	r1, #1
 8000c54:	4622      	mov	r2, r4
 8000c56:	f000 fad6 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c5a:	7823      	ldrb	r3, [r4, #0]
 8000c5c:	82a3      	strh	r3, [r4, #20]
 8000c5e:	7863      	ldrb	r3, [r4, #1]
 8000c60:	82e3      	strh	r3, [r4, #22]
 8000c62:	78a3      	ldrb	r3, [r4, #2]
 8000c64:	8323      	strh	r3, [r4, #24]
 8000c66:	78e3      	ldrb	r3, [r4, #3]
 8000c68:	8363      	strh	r3, [r4, #26]
 8000c6a:	4622      	mov	r2, r4
 8000c6c:	4620      	mov	r0, r4
 8000c6e:	2101      	movs	r1, #1
 8000c70:	f000 fac9 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c74:	462a      	mov	r2, r5
 8000c76:	f836 3f02 	ldrh.w	r3, [r6, #2]!
 8000c7a:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000c7e:	454e      	cmp	r6, r9
 8000c80:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000c84:	8033      	strh	r3, [r6, #0]
 8000c86:	d1f6      	bne.n	8000c76 <_ZN4CRGB8rgb_readEh+0x112>
 8000c88:	4620      	mov	r0, r4
 8000c8a:	2101      	movs	r1, #1
 8000c8c:	4622      	mov	r2, r4
 8000c8e:	f000 faba 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c92:	7823      	ldrb	r3, [r4, #0]
 8000c94:	84a3      	strh	r3, [r4, #36]	; 0x24
 8000c96:	7863      	ldrb	r3, [r4, #1]
 8000c98:	84e3      	strh	r3, [r4, #38]	; 0x26
 8000c9a:	78a3      	ldrb	r3, [r4, #2]
 8000c9c:	8523      	strh	r3, [r4, #40]	; 0x28
 8000c9e:	78e3      	ldrb	r3, [r4, #3]
 8000ca0:	8563      	strh	r3, [r4, #42]	; 0x2a
 8000ca2:	4622      	mov	r2, r4
 8000ca4:	4620      	mov	r0, r4
 8000ca6:	2100      	movs	r1, #0
 8000ca8:	f000 faad 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000cac:	f104 022a 	add.w	r2, r4, #42	; 0x2a
 8000cb0:	f837 3f02 	ldrh.w	r3, [r7, #2]!
 8000cb4:	f815 1f01 	ldrb.w	r1, [r5, #1]!
 8000cb8:	4297      	cmp	r7, r2
 8000cba:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000cbe:	803b      	strh	r3, [r7, #0]
 8000cc0:	d1f6      	bne.n	8000cb0 <_ZN4CRGB8rgb_readEh+0x14c>
 8000cc2:	4620      	mov	r0, r4
 8000cc4:	f000 fa49 	bl	800115a <_ZN8CRGB_I2C11rgb_i2cStopEv>
 8000cc8:	f1b8 0f00 	cmp.w	r8, #0
 8000ccc:	d025      	beq.n	8000d1a <_ZN4CRGB8rgb_readEh+0x1b6>
 8000cce:	2300      	movs	r3, #0
 8000cd0:	88a1      	ldrh	r1, [r4, #4]
 8000cd2:	f8b4 2044 	ldrh.w	r2, [r4, #68]	; 0x44
 8000cd6:	440a      	add	r2, r1
 8000cd8:	f8a4 2044 	strh.w	r2, [r4, #68]	; 0x44
 8000cdc:	89a1      	ldrh	r1, [r4, #12]
 8000cde:	f8b4 204c 	ldrh.w	r2, [r4, #76]	; 0x4c
 8000ce2:	440a      	add	r2, r1
 8000ce4:	f8a4 204c 	strh.w	r2, [r4, #76]	; 0x4c
 8000ce8:	8aa1      	ldrh	r1, [r4, #20]
 8000cea:	f8b4 2054 	ldrh.w	r2, [r4, #84]	; 0x54
 8000cee:	440a      	add	r2, r1
 8000cf0:	f8a4 2054 	strh.w	r2, [r4, #84]	; 0x54
 8000cf4:	8ca1      	ldrh	r1, [r4, #36]	; 0x24
 8000cf6:	f8b4 2064 	ldrh.w	r2, [r4, #100]	; 0x64
 8000cfa:	440a      	add	r2, r1
 8000cfc:	f8a4 2064 	strh.w	r2, [r4, #100]	; 0x64
 8000d00:	8ba1      	ldrh	r1, [r4, #28]
 8000d02:	f8b4 205c 	ldrh.w	r2, [r4, #92]	; 0x5c
 8000d06:	3301      	adds	r3, #1
 8000d08:	440a      	add	r2, r1
 8000d0a:	2b04      	cmp	r3, #4
 8000d0c:	f8a4 205c 	strh.w	r2, [r4, #92]	; 0x5c
 8000d10:	f104 0402 	add.w	r4, r4, #2
 8000d14:	d1dc      	bne.n	8000cd0 <_ZN4CRGB8rgb_readEh+0x16c>
 8000d16:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000d1a:	4641      	mov	r1, r8
 8000d1c:	b672      	cpsid	i
 8000d1e:	88a3      	ldrh	r3, [r4, #4]
 8000d20:	f8b4 0044 	ldrh.w	r0, [r4, #68]	; 0x44
 8000d24:	f8b4 204c 	ldrh.w	r2, [r4, #76]	; 0x4c
 8000d28:	f8b4 5054 	ldrh.w	r5, [r4, #84]	; 0x54
 8000d2c:	f8b4 6064 	ldrh.w	r6, [r4, #100]	; 0x64
 8000d30:	1a18      	subs	r0, r3, r0
 8000d32:	89a3      	ldrh	r3, [r4, #12]
 8000d34:	1a9a      	subs	r2, r3, r2
 8000d36:	8aa3      	ldrh	r3, [r4, #20]
 8000d38:	1b5b      	subs	r3, r3, r5
 8000d3a:	8ca5      	ldrh	r5, [r4, #36]	; 0x24
 8000d3c:	1bad      	subs	r5, r5, r6
 8000d3e:	84a5      	strh	r5, [r4, #36]	; 0x24
 8000d40:	f8b4 605c 	ldrh.w	r6, [r4, #92]	; 0x5c
 8000d44:	8ba5      	ldrh	r5, [r4, #28]
 8000d46:	b280      	uxth	r0, r0
 8000d48:	b292      	uxth	r2, r2
 8000d4a:	b29b      	uxth	r3, r3
 8000d4c:	1bad      	subs	r5, r5, r6
 8000d4e:	80a0      	strh	r0, [r4, #4]
 8000d50:	81a2      	strh	r2, [r4, #12]
 8000d52:	82a3      	strh	r3, [r4, #20]
 8000d54:	83a5      	strh	r5, [r4, #28]
 8000d56:	b662      	cpsie	i
 8000d58:	b200      	sxth	r0, r0
 8000d5a:	b212      	sxth	r2, r2
 8000d5c:	1885      	adds	r5, r0, r2
 8000d5e:	b21b      	sxth	r3, r3
 8000d60:	18ed      	adds	r5, r5, r3
 8000d62:	d00e      	beq.n	8000d82 <_ZN4CRGB8rgb_readEh+0x21e>
 8000d64:	ebc0 2000 	rsb	r0, r0, r0, lsl #8
 8000d68:	ebc2 2202 	rsb	r2, r2, r2, lsl #8
 8000d6c:	fb90 f0f5 	sdiv	r0, r0, r5
 8000d70:	fb92 f2f5 	sdiv	r2, r2, r5
 8000d74:	ebc3 2303 	rsb	r3, r3, r3, lsl #8
 8000d78:	85a0      	strh	r0, [r4, #44]	; 0x2c
 8000d7a:	fb93 f3f5 	sdiv	r3, r3, r5
 8000d7e:	86a2      	strh	r2, [r4, #52]	; 0x34
 8000d80:	87a3      	strh	r3, [r4, #60]	; 0x3c
 8000d82:	3101      	adds	r1, #1
 8000d84:	2904      	cmp	r1, #4
 8000d86:	f104 0402 	add.w	r4, r4, #2
 8000d8a:	d1c7      	bne.n	8000d1c <_ZN4CRGB8rgb_readEh+0x1b8>
 8000d8c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

08000d90 <_ZN4CRGB8rgb_initEv>:
 8000d90:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000d92:	4606      	mov	r6, r0
 8000d94:	4635      	mov	r5, r6
 8000d96:	f000 f991 	bl	80010bc <_ZN8CRGB_I2C12rgb_i2c_initEv>
 8000d9a:	4633      	mov	r3, r6
 8000d9c:	2200      	movs	r2, #0
 8000d9e:	3201      	adds	r2, #1
 8000da0:	2400      	movs	r4, #0
 8000da2:	2a04      	cmp	r2, #4
 8000da4:	809c      	strh	r4, [r3, #4]
 8000da6:	819c      	strh	r4, [r3, #12]
 8000da8:	829c      	strh	r4, [r3, #20]
 8000daa:	849c      	strh	r4, [r3, #36]	; 0x24
 8000dac:	839c      	strh	r4, [r3, #28]
 8000dae:	f8a3 4044 	strh.w	r4, [r3, #68]	; 0x44
 8000db2:	f8a3 404c 	strh.w	r4, [r3, #76]	; 0x4c
 8000db6:	f8a3 4054 	strh.w	r4, [r3, #84]	; 0x54
 8000dba:	f8a3 4064 	strh.w	r4, [r3, #100]	; 0x64
 8000dbe:	f8a3 405c 	strh.w	r4, [r3, #92]	; 0x5c
 8000dc2:	859c      	strh	r4, [r3, #44]	; 0x2c
 8000dc4:	869c      	strh	r4, [r3, #52]	; 0x34
 8000dc6:	879c      	strh	r4, [r3, #60]	; 0x3c
 8000dc8:	f103 0302 	add.w	r3, r3, #2
 8000dcc:	d1e7      	bne.n	8000d9e <_ZN4CRGB8rgb_initEv+0xe>
 8000dce:	4630      	mov	r0, r6
 8000dd0:	2172      	movs	r1, #114	; 0x72
 8000dd2:	2281      	movs	r2, #129	; 0x81
 8000dd4:	23ff      	movs	r3, #255	; 0xff
 8000dd6:	f000 f9fe 	bl	80011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000dda:	4630      	mov	r0, r6
 8000ddc:	2172      	movs	r1, #114	; 0x72
 8000dde:	2283      	movs	r2, #131	; 0x83
 8000de0:	23ff      	movs	r3, #255	; 0xff
 8000de2:	f000 f9f8 	bl	80011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000de6:	4630      	mov	r0, r6
 8000de8:	2172      	movs	r1, #114	; 0x72
 8000dea:	228d      	movs	r2, #141	; 0x8d
 8000dec:	4623      	mov	r3, r4
 8000dee:	f000 f9f2 	bl	80011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000df2:	4630      	mov	r0, r6
 8000df4:	2172      	movs	r1, #114	; 0x72
 8000df6:	2280      	movs	r2, #128	; 0x80
 8000df8:	2303      	movs	r3, #3
 8000dfa:	f000 f9ec 	bl	80011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000dfe:	228f      	movs	r2, #143	; 0x8f
 8000e00:	2323      	movs	r3, #35	; 0x23
 8000e02:	4630      	mov	r0, r6
 8000e04:	2172      	movs	r1, #114	; 0x72
 8000e06:	f000 f9e6 	bl	80011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000e0a:	af01      	add	r7, sp, #4
 8000e0c:	4630      	mov	r0, r6
 8000e0e:	4621      	mov	r1, r4
 8000e10:	f7ff fea8 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 8000e14:	463b      	mov	r3, r7
 8000e16:	4630      	mov	r0, r6
 8000e18:	2172      	movs	r1, #114	; 0x72
 8000e1a:	2292      	movs	r2, #146	; 0x92
 8000e1c:	f000 fa40 	bl	80012a0 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>
 8000e20:	4623      	mov	r3, r4
 8000e22:	5cfa      	ldrb	r2, [r7, r3]
 8000e24:	2a69      	cmp	r2, #105	; 0x69
 8000e26:	bf1c      	itt	ne
 8000e28:	2201      	movne	r2, #1
 8000e2a:	409a      	lslne	r2, r3
 8000e2c:	f103 0301 	add.w	r3, r3, #1
 8000e30:	bf18      	it	ne
 8000e32:	4314      	orrne	r4, r2
 8000e34:	2b04      	cmp	r3, #4
 8000e36:	d1f4      	bne.n	8000e22 <_ZN4CRGB8rgb_initEv+0x92>
 8000e38:	461f      	mov	r7, r3
 8000e3a:	4630      	mov	r0, r6
 8000e3c:	2101      	movs	r1, #1
 8000e3e:	f7ff fe91 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 8000e42:	3f01      	subs	r7, #1
 8000e44:	d1f9      	bne.n	8000e3a <_ZN4CRGB8rgb_initEv+0xaa>
 8000e46:	2104      	movs	r1, #4
 8000e48:	f9b5 3044 	ldrsh.w	r3, [r5, #68]	; 0x44
 8000e4c:	089b      	lsrs	r3, r3, #2
 8000e4e:	f8a5 3044 	strh.w	r3, [r5, #68]	; 0x44
 8000e52:	f9b5 304c 	ldrsh.w	r3, [r5, #76]	; 0x4c
 8000e56:	089b      	lsrs	r3, r3, #2
 8000e58:	f8a5 304c 	strh.w	r3, [r5, #76]	; 0x4c
 8000e5c:	f9b5 3054 	ldrsh.w	r3, [r5, #84]	; 0x54
 8000e60:	089b      	lsrs	r3, r3, #2
 8000e62:	f8a5 3054 	strh.w	r3, [r5, #84]	; 0x54
 8000e66:	f9b5 3064 	ldrsh.w	r3, [r5, #100]	; 0x64
 8000e6a:	089b      	lsrs	r3, r3, #2
 8000e6c:	f8a5 3064 	strh.w	r3, [r5, #100]	; 0x64
 8000e70:	f9b5 305c 	ldrsh.w	r3, [r5, #92]	; 0x5c
 8000e74:	3901      	subs	r1, #1
 8000e76:	ea4f 0393 	mov.w	r3, r3, lsr #2
 8000e7a:	f8a5 305c 	strh.w	r3, [r5, #92]	; 0x5c
 8000e7e:	f105 0502 	add.w	r5, r5, #2
 8000e82:	d1e1      	bne.n	8000e48 <_ZN4CRGB8rgb_initEv+0xb8>
 8000e84:	4630      	mov	r0, r6
 8000e86:	f7ff fe6d 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 8000e8a:	b114      	cbz	r4, 8000e92 <_ZN4CRGB8rgb_initEv+0x102>
 8000e8c:	4802      	ldr	r0, [pc, #8]	; (8000e98 <_ZN4CRGB8rgb_initEv+0x108>)
 8000e8e:	1b00      	subs	r0, r0, r4
 8000e90:	e000      	b.n	8000e94 <_ZN4CRGB8rgb_initEv+0x104>
 8000e92:	4620      	mov	r0, r4
 8000e94:	b003      	add	sp, #12
 8000e96:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e98:	fffffc18 	.word	0xfffffc18

08000e9c <_ZN4CRGB14get_rgb_resultEv>:
 8000e9c:	3004      	adds	r0, #4
 8000e9e:	4770      	bx	lr

08000ea0 <_ZN6CMotor11motor_sleepEv>:
 8000ea0:	b510      	push	{r4, lr}
 8000ea2:	4c07      	ldr	r4, [pc, #28]	; (8000ec0 <_ZN6CMotor11motor_sleepEv+0x20>)
 8000ea4:	21c0      	movs	r1, #192	; 0xc0
 8000ea6:	4620      	mov	r0, r4
 8000ea8:	2200      	movs	r2, #0
 8000eaa:	2318      	movs	r3, #24
 8000eac:	f000 fadc 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000eb0:	4620      	mov	r0, r4
 8000eb2:	21c2      	movs	r1, #194	; 0xc2
 8000eb4:	2200      	movs	r2, #0
 8000eb6:	2318      	movs	r3, #24
 8000eb8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000ebc:	f000 bad4 	b.w	8001468 <_ZN4CI2C9write_regEhhh>
 8000ec0:	20000168 	.word	0x20000168

08000ec4 <_ZN6CMotor13motor_refreshEv>:
 8000ec4:	b570      	push	{r4, r5, r6, lr}
 8000ec6:	e890 0030 	ldmia.w	r0, {r4, r5}
 8000eca:	2c2c      	cmp	r4, #44	; 0x2c
 8000ecc:	dc74      	bgt.n	8000fb8 <_ZN6CMotor13motor_refreshEv+0xf4>
 8000ece:	f114 0f2c 	cmn.w	r4, #44	; 0x2c
 8000ed2:	db11      	blt.n	8000ef8 <_ZN6CMotor13motor_refreshEv+0x34>
 8000ed4:	2d2c      	cmp	r5, #44	; 0x2c
 8000ed6:	dc5e      	bgt.n	8000f96 <_ZN6CMotor13motor_refreshEv+0xd2>
 8000ed8:	f115 0f2c 	cmn.w	r5, #44	; 0x2c
 8000edc:	db33      	blt.n	8000f46 <_ZN6CMotor13motor_refreshEv+0x82>
 8000ede:	b1dc      	cbz	r4, 8000f18 <_ZN6CMotor13motor_refreshEv+0x54>
 8000ee0:	e001      	b.n	8000ee6 <_ZN6CMotor13motor_refreshEv+0x22>
 8000ee2:	f06f 052b 	mvn.w	r5, #43	; 0x2b
 8000ee6:	2c00      	cmp	r4, #0
 8000ee8:	dd0d      	ble.n	8000f06 <_ZN6CMotor13motor_refreshEv+0x42>
 8000eea:	2c06      	cmp	r4, #6
 8000eec:	bfb8      	it	lt
 8000eee:	2406      	movlt	r4, #6
 8000ef0:	00a4      	lsls	r4, r4, #2
 8000ef2:	f044 0402 	orr.w	r4, r4, #2
 8000ef6:	e00d      	b.n	8000f14 <_ZN6CMotor13motor_refreshEv+0x50>
 8000ef8:	2d2c      	cmp	r5, #44	; 0x2c
 8000efa:	f06f 042b 	mvn.w	r4, #43	; 0x2b
 8000efe:	dc60      	bgt.n	8000fc2 <_ZN6CMotor13motor_refreshEv+0xfe>
 8000f00:	42a5      	cmp	r5, r4
 8000f02:	bfb8      	it	lt
 8000f04:	4625      	movlt	r5, r4
 8000f06:	4264      	negs	r4, r4
 8000f08:	2c06      	cmp	r4, #6
 8000f0a:	bfb8      	it	lt
 8000f0c:	2406      	movlt	r4, #6
 8000f0e:	00a4      	lsls	r4, r4, #2
 8000f10:	f044 0401 	orr.w	r4, r4, #1
 8000f14:	b2e4      	uxtb	r4, r4
 8000f16:	e000      	b.n	8000f1a <_ZN6CMotor13motor_refreshEv+0x56>
 8000f18:	241b      	movs	r4, #27
 8000f1a:	2200      	movs	r2, #0
 8000f1c:	4613      	mov	r3, r2
 8000f1e:	482a      	ldr	r0, [pc, #168]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f20:	21c0      	movs	r1, #192	; 0xc0
 8000f22:	f000 faa1 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000f26:	4828      	ldr	r0, [pc, #160]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f28:	21c0      	movs	r1, #192	; 0xc0
 8000f2a:	2200      	movs	r2, #0
 8000f2c:	4623      	mov	r3, r4
 8000f2e:	f000 fa9b 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000f32:	2d00      	cmp	r5, #0
 8000f34:	d020      	beq.n	8000f78 <_ZN6CMotor13motor_refreshEv+0xb4>
 8000f36:	dd16      	ble.n	8000f66 <_ZN6CMotor13motor_refreshEv+0xa2>
 8000f38:	2d06      	cmp	r5, #6
 8000f3a:	bfb8      	it	lt
 8000f3c:	2506      	movlt	r5, #6
 8000f3e:	00ad      	lsls	r5, r5, #2
 8000f40:	f045 0501 	orr.w	r5, r5, #1
 8000f44:	e016      	b.n	8000f74 <_ZN6CMotor13motor_refreshEv+0xb0>
 8000f46:	2c00      	cmp	r4, #0
 8000f48:	d1cb      	bne.n	8000ee2 <_ZN6CMotor13motor_refreshEv+0x1e>
 8000f4a:	481f      	ldr	r0, [pc, #124]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f4c:	21c0      	movs	r1, #192	; 0xc0
 8000f4e:	4622      	mov	r2, r4
 8000f50:	4623      	mov	r3, r4
 8000f52:	f000 fa89 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000f56:	481c      	ldr	r0, [pc, #112]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f58:	21c0      	movs	r1, #192	; 0xc0
 8000f5a:	4622      	mov	r2, r4
 8000f5c:	231b      	movs	r3, #27
 8000f5e:	f000 fa83 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000f62:	f06f 052b 	mvn.w	r5, #43	; 0x2b
 8000f66:	426d      	negs	r5, r5
 8000f68:	2d06      	cmp	r5, #6
 8000f6a:	bfb8      	it	lt
 8000f6c:	2506      	movlt	r5, #6
 8000f6e:	00ad      	lsls	r5, r5, #2
 8000f70:	f045 0502 	orr.w	r5, r5, #2
 8000f74:	b2ed      	uxtb	r5, r5
 8000f76:	e000      	b.n	8000f7a <_ZN6CMotor13motor_refreshEv+0xb6>
 8000f78:	251b      	movs	r5, #27
 8000f7a:	2200      	movs	r2, #0
 8000f7c:	4613      	mov	r3, r2
 8000f7e:	4812      	ldr	r0, [pc, #72]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f80:	21c2      	movs	r1, #194	; 0xc2
 8000f82:	f000 fa71 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000f86:	462b      	mov	r3, r5
 8000f88:	480f      	ldr	r0, [pc, #60]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f8a:	21c2      	movs	r1, #194	; 0xc2
 8000f8c:	2200      	movs	r2, #0
 8000f8e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000f92:	f000 ba69 	b.w	8001468 <_ZN4CI2C9write_regEhhh>
 8000f96:	b96c      	cbnz	r4, 8000fb4 <_ZN6CMotor13motor_refreshEv+0xf0>
 8000f98:	480b      	ldr	r0, [pc, #44]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f9a:	21c0      	movs	r1, #192	; 0xc0
 8000f9c:	4622      	mov	r2, r4
 8000f9e:	4623      	mov	r3, r4
 8000fa0:	f000 fa62 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000fa4:	4808      	ldr	r0, [pc, #32]	; (8000fc8 <_ZN6CMotor13motor_refreshEv+0x104>)
 8000fa6:	21c0      	movs	r1, #192	; 0xc0
 8000fa8:	4622      	mov	r2, r4
 8000faa:	231b      	movs	r3, #27
 8000fac:	f000 fa5c 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8000fb0:	252c      	movs	r5, #44	; 0x2c
 8000fb2:	e7c4      	b.n	8000f3e <_ZN6CMotor13motor_refreshEv+0x7a>
 8000fb4:	252c      	movs	r5, #44	; 0x2c
 8000fb6:	e796      	b.n	8000ee6 <_ZN6CMotor13motor_refreshEv+0x22>
 8000fb8:	242c      	movs	r4, #44	; 0x2c
 8000fba:	42a5      	cmp	r5, r4
 8000fbc:	dd8c      	ble.n	8000ed8 <_ZN6CMotor13motor_refreshEv+0x14>
 8000fbe:	4625      	mov	r5, r4
 8000fc0:	e796      	b.n	8000ef0 <_ZN6CMotor13motor_refreshEv+0x2c>
 8000fc2:	252c      	movs	r5, #44	; 0x2c
 8000fc4:	e79f      	b.n	8000f06 <_ZN6CMotor13motor_refreshEv+0x42>
 8000fc6:	bf00      	nop
 8000fc8:	20000168 	.word	0x20000168

08000fcc <_ZN6CMotor9set_motorEml>:
 8000fcc:	2901      	cmp	r1, #1
 8000fce:	bf98      	it	ls
 8000fd0:	f840 2021 	strls.w	r2, [r0, r1, lsl #2]
 8000fd4:	f7ff bf76 	b.w	8000ec4 <_ZN6CMotor13motor_refreshEv>

08000fd8 <_ZN6CMotor10motor_initEv>:
 8000fd8:	b510      	push	{r4, lr}
 8000fda:	2100      	movs	r1, #0
 8000fdc:	4604      	mov	r4, r0
 8000fde:	460a      	mov	r2, r1
 8000fe0:	f7ff fff4 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8000fe4:	4620      	mov	r0, r4
 8000fe6:	2101      	movs	r1, #1
 8000fe8:	2200      	movs	r2, #0
 8000fea:	f7ff ffef 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8000fee:	4620      	mov	r0, r4
 8000ff0:	f7ff ff68 	bl	8000ec4 <_ZN6CMotor13motor_refreshEv>
 8000ff4:	2000      	movs	r0, #0
 8000ff6:	bd10      	pop	{r4, pc}

08000ff8 <_ZN8CSensors12sensors_initEv>:
 8000ff8:	b510      	push	{r4, lr}
 8000ffa:	4604      	mov	r4, r0
 8000ffc:	4808      	ldr	r0, [pc, #32]	; (8001020 <_ZN8CSensors12sensors_initEv+0x28>)
 8000ffe:	f000 f9b1 	bl	8001364 <_ZN4CI2C4initEv>
 8001002:	4620      	mov	r0, r4
 8001004:	f7ff fec4 	bl	8000d90 <_ZN4CRGB8rgb_initEv>
 8001008:	b110      	cbz	r0, 8001010 <_ZN8CSensors12sensors_initEv+0x18>
 800100a:	f5a0 707a 	sub.w	r0, r0, #1000	; 0x3e8
 800100e:	bd10      	pop	{r4, pc}
 8001010:	f104 0084 	add.w	r0, r4, #132	; 0x84
 8001014:	f000 fb36 	bl	8001684 <_ZN4CIMU8imu_initEv>
 8001018:	b108      	cbz	r0, 800101e <_ZN8CSensors12sensors_initEv+0x26>
 800101a:	f5a0 60fa 	sub.w	r0, r0, #2000	; 0x7d0
 800101e:	bd10      	pop	{r4, pc}
 8001020:	20000168 	.word	0x20000168

08001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>:
 8001024:	2365      	movs	r3, #101	; 0x65
 8001026:	3b01      	subs	r3, #1
 8001028:	d001      	beq.n	800102e <_ZN8CRGB_I2C13rgb_i2c_delayEv+0xa>
 800102a:	bf00      	nop
 800102c:	e7fb      	b.n	8001026 <_ZN8CRGB_I2C13rgb_i2c_delayEv+0x2>
 800102e:	4770      	bx	lr

08001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>:
 8001030:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001032:	2301      	movs	r3, #1
 8001034:	2203      	movs	r2, #3
 8001036:	4605      	mov	r5, r0
 8001038:	24f0      	movs	r4, #240	; 0xf0
 800103a:	f88d 3004 	strb.w	r3, [sp, #4]
 800103e:	f88d 3006 	strb.w	r3, [sp, #6]
 8001042:	4669      	mov	r1, sp
 8001044:	2300      	movs	r3, #0
 8001046:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800104a:	f88d 2005 	strb.w	r2, [sp, #5]
 800104e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001052:	9400      	str	r4, [sp, #0]
 8001054:	f001 fe56 	bl	8002d04 <GPIO_Init>
 8001058:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800105c:	4628      	mov	r0, r5
 800105e:	851c      	strh	r4, [r3, #40]	; 0x28
 8001060:	f7ff ffe0 	bl	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8001064:	b003      	add	sp, #12
 8001066:	bd30      	pop	{r4, r5, pc}

08001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>:
 8001068:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800106a:	2300      	movs	r3, #0
 800106c:	2203      	movs	r2, #3
 800106e:	4605      	mov	r5, r0
 8001070:	24f0      	movs	r4, #240	; 0xf0
 8001072:	4669      	mov	r1, sp
 8001074:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001078:	f88d 3004 	strb.w	r3, [sp, #4]
 800107c:	f88d 2005 	strb.w	r2, [sp, #5]
 8001080:	f88d 3007 	strb.w	r3, [sp, #7]
 8001084:	9400      	str	r4, [sp, #0]
 8001086:	f001 fe3d 	bl	8002d04 <GPIO_Init>
 800108a:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800108e:	4628      	mov	r0, r5
 8001090:	619c      	str	r4, [r3, #24]
 8001092:	f7ff ffc7 	bl	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8001096:	b003      	add	sp, #12
 8001098:	bd30      	pop	{r4, r5, pc}
	...

0800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>:
 800109c:	4b02      	ldr	r3, [pc, #8]	; (80010a8 <_ZN8CRGB_I2C12RGBSetLowSCLEv+0xc>)
 800109e:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80010a2:	851a      	strh	r2, [r3, #40]	; 0x28
 80010a4:	f7ff bfbe 	b.w	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 80010a8:	48000800 	.word	0x48000800

080010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>:
 80010ac:	4b02      	ldr	r3, [pc, #8]	; (80010b8 <_ZN8CRGB_I2C13RGBSetHighSCLEv+0xc>)
 80010ae:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80010b2:	619a      	str	r2, [r3, #24]
 80010b4:	f7ff bfb6 	b.w	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 80010b8:	48000800 	.word	0x48000800

080010bc <_ZN8CRGB_I2C12rgb_i2c_initEv>:
 80010bc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80010be:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80010c2:	4605      	mov	r5, r0
 80010c4:	2400      	movs	r4, #0
 80010c6:	9300      	str	r3, [sp, #0]
 80010c8:	2703      	movs	r7, #3
 80010ca:	2301      	movs	r3, #1
 80010cc:	4817      	ldr	r0, [pc, #92]	; (800112c <_ZN8CRGB_I2C12rgb_i2c_initEv+0x70>)
 80010ce:	f88d 3004 	strb.w	r3, [sp, #4]
 80010d2:	4669      	mov	r1, sp
 80010d4:	26f0      	movs	r6, #240	; 0xf0
 80010d6:	f88d 7005 	strb.w	r7, [sp, #5]
 80010da:	f88d 4006 	strb.w	r4, [sp, #6]
 80010de:	f88d 4007 	strb.w	r4, [sp, #7]
 80010e2:	f001 fe0f 	bl	8002d04 <GPIO_Init>
 80010e6:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80010ea:	4669      	mov	r1, sp
 80010ec:	9600      	str	r6, [sp, #0]
 80010ee:	f88d 4004 	strb.w	r4, [sp, #4]
 80010f2:	f88d 7005 	strb.w	r7, [sp, #5]
 80010f6:	f88d 4007 	strb.w	r4, [sp, #7]
 80010fa:	f001 fe03 	bl	8002d04 <GPIO_Init>
 80010fe:	4631      	mov	r1, r6
 8001100:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001104:	f001 fe40 	bl	8002d88 <GPIO_SetBits>
 8001108:	4628      	mov	r0, r5
 800110a:	f7ff ffcf 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800110e:	4628      	mov	r0, r5
 8001110:	f7ff ff8e 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8001114:	4628      	mov	r0, r5
 8001116:	f7ff ffa7 	bl	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 800111a:	f242 7311 	movw	r3, #10001	; 0x2711
 800111e:	3b01      	subs	r3, #1
 8001120:	d001      	beq.n	8001126 <_ZN8CRGB_I2C12rgb_i2c_initEv+0x6a>
 8001122:	bf00      	nop
 8001124:	e7fb      	b.n	800111e <_ZN8CRGB_I2C12rgb_i2c_initEv+0x62>
 8001126:	b003      	add	sp, #12
 8001128:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800112a:	bf00      	nop
 800112c:	48000800 	.word	0x48000800

08001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>:
 8001130:	b510      	push	{r4, lr}
 8001132:	4604      	mov	r4, r0
 8001134:	f7ff ffba 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8001138:	4620      	mov	r0, r4
 800113a:	f7ff ff95 	bl	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 800113e:	4620      	mov	r0, r4
 8001140:	f7ff ffb4 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8001144:	4620      	mov	r0, r4
 8001146:	f7ff ff73 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 800114a:	4620      	mov	r0, r4
 800114c:	f7ff ffa6 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001150:	4620      	mov	r0, r4
 8001152:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001156:	f7ff bf87 	b.w	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>

0800115a <_ZN8CRGB_I2C11rgb_i2cStopEv>:
 800115a:	b510      	push	{r4, lr}
 800115c:	4604      	mov	r4, r0
 800115e:	f7ff ff9d 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001162:	4620      	mov	r0, r4
 8001164:	f7ff ff64 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8001168:	4620      	mov	r0, r4
 800116a:	f7ff ff9f 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800116e:	4620      	mov	r0, r4
 8001170:	f7ff ff5e 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8001174:	4620      	mov	r0, r4
 8001176:	f7ff ff99 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800117a:	4620      	mov	r0, r4
 800117c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001180:	f7ff bf72 	b.w	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>

08001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>:
 8001184:	b570      	push	{r4, r5, r6, lr}
 8001186:	4604      	mov	r4, r0
 8001188:	460e      	mov	r6, r1
 800118a:	2508      	movs	r5, #8
 800118c:	4620      	mov	r0, r4
 800118e:	f7ff ff85 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001192:	0633      	lsls	r3, r6, #24
 8001194:	4620      	mov	r0, r4
 8001196:	d502      	bpl.n	800119e <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1a>
 8001198:	f7ff ff66 	bl	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 800119c:	e001      	b.n	80011a2 <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1e>
 800119e:	f7ff ff47 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 80011a2:	4620      	mov	r0, r4
 80011a4:	3d01      	subs	r5, #1
 80011a6:	f7ff ff81 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80011aa:	0076      	lsls	r6, r6, #1
 80011ac:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80011b0:	b2f6      	uxtb	r6, r6
 80011b2:	d1eb      	bne.n	800118c <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x8>
 80011b4:	4620      	mov	r0, r4
 80011b6:	f7ff ff71 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 80011ba:	4620      	mov	r0, r4
 80011bc:	f7ff ff54 	bl	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 80011c0:	4620      	mov	r0, r4
 80011c2:	f7ff ff73 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80011c6:	4620      	mov	r0, r4
 80011c8:	f7ff ff68 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 80011cc:	4620      	mov	r0, r4
 80011ce:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80011d2:	f7ff bf27 	b.w	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

080011d6 <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>:
 80011d6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80011d8:	4604      	mov	r4, r0
 80011da:	460f      	mov	r7, r1
 80011dc:	4616      	mov	r6, r2
 80011de:	461d      	mov	r5, r3
 80011e0:	f7ff ffa6 	bl	8001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 80011e4:	4620      	mov	r0, r4
 80011e6:	4639      	mov	r1, r7
 80011e8:	f7ff ffcc 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80011ec:	4620      	mov	r0, r4
 80011ee:	4631      	mov	r1, r6
 80011f0:	f7ff ffc8 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80011f4:	4620      	mov	r0, r4
 80011f6:	4629      	mov	r1, r5
 80011f8:	f7ff ffc4 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80011fc:	4620      	mov	r0, r4
 80011fe:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8001202:	f7ff bfaa 	b.w	800115a <_ZN8CRGB_I2C11rgb_i2cStopEv>

08001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>:
 8001206:	2300      	movs	r3, #0
 8001208:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 800120c:	4605      	mov	r5, r0
 800120e:	7013      	strb	r3, [r2, #0]
 8001210:	7053      	strb	r3, [r2, #1]
 8001212:	7093      	strb	r3, [r2, #2]
 8001214:	70d3      	strb	r3, [r2, #3]
 8001216:	460e      	mov	r6, r1
 8001218:	4614      	mov	r4, r2
 800121a:	1cd7      	adds	r7, r2, #3
 800121c:	f7ff ff3e 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001220:	4628      	mov	r0, r5
 8001222:	f7ff ff21 	bl	8001068 <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8001226:	f04f 0808 	mov.w	r8, #8
 800122a:	1e63      	subs	r3, r4, #1
 800122c:	f813 2f01 	ldrb.w	r2, [r3, #1]!
 8001230:	0052      	lsls	r2, r2, #1
 8001232:	42bb      	cmp	r3, r7
 8001234:	701a      	strb	r2, [r3, #0]
 8001236:	d1f9      	bne.n	800122c <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x26>
 8001238:	4628      	mov	r0, r5
 800123a:	f7ff ff37 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800123e:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001242:	8a1b      	ldrh	r3, [r3, #16]
 8001244:	b29b      	uxth	r3, r3
 8001246:	06d8      	lsls	r0, r3, #27
 8001248:	bf42      	ittt	mi
 800124a:	7822      	ldrbmi	r2, [r4, #0]
 800124c:	f042 0201 	orrmi.w	r2, r2, #1
 8001250:	7022      	strbmi	r2, [r4, #0]
 8001252:	0699      	lsls	r1, r3, #26
 8001254:	bf42      	ittt	mi
 8001256:	7862      	ldrbmi	r2, [r4, #1]
 8001258:	f042 0201 	orrmi.w	r2, r2, #1
 800125c:	7062      	strbmi	r2, [r4, #1]
 800125e:	065a      	lsls	r2, r3, #25
 8001260:	bf42      	ittt	mi
 8001262:	78a2      	ldrbmi	r2, [r4, #2]
 8001264:	f042 0201 	orrmi.w	r2, r2, #1
 8001268:	70a2      	strbmi	r2, [r4, #2]
 800126a:	061b      	lsls	r3, r3, #24
 800126c:	bf42      	ittt	mi
 800126e:	78e3      	ldrbmi	r3, [r4, #3]
 8001270:	f043 0301 	orrmi.w	r3, r3, #1
 8001274:	70e3      	strbmi	r3, [r4, #3]
 8001276:	4628      	mov	r0, r5
 8001278:	f7ff ff10 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 800127c:	f1b8 0801 	subs.w	r8, r8, #1
 8001280:	d1d3      	bne.n	800122a <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x24>
 8001282:	b116      	cbz	r6, 800128a <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x84>
 8001284:	4628      	mov	r0, r5
 8001286:	f7ff fed3 	bl	8001030 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 800128a:	4628      	mov	r0, r5
 800128c:	f7ff ff0e 	bl	80010ac <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8001290:	4628      	mov	r0, r5
 8001292:	f7ff ff03 	bl	800109c <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001296:	4628      	mov	r0, r5
 8001298:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 800129c:	f7ff bec2 	b.w	8001024 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

080012a0 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>:
 80012a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80012a2:	4604      	mov	r4, r0
 80012a4:	460d      	mov	r5, r1
 80012a6:	4617      	mov	r7, r2
 80012a8:	461e      	mov	r6, r3
 80012aa:	f7ff ff41 	bl	8001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 80012ae:	4620      	mov	r0, r4
 80012b0:	4629      	mov	r1, r5
 80012b2:	f7ff ff67 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80012b6:	4639      	mov	r1, r7
 80012b8:	4620      	mov	r0, r4
 80012ba:	f7ff ff63 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80012be:	4620      	mov	r0, r4
 80012c0:	f7ff ff36 	bl	8001130 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 80012c4:	4620      	mov	r0, r4
 80012c6:	f045 0101 	orr.w	r1, r5, #1
 80012ca:	f7ff ff5b 	bl	8001184 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 80012ce:	4620      	mov	r0, r4
 80012d0:	4632      	mov	r2, r6
 80012d2:	2100      	movs	r1, #0
 80012d4:	f7ff ff97 	bl	8001206 <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 80012d8:	4620      	mov	r0, r4
 80012da:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 80012de:	f7ff bf3c 	b.w	800115a <_ZN8CRGB_I2C11rgb_i2cStopEv>

080012e2 <_ZN4CI2C5delayEv>:
 80012e2:	230b      	movs	r3, #11
 80012e4:	3b01      	subs	r3, #1
 80012e6:	d001      	beq.n	80012ec <_ZN4CI2C5delayEv+0xa>
 80012e8:	bf00      	nop
 80012ea:	e7fb      	b.n	80012e4 <_ZN4CI2C5delayEv+0x2>
 80012ec:	4770      	bx	lr
	...

080012f0 <_ZN4CI2C9SetLowSDAEv>:
 80012f0:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80012f2:	4c0c      	ldr	r4, [pc, #48]	; (8001324 <_ZN4CI2C9SetLowSDAEv+0x34>)
 80012f4:	2301      	movs	r3, #1
 80012f6:	2203      	movs	r2, #3
 80012f8:	4606      	mov	r6, r0
 80012fa:	2580      	movs	r5, #128	; 0x80
 80012fc:	f88d 3004 	strb.w	r3, [sp, #4]
 8001300:	f88d 3006 	strb.w	r3, [sp, #6]
 8001304:	4620      	mov	r0, r4
 8001306:	2300      	movs	r3, #0
 8001308:	4669      	mov	r1, sp
 800130a:	f88d 2005 	strb.w	r2, [sp, #5]
 800130e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001312:	9500      	str	r5, [sp, #0]
 8001314:	f001 fcf6 	bl	8002d04 <GPIO_Init>
 8001318:	8525      	strh	r5, [r4, #40]	; 0x28
 800131a:	4630      	mov	r0, r6
 800131c:	f7ff ffe1 	bl	80012e2 <_ZN4CI2C5delayEv>
 8001320:	b002      	add	sp, #8
 8001322:	bd70      	pop	{r4, r5, r6, pc}
 8001324:	48000400 	.word	0x48000400

08001328 <_ZN4CI2C10SetHighSDAEv>:
 8001328:	4b05      	ldr	r3, [pc, #20]	; (8001340 <_ZN4CI2C10SetHighSDAEv+0x18>)
 800132a:	681a      	ldr	r2, [r3, #0]
 800132c:	f422 4240 	bic.w	r2, r2, #49152	; 0xc000
 8001330:	601a      	str	r2, [r3, #0]
 8001332:	681a      	ldr	r2, [r3, #0]
 8001334:	601a      	str	r2, [r3, #0]
 8001336:	2280      	movs	r2, #128	; 0x80
 8001338:	619a      	str	r2, [r3, #24]
 800133a:	f7ff bfd2 	b.w	80012e2 <_ZN4CI2C5delayEv>
 800133e:	bf00      	nop
 8001340:	48000400 	.word	0x48000400

08001344 <_ZN4CI2C9SetLowSCLEv>:
 8001344:	4b02      	ldr	r3, [pc, #8]	; (8001350 <_ZN4CI2C9SetLowSCLEv+0xc>)
 8001346:	2240      	movs	r2, #64	; 0x40
 8001348:	851a      	strh	r2, [r3, #40]	; 0x28
 800134a:	f7ff bfca 	b.w	80012e2 <_ZN4CI2C5delayEv>
 800134e:	bf00      	nop
 8001350:	48000400 	.word	0x48000400

08001354 <_ZN4CI2C10SetHighSCLEv>:
 8001354:	4b02      	ldr	r3, [pc, #8]	; (8001360 <_ZN4CI2C10SetHighSCLEv+0xc>)
 8001356:	2240      	movs	r2, #64	; 0x40
 8001358:	619a      	str	r2, [r3, #24]
 800135a:	f7ff bfc2 	b.w	80012e2 <_ZN4CI2C5delayEv>
 800135e:	bf00      	nop
 8001360:	48000400 	.word	0x48000400

08001364 <_ZN4CI2C4initEv>:
 8001364:	b513      	push	{r0, r1, r4, lr}
 8001366:	4604      	mov	r4, r0
 8001368:	2101      	movs	r1, #1
 800136a:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800136e:	f001 fa75 	bl	800285c <RCC_AHBPeriphClockCmd>
 8001372:	23c0      	movs	r3, #192	; 0xc0
 8001374:	9300      	str	r3, [sp, #0]
 8001376:	2301      	movs	r3, #1
 8001378:	2203      	movs	r2, #3
 800137a:	4669      	mov	r1, sp
 800137c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001380:	f88d 3006 	strb.w	r3, [sp, #6]
 8001384:	4809      	ldr	r0, [pc, #36]	; (80013ac <_ZN4CI2C4initEv+0x48>)
 8001386:	f88d 2005 	strb.w	r2, [sp, #5]
 800138a:	2300      	movs	r3, #0
 800138c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001390:	f001 fcb8 	bl	8002d04 <GPIO_Init>
 8001394:	4620      	mov	r0, r4
 8001396:	f7ff ffdd 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 800139a:	4620      	mov	r0, r4
 800139c:	f7ff ffa8 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 80013a0:	4620      	mov	r0, r4
 80013a2:	f7ff ffc1 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 80013a6:	b002      	add	sp, #8
 80013a8:	bd10      	pop	{r4, pc}
 80013aa:	bf00      	nop
 80013ac:	48000400 	.word	0x48000400

080013b0 <_ZN4CI2C5StartEv>:
 80013b0:	b510      	push	{r4, lr}
 80013b2:	4604      	mov	r4, r0
 80013b4:	f7ff ffce 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80013b8:	4620      	mov	r0, r4
 80013ba:	f7ff ffb5 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 80013be:	4620      	mov	r0, r4
 80013c0:	f7ff ffc8 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80013c4:	4620      	mov	r0, r4
 80013c6:	f7ff ff93 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 80013ca:	4620      	mov	r0, r4
 80013cc:	f7ff ffba 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 80013d0:	4620      	mov	r0, r4
 80013d2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80013d6:	f7ff bfa7 	b.w	8001328 <_ZN4CI2C10SetHighSDAEv>

080013da <_ZN4CI2C4StopEv>:
 80013da:	b510      	push	{r4, lr}
 80013dc:	4604      	mov	r4, r0
 80013de:	f7ff ffb1 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 80013e2:	4620      	mov	r0, r4
 80013e4:	f7ff ff84 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 80013e8:	4620      	mov	r0, r4
 80013ea:	f7ff ffb3 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80013ee:	4620      	mov	r0, r4
 80013f0:	f7ff ff7e 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 80013f4:	4620      	mov	r0, r4
 80013f6:	f7ff ffad 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80013fa:	4620      	mov	r0, r4
 80013fc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001400:	f7ff bf92 	b.w	8001328 <_ZN4CI2C10SetHighSDAEv>

08001404 <_ZN4CI2C5WriteEh>:
 8001404:	b570      	push	{r4, r5, r6, lr}
 8001406:	4604      	mov	r4, r0
 8001408:	460e      	mov	r6, r1
 800140a:	2508      	movs	r5, #8
 800140c:	4620      	mov	r0, r4
 800140e:	f7ff ff99 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 8001412:	0633      	lsls	r3, r6, #24
 8001414:	4620      	mov	r0, r4
 8001416:	d502      	bpl.n	800141e <_ZN4CI2C5WriteEh+0x1a>
 8001418:	f7ff ff86 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 800141c:	e001      	b.n	8001422 <_ZN4CI2C5WriteEh+0x1e>
 800141e:	f7ff ff67 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 8001422:	4620      	mov	r0, r4
 8001424:	3d01      	subs	r5, #1
 8001426:	f7ff ff95 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 800142a:	0076      	lsls	r6, r6, #1
 800142c:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001430:	b2f6      	uxtb	r6, r6
 8001432:	d1eb      	bne.n	800140c <_ZN4CI2C5WriteEh+0x8>
 8001434:	4620      	mov	r0, r4
 8001436:	f7ff ff85 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 800143a:	4620      	mov	r0, r4
 800143c:	f7ff ff74 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 8001440:	4620      	mov	r0, r4
 8001442:	f7ff ff87 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 8001446:	4b07      	ldr	r3, [pc, #28]	; (8001464 <_ZN4CI2C5WriteEh+0x60>)
 8001448:	8a1d      	ldrh	r5, [r3, #16]
 800144a:	4620      	mov	r0, r4
 800144c:	f7ff ff7a 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 8001450:	b2ad      	uxth	r5, r5
 8001452:	4620      	mov	r0, r4
 8001454:	f7ff ff45 	bl	80012e2 <_ZN4CI2C5delayEv>
 8001458:	f085 0080 	eor.w	r0, r5, #128	; 0x80
 800145c:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8001460:	bd70      	pop	{r4, r5, r6, pc}
 8001462:	bf00      	nop
 8001464:	48000400 	.word	0x48000400

08001468 <_ZN4CI2C9write_regEhhh>:
 8001468:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800146a:	4604      	mov	r4, r0
 800146c:	460f      	mov	r7, r1
 800146e:	4616      	mov	r6, r2
 8001470:	461d      	mov	r5, r3
 8001472:	f7ff ff9d 	bl	80013b0 <_ZN4CI2C5StartEv>
 8001476:	4639      	mov	r1, r7
 8001478:	4620      	mov	r0, r4
 800147a:	f7ff ffc3 	bl	8001404 <_ZN4CI2C5WriteEh>
 800147e:	4631      	mov	r1, r6
 8001480:	4620      	mov	r0, r4
 8001482:	f7ff ffbf 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001486:	4620      	mov	r0, r4
 8001488:	4629      	mov	r1, r5
 800148a:	f7ff ffbb 	bl	8001404 <_ZN4CI2C5WriteEh>
 800148e:	4620      	mov	r0, r4
 8001490:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8001494:	f7ff bfa1 	b.w	80013da <_ZN4CI2C4StopEv>

08001498 <_ZN4CI2C4ReadEh>:
 8001498:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800149a:	4605      	mov	r5, r0
 800149c:	460f      	mov	r7, r1
 800149e:	f7ff ff51 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 80014a2:	2608      	movs	r6, #8
 80014a4:	2400      	movs	r4, #0
 80014a6:	4628      	mov	r0, r5
 80014a8:	f7ff ff54 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80014ac:	4b10      	ldr	r3, [pc, #64]	; (80014f0 <_ZN4CI2C4ReadEh+0x58>)
 80014ae:	8a1b      	ldrh	r3, [r3, #16]
 80014b0:	0064      	lsls	r4, r4, #1
 80014b2:	061b      	lsls	r3, r3, #24
 80014b4:	b2e4      	uxtb	r4, r4
 80014b6:	4628      	mov	r0, r5
 80014b8:	f106 36ff 	add.w	r6, r6, #4294967295	; 0xffffffff
 80014bc:	bf48      	it	mi
 80014be:	f044 0401 	orrmi.w	r4, r4, #1
 80014c2:	f7ff ff3f 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 80014c6:	f016 06ff 	ands.w	r6, r6, #255	; 0xff
 80014ca:	d1ec      	bne.n	80014a6 <_ZN4CI2C4ReadEh+0xe>
 80014cc:	4628      	mov	r0, r5
 80014ce:	b117      	cbz	r7, 80014d6 <_ZN4CI2C4ReadEh+0x3e>
 80014d0:	f7ff ff0e 	bl	80012f0 <_ZN4CI2C9SetLowSDAEv>
 80014d4:	e001      	b.n	80014da <_ZN4CI2C4ReadEh+0x42>
 80014d6:	f7ff ff27 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 80014da:	4628      	mov	r0, r5
 80014dc:	f7ff ff3a 	bl	8001354 <_ZN4CI2C10SetHighSCLEv>
 80014e0:	4628      	mov	r0, r5
 80014e2:	f7ff ff2f 	bl	8001344 <_ZN4CI2C9SetLowSCLEv>
 80014e6:	4628      	mov	r0, r5
 80014e8:	f7ff ff1e 	bl	8001328 <_ZN4CI2C10SetHighSDAEv>
 80014ec:	4620      	mov	r0, r4
 80014ee:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80014f0:	48000400 	.word	0x48000400

080014f4 <_ZN4CI2C8read_regEhh>:
 80014f4:	b570      	push	{r4, r5, r6, lr}
 80014f6:	4604      	mov	r4, r0
 80014f8:	460d      	mov	r5, r1
 80014fa:	4616      	mov	r6, r2
 80014fc:	f7ff ff58 	bl	80013b0 <_ZN4CI2C5StartEv>
 8001500:	4629      	mov	r1, r5
 8001502:	4620      	mov	r0, r4
 8001504:	f7ff ff7e 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001508:	4631      	mov	r1, r6
 800150a:	4620      	mov	r0, r4
 800150c:	f7ff ff7a 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001510:	4620      	mov	r0, r4
 8001512:	f7ff ff4d 	bl	80013b0 <_ZN4CI2C5StartEv>
 8001516:	f045 0101 	orr.w	r1, r5, #1
 800151a:	4620      	mov	r0, r4
 800151c:	f7ff ff72 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001520:	2100      	movs	r1, #0
 8001522:	4620      	mov	r0, r4
 8001524:	f7ff ffb8 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001528:	4605      	mov	r5, r0
 800152a:	4620      	mov	r0, r4
 800152c:	f7ff ff55 	bl	80013da <_ZN4CI2C4StopEv>
 8001530:	4628      	mov	r0, r5
 8001532:	bd70      	pop	{r4, r5, r6, pc}

08001534 <_ZN4CIMU8imu_readEv>:
 8001534:	b570      	push	{r4, r5, r6, lr}
 8001536:	4c52      	ldr	r4, [pc, #328]	; (8001680 <_ZN4CIMU8imu_readEv+0x14c>)
 8001538:	4605      	mov	r5, r0
 800153a:	4620      	mov	r0, r4
 800153c:	f7ff ff38 	bl	80013b0 <_ZN4CI2C5StartEv>
 8001540:	4620      	mov	r0, r4
 8001542:	21d4      	movs	r1, #212	; 0xd4
 8001544:	f7ff ff5e 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001548:	21a8      	movs	r1, #168	; 0xa8
 800154a:	4620      	mov	r0, r4
 800154c:	f7ff ff5a 	bl	8001404 <_ZN4CI2C5WriteEh>
 8001550:	4620      	mov	r0, r4
 8001552:	f7ff ff2d 	bl	80013b0 <_ZN4CI2C5StartEv>
 8001556:	4620      	mov	r0, r4
 8001558:	21d5      	movs	r1, #213	; 0xd5
 800155a:	f7ff ff53 	bl	8001404 <_ZN4CI2C5WriteEh>
 800155e:	4620      	mov	r0, r4
 8001560:	2101      	movs	r1, #1
 8001562:	f7ff ff99 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001566:	2101      	movs	r1, #1
 8001568:	b286      	uxth	r6, r0
 800156a:	4620      	mov	r0, r4
 800156c:	f7ff ff94 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001570:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001574:	b200      	sxth	r0, r0
 8001576:	6268      	str	r0, [r5, #36]	; 0x24
 8001578:	2101      	movs	r1, #1
 800157a:	4620      	mov	r0, r4
 800157c:	f7ff ff8c 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001580:	2101      	movs	r1, #1
 8001582:	b286      	uxth	r6, r0
 8001584:	4620      	mov	r0, r4
 8001586:	f7ff ff87 	bl	8001498 <_ZN4CI2C4ReadEh>
 800158a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 800158e:	b200      	sxth	r0, r0
 8001590:	62a8      	str	r0, [r5, #40]	; 0x28
 8001592:	2101      	movs	r1, #1
 8001594:	4620      	mov	r0, r4
 8001596:	f7ff ff7f 	bl	8001498 <_ZN4CI2C4ReadEh>
 800159a:	2100      	movs	r1, #0
 800159c:	b286      	uxth	r6, r0
 800159e:	4620      	mov	r0, r4
 80015a0:	f7ff ff7a 	bl	8001498 <_ZN4CI2C4ReadEh>
 80015a4:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 80015a8:	b200      	sxth	r0, r0
 80015aa:	62e8      	str	r0, [r5, #44]	; 0x2c
 80015ac:	4620      	mov	r0, r4
 80015ae:	f7ff ff14 	bl	80013da <_ZN4CI2C4StopEv>
 80015b2:	4620      	mov	r0, r4
 80015b4:	f7ff fefc 	bl	80013b0 <_ZN4CI2C5StartEv>
 80015b8:	4620      	mov	r0, r4
 80015ba:	213c      	movs	r1, #60	; 0x3c
 80015bc:	f7ff ff22 	bl	8001404 <_ZN4CI2C5WriteEh>
 80015c0:	21a8      	movs	r1, #168	; 0xa8
 80015c2:	4620      	mov	r0, r4
 80015c4:	f7ff ff1e 	bl	8001404 <_ZN4CI2C5WriteEh>
 80015c8:	4620      	mov	r0, r4
 80015ca:	f7ff fef1 	bl	80013b0 <_ZN4CI2C5StartEv>
 80015ce:	4620      	mov	r0, r4
 80015d0:	213d      	movs	r1, #61	; 0x3d
 80015d2:	f7ff ff17 	bl	8001404 <_ZN4CI2C5WriteEh>
 80015d6:	4620      	mov	r0, r4
 80015d8:	2101      	movs	r1, #1
 80015da:	f7ff ff5d 	bl	8001498 <_ZN4CI2C4ReadEh>
 80015de:	2101      	movs	r1, #1
 80015e0:	b286      	uxth	r6, r0
 80015e2:	4620      	mov	r0, r4
 80015e4:	f7ff ff58 	bl	8001498 <_ZN4CI2C4ReadEh>
 80015e8:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 80015ec:	b200      	sxth	r0, r0
 80015ee:	6328      	str	r0, [r5, #48]	; 0x30
 80015f0:	2101      	movs	r1, #1
 80015f2:	4620      	mov	r0, r4
 80015f4:	f7ff ff50 	bl	8001498 <_ZN4CI2C4ReadEh>
 80015f8:	2101      	movs	r1, #1
 80015fa:	b286      	uxth	r6, r0
 80015fc:	4620      	mov	r0, r4
 80015fe:	f7ff ff4b 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001602:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001606:	b200      	sxth	r0, r0
 8001608:	6368      	str	r0, [r5, #52]	; 0x34
 800160a:	2101      	movs	r1, #1
 800160c:	4620      	mov	r0, r4
 800160e:	f7ff ff43 	bl	8001498 <_ZN4CI2C4ReadEh>
 8001612:	2100      	movs	r1, #0
 8001614:	b286      	uxth	r6, r0
 8001616:	4620      	mov	r0, r4
 8001618:	f7ff ff3e 	bl	8001498 <_ZN4CI2C4ReadEh>
 800161c:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001620:	b200      	sxth	r0, r0
 8001622:	63a8      	str	r0, [r5, #56]	; 0x38
 8001624:	4620      	mov	r0, r4
 8001626:	f7ff fed8 	bl	80013da <_ZN4CI2C4StopEv>
 800162a:	686a      	ldr	r2, [r5, #4]
 800162c:	6aab      	ldr	r3, [r5, #40]	; 0x28
 800162e:	68a8      	ldr	r0, [r5, #8]
 8001630:	1a9b      	subs	r3, r3, r2
 8001632:	68ea      	ldr	r2, [r5, #12]
 8001634:	26c8      	movs	r6, #200	; 0xc8
 8001636:	fb93 f3f6 	sdiv	r3, r3, r6
 800163a:	441a      	add	r2, r3
 800163c:	6beb      	ldr	r3, [r5, #60]	; 0x3c
 800163e:	60ea      	str	r2, [r5, #12]
 8001640:	2155      	movs	r1, #85	; 0x55
 8001642:	4359      	muls	r1, r3
 8001644:	f640 14e2 	movw	r4, #2530	; 0x9e2
 8001648:	434a      	muls	r2, r1
 800164a:	6a6b      	ldr	r3, [r5, #36]	; 0x24
 800164c:	fb92 f2f4 	sdiv	r2, r2, r4
 8001650:	61aa      	str	r2, [r5, #24]
 8001652:	682a      	ldr	r2, [r5, #0]
 8001654:	1a9b      	subs	r3, r3, r2
 8001656:	692a      	ldr	r2, [r5, #16]
 8001658:	fb93 f3f6 	sdiv	r3, r3, r6
 800165c:	441a      	add	r2, r3
 800165e:	612a      	str	r2, [r5, #16]
 8001660:	434a      	muls	r2, r1
 8001662:	fb92 f2f4 	sdiv	r2, r2, r4
 8001666:	61ea      	str	r2, [r5, #28]
 8001668:	6aea      	ldr	r2, [r5, #44]	; 0x2c
 800166a:	1a12      	subs	r2, r2, r0
 800166c:	fb92 f0f6 	sdiv	r0, r2, r6
 8001670:	696a      	ldr	r2, [r5, #20]
 8001672:	1883      	adds	r3, r0, r2
 8001674:	616b      	str	r3, [r5, #20]
 8001676:	434b      	muls	r3, r1
 8001678:	fb93 f3f4 	sdiv	r3, r3, r4
 800167c:	622b      	str	r3, [r5, #32]
 800167e:	bd70      	pop	{r4, r5, r6, pc}
 8001680:	20000168 	.word	0x20000168

08001684 <_ZN4CIMU8imu_initEv>:
 8001684:	230a      	movs	r3, #10
 8001686:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 800168a:	63c3      	str	r3, [r0, #60]	; 0x3c
 800168c:	2300      	movs	r3, #0
 800168e:	4604      	mov	r4, r0
 8001690:	6003      	str	r3, [r0, #0]
 8001692:	6043      	str	r3, [r0, #4]
 8001694:	6083      	str	r3, [r0, #8]
 8001696:	60c3      	str	r3, [r0, #12]
 8001698:	6103      	str	r3, [r0, #16]
 800169a:	6143      	str	r3, [r0, #20]
 800169c:	f242 7511 	movw	r5, #10001	; 0x2711
 80016a0:	3d01      	subs	r5, #1
 80016a2:	d001      	beq.n	80016a8 <_ZN4CIMU8imu_initEv+0x24>
 80016a4:	bf00      	nop
 80016a6:	e7fb      	b.n	80016a0 <_ZN4CIMU8imu_initEv+0x1c>
 80016a8:	4832      	ldr	r0, [pc, #200]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016aa:	21d4      	movs	r1, #212	; 0xd4
 80016ac:	220f      	movs	r2, #15
 80016ae:	f7ff ff21 	bl	80014f4 <_ZN4CI2C8read_regEhh>
 80016b2:	28d4      	cmp	r0, #212	; 0xd4
 80016b4:	4606      	mov	r6, r0
 80016b6:	d155      	bne.n	8001764 <_ZN4CIMU8imu_initEv+0xe0>
 80016b8:	482e      	ldr	r0, [pc, #184]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016ba:	213c      	movs	r1, #60	; 0x3c
 80016bc:	220f      	movs	r2, #15
 80016be:	f7ff ff19 	bl	80014f4 <_ZN4CI2C8read_regEhh>
 80016c2:	2849      	cmp	r0, #73	; 0x49
 80016c4:	d152      	bne.n	800176c <_ZN4CIMU8imu_initEv+0xe8>
 80016c6:	4631      	mov	r1, r6
 80016c8:	482a      	ldr	r0, [pc, #168]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016ca:	2220      	movs	r2, #32
 80016cc:	23ff      	movs	r3, #255	; 0xff
 80016ce:	f7ff fecb 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 80016d2:	4631      	mov	r1, r6
 80016d4:	4827      	ldr	r0, [pc, #156]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016d6:	4e28      	ldr	r6, [pc, #160]	; (8001778 <_ZN4CIMU8imu_initEv+0xf4>)
 80016d8:	2223      	movs	r2, #35	; 0x23
 80016da:	2310      	movs	r3, #16
 80016dc:	f7ff fec4 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 80016e0:	4824      	ldr	r0, [pc, #144]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016e2:	213c      	movs	r1, #60	; 0x3c
 80016e4:	221f      	movs	r2, #31
 80016e6:	462b      	mov	r3, r5
 80016e8:	f7ff febe 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 80016ec:	4821      	ldr	r0, [pc, #132]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016ee:	213c      	movs	r1, #60	; 0x3c
 80016f0:	2220      	movs	r2, #32
 80016f2:	2367      	movs	r3, #103	; 0x67
 80016f4:	f7ff feb8 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 80016f8:	481e      	ldr	r0, [pc, #120]	; (8001774 <_ZN4CIMU8imu_initEv+0xf0>)
 80016fa:	213c      	movs	r1, #60	; 0x3c
 80016fc:	2221      	movs	r2, #33	; 0x21
 80016fe:	462b      	mov	r3, r5
 8001700:	f7ff feb2 	bl	8001468 <_ZN4CI2C9write_regEhhh>
 8001704:	3e01      	subs	r6, #1
 8001706:	d001      	beq.n	800170c <_ZN4CIMU8imu_initEv+0x88>
 8001708:	bf00      	nop
 800170a:	e7fb      	b.n	8001704 <_ZN4CIMU8imu_initEv+0x80>
 800170c:	4620      	mov	r0, r4
 800170e:	f7ff ff11 	bl	8001534 <_ZN4CIMU8imu_readEv>
 8001712:	2564      	movs	r5, #100	; 0x64
 8001714:	4637      	mov	r7, r6
 8001716:	46b0      	mov	r8, r6
 8001718:	2365      	movs	r3, #101	; 0x65
 800171a:	3b01      	subs	r3, #1
 800171c:	d001      	beq.n	8001722 <_ZN4CIMU8imu_initEv+0x9e>
 800171e:	bf00      	nop
 8001720:	e7fb      	b.n	800171a <_ZN4CIMU8imu_initEv+0x96>
 8001722:	4620      	mov	r0, r4
 8001724:	f7ff ff06 	bl	8001534 <_ZN4CIMU8imu_readEv>
 8001728:	6a63      	ldr	r3, [r4, #36]	; 0x24
 800172a:	4498      	add	r8, r3
 800172c:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 800172e:	441f      	add	r7, r3
 8001730:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 8001732:	3d01      	subs	r5, #1
 8001734:	441e      	add	r6, r3
 8001736:	d1ef      	bne.n	8001718 <_ZN4CIMU8imu_initEv+0x94>
 8001738:	2264      	movs	r2, #100	; 0x64
 800173a:	6325      	str	r5, [r4, #48]	; 0x30
 800173c:	fb98 f3f2 	sdiv	r3, r8, r2
 8001740:	fb97 f7f2 	sdiv	r7, r7, r2
 8001744:	fb96 f6f2 	sdiv	r6, r6, r2
 8001748:	6023      	str	r3, [r4, #0]
 800174a:	6067      	str	r7, [r4, #4]
 800174c:	60a6      	str	r6, [r4, #8]
 800174e:	6365      	str	r5, [r4, #52]	; 0x34
 8001750:	63a5      	str	r5, [r4, #56]	; 0x38
 8001752:	6265      	str	r5, [r4, #36]	; 0x24
 8001754:	62a5      	str	r5, [r4, #40]	; 0x28
 8001756:	62e5      	str	r5, [r4, #44]	; 0x2c
 8001758:	61a5      	str	r5, [r4, #24]
 800175a:	61e5      	str	r5, [r4, #28]
 800175c:	6225      	str	r5, [r4, #32]
 800175e:	4628      	mov	r0, r5
 8001760:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001764:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8001768:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800176c:	f06f 0001 	mvn.w	r0, #1
 8001770:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001774:	20000168 	.word	0x20000168
 8001778:	000186a1 	.word	0x000186a1

0800177c <_ZN4CIMU14get_imu_resultEv>:
 800177c:	3018      	adds	r0, #24
 800177e:	4770      	bx	lr

08001780 <_ZN5CGPIO9gpio_initEv>:
 8001780:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 8001784:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001788:	2101      	movs	r1, #1
 800178a:	f001 f867 	bl	800285c <RCC_AHBPeriphClockCmd>
 800178e:	4f22      	ldr	r7, [pc, #136]	; (8001818 <_ZN5CGPIO9gpio_initEv+0x98>)
 8001790:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001794:	2101      	movs	r1, #1
 8001796:	f001 f861 	bl	800285c <RCC_AHBPeriphClockCmd>
 800179a:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 800179e:	2101      	movs	r1, #1
 80017a0:	f001 f85c 	bl	800285c <RCC_AHBPeriphClockCmd>
 80017a4:	2400      	movs	r4, #0
 80017a6:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80017aa:	2503      	movs	r5, #3
 80017ac:	f04f 0801 	mov.w	r8, #1
 80017b0:	4638      	mov	r0, r7
 80017b2:	4669      	mov	r1, sp
 80017b4:	9300      	str	r3, [sp, #0]
 80017b6:	2608      	movs	r6, #8
 80017b8:	f88d 8004 	strb.w	r8, [sp, #4]
 80017bc:	f88d 4006 	strb.w	r4, [sp, #6]
 80017c0:	f88d 5005 	strb.w	r5, [sp, #5]
 80017c4:	f88d 4007 	strb.w	r4, [sp, #7]
 80017c8:	f001 fa9c 	bl	8002d04 <GPIO_Init>
 80017cc:	4669      	mov	r1, sp
 80017ce:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80017d2:	9600      	str	r6, [sp, #0]
 80017d4:	f88d 8004 	strb.w	r8, [sp, #4]
 80017d8:	f88d 4006 	strb.w	r4, [sp, #6]
 80017dc:	f88d 5005 	strb.w	r5, [sp, #5]
 80017e0:	f88d 4007 	strb.w	r4, [sp, #7]
 80017e4:	f001 fa8e 	bl	8002d04 <GPIO_Init>
 80017e8:	f44f 7300 	mov.w	r3, #512	; 0x200
 80017ec:	4638      	mov	r0, r7
 80017ee:	4669      	mov	r1, sp
 80017f0:	9300      	str	r3, [sp, #0]
 80017f2:	f88d 4004 	strb.w	r4, [sp, #4]
 80017f6:	f88d 5005 	strb.w	r5, [sp, #5]
 80017fa:	f88d 4007 	strb.w	r4, [sp, #7]
 80017fe:	f001 fa81 	bl	8002d04 <GPIO_Init>
 8001802:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001806:	4620      	mov	r0, r4
 8001808:	851e      	strh	r6, [r3, #40]	; 0x28
 800180a:	4b04      	ldr	r3, [pc, #16]	; (800181c <_ZN5CGPIO9gpio_initEv+0x9c>)
 800180c:	601c      	str	r4, [r3, #0]
 800180e:	4b04      	ldr	r3, [pc, #16]	; (8001820 <_ZN5CGPIO9gpio_initEv+0xa0>)
 8001810:	601c      	str	r4, [r3, #0]
 8001812:	b002      	add	sp, #8
 8001814:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001818:	48000400 	.word	0x48000400
 800181c:	2000016c 	.word	0x2000016c
 8001820:	20000170 	.word	0x20000170

08001824 <_ZN5CGPIO7gpio_onEm>:
 8001824:	2908      	cmp	r1, #8
 8001826:	d005      	beq.n	8001834 <_ZN5CGPIO7gpio_onEm+0x10>
 8001828:	f5b1 4f00 	cmp.w	r1, #32768	; 0x8000
 800182c:	d105      	bne.n	800183a <_ZN5CGPIO7gpio_onEm+0x16>
 800182e:	4b03      	ldr	r3, [pc, #12]	; (800183c <_ZN5CGPIO7gpio_onEm+0x18>)
 8001830:	6199      	str	r1, [r3, #24]
 8001832:	4770      	bx	lr
 8001834:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001838:	8519      	strh	r1, [r3, #40]	; 0x28
 800183a:	4770      	bx	lr
 800183c:	48000400 	.word	0x48000400

08001840 <_ZN5CGPIO8gpio_offEm>:
 8001840:	2908      	cmp	r1, #8
 8001842:	d005      	beq.n	8001850 <_ZN5CGPIO8gpio_offEm+0x10>
 8001844:	f5b1 4f00 	cmp.w	r1, #32768	; 0x8000
 8001848:	d105      	bne.n	8001856 <_ZN5CGPIO8gpio_offEm+0x16>
 800184a:	4b03      	ldr	r3, [pc, #12]	; (8001858 <_ZN5CGPIO8gpio_offEm+0x18>)
 800184c:	8519      	strh	r1, [r3, #40]	; 0x28
 800184e:	4770      	bx	lr
 8001850:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001854:	6199      	str	r1, [r3, #24]
 8001856:	4770      	bx	lr
 8001858:	48000400 	.word	0x48000400

0800185c <_ZN5CGPIO7gpio_inEm>:
 800185c:	4b02      	ldr	r3, [pc, #8]	; (8001868 <_ZN5CGPIO7gpio_inEm+0xc>)
 800185e:	8a18      	ldrh	r0, [r3, #16]
 8001860:	b280      	uxth	r0, r0
 8001862:	ea21 0000 	bic.w	r0, r1, r0
 8001866:	4770      	bx	lr
 8001868:	48000400 	.word	0x48000400

0800186c <EXTI9_5_IRQHandler>:
 800186c:	4a03      	ldr	r2, [pc, #12]	; (800187c <EXTI9_5_IRQHandler+0x10>)
 800186e:	6813      	ldr	r3, [r2, #0]
 8001870:	2006      	movs	r0, #6
 8001872:	3301      	adds	r3, #1
 8001874:	6013      	str	r3, [r2, #0]
 8001876:	f001 ba39 	b.w	8002cec <EXTI_ClearITPendingBit>
 800187a:	bf00      	nop
 800187c:	2000016c 	.word	0x2000016c

08001880 <EXTI15_10_IRQHandler>:
 8001880:	4a03      	ldr	r2, [pc, #12]	; (8001890 <EXTI15_10_IRQHandler+0x10>)
 8001882:	6813      	ldr	r3, [r2, #0]
 8001884:	200c      	movs	r0, #12
 8001886:	3301      	adds	r3, #1
 8001888:	6013      	str	r3, [r2, #0]
 800188a:	f001 ba2f 	b.w	8002cec <EXTI_ClearITPendingBit>
 800188e:	bf00      	nop
 8001890:	20000170 	.word	0x20000170

08001894 <_ZN9CTerminal12clear_bufferEv>:
 8001894:	4a05      	ldr	r2, [pc, #20]	; (80018ac <_ZN9CTerminal12clear_bufferEv+0x18>)
 8001896:	2300      	movs	r3, #0
 8001898:	6013      	str	r3, [r2, #0]
 800189a:	4a05      	ldr	r2, [pc, #20]	; (80018b0 <_ZN9CTerminal12clear_bufferEv+0x1c>)
 800189c:	6013      	str	r3, [r2, #0]
 800189e:	4a05      	ldr	r2, [pc, #20]	; (80018b4 <_ZN9CTerminal12clear_bufferEv+0x20>)
 80018a0:	2100      	movs	r1, #0
 80018a2:	54d1      	strb	r1, [r2, r3]
 80018a4:	3301      	adds	r3, #1
 80018a6:	2b10      	cmp	r3, #16
 80018a8:	d1f9      	bne.n	800189e <_ZN9CTerminal12clear_bufferEv+0xa>
 80018aa:	4770      	bx	lr
 80018ac:	20000174 	.word	0x20000174
 80018b0:	20000188 	.word	0x20000188
 80018b4:	20000178 	.word	0x20000178

080018b8 <_ZN9CTerminal13terminal_initEv>:
 80018b8:	b570      	push	{r4, r5, r6, lr}
 80018ba:	b08a      	sub	sp, #40	; 0x28
 80018bc:	f7ff ffea 	bl	8001894 <_ZN9CTerminal12clear_bufferEv>
 80018c0:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80018c4:	2101      	movs	r1, #1
 80018c6:	f000 ffc9 	bl	800285c <RCC_AHBPeriphClockCmd>
 80018ca:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 80018ce:	2101      	movs	r1, #1
 80018d0:	f000 ffd2 	bl	8002878 <RCC_APB2PeriphClockCmd>
 80018d4:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80018d8:	9302      	str	r3, [sp, #8]
 80018da:	2302      	movs	r3, #2
 80018dc:	2400      	movs	r4, #0
 80018de:	f88d 300c 	strb.w	r3, [sp, #12]
 80018e2:	a902      	add	r1, sp, #8
 80018e4:	2303      	movs	r3, #3
 80018e6:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018ea:	f88d 300d 	strb.w	r3, [sp, #13]
 80018ee:	f88d 400e 	strb.w	r4, [sp, #14]
 80018f2:	f88d 400f 	strb.w	r4, [sp, #15]
 80018f6:	f001 fa05 	bl	8002d04 <GPIO_Init>
 80018fa:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018fe:	2109      	movs	r1, #9
 8001900:	2207      	movs	r2, #7
 8001902:	f001 fa45 	bl	8002d90 <GPIO_PinAFConfig>
 8001906:	4d18      	ldr	r5, [pc, #96]	; (8001968 <_ZN9CTerminal13terminal_initEv+0xb0>)
 8001908:	2207      	movs	r2, #7
 800190a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800190e:	210a      	movs	r1, #10
 8001910:	f001 fa3e 	bl	8002d90 <GPIO_PinAFConfig>
 8001914:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001918:	9304      	str	r3, [sp, #16]
 800191a:	4628      	mov	r0, r5
 800191c:	230c      	movs	r3, #12
 800191e:	a904      	add	r1, sp, #16
 8001920:	9308      	str	r3, [sp, #32]
 8001922:	9405      	str	r4, [sp, #20]
 8001924:	9406      	str	r4, [sp, #24]
 8001926:	9407      	str	r4, [sp, #28]
 8001928:	9409      	str	r4, [sp, #36]	; 0x24
 800192a:	f001 f871 	bl	8002a10 <USART_Init>
 800192e:	4628      	mov	r0, r5
 8001930:	2101      	movs	r1, #1
 8001932:	f001 f8cf 	bl	8002ad4 <USART_Cmd>
 8001936:	2201      	movs	r2, #1
 8001938:	4628      	mov	r0, r5
 800193a:	490c      	ldr	r1, [pc, #48]	; (800196c <_ZN9CTerminal13terminal_initEv+0xb4>)
 800193c:	f001 f8da 	bl	8002af4 <USART_ITConfig>
 8001940:	2601      	movs	r6, #1
 8001942:	2325      	movs	r3, #37	; 0x25
 8001944:	a801      	add	r0, sp, #4
 8001946:	f88d 3004 	strb.w	r3, [sp, #4]
 800194a:	f88d 4005 	strb.w	r4, [sp, #5]
 800194e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001952:	f88d 6007 	strb.w	r6, [sp, #7]
 8001956:	f001 f98f 	bl	8002c78 <NVIC_Init>
 800195a:	4628      	mov	r0, r5
 800195c:	4631      	mov	r1, r6
 800195e:	f001 f8b9 	bl	8002ad4 <USART_Cmd>
 8001962:	4620      	mov	r0, r4
 8001964:	b00a      	add	sp, #40	; 0x28
 8001966:	bd70      	pop	{r4, r5, r6, pc}
 8001968:	40013800 	.word	0x40013800
 800196c:	00050105 	.word	0x00050105

08001970 <USART1_IRQHandler>:
 8001970:	b508      	push	{r3, lr}
 8001972:	480d      	ldr	r0, [pc, #52]	; (80019a8 <USART1_IRQHandler+0x38>)
 8001974:	490d      	ldr	r1, [pc, #52]	; (80019ac <USART1_IRQHandler+0x3c>)
 8001976:	f001 f8d7 	bl	8002b28 <USART_GetITStatus>
 800197a:	b178      	cbz	r0, 800199c <USART1_IRQHandler+0x2c>
 800197c:	480a      	ldr	r0, [pc, #40]	; (80019a8 <USART1_IRQHandler+0x38>)
 800197e:	f001 f8b4 	bl	8002aea <USART_ReceiveData>
 8001982:	4b0b      	ldr	r3, [pc, #44]	; (80019b0 <USART1_IRQHandler+0x40>)
 8001984:	490b      	ldr	r1, [pc, #44]	; (80019b4 <USART1_IRQHandler+0x44>)
 8001986:	681a      	ldr	r2, [r3, #0]
 8001988:	b2c0      	uxtb	r0, r0
 800198a:	5488      	strb	r0, [r1, r2]
 800198c:	681a      	ldr	r2, [r3, #0]
 800198e:	3201      	adds	r2, #1
 8001990:	601a      	str	r2, [r3, #0]
 8001992:	681a      	ldr	r2, [r3, #0]
 8001994:	2a0f      	cmp	r2, #15
 8001996:	bf84      	itt	hi
 8001998:	2200      	movhi	r2, #0
 800199a:	601a      	strhi	r2, [r3, #0]
 800199c:	4802      	ldr	r0, [pc, #8]	; (80019a8 <USART1_IRQHandler+0x38>)
 800199e:	4903      	ldr	r1, [pc, #12]	; (80019ac <USART1_IRQHandler+0x3c>)
 80019a0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80019a4:	f001 b8de 	b.w	8002b64 <USART_ClearITPendingBit>
 80019a8:	40013800 	.word	0x40013800
 80019ac:	00050105 	.word	0x00050105
 80019b0:	20000174 	.word	0x20000174
 80019b4:	20000178 	.word	0x20000178

080019b8 <_ZN9CTerminal7putcharEc>:
 80019b8:	4b04      	ldr	r3, [pc, #16]	; (80019cc <_ZN9CTerminal7putcharEc+0x14>)
 80019ba:	69da      	ldr	r2, [r3, #28]
 80019bc:	0612      	lsls	r2, r2, #24
 80019be:	d401      	bmi.n	80019c4 <_ZN9CTerminal7putcharEc+0xc>
 80019c0:	bf00      	nop
 80019c2:	e7f9      	b.n	80019b8 <_ZN9CTerminal7putcharEc>
 80019c4:	b289      	uxth	r1, r1
 80019c6:	8519      	strh	r1, [r3, #40]	; 0x28
 80019c8:	4770      	bx	lr
 80019ca:	bf00      	nop
 80019cc:	40013800 	.word	0x40013800

080019d0 <_ZN9CTerminal6ischarEv>:
 80019d0:	4b0a      	ldr	r3, [pc, #40]	; (80019fc <_ZN9CTerminal6ischarEv+0x2c>)
 80019d2:	4a0b      	ldr	r2, [pc, #44]	; (8001a00 <_ZN9CTerminal6ischarEv+0x30>)
 80019d4:	6819      	ldr	r1, [r3, #0]
 80019d6:	6812      	ldr	r2, [r2, #0]
 80019d8:	4291      	cmp	r1, r2
 80019da:	d00c      	beq.n	80019f6 <_ZN9CTerminal6ischarEv+0x26>
 80019dc:	681a      	ldr	r2, [r3, #0]
 80019de:	4909      	ldr	r1, [pc, #36]	; (8001a04 <_ZN9CTerminal6ischarEv+0x34>)
 80019e0:	5c88      	ldrb	r0, [r1, r2]
 80019e2:	681a      	ldr	r2, [r3, #0]
 80019e4:	3201      	adds	r2, #1
 80019e6:	601a      	str	r2, [r3, #0]
 80019e8:	681a      	ldr	r2, [r3, #0]
 80019ea:	2a0f      	cmp	r2, #15
 80019ec:	b2c0      	uxtb	r0, r0
 80019ee:	d904      	bls.n	80019fa <_ZN9CTerminal6ischarEv+0x2a>
 80019f0:	2200      	movs	r2, #0
 80019f2:	601a      	str	r2, [r3, #0]
 80019f4:	4770      	bx	lr
 80019f6:	f64f 70ff 	movw	r0, #65535	; 0xffff
 80019fa:	4770      	bx	lr
 80019fc:	20000188 	.word	0x20000188
 8001a00:	20000174 	.word	0x20000174
 8001a04:	20000178 	.word	0x20000178

08001a08 <_ZN9CTerminal7getcharEv>:
 8001a08:	b510      	push	{r4, lr}
 8001a0a:	4604      	mov	r4, r0
 8001a0c:	4620      	mov	r0, r4
 8001a0e:	f7ff ffdf 	bl	80019d0 <_ZN9CTerminal6ischarEv>
 8001a12:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001a16:	4298      	cmp	r0, r3
 8001a18:	d101      	bne.n	8001a1e <_ZN9CTerminal7getcharEv+0x16>
 8001a1a:	bf00      	nop
 8001a1c:	e7f6      	b.n	8001a0c <_ZN9CTerminal7getcharEv+0x4>
 8001a1e:	bd10      	pop	{r4, pc}

08001a20 <_ZN9CTerminal4putsEPc>:
 8001a20:	b538      	push	{r3, r4, r5, lr}
 8001a22:	4605      	mov	r5, r0
 8001a24:	1e4c      	subs	r4, r1, #1
 8001a26:	f814 1f01 	ldrb.w	r1, [r4, #1]!
 8001a2a:	b119      	cbz	r1, 8001a34 <_ZN9CTerminal4putsEPc+0x14>
 8001a2c:	4628      	mov	r0, r5
 8001a2e:	f7ff ffc3 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8001a32:	e7f8      	b.n	8001a26 <_ZN9CTerminal4putsEPc+0x6>
 8001a34:	2001      	movs	r0, #1
 8001a36:	bd38      	pop	{r3, r4, r5, pc}

08001a38 <_ZN9CTerminal4putiEl>:
 8001a38:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8001a3a:	1e0b      	subs	r3, r1, #0
 8001a3c:	f04f 0200 	mov.w	r2, #0
 8001a40:	bfba      	itte	lt
 8001a42:	425b      	neglt	r3, r3
 8001a44:	2501      	movlt	r5, #1
 8001a46:	4615      	movge	r5, r2
 8001a48:	f88d 200f 	strb.w	r2, [sp, #15]
 8001a4c:	210a      	movs	r1, #10
 8001a4e:	220a      	movs	r2, #10
 8001a50:	ac01      	add	r4, sp, #4
 8001a52:	fb93 f6f2 	sdiv	r6, r3, r2
 8001a56:	fb02 3316 	mls	r3, r2, r6, r3
 8001a5a:	3330      	adds	r3, #48	; 0x30
 8001a5c:	550b      	strb	r3, [r1, r4]
 8001a5e:	1e4a      	subs	r2, r1, #1
 8001a60:	4633      	mov	r3, r6
 8001a62:	b10e      	cbz	r6, 8001a68 <_ZN9CTerminal4putiEl+0x30>
 8001a64:	4611      	mov	r1, r2
 8001a66:	e7f2      	b.n	8001a4e <_ZN9CTerminal4putiEl+0x16>
 8001a68:	b12d      	cbz	r5, 8001a76 <_ZN9CTerminal4putiEl+0x3e>
 8001a6a:	ab04      	add	r3, sp, #16
 8001a6c:	4413      	add	r3, r2
 8001a6e:	212d      	movs	r1, #45	; 0x2d
 8001a70:	f803 1c0c 	strb.w	r1, [r3, #-12]
 8001a74:	4611      	mov	r1, r2
 8001a76:	4421      	add	r1, r4
 8001a78:	f7ff ffd2 	bl	8001a20 <_ZN9CTerminal4putsEPc>
 8001a7c:	b004      	add	sp, #16
 8001a7e:	bd70      	pop	{r4, r5, r6, pc}

08001a80 <_ZN9CTerminal5putuiEm>:
 8001a80:	b530      	push	{r4, r5, lr}
 8001a82:	b085      	sub	sp, #20
 8001a84:	2300      	movs	r3, #0
 8001a86:	f88d 300f 	strb.w	r3, [sp, #15]
 8001a8a:	220a      	movs	r2, #10
 8001a8c:	230a      	movs	r3, #10
 8001a8e:	ac01      	add	r4, sp, #4
 8001a90:	fbb1 f5f3 	udiv	r5, r1, r3
 8001a94:	fb03 1315 	mls	r3, r3, r5, r1
 8001a98:	3330      	adds	r3, #48	; 0x30
 8001a9a:	5513      	strb	r3, [r2, r4]
 8001a9c:	4629      	mov	r1, r5
 8001a9e:	1e53      	subs	r3, r2, #1
 8001aa0:	b10d      	cbz	r5, 8001aa6 <_ZN9CTerminal5putuiEm+0x26>
 8001aa2:	461a      	mov	r2, r3
 8001aa4:	e7f2      	b.n	8001a8c <_ZN9CTerminal5putuiEm+0xc>
 8001aa6:	18a1      	adds	r1, r4, r2
 8001aa8:	f7ff ffba 	bl	8001a20 <_ZN9CTerminal4putsEPc>
 8001aac:	b005      	add	sp, #20
 8001aae:	bd30      	pop	{r4, r5, pc}

08001ab0 <_ZN9CTerminal4putxEm>:
 8001ab0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8001ab2:	2300      	movs	r3, #0
 8001ab4:	f88d 300f 	strb.w	r3, [sp, #15]
 8001ab8:	220a      	movs	r2, #10
 8001aba:	f001 030f 	and.w	r3, r1, #15
 8001abe:	2b09      	cmp	r3, #9
 8001ac0:	ac01      	add	r4, sp, #4
 8001ac2:	bfd4      	ite	le
 8001ac4:	3330      	addle	r3, #48	; 0x30
 8001ac6:	3357      	addgt	r3, #87	; 0x57
 8001ac8:	0909      	lsrs	r1, r1, #4
 8001aca:	54a3      	strb	r3, [r4, r2]
 8001acc:	f102 33ff 	add.w	r3, r2, #4294967295	; 0xffffffff
 8001ad0:	d001      	beq.n	8001ad6 <_ZN9CTerminal4putxEm+0x26>
 8001ad2:	461a      	mov	r2, r3
 8001ad4:	e7f1      	b.n	8001aba <_ZN9CTerminal4putxEm+0xa>
 8001ad6:	18a1      	adds	r1, r4, r2
 8001ad8:	f7ff ffa2 	bl	8001a20 <_ZN9CTerminal4putsEPc>
 8001adc:	b004      	add	sp, #16
 8001ade:	bd10      	pop	{r4, pc}

08001ae0 <_ZN9CTerminal4putfEfj>:
 8001ae0:	b538      	push	{r3, r4, r5, lr}
 8001ae2:	2200      	movs	r2, #0
 8001ae4:	4605      	mov	r5, r0
 8001ae6:	2301      	movs	r3, #1
 8001ae8:	428a      	cmp	r2, r1
 8001aea:	d003      	beq.n	8001af4 <_ZN9CTerminal4putfEfj+0x14>
 8001aec:	200a      	movs	r0, #10
 8001aee:	4343      	muls	r3, r0
 8001af0:	3201      	adds	r2, #1
 8001af2:	e7f9      	b.n	8001ae8 <_ZN9CTerminal4putfEfj+0x8>
 8001af4:	eebd 7ac0 	vcvt.s32.f32	s14, s0
 8001af8:	4628      	mov	r0, r5
 8001afa:	eef8 7ac7 	vcvt.f32.s32	s15, s14
 8001afe:	ee17 1a10 	vmov	r1, s14
 8001b02:	ee30 0a67 	vsub.f32	s0, s0, s15
 8001b06:	ee07 3a90 	vmov	s15, r3
 8001b0a:	eef8 7a67 	vcvt.f32.u32	s15, s15
 8001b0e:	ee20 0a27 	vmul.f32	s0, s0, s15
 8001b12:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8001b16:	ee17 4a90 	vmov	r4, s15
 8001b1a:	f7ff ff8d 	bl	8001a38 <_ZN9CTerminal4putiEl>
 8001b1e:	4628      	mov	r0, r5
 8001b20:	212e      	movs	r1, #46	; 0x2e
 8001b22:	f7ff ff49 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8001b26:	ea84 71e4 	eor.w	r1, r4, r4, asr #31
 8001b2a:	4628      	mov	r0, r5
 8001b2c:	eba1 71e4 	sub.w	r1, r1, r4, asr #31
 8001b30:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001b34:	f7ff bf80 	b.w	8001a38 <_ZN9CTerminal4putiEl>

08001b38 <_ZN9CTerminal6printfEPKcz>:
 8001b38:	b40e      	push	{r1, r2, r3}
 8001b3a:	b577      	push	{r0, r1, r2, r4, r5, r6, lr}
 8001b3c:	ab07      	add	r3, sp, #28
 8001b3e:	4604      	mov	r4, r0
 8001b40:	f853 6b04 	ldr.w	r6, [r3], #4
 8001b44:	9301      	str	r3, [sp, #4]
 8001b46:	2500      	movs	r5, #0
 8001b48:	5d71      	ldrb	r1, [r6, r5]
 8001b4a:	2900      	cmp	r1, #0
 8001b4c:	d054      	beq.n	8001bf8 <_ZN9CTerminal6printfEPKcz+0xc0>
 8001b4e:	2925      	cmp	r1, #37	; 0x25
 8001b50:	d004      	beq.n	8001b5c <_ZN9CTerminal6printfEPKcz+0x24>
 8001b52:	4620      	mov	r0, r4
 8001b54:	f7ff ff30 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8001b58:	3501      	adds	r5, #1
 8001b5a:	e7f5      	b.n	8001b48 <_ZN9CTerminal6printfEPKcz+0x10>
 8001b5c:	1973      	adds	r3, r6, r5
 8001b5e:	7859      	ldrb	r1, [r3, #1]
 8001b60:	2969      	cmp	r1, #105	; 0x69
 8001b62:	d016      	beq.n	8001b92 <_ZN9CTerminal6printfEPKcz+0x5a>
 8001b64:	d807      	bhi.n	8001b76 <_ZN9CTerminal6printfEPKcz+0x3e>
 8001b66:	2963      	cmp	r1, #99	; 0x63
 8001b68:	d02b      	beq.n	8001bc2 <_ZN9CTerminal6printfEPKcz+0x8a>
 8001b6a:	2966      	cmp	r1, #102	; 0x66
 8001b6c:	d031      	beq.n	8001bd2 <_ZN9CTerminal6printfEPKcz+0x9a>
 8001b6e:	2925      	cmp	r1, #37	; 0x25
 8001b70:	d140      	bne.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b72:	4620      	mov	r0, r4
 8001b74:	e02a      	b.n	8001bcc <_ZN9CTerminal6printfEPKcz+0x94>
 8001b76:	2975      	cmp	r1, #117	; 0x75
 8001b78:	d013      	beq.n	8001ba2 <_ZN9CTerminal6printfEPKcz+0x6a>
 8001b7a:	2978      	cmp	r1, #120	; 0x78
 8001b7c:	d019      	beq.n	8001bb2 <_ZN9CTerminal6printfEPKcz+0x7a>
 8001b7e:	2973      	cmp	r1, #115	; 0x73
 8001b80:	d138      	bne.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b82:	9b01      	ldr	r3, [sp, #4]
 8001b84:	4620      	mov	r0, r4
 8001b86:	1d1a      	adds	r2, r3, #4
 8001b88:	6819      	ldr	r1, [r3, #0]
 8001b8a:	9201      	str	r2, [sp, #4]
 8001b8c:	f7ff ff48 	bl	8001a20 <_ZN9CTerminal4putsEPc>
 8001b90:	e030      	b.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b92:	9b01      	ldr	r3, [sp, #4]
 8001b94:	4620      	mov	r0, r4
 8001b96:	1d1a      	adds	r2, r3, #4
 8001b98:	6819      	ldr	r1, [r3, #0]
 8001b9a:	9201      	str	r2, [sp, #4]
 8001b9c:	f7ff ff4c 	bl	8001a38 <_ZN9CTerminal4putiEl>
 8001ba0:	e028      	b.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001ba2:	9b01      	ldr	r3, [sp, #4]
 8001ba4:	4620      	mov	r0, r4
 8001ba6:	1d1a      	adds	r2, r3, #4
 8001ba8:	6819      	ldr	r1, [r3, #0]
 8001baa:	9201      	str	r2, [sp, #4]
 8001bac:	f7ff ff68 	bl	8001a80 <_ZN9CTerminal5putuiEm>
 8001bb0:	e020      	b.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001bb2:	9b01      	ldr	r3, [sp, #4]
 8001bb4:	4620      	mov	r0, r4
 8001bb6:	1d1a      	adds	r2, r3, #4
 8001bb8:	6819      	ldr	r1, [r3, #0]
 8001bba:	9201      	str	r2, [sp, #4]
 8001bbc:	f7ff ff78 	bl	8001ab0 <_ZN9CTerminal4putxEm>
 8001bc0:	e018      	b.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001bc2:	9b01      	ldr	r3, [sp, #4]
 8001bc4:	1d1a      	adds	r2, r3, #4
 8001bc6:	7819      	ldrb	r1, [r3, #0]
 8001bc8:	9201      	str	r2, [sp, #4]
 8001bca:	4620      	mov	r0, r4
 8001bcc:	f7ff fef4 	bl	80019b8 <_ZN9CTerminal7putcharEc>
 8001bd0:	e010      	b.n	8001bf4 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001bd2:	9b01      	ldr	r3, [sp, #4]
 8001bd4:	3307      	adds	r3, #7
 8001bd6:	f023 0307 	bic.w	r3, r3, #7
 8001bda:	f103 0208 	add.w	r2, r3, #8
 8001bde:	e9d3 0100 	ldrd	r0, r1, [r3]
 8001be2:	9201      	str	r2, [sp, #4]
 8001be4:	f001 f972 	bl	8002ecc <__aeabi_d2f>
 8001be8:	2103      	movs	r1, #3
 8001bea:	ee00 0a10 	vmov	s0, r0
 8001bee:	4620      	mov	r0, r4
 8001bf0:	f7ff ff76 	bl	8001ae0 <_ZN9CTerminal4putfEfj>
 8001bf4:	3502      	adds	r5, #2
 8001bf6:	e7a7      	b.n	8001b48 <_ZN9CTerminal6printfEPKcz+0x10>
 8001bf8:	b003      	add	sp, #12
 8001bfa:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001bfe:	b003      	add	sp, #12
 8001c00:	4770      	bx	lr
	...

08001c04 <_Z13i_led_set_pwmj>:
 8001c04:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8001c06:	2370      	movs	r3, #112	; 0x70
 8001c08:	9301      	str	r3, [sp, #4]
 8001c0a:	2301      	movs	r3, #1
 8001c0c:	f8ad 3008 	strh.w	r3, [sp, #8]
 8001c10:	2304      	movs	r3, #4
 8001c12:	f8ad 300a 	strh.w	r3, [sp, #10]
 8001c16:	2302      	movs	r3, #2
 8001c18:	f8ad 3010 	strh.w	r3, [sp, #16]
 8001c1c:	2300      	movs	r3, #0
 8001c1e:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001c22:	f8ad 3016 	strh.w	r3, [sp, #22]
 8001c26:	4b0a      	ldr	r3, [pc, #40]	; (8001c50 <_Z13i_led_set_pwmj+0x4c>)
 8001c28:	f44f 7280 	mov.w	r2, #256	; 0x100
 8001c2c:	f8ad 2014 	strh.w	r2, [sp, #20]
 8001c30:	681b      	ldr	r3, [r3, #0]
 8001c32:	22c8      	movs	r2, #200	; 0xc8
 8001c34:	fbb3 f3f2 	udiv	r3, r3, r2
 8001c38:	3b02      	subs	r3, #2
 8001c3a:	4358      	muls	r0, r3
 8001c3c:	0980      	lsrs	r0, r0, #6
 8001c3e:	9003      	str	r0, [sp, #12]
 8001c40:	a901      	add	r1, sp, #4
 8001c42:	4804      	ldr	r0, [pc, #16]	; (8001c54 <_Z13i_led_set_pwmj+0x50>)
 8001c44:	f000 fe92 	bl	800296c <TIM_OC2Init>
 8001c48:	b007      	add	sp, #28
 8001c4a:	f85d fb04 	ldr.w	pc, [sp], #4
 8001c4e:	bf00      	nop
 8001c50:	20000030 	.word	0x20000030
 8001c54:	40014000 	.word	0x40014000

08001c58 <_ZN5CILED10i_led_initEv>:
 8001c58:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001c5a:	4b3a      	ldr	r3, [pc, #232]	; (8001d44 <_ZN5CILED10i_led_initEv+0xec>)
 8001c5c:	4f3a      	ldr	r7, [pc, #232]	; (8001d48 <_ZN5CILED10i_led_initEv+0xf0>)
 8001c5e:	4e3b      	ldr	r6, [pc, #236]	; (8001d4c <_ZN5CILED10i_led_initEv+0xf4>)
 8001c60:	4d3b      	ldr	r5, [pc, #236]	; (8001d50 <_ZN5CILED10i_led_initEv+0xf8>)
 8001c62:	2400      	movs	r4, #0
 8001c64:	701c      	strb	r4, [r3, #0]
 8001c66:	4b3b      	ldr	r3, [pc, #236]	; (8001d54 <_ZN5CILED10i_led_initEv+0xfc>)
 8001c68:	703c      	strb	r4, [r7, #0]
 8001c6a:	601c      	str	r4, [r3, #0]
 8001c6c:	4b3a      	ldr	r3, [pc, #232]	; (8001d58 <_ZN5CILED10i_led_initEv+0x100>)
 8001c6e:	6034      	str	r4, [r6, #0]
 8001c70:	b08b      	sub	sp, #44	; 0x2c
 8001c72:	701c      	strb	r4, [r3, #0]
 8001c74:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001c78:	9302      	str	r3, [sp, #8]
 8001c7a:	2302      	movs	r3, #2
 8001c7c:	f88d 300c 	strb.w	r3, [sp, #12]
 8001c80:	4628      	mov	r0, r5
 8001c82:	2303      	movs	r3, #3
 8001c84:	a902      	add	r1, sp, #8
 8001c86:	f88d 300d 	strb.w	r3, [sp, #13]
 8001c8a:	f001 f83b 	bl	8002d04 <GPIO_Init>
 8001c8e:	4628      	mov	r0, r5
 8001c90:	2201      	movs	r2, #1
 8001c92:	210f      	movs	r1, #15
 8001c94:	f001 f87c 	bl	8002d90 <GPIO_PinAFConfig>
 8001c98:	f44f 3080 	mov.w	r0, #65536	; 0x10000
 8001c9c:	2101      	movs	r1, #1
 8001c9e:	f000 fdeb 	bl	8002878 <RCC_APB2PeriphClockCmd>
 8001ca2:	4d2e      	ldr	r5, [pc, #184]	; (8001d5c <_ZN5CILED10i_led_initEv+0x104>)
 8001ca4:	4b2e      	ldr	r3, [pc, #184]	; (8001d60 <_ZN5CILED10i_led_initEv+0x108>)
 8001ca6:	f8ad 4010 	strh.w	r4, [sp, #16]
 8001caa:	22c8      	movs	r2, #200	; 0xc8
 8001cac:	4628      	mov	r0, r5
 8001cae:	a904      	add	r1, sp, #16
 8001cb0:	681b      	ldr	r3, [r3, #0]
 8001cb2:	fbb3 f3f2 	udiv	r3, r3, r2
 8001cb6:	3b01      	subs	r3, #1
 8001cb8:	9305      	str	r3, [sp, #20]
 8001cba:	f8ad 4012 	strh.w	r4, [sp, #18]
 8001cbe:	f8ad 4018 	strh.w	r4, [sp, #24]
 8001cc2:	f8ad 401a 	strh.w	r4, [sp, #26]
 8001cc6:	f000 fdf3 	bl	80028b0 <TIM_TimeBaseInit>
 8001cca:	4628      	mov	r0, r5
 8001ccc:	2101      	movs	r1, #1
 8001cce:	f000 fe3f 	bl	8002950 <TIM_Cmd>
 8001cd2:	4628      	mov	r0, r5
 8001cd4:	2101      	movs	r1, #1
 8001cd6:	f000 fe8a 	bl	80029ee <TIM_CtrlPWMOutputs>
 8001cda:	4620      	mov	r0, r4
 8001cdc:	f7ff ff92 	bl	8001c04 <_Z13i_led_set_pwmj>
 8001ce0:	2004      	movs	r0, #4
 8001ce2:	2101      	movs	r1, #1
 8001ce4:	f000 fdd6 	bl	8002894 <RCC_APB1PeriphClockCmd>
 8001ce8:	f5a5 359c 	sub.w	r5, r5, #79872	; 0x13800
 8001cec:	f44f 7334 	mov.w	r3, #720	; 0x2d0
 8001cf0:	f8ad 301c 	strh.w	r3, [sp, #28]
 8001cf4:	4628      	mov	r0, r5
 8001cf6:	f240 33e7 	movw	r3, #999	; 0x3e7
 8001cfa:	a907      	add	r1, sp, #28
 8001cfc:	9308      	str	r3, [sp, #32]
 8001cfe:	f8ad 401e 	strh.w	r4, [sp, #30]
 8001d02:	f8ad 4024 	strh.w	r4, [sp, #36]	; 0x24
 8001d06:	f8ad 4026 	strh.w	r4, [sp, #38]	; 0x26
 8001d0a:	f000 fdd1 	bl	80028b0 <TIM_TimeBaseInit>
 8001d0e:	4628      	mov	r0, r5
 8001d10:	2101      	movs	r1, #1
 8001d12:	f000 fe1d 	bl	8002950 <TIM_Cmd>
 8001d16:	68eb      	ldr	r3, [r5, #12]
 8001d18:	f043 0301 	orr.w	r3, r3, #1
 8001d1c:	60eb      	str	r3, [r5, #12]
 8001d1e:	a801      	add	r0, sp, #4
 8001d20:	231e      	movs	r3, #30
 8001d22:	f88d 4005 	strb.w	r4, [sp, #5]
 8001d26:	2401      	movs	r4, #1
 8001d28:	f88d 3004 	strb.w	r3, [sp, #4]
 8001d2c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d30:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d34:	f000 ffa0 	bl	8002c78 <NVIC_Init>
 8001d38:	2364      	movs	r3, #100	; 0x64
 8001d3a:	703c      	strb	r4, [r7, #0]
 8001d3c:	6033      	str	r3, [r6, #0]
 8001d3e:	b00b      	add	sp, #44	; 0x2c
 8001d40:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001d42:	bf00      	nop
 8001d44:	20000199 	.word	0x20000199
 8001d48:	2000019a 	.word	0x2000019a
 8001d4c:	20000194 	.word	0x20000194
 8001d50:	48000400 	.word	0x48000400
 8001d54:	20000190 	.word	0x20000190
 8001d58:	2000018c 	.word	0x2000018c
 8001d5c:	40014000 	.word	0x40014000
 8001d60:	20000030 	.word	0x20000030

08001d64 <_ZN5CILED9i_led_setEjj>:
 8001d64:	4b02      	ldr	r3, [pc, #8]	; (8001d70 <_ZN5CILED9i_led_setEjj+0xc>)
 8001d66:	b2c9      	uxtb	r1, r1
 8001d68:	7019      	strb	r1, [r3, #0]
 8001d6a:	4b02      	ldr	r3, [pc, #8]	; (8001d74 <_ZN5CILED9i_led_setEjj+0x10>)
 8001d6c:	601a      	str	r2, [r3, #0]
 8001d6e:	4770      	bx	lr
 8001d70:	2000019a 	.word	0x2000019a
 8001d74:	20000194 	.word	0x20000194

08001d78 <TIM4_IRQHandler>:
 8001d78:	4a3a      	ldr	r2, [pc, #232]	; (8001e64 <TIM4_IRQHandler+0xec>)
 8001d7a:	b510      	push	{r4, lr}
 8001d7c:	6813      	ldr	r3, [r2, #0]
 8001d7e:	3301      	adds	r3, #1
 8001d80:	6013      	str	r3, [r2, #0]
 8001d82:	4b39      	ldr	r3, [pc, #228]	; (8001e68 <TIM4_IRQHandler+0xf0>)
 8001d84:	7819      	ldrb	r1, [r3, #0]
 8001d86:	4b39      	ldr	r3, [pc, #228]	; (8001e6c <TIM4_IRQHandler+0xf4>)
 8001d88:	2904      	cmp	r1, #4
 8001d8a:	d856      	bhi.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001d8c:	e8df f001 	tbb	[pc, r1]
 8001d90:	16031326 	.word	0x16031326
 8001d94:	28          	.byte	0x28
 8001d95:	00          	.byte	0x00
 8001d96:	4936      	ldr	r1, [pc, #216]	; (8001e70 <TIM4_IRQHandler+0xf8>)
 8001d98:	2005      	movs	r0, #5
 8001d9a:	6809      	ldr	r1, [r1, #0]
 8001d9c:	fbb1 f1f0 	udiv	r1, r1, r0
 8001da0:	6810      	ldr	r0, [r2, #0]
 8001da2:	2901      	cmp	r1, #1
 8001da4:	bf98      	it	ls
 8001da6:	2102      	movls	r1, #2
 8001da8:	fbb0 f2f1 	udiv	r2, r0, r1
 8001dac:	fb01 0212 	mls	r2, r1, r2, r0
 8001db0:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001db4:	d912      	bls.n	8001ddc <TIM4_IRQHandler+0x64>
 8001db6:	223f      	movs	r2, #63	; 0x3f
 8001db8:	701a      	strb	r2, [r3, #0]
 8001dba:	e03e      	b.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001dbc:	492c      	ldr	r1, [pc, #176]	; (8001e70 <TIM4_IRQHandler+0xf8>)
 8001dbe:	6812      	ldr	r2, [r2, #0]
 8001dc0:	6809      	ldr	r1, [r1, #0]
 8001dc2:	f3c2 1283 	ubfx	r2, r2, #6, #4
 8001dc6:	428a      	cmp	r2, r1
 8001dc8:	d208      	bcs.n	8001ddc <TIM4_IRQHandler+0x64>
 8001dca:	4a26      	ldr	r2, [pc, #152]	; (8001e64 <TIM4_IRQHandler+0xec>)
 8001dcc:	6810      	ldr	r0, [r2, #0]
 8001dce:	223c      	movs	r2, #60	; 0x3c
 8001dd0:	fbb0 f1f2 	udiv	r1, r0, r2
 8001dd4:	fb02 0211 	mls	r2, r2, r1, r0
 8001dd8:	2a1e      	cmp	r2, #30
 8001dda:	d8ec      	bhi.n	8001db6 <TIM4_IRQHandler+0x3e>
 8001ddc:	2200      	movs	r2, #0
 8001dde:	e7eb      	b.n	8001db8 <TIM4_IRQHandler+0x40>
 8001de0:	4924      	ldr	r1, [pc, #144]	; (8001e74 <TIM4_IRQHandler+0xfc>)
 8001de2:	7808      	ldrb	r0, [r1, #0]
 8001de4:	f000 04ff 	and.w	r4, r0, #255	; 0xff
 8001de8:	b110      	cbz	r0, 8001df0 <TIM4_IRQHandler+0x78>
 8001dea:	2c01      	cmp	r4, #1
 8001dec:	d012      	beq.n	8001e14 <TIM4_IRQHandler+0x9c>
 8001dee:	e024      	b.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001df0:	6810      	ldr	r0, [r2, #0]
 8001df2:	220f      	movs	r2, #15
 8001df4:	fbb0 f2f2 	udiv	r2, r0, r2
 8001df8:	ebc2 1202 	rsb	r2, r2, r2, lsl #4
 8001dfc:	4290      	cmp	r0, r2
 8001dfe:	d11c      	bne.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001e00:	781a      	ldrb	r2, [r3, #0]
 8001e02:	481a      	ldr	r0, [pc, #104]	; (8001e6c <TIM4_IRQHandler+0xf4>)
 8001e04:	2a3e      	cmp	r2, #62	; 0x3e
 8001e06:	d802      	bhi.n	8001e0e <TIM4_IRQHandler+0x96>
 8001e08:	7802      	ldrb	r2, [r0, #0]
 8001e0a:	3201      	adds	r2, #1
 8001e0c:	e011      	b.n	8001e32 <TIM4_IRQHandler+0xba>
 8001e0e:	2201      	movs	r2, #1
 8001e10:	700a      	strb	r2, [r1, #0]
 8001e12:	e012      	b.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001e14:	6810      	ldr	r0, [r2, #0]
 8001e16:	220f      	movs	r2, #15
 8001e18:	fbb0 f2f2 	udiv	r2, r0, r2
 8001e1c:	ebc2 1202 	rsb	r2, r2, r2, lsl #4
 8001e20:	4290      	cmp	r0, r2
 8001e22:	d10a      	bne.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001e24:	781a      	ldrb	r2, [r3, #0]
 8001e26:	4811      	ldr	r0, [pc, #68]	; (8001e6c <TIM4_IRQHandler+0xf4>)
 8001e28:	f002 04ff 	and.w	r4, r2, #255	; 0xff
 8001e2c:	b122      	cbz	r2, 8001e38 <TIM4_IRQHandler+0xc0>
 8001e2e:	7802      	ldrb	r2, [r0, #0]
 8001e30:	3a01      	subs	r2, #1
 8001e32:	b2d2      	uxtb	r2, r2
 8001e34:	7002      	strb	r2, [r0, #0]
 8001e36:	e000      	b.n	8001e3a <TIM4_IRQHandler+0xc2>
 8001e38:	700c      	strb	r4, [r1, #0]
 8001e3a:	7819      	ldrb	r1, [r3, #0]
 8001e3c:	4b0e      	ldr	r3, [pc, #56]	; (8001e78 <TIM4_IRQHandler+0x100>)
 8001e3e:	480f      	ldr	r0, [pc, #60]	; (8001e7c <TIM4_IRQHandler+0x104>)
 8001e40:	681a      	ldr	r2, [r3, #0]
 8001e42:	23c8      	movs	r3, #200	; 0xc8
 8001e44:	fbb2 f3f3 	udiv	r3, r2, r3
 8001e48:	3b02      	subs	r3, #2
 8001e4a:	434b      	muls	r3, r1
 8001e4c:	213f      	movs	r1, #63	; 0x3f
 8001e4e:	fbb3 f1f1 	udiv	r1, r3, r1
 8001e52:	f000 fdc9 	bl	80029e8 <TIM_SetCompare2>
 8001e56:	480a      	ldr	r0, [pc, #40]	; (8001e80 <TIM4_IRQHandler+0x108>)
 8001e58:	2101      	movs	r1, #1
 8001e5a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001e5e:	f000 bdd1 	b.w	8002a04 <TIM_ClearITPendingBit>
 8001e62:	bf00      	nop
 8001e64:	20000190 	.word	0x20000190
 8001e68:	2000019a 	.word	0x2000019a
 8001e6c:	2000018c 	.word	0x2000018c
 8001e70:	20000194 	.word	0x20000194
 8001e74:	20000199 	.word	0x20000199
 8001e78:	20000030 	.word	0x20000030
 8001e7c:	40014000 	.word	0x40014000
 8001e80:	40000800 	.word	0x40000800

08001e84 <_ZN9CUniqueID13get_unique_idEv>:
 8001e84:	4b06      	ldr	r3, [pc, #24]	; (8001ea0 <_ZN9CUniqueID13get_unique_idEv+0x1c>)
 8001e86:	4a07      	ldr	r2, [pc, #28]	; (8001ea4 <_ZN9CUniqueID13get_unique_idEv+0x20>)
 8001e88:	6818      	ldr	r0, [r3, #0]
 8001e8a:	3304      	adds	r3, #4
 8001e8c:	681b      	ldr	r3, [r3, #0]
 8001e8e:	4403      	add	r3, r0
 8001e90:	eb03 4300 	add.w	r3, r3, r0, lsl #16
 8001e94:	6810      	ldr	r0, [r2, #0]
 8001e96:	4418      	add	r0, r3
 8001e98:	eb00 4003 	add.w	r0, r0, r3, lsl #16
 8001e9c:	4770      	bx	lr
 8001e9e:	bf00      	nop
 8001ea0:	1ffff7ac 	.word	0x1ffff7ac
 8001ea4:	1ffff7b4 	.word	0x1ffff7b4

08001ea8 <_ZN10MathVectorILj4EE4initEv>:
 8001ea8:	2300      	movs	r3, #0
 8001eaa:	6003      	str	r3, [r0, #0]
 8001eac:	6043      	str	r3, [r0, #4]
 8001eae:	6083      	str	r3, [r0, #8]
 8001eb0:	60c3      	str	r3, [r0, #12]
 8001eb2:	4770      	bx	lr

08001eb4 <_ZN10MathVectorILj3EE3mixERS0_f>:
 8001eb4:	f100 030c 	add.w	r3, r0, #12
 8001eb8:	ecf1 7a01 	vldmia	r1!, {s15}
 8001ebc:	edd0 6a00 	vldr	s13, [r0]
 8001ec0:	eeb7 7a00 	vmov.f32	s14, #112	; 0x3f800000  1.0
 8001ec4:	ee37 7a40 	vsub.f32	s14, s14, s0
 8001ec8:	ee60 7a27 	vmul.f32	s15, s0, s15
 8001ecc:	eee7 7a26 	vfma.f32	s15, s14, s13
 8001ed0:	ece0 7a01 	vstmia	r0!, {s15}
 8001ed4:	4298      	cmp	r0, r3
 8001ed6:	d1ef      	bne.n	8001eb8 <_ZN10MathVectorILj3EE3mixERS0_f+0x4>
 8001ed8:	4770      	bx	lr
	...

08001edc <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>:
 8001edc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ede:	eddf 6a17 	vldr	s13, [pc, #92]	; 8001f3c <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x60>
 8001ee2:	4603      	mov	r3, r0
 8001ee4:	2600      	movs	r6, #0
 8001ee6:	f8d0 01c0 	ldr.w	r0, [r0, #448]	; 0x1c0
 8001eea:	461c      	mov	r4, r3
 8001eec:	4635      	mov	r5, r6
 8001eee:	4285      	cmp	r5, r0
 8001ef0:	d019      	beq.n	8001f26 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x4a>
 8001ef2:	eddf 7a13 	vldr	s15, [pc, #76]	; 8001f40 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x64>
 8001ef6:	468e      	mov	lr, r1
 8001ef8:	f104 0710 	add.w	r7, r4, #16
 8001efc:	ecb4 6a01 	vldmia	r4!, {s12}
 8001f00:	ecbe 7a01 	vldmia	lr!, {s14}
 8001f04:	ee37 7a46 	vsub.f32	s14, s14, s12
 8001f08:	42bc      	cmp	r4, r7
 8001f0a:	eee7 7a07 	vfma.f32	s15, s14, s14
 8001f0e:	d1f5      	bne.n	8001efc <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x20>
 8001f10:	eef4 7ae6 	vcmpe.f32	s15, s13
 8001f14:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001f18:	bf44      	itt	mi
 8001f1a:	462e      	movmi	r6, r5
 8001f1c:	eef0 6a67 	vmovmi.f32	s13, s15
 8001f20:	3501      	adds	r5, #1
 8001f22:	463c      	mov	r4, r7
 8001f24:	e7e3      	b.n	8001eee <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x12>
 8001f26:	f503 7380 	add.w	r3, r3, #256	; 0x100
 8001f2a:	210c      	movs	r1, #12
 8001f2c:	4610      	mov	r0, r2
 8001f2e:	fb01 3106 	mla	r1, r1, r6, r3
 8001f32:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8001f36:	f7ff ffbd 	bl	8001eb4 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001f3a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001f3c:	4cbebc20 	.word	0x4cbebc20
 8001f40:	00000000 	.word	0x00000000

08001f44 <_ZN21CLearningLineFollower3runEv>:
 8001f44:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8001f48:	2308      	movs	r3, #8
 8001f4a:	ed2d 8b06 	vpush	{d8-d10}
 8001f4e:	f100 0650 	add.w	r6, r0, #80	; 0x50
 8001f52:	f8c0 3210 	str.w	r3, [r0, #528]	; 0x210
 8001f56:	4bcb      	ldr	r3, [pc, #812]	; (8002284 <_ZN21CLearningLineFollower3runEv+0x340>)
 8001f58:	f8c0 3214 	str.w	r3, [r0, #532]	; 0x214
 8001f5c:	4604      	mov	r4, r0
 8001f5e:	f500 78a8 	add.w	r8, r0, #336	; 0x150
 8001f62:	4635      	mov	r5, r6
 8001f64:	f105 0710 	add.w	r7, r5, #16
 8001f68:	48c7      	ldr	r0, [pc, #796]	; (8002288 <_ZN21CLearningLineFollower3runEv+0x344>)
 8001f6a:	f7fe fd1f 	bl	80009ac <_ZN5CMath3rndEv>
 8001f6e:	eca5 0a01 	vstmia	r5!, {s0}
 8001f72:	42bd      	cmp	r5, r7
 8001f74:	d1f8      	bne.n	8001f68 <_ZN21CLearningLineFollower3runEv+0x24>
 8001f76:	4545      	cmp	r5, r8
 8001f78:	d1f4      	bne.n	8001f64 <_ZN21CLearningLineFollower3runEv+0x20>
 8001f7a:	4623      	mov	r3, r4
 8001f7c:	f104 02c0 	add.w	r2, r4, #192	; 0xc0
 8001f80:	eddf 8ac2 	vldr	s17, [pc, #776]	; 800228c <_ZN21CLearningLineFollower3runEv+0x348>
 8001f84:	330c      	adds	r3, #12
 8001f86:	edc3 8a51 	vstr	s17, [r3, #324]	; 0x144
 8001f8a:	edc3 8a52 	vstr	s17, [r3, #328]	; 0x148
 8001f8e:	edc3 8a53 	vstr	s17, [r3, #332]	; 0x14c
 8001f92:	4293      	cmp	r3, r2
 8001f94:	d1f4      	bne.n	8001f80 <_ZN21CLearningLineFollower3runEv+0x3c>
 8001f96:	2300      	movs	r3, #0
 8001f98:	f104 0530 	add.w	r5, r4, #48	; 0x30
 8001f9c:	62a3      	str	r3, [r4, #40]	; 0x28
 8001f9e:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001fa0:	4628      	mov	r0, r5
 8001fa2:	f104 0940 	add.w	r9, r4, #64	; 0x40
 8001fa6:	f7ff ff7f 	bl	8001ea8 <_ZN10MathVectorILj4EE4initEv>
 8001faa:	4648      	mov	r0, r9
 8001fac:	f7ff ff7c 	bl	8001ea8 <_ZN10MathVectorILj4EE4initEv>
 8001fb0:	eebf aa00 	vmov.f32	s20, #240	; 0xbf800000 -1.0
 8001fb4:	edc4 8a86 	vstr	s17, [r4, #536]	; 0x218
 8001fb8:	edc4 8a87 	vstr	s17, [r4, #540]	; 0x21c
 8001fbc:	edc4 8a88 	vstr	s17, [r4, #544]	; 0x220
 8001fc0:	2100      	movs	r1, #0
 8001fc2:	48b3      	ldr	r0, [pc, #716]	; (8002290 <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001fc4:	f7fe fdce 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 8001fc8:	48b1      	ldr	r0, [pc, #708]	; (8002290 <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001fca:	f7fe ff67 	bl	8000e9c <_ZN4CRGB14get_rgb_resultEv>
 8001fce:	4601      	mov	r1, r0
 8001fd0:	4620      	mov	r0, r4
 8001fd2:	f7fe fbdd 	bl	8000790 <_ZN13CLinePosition7processEP10sRGBResult>
 8001fd6:	4620      	mov	r0, r4
 8001fd8:	f7fe fc74 	bl	80008c4 <_ZN13CLinePosition17get_line_positionEv>
 8001fdc:	6a23      	ldr	r3, [r4, #32]
 8001fde:	6263      	str	r3, [r4, #36]	; 0x24
 8001fe0:	69e3      	ldr	r3, [r4, #28]
 8001fe2:	6223      	str	r3, [r4, #32]
 8001fe4:	69a3      	ldr	r3, [r4, #24]
 8001fe6:	61e3      	str	r3, [r4, #28]
 8001fe8:	ed84 0a06 	vstr	s0, [r4, #24]
 8001fec:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
 8001ff0:	f104 0740 	add.w	r7, r4, #64	; 0x40
 8001ff4:	e887 000f 	stmia.w	r7, {r0, r1, r2, r3}
 8001ff8:	f104 0318 	add.w	r3, r4, #24
 8001ffc:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8001ffe:	f504 7706 	add.w	r7, r4, #536	; 0x218
 8002002:	e885 000f 	stmia.w	r5, {r0, r1, r2, r3}
 8002006:	463a      	mov	r2, r7
 8002008:	4630      	mov	r0, r6
 800200a:	4629      	mov	r1, r5
 800200c:	f7ff ff66 	bl	8001edc <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 8002010:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 8002012:	62a3      	str	r3, [r4, #40]	; 0x28
 8002014:	489c      	ldr	r0, [pc, #624]	; (8002288 <_ZN21CLearningLineFollower3runEv+0x344>)
 8002016:	f7fe fcaf 	bl	8000978 <_ZN5CMath4randEv>
 800201a:	2364      	movs	r3, #100	; 0x64
 800201c:	fbb0 f2f3 	udiv	r2, r0, r3
 8002020:	fb02 0013 	mls	r0, r2, r3, r0
 8002024:	2813      	cmp	r0, #19
 8002026:	d80b      	bhi.n	8002040 <_ZN21CLearningLineFollower3runEv+0xfc>
 8002028:	4897      	ldr	r0, [pc, #604]	; (8002288 <_ZN21CLearningLineFollower3runEv+0x344>)
 800202a:	f7fe fca5 	bl	8000978 <_ZN5CMath4randEv>
 800202e:	f04f 0a03 	mov.w	sl, #3
 8002032:	fbb0 fafa 	udiv	sl, r0, sl
 8002036:	eb0a 0a4a 	add.w	sl, sl, sl, lsl #1
 800203a:	ebca 0a00 	rsb	sl, sl, r0
 800203e:	e012      	b.n	8002066 <_ZN21CLearningLineFollower3runEv+0x122>
 8002040:	f04f 0a00 	mov.w	sl, #0
 8002044:	463a      	mov	r2, r7
 8002046:	4653      	mov	r3, sl
 8002048:	eb04 018a 	add.w	r1, r4, sl, lsl #2
 800204c:	ecb2 7a01 	vldmia	r2!, {s14}
 8002050:	edd1 7a86 	vldr	s15, [r1, #536]	; 0x218
 8002054:	eeb4 7a67 	vcmp.f32	s14, s15
 8002058:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800205c:	bfc8      	it	gt
 800205e:	469a      	movgt	sl, r3
 8002060:	3301      	adds	r3, #1
 8002062:	2b03      	cmp	r3, #3
 8002064:	d1f0      	bne.n	8002048 <_ZN21CLearningLineFollower3runEv+0x104>
 8002066:	f1ba 0f01 	cmp.w	sl, #1
 800206a:	f8c4 a02c 	str.w	sl, [r4, #44]	; 0x2c
 800206e:	d014      	beq.n	800209a <_ZN21CLearningLineFollower3runEv+0x156>
 8002070:	d30b      	bcc.n	800208a <_ZN21CLearningLineFollower3runEv+0x146>
 8002072:	f1ba 0f02 	cmp.w	sl, #2
 8002076:	d11a      	bne.n	80020ae <_ZN21CLearningLineFollower3runEv+0x16a>
 8002078:	4886      	ldr	r0, [pc, #536]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800207a:	2100      	movs	r1, #0
 800207c:	220e      	movs	r2, #14
 800207e:	f7fe ffa5 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002082:	4884      	ldr	r0, [pc, #528]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 8002084:	2101      	movs	r1, #1
 8002086:	2200      	movs	r2, #0
 8002088:	e00f      	b.n	80020aa <_ZN21CLearningLineFollower3runEv+0x166>
 800208a:	4882      	ldr	r0, [pc, #520]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800208c:	2100      	movs	r1, #0
 800208e:	220e      	movs	r2, #14
 8002090:	f7fe ff9c 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002094:	487f      	ldr	r0, [pc, #508]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 8002096:	2101      	movs	r1, #1
 8002098:	e006      	b.n	80020a8 <_ZN21CLearningLineFollower3runEv+0x164>
 800209a:	2100      	movs	r1, #0
 800209c:	487d      	ldr	r0, [pc, #500]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800209e:	460a      	mov	r2, r1
 80020a0:	f7fe ff94 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 80020a4:	487b      	ldr	r0, [pc, #492]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 80020a6:	4651      	mov	r1, sl
 80020a8:	220e      	movs	r2, #14
 80020aa:	f7fe ff8f 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 80020ae:	487a      	ldr	r0, [pc, #488]	; (8002298 <_ZN21CLearningLineFollower3runEv+0x354>)
 80020b0:	2132      	movs	r1, #50	; 0x32
 80020b2:	f7fe fd23 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80020b6:	2100      	movs	r1, #0
 80020b8:	4875      	ldr	r0, [pc, #468]	; (8002290 <_ZN21CLearningLineFollower3runEv+0x34c>)
 80020ba:	f7fe fd53 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 80020be:	4874      	ldr	r0, [pc, #464]	; (8002290 <_ZN21CLearningLineFollower3runEv+0x34c>)
 80020c0:	f7fe feec 	bl	8000e9c <_ZN4CRGB14get_rgb_resultEv>
 80020c4:	4601      	mov	r1, r0
 80020c6:	4620      	mov	r0, r4
 80020c8:	f7fe fb62 	bl	8000790 <_ZN13CLinePosition7processEP10sRGBResult>
 80020cc:	4620      	mov	r0, r4
 80020ce:	f7fe fbf9 	bl	80008c4 <_ZN13CLinePosition17get_line_positionEv>
 80020d2:	486d      	ldr	r0, [pc, #436]	; (8002288 <_ZN21CLearningLineFollower3runEv+0x344>)
 80020d4:	f7fe fc48 	bl	8000968 <_ZN5CMath3absEf>
 80020d8:	eef7 9a00 	vmov.f32	s19, #112	; 0x3f800000  1.0
 80020dc:	f8d4 b02c 	ldr.w	fp, [r4, #44]	; 0x2c
 80020e0:	f8d4 a028 	ldr.w	sl, [r4, #40]	; 0x28
 80020e4:	ee39 0ac0 	vsub.f32	s0, s19, s0
 80020e8:	eef6 7a00 	vmov.f32	s15, #96	; 0x3f000000  0.5
 80020ec:	4630      	mov	r0, r6
 80020ee:	4629      	mov	r1, r5
 80020f0:	463a      	mov	r2, r7
 80020f2:	eb04 0b8b 	add.w	fp, r4, fp, lsl #2
 80020f6:	ee30 9a67 	vsub.f32	s18, s0, s15
 80020fa:	f7ff feef 	bl	8001edc <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 80020fe:	edd4 7a86 	vldr	s15, [r4, #536]	; 0x218
 8002102:	ed9b 8a86 	vldr	s16, [fp, #536]	; 0x218
 8002106:	eeb4 8a67 	vcmp.f32	s16, s15
 800210a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800210e:	bf48      	it	mi
 8002110:	eeb0 8a67 	vmovmi.f32	s16, s15
 8002114:	edd4 7a87 	vldr	s15, [r4, #540]	; 0x21c
 8002118:	eeb4 8a67 	vcmp.f32	s16, s15
 800211c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8002120:	bf48      	it	mi
 8002122:	eeb0 8a67 	vmovmi.f32	s16, s15
 8002126:	edd4 7a88 	vldr	s15, [r4, #544]	; 0x220
 800212a:	eeb4 8a67 	vcmp.f32	s16, s15
 800212e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8002132:	4630      	mov	r0, r6
 8002134:	4649      	mov	r1, r9
 8002136:	463a      	mov	r2, r7
 8002138:	bf48      	it	mi
 800213a:	eeb0 8a67 	vmovmi.f32	s16, s15
 800213e:	f7ff fecd 	bl	8001edc <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 8002142:	eddf 7a56 	vldr	s15, [pc, #344]	; 800229c <_ZN21CLearningLineFollower3runEv+0x358>
 8002146:	f8d4 0210 	ldr.w	r0, [r4, #528]	; 0x210
 800214a:	eddf 6a55 	vldr	s13, [pc, #340]	; 80022a0 <_ZN21CLearningLineFollower3runEv+0x35c>
 800214e:	eeb0 7a49 	vmov.f32	s14, s18
 8002152:	eea8 7a27 	vfma.f32	s14, s16, s15
 8002156:	eb04 0a8a 	add.w	sl, r4, sl, lsl #2
 800215a:	2100      	movs	r1, #0
 800215c:	46b6      	mov	lr, r6
 800215e:	ed8a 7a86 	vstr	s14, [sl, #536]	; 0x218
 8002162:	460a      	mov	r2, r1
 8002164:	4282      	cmp	r2, r0
 8002166:	f104 0340 	add.w	r3, r4, #64	; 0x40
 800216a:	d018      	beq.n	800219e <_ZN21CLearningLineFollower3runEv+0x25a>
 800216c:	eddf 7a47 	vldr	s15, [pc, #284]	; 800228c <_ZN21CLearningLineFollower3runEv+0x348>
 8002170:	46f4      	mov	ip, lr
 8002172:	ecb3 7a01 	vldmia	r3!, {s14}
 8002176:	ecbc 6a01 	vldmia	ip!, {s12}
 800217a:	ee37 7a46 	vsub.f32	s14, s14, s12
 800217e:	42b3      	cmp	r3, r6
 8002180:	eee7 7a07 	vfma.f32	s15, s14, s14
 8002184:	d1f5      	bne.n	8002172 <_ZN21CLearningLineFollower3runEv+0x22e>
 8002186:	eef4 7ae6 	vcmpe.f32	s15, s13
 800218a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800218e:	bf44      	itt	mi
 8002190:	4611      	movmi	r1, r2
 8002192:	eef0 6a67 	vmovmi.f32	s13, s15
 8002196:	3201      	adds	r2, #1
 8002198:	f10e 0e10 	add.w	lr, lr, #16
 800219c:	e7e2      	b.n	8002164 <_ZN21CLearningLineFollower3runEv+0x220>
 800219e:	280f      	cmp	r0, #15
 80021a0:	d81a      	bhi.n	80021d8 <_ZN21CLearningLineFollower3runEv+0x294>
 80021a2:	1d42      	adds	r2, r0, #5
 80021a4:	eb04 1202 	add.w	r2, r4, r2, lsl #4
 80021a8:	ecf3 7a01 	vldmia	r3!, {s15}
 80021ac:	ed92 7a00 	vldr	s14, [r2]
 80021b0:	eee7 7a28 	vfma.f32	s15, s14, s17
 80021b4:	42b3      	cmp	r3, r6
 80021b6:	ece2 7a01 	vstmia	r2!, {s15}
 80021ba:	d1f5      	bne.n	80021a8 <_ZN21CLearningLineFollower3runEv+0x264>
 80021bc:	230c      	movs	r3, #12
 80021be:	fb03 8000 	mla	r0, r3, r0, r8
 80021c2:	4639      	mov	r1, r7
 80021c4:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 80021c8:	f7ff fe74 	bl	8001eb4 <_ZN10MathVectorILj3EE3mixERS0_f>
 80021cc:	f8d4 3210 	ldr.w	r3, [r4, #528]	; 0x210
 80021d0:	3301      	adds	r3, #1
 80021d2:	f8c4 3210 	str.w	r3, [r4, #528]	; 0x210
 80021d6:	e01a      	b.n	800220e <_ZN21CLearningLineFollower3runEv+0x2ca>
 80021d8:	1d4a      	adds	r2, r1, #5
 80021da:	edd4 6a85 	vldr	s13, [r4, #532]	; 0x214
 80021de:	eb04 1202 	add.w	r2, r4, r2, lsl #4
 80021e2:	ecf3 7a01 	vldmia	r3!, {s15}
 80021e6:	ed92 6a00 	vldr	s12, [r2]
 80021ea:	ee39 7ae6 	vsub.f32	s14, s19, s13
 80021ee:	ee66 7aa7 	vmul.f32	s15, s13, s15
 80021f2:	42b3      	cmp	r3, r6
 80021f4:	eee7 7a06 	vfma.f32	s15, s14, s12
 80021f8:	ece2 7a01 	vstmia	r2!, {s15}
 80021fc:	d1f1      	bne.n	80021e2 <_ZN21CLearningLineFollower3runEv+0x29e>
 80021fe:	200c      	movs	r0, #12
 8002200:	fb00 8001 	mla	r0, r0, r1, r8
 8002204:	ed94 0a85 	vldr	s0, [r4, #532]	; 0x214
 8002208:	4639      	mov	r1, r7
 800220a:	f7ff fe53 	bl	8001eb4 <_ZN10MathVectorILj3EE3mixERS0_f>
 800220e:	4620      	mov	r0, r4
 8002210:	f7fe fb56 	bl	80008c0 <_ZN13CLinePosition7on_lineEv>
 8002214:	4607      	mov	r7, r0
 8002216:	b9f0      	cbnz	r0, 8002256 <_ZN21CLearningLineFollower3runEv+0x312>
 8002218:	481e      	ldr	r0, [pc, #120]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800221a:	4639      	mov	r1, r7
 800221c:	f06f 020d 	mvn.w	r2, #13
 8002220:	f7fe fed4 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002224:	f06f 020d 	mvn.w	r2, #13
 8002228:	481a      	ldr	r0, [pc, #104]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800222a:	2101      	movs	r1, #1
 800222c:	f7fe fece 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002230:	4819      	ldr	r0, [pc, #100]	; (8002298 <_ZN21CLearningLineFollower3runEv+0x354>)
 8002232:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8002236:	f7fe fc61 	bl	8000afc <_ZN6CTimer8delay_msEm>
 800223a:	4816      	ldr	r0, [pc, #88]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 800223c:	4639      	mov	r1, r7
 800223e:	463a      	mov	r2, r7
 8002240:	f7fe fec4 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002244:	4813      	ldr	r0, [pc, #76]	; (8002294 <_ZN21CLearningLineFollower3runEv+0x350>)
 8002246:	2101      	movs	r1, #1
 8002248:	463a      	mov	r2, r7
 800224a:	f7fe febf 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 800224e:	4812      	ldr	r0, [pc, #72]	; (8002298 <_ZN21CLearningLineFollower3runEv+0x354>)
 8002250:	2164      	movs	r1, #100	; 0x64
 8002252:	f7fe fc53 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8002256:	ed9f 0a13 	vldr	s0, [pc, #76]	; 80022a4 <_ZN21CLearningLineFollower3runEv+0x360>
 800225a:	eddf 7a13 	vldr	s15, [pc, #76]	; 80022a8 <_ZN21CLearningLineFollower3runEv+0x364>
 800225e:	480c      	ldr	r0, [pc, #48]	; (8002290 <_ZN21CLearningLineFollower3runEv+0x34c>)
 8002260:	4912      	ldr	r1, [pc, #72]	; (80022ac <_ZN21CLearningLineFollower3runEv+0x368>)
 8002262:	ee29 9a00 	vmul.f32	s18, s18, s0
 8002266:	eeaa 9a27 	vfma.f32	s18, s20, s15
 800226a:	eddf 7a11 	vldr	s15, [pc, #68]	; 80022b0 <_ZN21CLearningLineFollower3runEv+0x36c>
 800226e:	ee69 7a27 	vmul.f32	s15, s18, s15
 8002272:	eeb0 aa49 	vmov.f32	s20, s18
 8002276:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800227a:	ee17 2a90 	vmov	r2, s15
 800227e:	f7ff fc5b 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 8002282:	e69d      	b.n	8001fc0 <_ZN21CLearningLineFollower3runEv+0x7c>
 8002284:	3dcccccd 	.word	0x3dcccccd
 8002288:	20000110 	.word	0x20000110
 800228c:	00000000 	.word	0x00000000
 8002290:	20000038 	.word	0x20000038
 8002294:	200000fc 	.word	0x200000fc
 8002298:	20000144 	.word	0x20000144
 800229c:	3f666666 	.word	0x3f666666
 80022a0:	4cbebc20 	.word	0x4cbebc20
 80022a4:	3c23d70a 	.word	0x3c23d70a
 80022a8:	3f7d70a4 	.word	0x3f7d70a4
 80022ac:	0800307c 	.word	0x0800307c
 80022b0:	447a0000 	.word	0x447a0000

080022b4 <_ZN5CDemo4initEv>:
 80022b4:	4770      	bx	lr
	...

080022b8 <_ZN5CDemo10blink_taskEv>:
 80022b8:	b508      	push	{r3, lr}
 80022ba:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80022be:	480a      	ldr	r0, [pc, #40]	; (80022e8 <_ZN5CDemo10blink_taskEv+0x30>)
 80022c0:	f7ff fab0 	bl	8001824 <_ZN5CGPIO7gpio_onEm>
 80022c4:	4809      	ldr	r0, [pc, #36]	; (80022ec <_ZN5CDemo10blink_taskEv+0x34>)
 80022c6:	f7fe fc0b 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 80022ca:	4909      	ldr	r1, [pc, #36]	; (80022f0 <_ZN5CDemo10blink_taskEv+0x38>)
 80022cc:	4602      	mov	r2, r0
 80022ce:	4806      	ldr	r0, [pc, #24]	; (80022e8 <_ZN5CDemo10blink_taskEv+0x30>)
 80022d0:	f7ff fc32 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 80022d4:	4805      	ldr	r0, [pc, #20]	; (80022ec <_ZN5CDemo10blink_taskEv+0x34>)
 80022d6:	210a      	movs	r1, #10
 80022d8:	f7fe fc10 	bl	8000afc <_ZN6CTimer8delay_msEm>
 80022dc:	4802      	ldr	r0, [pc, #8]	; (80022e8 <_ZN5CDemo10blink_taskEv+0x30>)
 80022de:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80022e2:	f7ff faad 	bl	8001840 <_ZN5CGPIO8gpio_offEm>
 80022e6:	e7e8      	b.n	80022ba <_ZN5CDemo10blink_taskEv+0x2>
 80022e8:	20000038 	.word	0x20000038
 80022ec:	20000144 	.word	0x20000144
 80022f0:	08003064 	.word	0x08003064

080022f4 <_ZN5CDemo16wifi_client_taskEv>:
 80022f4:	b507      	push	{r0, r1, r2, lr}
 80022f6:	4668      	mov	r0, sp
 80022f8:	f7fe f810 	bl	800031c <_ZN5CWifiC1Ev>
 80022fc:	2100      	movs	r1, #0
 80022fe:	4668      	mov	r0, sp
 8002300:	f7fe f8c4 	bl	800048c <_ZN5CWifi4initEh>
 8002304:	4668      	mov	r0, sp
 8002306:	f7fe fa07 	bl	8000718 <_ZN5CWifi11client_demoEv>
 800230a:	4668      	mov	r0, sp
 800230c:	f7fe f807 	bl	800031e <_ZN5CWifiD1Ev>
 8002310:	b003      	add	sp, #12
 8002312:	f85d fb04 	ldr.w	pc, [sp], #4
	...

08002318 <_ZN5CDemo10moves_taskEv>:
 8002318:	b570      	push	{r4, r5, r6, lr}
 800231a:	4c1c      	ldr	r4, [pc, #112]	; (800238c <_ZN5CDemo10moves_taskEv+0x74>)
 800231c:	4d1c      	ldr	r5, [pc, #112]	; (8002390 <_ZN5CDemo10moves_taskEv+0x78>)
 800231e:	4620      	mov	r0, r4
 8002320:	f44f 7161 	mov.w	r1, #900	; 0x384
 8002324:	2216      	movs	r2, #22
 8002326:	2300      	movs	r3, #0
 8002328:	f7fd ffa2 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800232c:	4620      	mov	r0, r4
 800232e:	f44f 7161 	mov.w	r1, #900	; 0x384
 8002332:	2216      	movs	r2, #22
 8002334:	2300      	movs	r3, #0
 8002336:	f7fd ff9b 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800233a:	4620      	mov	r0, r4
 800233c:	f44f 7161 	mov.w	r1, #900	; 0x384
 8002340:	2216      	movs	r2, #22
 8002342:	2300      	movs	r3, #0
 8002344:	f7fd ff94 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002348:	4620      	mov	r0, r4
 800234a:	f44f 7161 	mov.w	r1, #900	; 0x384
 800234e:	2216      	movs	r2, #22
 8002350:	2300      	movs	r3, #0
 8002352:	f7fd ff8d 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002356:	4620      	mov	r0, r4
 8002358:	4629      	mov	r1, r5
 800235a:	2216      	movs	r2, #22
 800235c:	2300      	movs	r3, #0
 800235e:	f7fd ff87 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002362:	4620      	mov	r0, r4
 8002364:	4629      	mov	r1, r5
 8002366:	2216      	movs	r2, #22
 8002368:	2300      	movs	r3, #0
 800236a:	f7fd ff81 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800236e:	4620      	mov	r0, r4
 8002370:	4629      	mov	r1, r5
 8002372:	2216      	movs	r2, #22
 8002374:	2300      	movs	r3, #0
 8002376:	f7fd ff7b 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800237a:	4620      	mov	r0, r4
 800237c:	4629      	mov	r1, r5
 800237e:	2216      	movs	r2, #22
 8002380:	2300      	movs	r3, #0
 8002382:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8002386:	f7fd bf73 	b.w	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800238a:	bf00      	nop
 800238c:	20000038 	.word	0x20000038
 8002390:	fffffc7c 	.word	0xfffffc7c

08002394 <_ZN5CDemo24basic_line_follower_taskEv>:
 8002394:	b510      	push	{r4, lr}
 8002396:	b08e      	sub	sp, #56	; 0x38
 8002398:	4668      	mov	r0, sp
 800239a:	f7fe f9ef 	bl	800077c <_ZN13CLinePositionC1Ev>
 800239e:	a806      	add	r0, sp, #24
 80023a0:	eeb2 0a04 	vmov.f32	s0, #36	; 0x41200000  10.0
 80023a4:	eddf 0a38 	vldr	s1, [pc, #224]	; 8002488 <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 80023a8:	eddf 1a38 	vldr	s3, [pc, #224]	; 800248c <_ZN5CDemo24basic_line_follower_taskEv+0xf8>
 80023ac:	eeb2 1a00 	vmov.f32	s2, #32	; 0x41000000  8.0
 80023b0:	f7fe faa1 	bl	80008f6 <_ZN4CPIDC1Effff>
 80023b4:	4836      	ldr	r0, [pc, #216]	; (8002490 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 80023b6:	2100      	movs	r1, #0
 80023b8:	220a      	movs	r2, #10
 80023ba:	f7fe fbb1 	bl	8000b20 <_ZN6CTimer22event_timer_set_periodEhm>
 80023be:	4834      	ldr	r0, [pc, #208]	; (8002490 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 80023c0:	2100      	movs	r1, #0
 80023c2:	f7fe fbc1 	bl	8000b48 <_ZN6CTimer17event_timer_checkEh>
 80023c6:	2800      	cmp	r0, #0
 80023c8:	d0f9      	beq.n	80023be <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 80023ca:	2100      	movs	r1, #0
 80023cc:	4831      	ldr	r0, [pc, #196]	; (8002494 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 80023ce:	f7fe fbc9 	bl	8000b64 <_ZN4CRGB8rgb_readEh>
 80023d2:	4830      	ldr	r0, [pc, #192]	; (8002494 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 80023d4:	f7fe fd62 	bl	8000e9c <_ZN4CRGB14get_rgb_resultEv>
 80023d8:	4601      	mov	r1, r0
 80023da:	4668      	mov	r0, sp
 80023dc:	f7fe f9d8 	bl	8000790 <_ZN13CLinePosition7processEP10sRGBResult>
 80023e0:	4668      	mov	r0, sp
 80023e2:	f7fe fa6d 	bl	80008c0 <_ZN13CLinePosition7on_lineEv>
 80023e6:	4604      	mov	r4, r0
 80023e8:	4668      	mov	r0, sp
 80023ea:	f7fe fa6b 	bl	80008c4 <_ZN13CLinePosition17get_line_positionEv>
 80023ee:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8002498 <_ZN5CDemo24basic_line_follower_taskEv+0x104>
 80023f2:	4828      	ldr	r0, [pc, #160]	; (8002494 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 80023f4:	4929      	ldr	r1, [pc, #164]	; (800249c <_ZN5CDemo24basic_line_follower_taskEv+0x108>)
 80023f6:	ee20 0a27 	vmul.f32	s0, s0, s15
 80023fa:	4622      	mov	r2, r4
 80023fc:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8002400:	ee17 3a90 	vmov	r3, s15
 8002404:	f7ff fb98 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 8002408:	4668      	mov	r0, sp
 800240a:	f7fe fa59 	bl	80008c0 <_ZN13CLinePosition7on_lineEv>
 800240e:	4604      	mov	r4, r0
 8002410:	b1d0      	cbz	r0, 8002448 <_ZN5CDemo24basic_line_follower_taskEv+0xb4>
 8002412:	4668      	mov	r0, sp
 8002414:	f7fe fa56 	bl	80008c4 <_ZN13CLinePosition17get_line_positionEv>
 8002418:	eddf 7a1b 	vldr	s15, [pc, #108]	; 8002488 <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 800241c:	a806      	add	r0, sp, #24
 800241e:	ee37 0ac0 	vsub.f32	s0, s15, s0
 8002422:	f7fe fa6e 	bl	8000902 <_ZN4CPID7processEf>
 8002426:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 800242a:	481d      	ldr	r0, [pc, #116]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 800242c:	ee17 4a90 	vmov	r4, s15
 8002430:	2100      	movs	r1, #0
 8002432:	f104 020b 	add.w	r2, r4, #11
 8002436:	f7fe fdc9 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 800243a:	4819      	ldr	r0, [pc, #100]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 800243c:	2101      	movs	r1, #1
 800243e:	f1c4 020b 	rsb	r2, r4, #11
 8002442:	f7fe fdc3 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002446:	e7ba      	b.n	80023be <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8002448:	4621      	mov	r1, r4
 800244a:	4815      	ldr	r0, [pc, #84]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 800244c:	f06f 020a 	mvn.w	r2, #10
 8002450:	f7fe fdbc 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002454:	f06f 020a 	mvn.w	r2, #10
 8002458:	4811      	ldr	r0, [pc, #68]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 800245a:	2101      	movs	r1, #1
 800245c:	f7fe fdb6 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002460:	480b      	ldr	r0, [pc, #44]	; (8002490 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8002462:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8002466:	f7fe fb49 	bl	8000afc <_ZN6CTimer8delay_msEm>
 800246a:	4621      	mov	r1, r4
 800246c:	4622      	mov	r2, r4
 800246e:	480c      	ldr	r0, [pc, #48]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002470:	f7fe fdac 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 8002474:	480a      	ldr	r0, [pc, #40]	; (80024a0 <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002476:	2101      	movs	r1, #1
 8002478:	4622      	mov	r2, r4
 800247a:	f7fe fda7 	bl	8000fcc <_ZN6CMotor9set_motorEml>
 800247e:	4804      	ldr	r0, [pc, #16]	; (8002490 <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8002480:	2164      	movs	r1, #100	; 0x64
 8002482:	f7fe fb3b 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8002486:	e79a      	b.n	80023be <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8002488:	00000000 	.word	0x00000000
 800248c:	42300000 	.word	0x42300000
 8002490:	20000144 	.word	0x20000144
 8002494:	20000038 	.word	0x20000038
 8002498:	447a0000 	.word	0x447a0000
 800249c:	08003079 	.word	0x08003079
 80024a0:	200000fc 	.word	0x200000fc

080024a4 <_ZN5CDemo3runEj>:
 80024a4:	3901      	subs	r1, #1
 80024a6:	b508      	push	{r3, lr}
 80024a8:	2903      	cmp	r1, #3
 80024aa:	d812      	bhi.n	80024d2 <_ZN5CDemo3runEj+0x2e>
 80024ac:	e8df f001 	tbb	[pc, r1]
 80024b0:	0c0a0602 	.word	0x0c0a0602
 80024b4:	f7ff ff30 	bl	8002318 <_ZN5CDemo10moves_taskEv>
 80024b8:	f7ff fefe 	bl	80022b8 <_ZN5CDemo10blink_taskEv>
 80024bc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80024c0:	f7ff bf18 	b.w	80022f4 <_ZN5CDemo16wifi_client_taskEv>
 80024c4:	f7ff ff66 	bl	8002394 <_ZN5CDemo24basic_line_follower_taskEv>
 80024c8:	4802      	ldr	r0, [pc, #8]	; (80024d4 <_ZN5CDemo3runEj+0x30>)
 80024ca:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80024ce:	f7ff bd39 	b.w	8001f44 <_ZN21CLearningLineFollower3runEv>
 80024d2:	bd08      	pop	{r3, pc}
 80024d4:	2000019c 	.word	0x2000019c

080024d8 <main>:
 80024d8:	b508      	push	{r3, lr}
 80024da:	f000 fbcb 	bl	8002c74 <sytem_clock_init>
 80024de:	481f      	ldr	r0, [pc, #124]	; (800255c <main+0x84>)
 80024e0:	f7fd fe84 	bl	80001ec <_ZN7CKodama4initEv>
 80024e4:	210a      	movs	r1, #10
 80024e6:	481d      	ldr	r0, [pc, #116]	; (800255c <main+0x84>)
 80024e8:	f7fd febf 	bl	800026a <_ZN7CKodama6set_dtEl>
 80024ec:	481b      	ldr	r0, [pc, #108]	; (800255c <main+0x84>)
 80024ee:	f7fd fe9f 	bl	8000230 <_ZN7CKodama5sleepEv>
 80024f2:	481b      	ldr	r0, [pc, #108]	; (8002560 <main+0x88>)
 80024f4:	f7ff fbb0 	bl	8001c58 <_ZN5CILED10i_led_initEv>
 80024f8:	4819      	ldr	r0, [pc, #100]	; (8002560 <main+0x88>)
 80024fa:	2102      	movs	r1, #2
 80024fc:	f44f 7216 	mov.w	r2, #600	; 0x258
 8002500:	f7ff fc30 	bl	8001d64 <_ZN5CILED9i_led_setEjj>
 8002504:	4815      	ldr	r0, [pc, #84]	; (800255c <main+0x84>)
 8002506:	f44f 7100 	mov.w	r1, #512	; 0x200
 800250a:	f7ff f9a7 	bl	800185c <_ZN5CGPIO7gpio_inEm>
 800250e:	b148      	cbz	r0, 8002524 <main+0x4c>
 8002510:	4812      	ldr	r0, [pc, #72]	; (800255c <main+0x84>)
 8002512:	f7fd fe98 	bl	8000246 <_ZN7CKodama6wakeupEv>
 8002516:	4813      	ldr	r0, [pc, #76]	; (8002564 <main+0x8c>)
 8002518:	f7ff fecc 	bl	80022b4 <_ZN5CDemo4initEv>
 800251c:	4811      	ldr	r0, [pc, #68]	; (8002564 <main+0x8c>)
 800251e:	2102      	movs	r1, #2
 8002520:	f7ff ffc0 	bl	80024a4 <_ZN5CDemo3runEj>
 8002524:	480d      	ldr	r0, [pc, #52]	; (800255c <main+0x84>)
 8002526:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800252a:	f7ff f97b 	bl	8001824 <_ZN5CGPIO7gpio_onEm>
 800252e:	480e      	ldr	r0, [pc, #56]	; (8002568 <main+0x90>)
 8002530:	210a      	movs	r1, #10
 8002532:	f7fe fae3 	bl	8000afc <_ZN6CTimer8delay_msEm>
 8002536:	4809      	ldr	r0, [pc, #36]	; (800255c <main+0x84>)
 8002538:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800253c:	f7ff f980 	bl	8001840 <_ZN5CGPIO8gpio_offEm>
 8002540:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8002544:	4808      	ldr	r0, [pc, #32]	; (8002568 <main+0x90>)
 8002546:	f7fe fad9 	bl	8000afc <_ZN6CTimer8delay_msEm>
 800254a:	4807      	ldr	r0, [pc, #28]	; (8002568 <main+0x90>)
 800254c:	f7fe fac8 	bl	8000ae0 <_ZN6CTimer8get_timeEv>
 8002550:	4906      	ldr	r1, [pc, #24]	; (800256c <main+0x94>)
 8002552:	4602      	mov	r2, r0
 8002554:	4801      	ldr	r0, [pc, #4]	; (800255c <main+0x84>)
 8002556:	f7ff faef 	bl	8001b38 <_ZN9CTerminal6printfEPKcz>
 800255a:	e7d3      	b.n	8002504 <main+0x2c>
 800255c:	20000038 	.word	0x20000038
 8002560:	20000198 	.word	0x20000198
 8002564:	200003c0 	.word	0x200003c0
 8002568:	20000144 	.word	0x20000144
 800256c:	08003081 	.word	0x08003081

08002570 <RCC_GetClocksFreq>:
 8002570:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8002574:	4f9b      	ldr	r7, [pc, #620]	; (80027e4 <RCC_GetClocksFreq+0x274>)
 8002576:	687b      	ldr	r3, [r7, #4]
 8002578:	f003 030c 	and.w	r3, r3, #12
 800257c:	2b04      	cmp	r3, #4
 800257e:	d005      	beq.n	800258c <RCC_GetClocksFreq+0x1c>
 8002580:	2b08      	cmp	r3, #8
 8002582:	d006      	beq.n	8002592 <RCC_GetClocksFreq+0x22>
 8002584:	4a98      	ldr	r2, [pc, #608]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 8002586:	6002      	str	r2, [r0, #0]
 8002588:	b9b3      	cbnz	r3, 80025b8 <RCC_GetClocksFreq+0x48>
 800258a:	e016      	b.n	80025ba <RCC_GetClocksFreq+0x4a>
 800258c:	4b96      	ldr	r3, [pc, #600]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 800258e:	6003      	str	r3, [r0, #0]
 8002590:	e012      	b.n	80025b8 <RCC_GetClocksFreq+0x48>
 8002592:	687b      	ldr	r3, [r7, #4]
 8002594:	6879      	ldr	r1, [r7, #4]
 8002596:	f3c3 4383 	ubfx	r3, r3, #18, #4
 800259a:	1c9a      	adds	r2, r3, #2
 800259c:	03cb      	lsls	r3, r1, #15
 800259e:	bf49      	itett	mi
 80025a0:	6afb      	ldrmi	r3, [r7, #44]	; 0x2c
 80025a2:	4b92      	ldrpl	r3, [pc, #584]	; (80027ec <RCC_GetClocksFreq+0x27c>)
 80025a4:	4990      	ldrmi	r1, [pc, #576]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 80025a6:	f003 030f 	andmi.w	r3, r3, #15
 80025aa:	bf44      	itt	mi
 80025ac:	3301      	addmi	r3, #1
 80025ae:	fbb1 f3f3 	udivmi	r3, r1, r3
 80025b2:	4353      	muls	r3, r2
 80025b4:	6003      	str	r3, [r0, #0]
 80025b6:	e000      	b.n	80025ba <RCC_GetClocksFreq+0x4a>
 80025b8:	2300      	movs	r3, #0
 80025ba:	687a      	ldr	r2, [r7, #4]
 80025bc:	4e8c      	ldr	r6, [pc, #560]	; (80027f0 <RCC_GetClocksFreq+0x280>)
 80025be:	f8df c234 	ldr.w	ip, [pc, #564]	; 80027f4 <RCC_GetClocksFreq+0x284>
 80025c2:	f3c2 1203 	ubfx	r2, r2, #4, #4
 80025c6:	5cb4      	ldrb	r4, [r6, r2]
 80025c8:	6802      	ldr	r2, [r0, #0]
 80025ca:	b2e4      	uxtb	r4, r4
 80025cc:	fa22 f104 	lsr.w	r1, r2, r4
 80025d0:	6041      	str	r1, [r0, #4]
 80025d2:	687d      	ldr	r5, [r7, #4]
 80025d4:	f3c5 2502 	ubfx	r5, r5, #8, #3
 80025d8:	5d75      	ldrb	r5, [r6, r5]
 80025da:	fa21 fe05 	lsr.w	lr, r1, r5
 80025de:	f8c0 e008 	str.w	lr, [r0, #8]
 80025e2:	687d      	ldr	r5, [r7, #4]
 80025e4:	f3c5 25c2 	ubfx	r5, r5, #11, #3
 80025e8:	5d75      	ldrb	r5, [r6, r5]
 80025ea:	b2ed      	uxtb	r5, r5
 80025ec:	40e9      	lsrs	r1, r5
 80025ee:	60c1      	str	r1, [r0, #12]
 80025f0:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 80025f2:	f3c6 1804 	ubfx	r8, r6, #4, #5
 80025f6:	f008 060f 	and.w	r6, r8, #15
 80025fa:	f018 0f10 	tst.w	r8, #16
 80025fe:	f83c 6016 	ldrh.w	r6, [ip, r6, lsl #1]
 8002602:	46e0      	mov	r8, ip
 8002604:	b2b6      	uxth	r6, r6
 8002606:	d004      	beq.n	8002612 <RCC_GetClocksFreq+0xa2>
 8002608:	b11e      	cbz	r6, 8002612 <RCC_GetClocksFreq+0xa2>
 800260a:	fbb3 f6f6 	udiv	r6, r3, r6
 800260e:	6106      	str	r6, [r0, #16]
 8002610:	e000      	b.n	8002614 <RCC_GetClocksFreq+0xa4>
 8002612:	6102      	str	r2, [r0, #16]
 8002614:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 8002616:	f3c6 2c44 	ubfx	ip, r6, #9, #5
 800261a:	f00c 060f 	and.w	r6, ip, #15
 800261e:	f01c 0f10 	tst.w	ip, #16
 8002622:	f838 6016 	ldrh.w	r6, [r8, r6, lsl #1]
 8002626:	b2b6      	uxth	r6, r6
 8002628:	d004      	beq.n	8002634 <RCC_GetClocksFreq+0xc4>
 800262a:	b11e      	cbz	r6, 8002634 <RCC_GetClocksFreq+0xc4>
 800262c:	fbb3 f6f6 	udiv	r6, r3, r6
 8002630:	6146      	str	r6, [r0, #20]
 8002632:	e000      	b.n	8002636 <RCC_GetClocksFreq+0xc6>
 8002634:	6142      	str	r2, [r0, #20]
 8002636:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002638:	06f6      	lsls	r6, r6, #27
 800263a:	bf5a      	itte	pl
 800263c:	4e6a      	ldrpl	r6, [pc, #424]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 800263e:	6186      	strpl	r6, [r0, #24]
 8002640:	6182      	strmi	r2, [r0, #24]
 8002642:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002644:	06b6      	lsls	r6, r6, #26
 8002646:	bf5a      	itte	pl
 8002648:	4e67      	ldrpl	r6, [pc, #412]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 800264a:	61c6      	strpl	r6, [r0, #28]
 800264c:	61c2      	strmi	r2, [r0, #28]
 800264e:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002650:	0676      	lsls	r6, r6, #25
 8002652:	bf5a      	itte	pl
 8002654:	4e64      	ldrpl	r6, [pc, #400]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 8002656:	6206      	strpl	r6, [r0, #32]
 8002658:	6202      	strmi	r2, [r0, #32]
 800265a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800265c:	05f6      	lsls	r6, r6, #23
 800265e:	d506      	bpl.n	800266e <RCC_GetClocksFreq+0xfe>
 8002660:	429a      	cmp	r2, r3
 8002662:	d104      	bne.n	800266e <RCC_GetClocksFreq+0xfe>
 8002664:	42a5      	cmp	r5, r4
 8002666:	d102      	bne.n	800266e <RCC_GetClocksFreq+0xfe>
 8002668:	0056      	lsls	r6, r2, #1
 800266a:	6246      	str	r6, [r0, #36]	; 0x24
 800266c:	e000      	b.n	8002670 <RCC_GetClocksFreq+0x100>
 800266e:	6241      	str	r1, [r0, #36]	; 0x24
 8002670:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002672:	04f6      	lsls	r6, r6, #19
 8002674:	d506      	bpl.n	8002684 <RCC_GetClocksFreq+0x114>
 8002676:	429a      	cmp	r2, r3
 8002678:	d104      	bne.n	8002684 <RCC_GetClocksFreq+0x114>
 800267a:	42a5      	cmp	r5, r4
 800267c:	d102      	bne.n	8002684 <RCC_GetClocksFreq+0x114>
 800267e:	0056      	lsls	r6, r2, #1
 8002680:	6286      	str	r6, [r0, #40]	; 0x28
 8002682:	e000      	b.n	8002686 <RCC_GetClocksFreq+0x116>
 8002684:	6281      	str	r1, [r0, #40]	; 0x28
 8002686:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002688:	05b6      	lsls	r6, r6, #22
 800268a:	d506      	bpl.n	800269a <RCC_GetClocksFreq+0x12a>
 800268c:	429a      	cmp	r2, r3
 800268e:	d104      	bne.n	800269a <RCC_GetClocksFreq+0x12a>
 8002690:	42a5      	cmp	r5, r4
 8002692:	d102      	bne.n	800269a <RCC_GetClocksFreq+0x12a>
 8002694:	0056      	lsls	r6, r2, #1
 8002696:	62c6      	str	r6, [r0, #44]	; 0x2c
 8002698:	e000      	b.n	800269c <RCC_GetClocksFreq+0x12c>
 800269a:	62c1      	str	r1, [r0, #44]	; 0x2c
 800269c:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800269e:	0576      	lsls	r6, r6, #21
 80026a0:	d506      	bpl.n	80026b0 <RCC_GetClocksFreq+0x140>
 80026a2:	429a      	cmp	r2, r3
 80026a4:	d104      	bne.n	80026b0 <RCC_GetClocksFreq+0x140>
 80026a6:	42a5      	cmp	r5, r4
 80026a8:	d102      	bne.n	80026b0 <RCC_GetClocksFreq+0x140>
 80026aa:	0056      	lsls	r6, r2, #1
 80026ac:	64c6      	str	r6, [r0, #76]	; 0x4c
 80026ae:	e000      	b.n	80026b2 <RCC_GetClocksFreq+0x142>
 80026b0:	64c1      	str	r1, [r0, #76]	; 0x4c
 80026b2:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80026b4:	0536      	lsls	r6, r6, #20
 80026b6:	d506      	bpl.n	80026c6 <RCC_GetClocksFreq+0x156>
 80026b8:	429a      	cmp	r2, r3
 80026ba:	d104      	bne.n	80026c6 <RCC_GetClocksFreq+0x156>
 80026bc:	42a5      	cmp	r5, r4
 80026be:	d102      	bne.n	80026c6 <RCC_GetClocksFreq+0x156>
 80026c0:	0056      	lsls	r6, r2, #1
 80026c2:	6506      	str	r6, [r0, #80]	; 0x50
 80026c4:	e000      	b.n	80026c8 <RCC_GetClocksFreq+0x158>
 80026c6:	6501      	str	r1, [r0, #80]	; 0x50
 80026c8:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80026ca:	04b6      	lsls	r6, r6, #18
 80026cc:	d506      	bpl.n	80026dc <RCC_GetClocksFreq+0x16c>
 80026ce:	429a      	cmp	r2, r3
 80026d0:	d104      	bne.n	80026dc <RCC_GetClocksFreq+0x16c>
 80026d2:	42a5      	cmp	r5, r4
 80026d4:	d102      	bne.n	80026dc <RCC_GetClocksFreq+0x16c>
 80026d6:	0056      	lsls	r6, r2, #1
 80026d8:	6546      	str	r6, [r0, #84]	; 0x54
 80026da:	e000      	b.n	80026de <RCC_GetClocksFreq+0x16e>
 80026dc:	6501      	str	r1, [r0, #80]	; 0x50
 80026de:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80026e0:	0436      	lsls	r6, r6, #16
 80026e2:	d506      	bpl.n	80026f2 <RCC_GetClocksFreq+0x182>
 80026e4:	429a      	cmp	r2, r3
 80026e6:	d104      	bne.n	80026f2 <RCC_GetClocksFreq+0x182>
 80026e8:	42a5      	cmp	r5, r4
 80026ea:	d102      	bne.n	80026f2 <RCC_GetClocksFreq+0x182>
 80026ec:	0053      	lsls	r3, r2, #1
 80026ee:	6583      	str	r3, [r0, #88]	; 0x58
 80026f0:	e000      	b.n	80026f4 <RCC_GetClocksFreq+0x184>
 80026f2:	6581      	str	r1, [r0, #88]	; 0x58
 80026f4:	6b3c      	ldr	r4, [r7, #48]	; 0x30
 80026f6:	4b3b      	ldr	r3, [pc, #236]	; (80027e4 <RCC_GetClocksFreq+0x274>)
 80026f8:	07a4      	lsls	r4, r4, #30
 80026fa:	d101      	bne.n	8002700 <RCC_GetClocksFreq+0x190>
 80026fc:	6381      	str	r1, [r0, #56]	; 0x38
 80026fe:	e015      	b.n	800272c <RCC_GetClocksFreq+0x1bc>
 8002700:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002702:	f001 0103 	and.w	r1, r1, #3
 8002706:	2901      	cmp	r1, #1
 8002708:	d101      	bne.n	800270e <RCC_GetClocksFreq+0x19e>
 800270a:	6382      	str	r2, [r0, #56]	; 0x38
 800270c:	e00e      	b.n	800272c <RCC_GetClocksFreq+0x1bc>
 800270e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002710:	f001 0103 	and.w	r1, r1, #3
 8002714:	2902      	cmp	r1, #2
 8002716:	d102      	bne.n	800271e <RCC_GetClocksFreq+0x1ae>
 8002718:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800271c:	e005      	b.n	800272a <RCC_GetClocksFreq+0x1ba>
 800271e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002720:	f003 0303 	and.w	r3, r3, #3
 8002724:	2b03      	cmp	r3, #3
 8002726:	d101      	bne.n	800272c <RCC_GetClocksFreq+0x1bc>
 8002728:	4b2f      	ldr	r3, [pc, #188]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 800272a:	6383      	str	r3, [r0, #56]	; 0x38
 800272c:	6b39      	ldr	r1, [r7, #48]	; 0x30
 800272e:	4b2d      	ldr	r3, [pc, #180]	; (80027e4 <RCC_GetClocksFreq+0x274>)
 8002730:	f411 3f40 	tst.w	r1, #196608	; 0x30000
 8002734:	d102      	bne.n	800273c <RCC_GetClocksFreq+0x1cc>
 8002736:	f8c0 e03c 	str.w	lr, [r0, #60]	; 0x3c
 800273a:	e018      	b.n	800276e <RCC_GetClocksFreq+0x1fe>
 800273c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800273e:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002742:	f5b1 3f80 	cmp.w	r1, #65536	; 0x10000
 8002746:	d101      	bne.n	800274c <RCC_GetClocksFreq+0x1dc>
 8002748:	63c2      	str	r2, [r0, #60]	; 0x3c
 800274a:	e010      	b.n	800276e <RCC_GetClocksFreq+0x1fe>
 800274c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800274e:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002752:	f5b1 3f00 	cmp.w	r1, #131072	; 0x20000
 8002756:	d102      	bne.n	800275e <RCC_GetClocksFreq+0x1ee>
 8002758:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800275c:	e006      	b.n	800276c <RCC_GetClocksFreq+0x1fc>
 800275e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002760:	f403 3340 	and.w	r3, r3, #196608	; 0x30000
 8002764:	f5b3 3f40 	cmp.w	r3, #196608	; 0x30000
 8002768:	d101      	bne.n	800276e <RCC_GetClocksFreq+0x1fe>
 800276a:	4b1f      	ldr	r3, [pc, #124]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 800276c:	63c3      	str	r3, [r0, #60]	; 0x3c
 800276e:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8002770:	4b1c      	ldr	r3, [pc, #112]	; (80027e4 <RCC_GetClocksFreq+0x274>)
 8002772:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8002776:	d102      	bne.n	800277e <RCC_GetClocksFreq+0x20e>
 8002778:	f8c0 e040 	str.w	lr, [r0, #64]	; 0x40
 800277c:	e018      	b.n	80027b0 <RCC_GetClocksFreq+0x240>
 800277e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002780:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002784:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8002788:	d101      	bne.n	800278e <RCC_GetClocksFreq+0x21e>
 800278a:	6402      	str	r2, [r0, #64]	; 0x40
 800278c:	e010      	b.n	80027b0 <RCC_GetClocksFreq+0x240>
 800278e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002790:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002794:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8002798:	d102      	bne.n	80027a0 <RCC_GetClocksFreq+0x230>
 800279a:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800279e:	e006      	b.n	80027ae <RCC_GetClocksFreq+0x23e>
 80027a0:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80027a2:	f403 2340 	and.w	r3, r3, #786432	; 0xc0000
 80027a6:	f5b3 2f40 	cmp.w	r3, #786432	; 0xc0000
 80027aa:	d101      	bne.n	80027b0 <RCC_GetClocksFreq+0x240>
 80027ac:	4b0e      	ldr	r3, [pc, #56]	; (80027e8 <RCC_GetClocksFreq+0x278>)
 80027ae:	6403      	str	r3, [r0, #64]	; 0x40
 80027b0:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80027b2:	4b0c      	ldr	r3, [pc, #48]	; (80027e4 <RCC_GetClocksFreq+0x274>)
 80027b4:	f411 1f40 	tst.w	r1, #3145728	; 0x300000
 80027b8:	d102      	bne.n	80027c0 <RCC_GetClocksFreq+0x250>
 80027ba:	f8c0 e044 	str.w	lr, [r0, #68]	; 0x44
 80027be:	e023      	b.n	8002808 <RCC_GetClocksFreq+0x298>
 80027c0:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80027c2:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 80027c6:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 80027ca:	d101      	bne.n	80027d0 <RCC_GetClocksFreq+0x260>
 80027cc:	6442      	str	r2, [r0, #68]	; 0x44
 80027ce:	e01b      	b.n	8002808 <RCC_GetClocksFreq+0x298>
 80027d0:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80027d2:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 80027d6:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 80027da:	d10d      	bne.n	80027f8 <RCC_GetClocksFreq+0x288>
 80027dc:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80027e0:	e011      	b.n	8002806 <RCC_GetClocksFreq+0x296>
 80027e2:	bf00      	nop
 80027e4:	40021000 	.word	0x40021000
 80027e8:	007a1200 	.word	0x007a1200
 80027ec:	003d0900 	.word	0x003d0900
 80027f0:	20000020 	.word	0x20000020
 80027f4:	20000000 	.word	0x20000000
 80027f8:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80027fa:	f403 1340 	and.w	r3, r3, #3145728	; 0x300000
 80027fe:	f5b3 1f40 	cmp.w	r3, #3145728	; 0x300000
 8002802:	d101      	bne.n	8002808 <RCC_GetClocksFreq+0x298>
 8002804:	4b13      	ldr	r3, [pc, #76]	; (8002854 <RCC_GetClocksFreq+0x2e4>)
 8002806:	6443      	str	r3, [r0, #68]	; 0x44
 8002808:	6b39      	ldr	r1, [r7, #48]	; 0x30
 800280a:	4b13      	ldr	r3, [pc, #76]	; (8002858 <RCC_GetClocksFreq+0x2e8>)
 800280c:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8002810:	d103      	bne.n	800281a <RCC_GetClocksFreq+0x2aa>
 8002812:	f8c0 e048 	str.w	lr, [r0, #72]	; 0x48
 8002816:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800281a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800281c:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8002820:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8002824:	d102      	bne.n	800282c <RCC_GetClocksFreq+0x2bc>
 8002826:	6482      	str	r2, [r0, #72]	; 0x48
 8002828:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800282c:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800282e:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 8002832:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 8002836:	d102      	bne.n	800283e <RCC_GetClocksFreq+0x2ce>
 8002838:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800283c:	e006      	b.n	800284c <RCC_GetClocksFreq+0x2dc>
 800283e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002840:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8002844:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8002848:	d101      	bne.n	800284e <RCC_GetClocksFreq+0x2de>
 800284a:	4b02      	ldr	r3, [pc, #8]	; (8002854 <RCC_GetClocksFreq+0x2e4>)
 800284c:	6483      	str	r3, [r0, #72]	; 0x48
 800284e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8002852:	bf00      	nop
 8002854:	007a1200 	.word	0x007a1200
 8002858:	40021000 	.word	0x40021000

0800285c <RCC_AHBPeriphClockCmd>:
 800285c:	bf00      	nop
 800285e:	bf00      	nop
 8002860:	4b04      	ldr	r3, [pc, #16]	; (8002874 <RCC_AHBPeriphClockCmd+0x18>)
 8002862:	695a      	ldr	r2, [r3, #20]
 8002864:	b109      	cbz	r1, 800286a <RCC_AHBPeriphClockCmd+0xe>
 8002866:	4310      	orrs	r0, r2
 8002868:	e001      	b.n	800286e <RCC_AHBPeriphClockCmd+0x12>
 800286a:	ea22 0000 	bic.w	r0, r2, r0
 800286e:	6158      	str	r0, [r3, #20]
 8002870:	4770      	bx	lr
 8002872:	bf00      	nop
 8002874:	40021000 	.word	0x40021000

08002878 <RCC_APB2PeriphClockCmd>:
 8002878:	bf00      	nop
 800287a:	bf00      	nop
 800287c:	4b04      	ldr	r3, [pc, #16]	; (8002890 <RCC_APB2PeriphClockCmd+0x18>)
 800287e:	699a      	ldr	r2, [r3, #24]
 8002880:	b109      	cbz	r1, 8002886 <RCC_APB2PeriphClockCmd+0xe>
 8002882:	4310      	orrs	r0, r2
 8002884:	e001      	b.n	800288a <RCC_APB2PeriphClockCmd+0x12>
 8002886:	ea22 0000 	bic.w	r0, r2, r0
 800288a:	6198      	str	r0, [r3, #24]
 800288c:	4770      	bx	lr
 800288e:	bf00      	nop
 8002890:	40021000 	.word	0x40021000

08002894 <RCC_APB1PeriphClockCmd>:
 8002894:	bf00      	nop
 8002896:	bf00      	nop
 8002898:	4b04      	ldr	r3, [pc, #16]	; (80028ac <RCC_APB1PeriphClockCmd+0x18>)
 800289a:	69da      	ldr	r2, [r3, #28]
 800289c:	b109      	cbz	r1, 80028a2 <RCC_APB1PeriphClockCmd+0xe>
 800289e:	4310      	orrs	r0, r2
 80028a0:	e001      	b.n	80028a6 <RCC_APB1PeriphClockCmd+0x12>
 80028a2:	ea22 0000 	bic.w	r0, r2, r0
 80028a6:	61d8      	str	r0, [r3, #28]
 80028a8:	4770      	bx	lr
 80028aa:	bf00      	nop
 80028ac:	40021000 	.word	0x40021000

080028b0 <TIM_TimeBaseInit>:
 80028b0:	bf00      	nop
 80028b2:	bf00      	nop
 80028b4:	bf00      	nop
 80028b6:	4a24      	ldr	r2, [pc, #144]	; (8002948 <TIM_TimeBaseInit+0x98>)
 80028b8:	8803      	ldrh	r3, [r0, #0]
 80028ba:	4290      	cmp	r0, r2
 80028bc:	b29b      	uxth	r3, r3
 80028be:	d012      	beq.n	80028e6 <TIM_TimeBaseInit+0x36>
 80028c0:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80028c4:	4290      	cmp	r0, r2
 80028c6:	d00e      	beq.n	80028e6 <TIM_TimeBaseInit+0x36>
 80028c8:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80028cc:	d00b      	beq.n	80028e6 <TIM_TimeBaseInit+0x36>
 80028ce:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 80028d2:	4290      	cmp	r0, r2
 80028d4:	d007      	beq.n	80028e6 <TIM_TimeBaseInit+0x36>
 80028d6:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80028da:	4290      	cmp	r0, r2
 80028dc:	d003      	beq.n	80028e6 <TIM_TimeBaseInit+0x36>
 80028de:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 80028e2:	4290      	cmp	r0, r2
 80028e4:	d103      	bne.n	80028ee <TIM_TimeBaseInit+0x3e>
 80028e6:	884a      	ldrh	r2, [r1, #2]
 80028e8:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80028ec:	4313      	orrs	r3, r2
 80028ee:	4a17      	ldr	r2, [pc, #92]	; (800294c <TIM_TimeBaseInit+0x9c>)
 80028f0:	4290      	cmp	r0, r2
 80028f2:	d008      	beq.n	8002906 <TIM_TimeBaseInit+0x56>
 80028f4:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80028f8:	4290      	cmp	r0, r2
 80028fa:	bf1f      	itttt	ne
 80028fc:	f423 7340 	bicne.w	r3, r3, #768	; 0x300
 8002900:	890a      	ldrhne	r2, [r1, #8]
 8002902:	b29b      	uxthne	r3, r3
 8002904:	4313      	orrne	r3, r2
 8002906:	8003      	strh	r3, [r0, #0]
 8002908:	684b      	ldr	r3, [r1, #4]
 800290a:	62c3      	str	r3, [r0, #44]	; 0x2c
 800290c:	880b      	ldrh	r3, [r1, #0]
 800290e:	8503      	strh	r3, [r0, #40]	; 0x28
 8002910:	4b0d      	ldr	r3, [pc, #52]	; (8002948 <TIM_TimeBaseInit+0x98>)
 8002912:	4298      	cmp	r0, r3
 8002914:	d013      	beq.n	800293e <TIM_TimeBaseInit+0x8e>
 8002916:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 800291a:	4298      	cmp	r0, r3
 800291c:	d00f      	beq.n	800293e <TIM_TimeBaseInit+0x8e>
 800291e:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8002922:	4298      	cmp	r0, r3
 8002924:	d00b      	beq.n	800293e <TIM_TimeBaseInit+0x8e>
 8002926:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800292a:	4298      	cmp	r0, r3
 800292c:	d007      	beq.n	800293e <TIM_TimeBaseInit+0x8e>
 800292e:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8002932:	4298      	cmp	r0, r3
 8002934:	d003      	beq.n	800293e <TIM_TimeBaseInit+0x8e>
 8002936:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 800293a:	4298      	cmp	r0, r3
 800293c:	d101      	bne.n	8002942 <TIM_TimeBaseInit+0x92>
 800293e:	894b      	ldrh	r3, [r1, #10]
 8002940:	8603      	strh	r3, [r0, #48]	; 0x30
 8002942:	2301      	movs	r3, #1
 8002944:	6143      	str	r3, [r0, #20]
 8002946:	4770      	bx	lr
 8002948:	40012c00 	.word	0x40012c00
 800294c:	40001000 	.word	0x40001000

08002950 <TIM_Cmd>:
 8002950:	bf00      	nop
 8002952:	bf00      	nop
 8002954:	8803      	ldrh	r3, [r0, #0]
 8002956:	b119      	cbz	r1, 8002960 <TIM_Cmd+0x10>
 8002958:	b29b      	uxth	r3, r3
 800295a:	f043 0301 	orr.w	r3, r3, #1
 800295e:	e003      	b.n	8002968 <TIM_Cmd+0x18>
 8002960:	f023 0301 	bic.w	r3, r3, #1
 8002964:	041b      	lsls	r3, r3, #16
 8002966:	0c1b      	lsrs	r3, r3, #16
 8002968:	8003      	strh	r3, [r0, #0]
 800296a:	4770      	bx	lr

0800296c <TIM_OC2Init>:
 800296c:	b570      	push	{r4, r5, r6, lr}
 800296e:	bf00      	nop
 8002970:	bf00      	nop
 8002972:	bf00      	nop
 8002974:	bf00      	nop
 8002976:	6a03      	ldr	r3, [r0, #32]
 8002978:	680d      	ldr	r5, [r1, #0]
 800297a:	898e      	ldrh	r6, [r1, #12]
 800297c:	f023 0310 	bic.w	r3, r3, #16
 8002980:	6203      	str	r3, [r0, #32]
 8002982:	6a03      	ldr	r3, [r0, #32]
 8002984:	6844      	ldr	r4, [r0, #4]
 8002986:	6982      	ldr	r2, [r0, #24]
 8002988:	f022 7280 	bic.w	r2, r2, #16777216	; 0x1000000
 800298c:	f422 42e6 	bic.w	r2, r2, #29440	; 0x7300
 8002990:	ea42 2505 	orr.w	r5, r2, r5, lsl #8
 8002994:	f023 0220 	bic.w	r2, r3, #32
 8002998:	888b      	ldrh	r3, [r1, #4]
 800299a:	4333      	orrs	r3, r6
 800299c:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
 80029a0:	4a10      	ldr	r2, [pc, #64]	; (80029e4 <TIM_OC2Init+0x78>)
 80029a2:	4290      	cmp	r0, r2
 80029a4:	d003      	beq.n	80029ae <TIM_OC2Init+0x42>
 80029a6:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80029aa:	4290      	cmp	r0, r2
 80029ac:	d114      	bne.n	80029d8 <TIM_OC2Init+0x6c>
 80029ae:	bf00      	nop
 80029b0:	bf00      	nop
 80029b2:	bf00      	nop
 80029b4:	bf00      	nop
 80029b6:	89ca      	ldrh	r2, [r1, #14]
 80029b8:	8a0e      	ldrh	r6, [r1, #16]
 80029ba:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 80029be:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 80029c2:	88ca      	ldrh	r2, [r1, #6]
 80029c4:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 80029c8:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 80029cc:	8a4a      	ldrh	r2, [r1, #18]
 80029ce:	f424 6440 	bic.w	r4, r4, #3072	; 0xc00
 80029d2:	4332      	orrs	r2, r6
 80029d4:	ea44 0482 	orr.w	r4, r4, r2, lsl #2
 80029d8:	688a      	ldr	r2, [r1, #8]
 80029da:	6044      	str	r4, [r0, #4]
 80029dc:	6185      	str	r5, [r0, #24]
 80029de:	6382      	str	r2, [r0, #56]	; 0x38
 80029e0:	6203      	str	r3, [r0, #32]
 80029e2:	bd70      	pop	{r4, r5, r6, pc}
 80029e4:	40012c00 	.word	0x40012c00

080029e8 <TIM_SetCompare2>:
 80029e8:	bf00      	nop
 80029ea:	6381      	str	r1, [r0, #56]	; 0x38
 80029ec:	4770      	bx	lr

080029ee <TIM_CtrlPWMOutputs>:
 80029ee:	bf00      	nop
 80029f0:	bf00      	nop
 80029f2:	6c43      	ldr	r3, [r0, #68]	; 0x44
 80029f4:	b111      	cbz	r1, 80029fc <TIM_CtrlPWMOutputs+0xe>
 80029f6:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 80029fa:	e001      	b.n	8002a00 <TIM_CtrlPWMOutputs+0x12>
 80029fc:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8002a00:	6443      	str	r3, [r0, #68]	; 0x44
 8002a02:	4770      	bx	lr

08002a04 <TIM_ClearITPendingBit>:
 8002a04:	bf00      	nop
 8002a06:	43c9      	mvns	r1, r1
 8002a08:	b289      	uxth	r1, r1
 8002a0a:	6101      	str	r1, [r0, #16]
 8002a0c:	4770      	bx	lr
	...

08002a10 <USART_Init>:
 8002a10:	b530      	push	{r4, r5, lr}
 8002a12:	4604      	mov	r4, r0
 8002a14:	b099      	sub	sp, #100	; 0x64
 8002a16:	460d      	mov	r5, r1
 8002a18:	bf00      	nop
 8002a1a:	bf00      	nop
 8002a1c:	bf00      	nop
 8002a1e:	bf00      	nop
 8002a20:	bf00      	nop
 8002a22:	bf00      	nop
 8002a24:	bf00      	nop
 8002a26:	6803      	ldr	r3, [r0, #0]
 8002a28:	f023 0301 	bic.w	r3, r3, #1
 8002a2c:	6003      	str	r3, [r0, #0]
 8002a2e:	6843      	ldr	r3, [r0, #4]
 8002a30:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 8002a34:	688b      	ldr	r3, [r1, #8]
 8002a36:	68c9      	ldr	r1, [r1, #12]
 8002a38:	4313      	orrs	r3, r2
 8002a3a:	6043      	str	r3, [r0, #4]
 8002a3c:	686a      	ldr	r2, [r5, #4]
 8002a3e:	6803      	ldr	r3, [r0, #0]
 8002a40:	4311      	orrs	r1, r2
 8002a42:	692a      	ldr	r2, [r5, #16]
 8002a44:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8002a48:	430a      	orrs	r2, r1
 8002a4a:	f023 030c 	bic.w	r3, r3, #12
 8002a4e:	4313      	orrs	r3, r2
 8002a50:	6003      	str	r3, [r0, #0]
 8002a52:	6883      	ldr	r3, [r0, #8]
 8002a54:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 8002a58:	696b      	ldr	r3, [r5, #20]
 8002a5a:	4313      	orrs	r3, r2
 8002a5c:	6083      	str	r3, [r0, #8]
 8002a5e:	a801      	add	r0, sp, #4
 8002a60:	f7ff fd86 	bl	8002570 <RCC_GetClocksFreq>
 8002a64:	4b17      	ldr	r3, [pc, #92]	; (8002ac4 <USART_Init+0xb4>)
 8002a66:	429c      	cmp	r4, r3
 8002a68:	d101      	bne.n	8002a6e <USART_Init+0x5e>
 8002a6a:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 8002a6c:	e00e      	b.n	8002a8c <USART_Init+0x7c>
 8002a6e:	4b16      	ldr	r3, [pc, #88]	; (8002ac8 <USART_Init+0xb8>)
 8002a70:	429c      	cmp	r4, r3
 8002a72:	d101      	bne.n	8002a78 <USART_Init+0x68>
 8002a74:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8002a76:	e009      	b.n	8002a8c <USART_Init+0x7c>
 8002a78:	4b14      	ldr	r3, [pc, #80]	; (8002acc <USART_Init+0xbc>)
 8002a7a:	429c      	cmp	r4, r3
 8002a7c:	d101      	bne.n	8002a82 <USART_Init+0x72>
 8002a7e:	9b11      	ldr	r3, [sp, #68]	; 0x44
 8002a80:	e004      	b.n	8002a8c <USART_Init+0x7c>
 8002a82:	4b13      	ldr	r3, [pc, #76]	; (8002ad0 <USART_Init+0xc0>)
 8002a84:	429c      	cmp	r4, r3
 8002a86:	bf0c      	ite	eq
 8002a88:	9b12      	ldreq	r3, [sp, #72]	; 0x48
 8002a8a:	9b13      	ldrne	r3, [sp, #76]	; 0x4c
 8002a8c:	6822      	ldr	r2, [r4, #0]
 8002a8e:	6829      	ldr	r1, [r5, #0]
 8002a90:	f412 4f00 	tst.w	r2, #32768	; 0x8000
 8002a94:	bf18      	it	ne
 8002a96:	005b      	lslne	r3, r3, #1
 8002a98:	fbb3 f2f1 	udiv	r2, r3, r1
 8002a9c:	fb01 3312 	mls	r3, r1, r2, r3
 8002aa0:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
 8002aa4:	6823      	ldr	r3, [r4, #0]
 8002aa6:	bf28      	it	cs
 8002aa8:	3201      	addcs	r2, #1
 8002aaa:	041b      	lsls	r3, r3, #16
 8002aac:	bf41      	itttt	mi
 8002aae:	f64f 73f0 	movwmi	r3, #65520	; 0xfff0
 8002ab2:	f3c2 0142 	ubfxmi	r1, r2, #1, #3
 8002ab6:	4013      	andmi	r3, r2
 8002ab8:	ea41 0203 	orrmi.w	r2, r1, r3
 8002abc:	b292      	uxth	r2, r2
 8002abe:	81a2      	strh	r2, [r4, #12]
 8002ac0:	b019      	add	sp, #100	; 0x64
 8002ac2:	bd30      	pop	{r4, r5, pc}
 8002ac4:	40013800 	.word	0x40013800
 8002ac8:	40004400 	.word	0x40004400
 8002acc:	40004800 	.word	0x40004800
 8002ad0:	40004c00 	.word	0x40004c00

08002ad4 <USART_Cmd>:
 8002ad4:	bf00      	nop
 8002ad6:	bf00      	nop
 8002ad8:	6803      	ldr	r3, [r0, #0]
 8002ada:	b111      	cbz	r1, 8002ae2 <USART_Cmd+0xe>
 8002adc:	f043 0301 	orr.w	r3, r3, #1
 8002ae0:	e001      	b.n	8002ae6 <USART_Cmd+0x12>
 8002ae2:	f023 0301 	bic.w	r3, r3, #1
 8002ae6:	6003      	str	r3, [r0, #0]
 8002ae8:	4770      	bx	lr

08002aea <USART_ReceiveData>:
 8002aea:	bf00      	nop
 8002aec:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8002aee:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8002af2:	4770      	bx	lr

08002af4 <USART_ITConfig>:
 8002af4:	b510      	push	{r4, lr}
 8002af6:	bf00      	nop
 8002af8:	bf00      	nop
 8002afa:	bf00      	nop
 8002afc:	f3c1 2407 	ubfx	r4, r1, #8, #8
 8002b00:	2301      	movs	r3, #1
 8002b02:	b2c9      	uxtb	r1, r1
 8002b04:	2c02      	cmp	r4, #2
 8002b06:	fa03 f301 	lsl.w	r3, r3, r1
 8002b0a:	d101      	bne.n	8002b10 <USART_ITConfig+0x1c>
 8002b0c:	3004      	adds	r0, #4
 8002b0e:	e002      	b.n	8002b16 <USART_ITConfig+0x22>
 8002b10:	2c03      	cmp	r4, #3
 8002b12:	bf08      	it	eq
 8002b14:	3008      	addeq	r0, #8
 8002b16:	b112      	cbz	r2, 8002b1e <USART_ITConfig+0x2a>
 8002b18:	6802      	ldr	r2, [r0, #0]
 8002b1a:	4313      	orrs	r3, r2
 8002b1c:	e002      	b.n	8002b24 <USART_ITConfig+0x30>
 8002b1e:	6802      	ldr	r2, [r0, #0]
 8002b20:	ea22 0303 	bic.w	r3, r2, r3
 8002b24:	6003      	str	r3, [r0, #0]
 8002b26:	bd10      	pop	{r4, pc}

08002b28 <USART_GetITStatus>:
 8002b28:	b510      	push	{r4, lr}
 8002b2a:	bf00      	nop
 8002b2c:	bf00      	nop
 8002b2e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8002b32:	b2cc      	uxtb	r4, r1
 8002b34:	2301      	movs	r3, #1
 8002b36:	2a01      	cmp	r2, #1
 8002b38:	fa03 f304 	lsl.w	r3, r3, r4
 8002b3c:	d101      	bne.n	8002b42 <USART_GetITStatus+0x1a>
 8002b3e:	6802      	ldr	r2, [r0, #0]
 8002b40:	e003      	b.n	8002b4a <USART_GetITStatus+0x22>
 8002b42:	2a02      	cmp	r2, #2
 8002b44:	bf0c      	ite	eq
 8002b46:	6842      	ldreq	r2, [r0, #4]
 8002b48:	6882      	ldrne	r2, [r0, #8]
 8002b4a:	4013      	ands	r3, r2
 8002b4c:	69c2      	ldr	r2, [r0, #28]
 8002b4e:	b13b      	cbz	r3, 8002b60 <USART_GetITStatus+0x38>
 8002b50:	0c09      	lsrs	r1, r1, #16
 8002b52:	2301      	movs	r3, #1
 8002b54:	408b      	lsls	r3, r1
 8002b56:	4213      	tst	r3, r2
 8002b58:	bf14      	ite	ne
 8002b5a:	2001      	movne	r0, #1
 8002b5c:	2000      	moveq	r0, #0
 8002b5e:	bd10      	pop	{r4, pc}
 8002b60:	4618      	mov	r0, r3
 8002b62:	bd10      	pop	{r4, pc}

08002b64 <USART_ClearITPendingBit>:
 8002b64:	bf00      	nop
 8002b66:	bf00      	nop
 8002b68:	2301      	movs	r3, #1
 8002b6a:	0c09      	lsrs	r1, r1, #16
 8002b6c:	408b      	lsls	r3, r1
 8002b6e:	6203      	str	r3, [r0, #32]
 8002b70:	4770      	bx	lr
	...

08002b74 <SystemInit>:
 8002b74:	4a39      	ldr	r2, [pc, #228]	; (8002c5c <SystemInit+0xe8>)
 8002b76:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8002b7a:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8002b7e:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8002b82:	4b37      	ldr	r3, [pc, #220]	; (8002c60 <SystemInit+0xec>)
 8002b84:	681a      	ldr	r2, [r3, #0]
 8002b86:	f042 0201 	orr.w	r2, r2, #1
 8002b8a:	601a      	str	r2, [r3, #0]
 8002b8c:	6859      	ldr	r1, [r3, #4]
 8002b8e:	4a35      	ldr	r2, [pc, #212]	; (8002c64 <SystemInit+0xf0>)
 8002b90:	400a      	ands	r2, r1
 8002b92:	605a      	str	r2, [r3, #4]
 8002b94:	681a      	ldr	r2, [r3, #0]
 8002b96:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8002b9a:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8002b9e:	601a      	str	r2, [r3, #0]
 8002ba0:	681a      	ldr	r2, [r3, #0]
 8002ba2:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8002ba6:	601a      	str	r2, [r3, #0]
 8002ba8:	685a      	ldr	r2, [r3, #4]
 8002baa:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8002bae:	605a      	str	r2, [r3, #4]
 8002bb0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8002bb2:	f022 020f 	bic.w	r2, r2, #15
 8002bb6:	62da      	str	r2, [r3, #44]	; 0x2c
 8002bb8:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002bba:	4a2b      	ldr	r2, [pc, #172]	; (8002c68 <SystemInit+0xf4>)
 8002bbc:	b082      	sub	sp, #8
 8002bbe:	400a      	ands	r2, r1
 8002bc0:	631a      	str	r2, [r3, #48]	; 0x30
 8002bc2:	2200      	movs	r2, #0
 8002bc4:	609a      	str	r2, [r3, #8]
 8002bc6:	9200      	str	r2, [sp, #0]
 8002bc8:	9201      	str	r2, [sp, #4]
 8002bca:	681a      	ldr	r2, [r3, #0]
 8002bcc:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8002bd0:	601a      	str	r2, [r3, #0]
 8002bd2:	681a      	ldr	r2, [r3, #0]
 8002bd4:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8002bd8:	9201      	str	r2, [sp, #4]
 8002bda:	9a00      	ldr	r2, [sp, #0]
 8002bdc:	3201      	adds	r2, #1
 8002bde:	9200      	str	r2, [sp, #0]
 8002be0:	9a01      	ldr	r2, [sp, #4]
 8002be2:	b91a      	cbnz	r2, 8002bec <SystemInit+0x78>
 8002be4:	9a00      	ldr	r2, [sp, #0]
 8002be6:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002bea:	d1f2      	bne.n	8002bd2 <SystemInit+0x5e>
 8002bec:	681a      	ldr	r2, [r3, #0]
 8002bee:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 8002bf2:	bf18      	it	ne
 8002bf4:	2201      	movne	r2, #1
 8002bf6:	9201      	str	r2, [sp, #4]
 8002bf8:	9a01      	ldr	r2, [sp, #4]
 8002bfa:	2a01      	cmp	r2, #1
 8002bfc:	d005      	beq.n	8002c0a <SystemInit+0x96>
 8002bfe:	4b17      	ldr	r3, [pc, #92]	; (8002c5c <SystemInit+0xe8>)
 8002c00:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8002c04:	609a      	str	r2, [r3, #8]
 8002c06:	b002      	add	sp, #8
 8002c08:	4770      	bx	lr
 8002c0a:	4a18      	ldr	r2, [pc, #96]	; (8002c6c <SystemInit+0xf8>)
 8002c0c:	2112      	movs	r1, #18
 8002c0e:	6011      	str	r1, [r2, #0]
 8002c10:	685a      	ldr	r2, [r3, #4]
 8002c12:	605a      	str	r2, [r3, #4]
 8002c14:	685a      	ldr	r2, [r3, #4]
 8002c16:	605a      	str	r2, [r3, #4]
 8002c18:	685a      	ldr	r2, [r3, #4]
 8002c1a:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8002c1e:	605a      	str	r2, [r3, #4]
 8002c20:	685a      	ldr	r2, [r3, #4]
 8002c22:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8002c26:	605a      	str	r2, [r3, #4]
 8002c28:	685a      	ldr	r2, [r3, #4]
 8002c2a:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8002c2e:	605a      	str	r2, [r3, #4]
 8002c30:	681a      	ldr	r2, [r3, #0]
 8002c32:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8002c36:	601a      	str	r2, [r3, #0]
 8002c38:	6819      	ldr	r1, [r3, #0]
 8002c3a:	4a09      	ldr	r2, [pc, #36]	; (8002c60 <SystemInit+0xec>)
 8002c3c:	0189      	lsls	r1, r1, #6
 8002c3e:	d5fb      	bpl.n	8002c38 <SystemInit+0xc4>
 8002c40:	6851      	ldr	r1, [r2, #4]
 8002c42:	f021 0103 	bic.w	r1, r1, #3
 8002c46:	6051      	str	r1, [r2, #4]
 8002c48:	6851      	ldr	r1, [r2, #4]
 8002c4a:	f041 0102 	orr.w	r1, r1, #2
 8002c4e:	6051      	str	r1, [r2, #4]
 8002c50:	685a      	ldr	r2, [r3, #4]
 8002c52:	f002 020c 	and.w	r2, r2, #12
 8002c56:	2a08      	cmp	r2, #8
 8002c58:	d1fa      	bne.n	8002c50 <SystemInit+0xdc>
 8002c5a:	e7d0      	b.n	8002bfe <SystemInit+0x8a>
 8002c5c:	e000ed00 	.word	0xe000ed00
 8002c60:	40021000 	.word	0x40021000
 8002c64:	f87fc00c 	.word	0xf87fc00c
 8002c68:	ff00fccc 	.word	0xff00fccc
 8002c6c:	40022000 	.word	0x40022000

08002c70 <core_yield>:
 8002c70:	bf00      	nop
 8002c72:	4770      	bx	lr

08002c74 <sytem_clock_init>:
 8002c74:	f7ff bf7e 	b.w	8002b74 <SystemInit>

08002c78 <NVIC_Init>:
 8002c78:	b510      	push	{r4, lr}
 8002c7a:	bf00      	nop
 8002c7c:	bf00      	nop
 8002c7e:	bf00      	nop
 8002c80:	78c2      	ldrb	r2, [r0, #3]
 8002c82:	7803      	ldrb	r3, [r0, #0]
 8002c84:	b312      	cbz	r2, 8002ccc <NVIC_Init+0x54>
 8002c86:	4a17      	ldr	r2, [pc, #92]	; (8002ce4 <NVIC_Init+0x6c>)
 8002c88:	68d1      	ldr	r1, [r2, #12]
 8002c8a:	7842      	ldrb	r2, [r0, #1]
 8002c8c:	43c9      	mvns	r1, r1
 8002c8e:	f3c1 2102 	ubfx	r1, r1, #8, #3
 8002c92:	f1c1 0404 	rsb	r4, r1, #4
 8002c96:	b2e4      	uxtb	r4, r4
 8002c98:	40a2      	lsls	r2, r4
 8002c9a:	b2d4      	uxtb	r4, r2
 8002c9c:	220f      	movs	r2, #15
 8002c9e:	410a      	asrs	r2, r1
 8002ca0:	7881      	ldrb	r1, [r0, #2]
 8002ca2:	400a      	ands	r2, r1
 8002ca4:	4322      	orrs	r2, r4
 8002ca6:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8002caa:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8002cae:	0112      	lsls	r2, r2, #4
 8002cb0:	b2d2      	uxtb	r2, r2
 8002cb2:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8002cb6:	7803      	ldrb	r3, [r0, #0]
 8002cb8:	2201      	movs	r2, #1
 8002cba:	0959      	lsrs	r1, r3, #5
 8002cbc:	f003 031f 	and.w	r3, r3, #31
 8002cc0:	fa02 f303 	lsl.w	r3, r2, r3
 8002cc4:	4a08      	ldr	r2, [pc, #32]	; (8002ce8 <NVIC_Init+0x70>)
 8002cc6:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8002cca:	bd10      	pop	{r4, pc}
 8002ccc:	095a      	lsrs	r2, r3, #5
 8002cce:	2101      	movs	r1, #1
 8002cd0:	f003 031f 	and.w	r3, r3, #31
 8002cd4:	4099      	lsls	r1, r3
 8002cd6:	f102 0320 	add.w	r3, r2, #32
 8002cda:	4a03      	ldr	r2, [pc, #12]	; (8002ce8 <NVIC_Init+0x70>)
 8002cdc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8002ce0:	bd10      	pop	{r4, pc}
 8002ce2:	bf00      	nop
 8002ce4:	e000ed00 	.word	0xe000ed00
 8002ce8:	e000e100 	.word	0xe000e100

08002cec <EXTI_ClearITPendingBit>:
 8002cec:	f020 011f 	bic.w	r1, r0, #31
 8002cf0:	2301      	movs	r3, #1
 8002cf2:	f000 001f 	and.w	r0, r0, #31
 8002cf6:	4a02      	ldr	r2, [pc, #8]	; (8002d00 <EXTI_ClearITPendingBit+0x14>)
 8002cf8:	4083      	lsls	r3, r0
 8002cfa:	508b      	str	r3, [r1, r2]
 8002cfc:	4770      	bx	lr
 8002cfe:	bf00      	nop
 8002d00:	40010414 	.word	0x40010414

08002d04 <GPIO_Init>:
 8002d04:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002d06:	bf00      	nop
 8002d08:	bf00      	nop
 8002d0a:	bf00      	nop
 8002d0c:	bf00      	nop
 8002d0e:	2300      	movs	r3, #0
 8002d10:	680e      	ldr	r6, [r1, #0]
 8002d12:	461c      	mov	r4, r3
 8002d14:	2501      	movs	r5, #1
 8002d16:	40a5      	lsls	r5, r4
 8002d18:	ea05 0e06 	and.w	lr, r5, r6
 8002d1c:	45ae      	cmp	lr, r5
 8002d1e:	d12d      	bne.n	8002d7c <GPIO_Init+0x78>
 8002d20:	790f      	ldrb	r7, [r1, #4]
 8002d22:	1e7a      	subs	r2, r7, #1
 8002d24:	2a01      	cmp	r2, #1
 8002d26:	d817      	bhi.n	8002d58 <GPIO_Init+0x54>
 8002d28:	bf00      	nop
 8002d2a:	2203      	movs	r2, #3
 8002d2c:	6885      	ldr	r5, [r0, #8]
 8002d2e:	409a      	lsls	r2, r3
 8002d30:	ea25 0202 	bic.w	r2, r5, r2
 8002d34:	6082      	str	r2, [r0, #8]
 8002d36:	794d      	ldrb	r5, [r1, #5]
 8002d38:	6882      	ldr	r2, [r0, #8]
 8002d3a:	409d      	lsls	r5, r3
 8002d3c:	4315      	orrs	r5, r2
 8002d3e:	6085      	str	r5, [r0, #8]
 8002d40:	bf00      	nop
 8002d42:	8882      	ldrh	r2, [r0, #4]
 8002d44:	b292      	uxth	r2, r2
 8002d46:	ea22 020e 	bic.w	r2, r2, lr
 8002d4a:	8082      	strh	r2, [r0, #4]
 8002d4c:	798a      	ldrb	r2, [r1, #6]
 8002d4e:	8885      	ldrh	r5, [r0, #4]
 8002d50:	40a2      	lsls	r2, r4
 8002d52:	432a      	orrs	r2, r5
 8002d54:	b292      	uxth	r2, r2
 8002d56:	8082      	strh	r2, [r0, #4]
 8002d58:	2203      	movs	r2, #3
 8002d5a:	6805      	ldr	r5, [r0, #0]
 8002d5c:	409a      	lsls	r2, r3
 8002d5e:	43d2      	mvns	r2, r2
 8002d60:	4015      	ands	r5, r2
 8002d62:	6005      	str	r5, [r0, #0]
 8002d64:	6805      	ldr	r5, [r0, #0]
 8002d66:	409f      	lsls	r7, r3
 8002d68:	432f      	orrs	r7, r5
 8002d6a:	6007      	str	r7, [r0, #0]
 8002d6c:	68c7      	ldr	r7, [r0, #12]
 8002d6e:	4017      	ands	r7, r2
 8002d70:	79ca      	ldrb	r2, [r1, #7]
 8002d72:	fa02 f503 	lsl.w	r5, r2, r3
 8002d76:	ea47 0205 	orr.w	r2, r7, r5
 8002d7a:	60c2      	str	r2, [r0, #12]
 8002d7c:	3401      	adds	r4, #1
 8002d7e:	2c10      	cmp	r4, #16
 8002d80:	f103 0302 	add.w	r3, r3, #2
 8002d84:	d1c6      	bne.n	8002d14 <GPIO_Init+0x10>
 8002d86:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002d88 <GPIO_SetBits>:
 8002d88:	bf00      	nop
 8002d8a:	bf00      	nop
 8002d8c:	6181      	str	r1, [r0, #24]
 8002d8e:	4770      	bx	lr

08002d90 <GPIO_PinAFConfig>:
 8002d90:	b510      	push	{r4, lr}
 8002d92:	bf00      	nop
 8002d94:	bf00      	nop
 8002d96:	bf00      	nop
 8002d98:	f001 0307 	and.w	r3, r1, #7
 8002d9c:	08c9      	lsrs	r1, r1, #3
 8002d9e:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002da2:	009b      	lsls	r3, r3, #2
 8002da4:	6a04      	ldr	r4, [r0, #32]
 8002da6:	210f      	movs	r1, #15
 8002da8:	4099      	lsls	r1, r3
 8002daa:	ea24 0101 	bic.w	r1, r4, r1
 8002dae:	6201      	str	r1, [r0, #32]
 8002db0:	6a01      	ldr	r1, [r0, #32]
 8002db2:	409a      	lsls	r2, r3
 8002db4:	430a      	orrs	r2, r1
 8002db6:	6202      	str	r2, [r0, #32]
 8002db8:	bd10      	pop	{r4, pc}

08002dba <Default_Handler>:
 8002dba:	4668      	mov	r0, sp
 8002dbc:	f020 0107 	bic.w	r1, r0, #7
 8002dc0:	468d      	mov	sp, r1
 8002dc2:	b501      	push	{r0, lr}
 8002dc4:	bf00      	nop
 8002dc6:	e8bd 4001 	ldmia.w	sp!, {r0, lr}
 8002dca:	4685      	mov	sp, r0
 8002dcc:	4770      	bx	lr

08002dce <HardFault_Handler>:
 8002dce:	bf00      	nop
 8002dd0:	e7fd      	b.n	8002dce <HardFault_Handler>
	...

08002dd4 <_reset_init>:
 8002dd4:	490e      	ldr	r1, [pc, #56]	; (8002e10 <_reset_init+0x3c>)
 8002dd6:	4b0f      	ldr	r3, [pc, #60]	; (8002e14 <_reset_init+0x40>)
 8002dd8:	1a5b      	subs	r3, r3, r1
 8002dda:	109b      	asrs	r3, r3, #2
 8002ddc:	2200      	movs	r2, #0
 8002dde:	429a      	cmp	r2, r3
 8002de0:	d006      	beq.n	8002df0 <_reset_init+0x1c>
 8002de2:	480d      	ldr	r0, [pc, #52]	; (8002e18 <_reset_init+0x44>)
 8002de4:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
 8002de8:	f841 0022 	str.w	r0, [r1, r2, lsl #2]
 8002dec:	3201      	adds	r2, #1
 8002dee:	e7f6      	b.n	8002dde <_reset_init+0xa>
 8002df0:	4a0a      	ldr	r2, [pc, #40]	; (8002e1c <_reset_init+0x48>)
 8002df2:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8002df6:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8002dfa:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8002dfe:	f502 720c 	add.w	r2, r2, #560	; 0x230
 8002e02:	6853      	ldr	r3, [r2, #4]
 8002e04:	f023 4340 	bic.w	r3, r3, #3221225472	; 0xc0000000
 8002e08:	6053      	str	r3, [r2, #4]
 8002e0a:	f7ff bb65 	b.w	80024d8 <main>
 8002e0e:	bf00      	nop
 8002e10:	20000000 	.word	0x20000000
 8002e14:	20000034 	.word	0x20000034
 8002e18:	08003090 	.word	0x08003090
 8002e1c:	e000ed00 	.word	0xe000ed00

08002e20 <scheduler>:
 8002e20:	b570      	push	{r4, r5, r6, lr}
 8002e22:	2200      	movs	r2, #0
 8002e24:	4611      	mov	r1, r2
 8002e26:	4b15      	ldr	r3, [pc, #84]	; (8002e7c <scheduler+0x5c>)
 8002e28:	200c      	movs	r0, #12
 8002e2a:	fb00 f401 	mul.w	r4, r0, r1
 8002e2e:	191e      	adds	r6, r3, r4
 8002e30:	6875      	ldr	r5, [r6, #4]
 8002e32:	f015 0f02 	tst.w	r5, #2
 8002e36:	461d      	mov	r5, r3
 8002e38:	d10a      	bne.n	8002e50 <scheduler+0x30>
 8002e3a:	6876      	ldr	r6, [r6, #4]
 8002e3c:	07f6      	lsls	r6, r6, #31
 8002e3e:	d507      	bpl.n	8002e50 <scheduler+0x30>
 8002e40:	4350      	muls	r0, r2
 8002e42:	5b1c      	ldrh	r4, [r3, r4]
 8002e44:	5a18      	ldrh	r0, [r3, r0]
 8002e46:	b2a4      	uxth	r4, r4
 8002e48:	b280      	uxth	r0, r0
 8002e4a:	4284      	cmp	r4, r0
 8002e4c:	bf38      	it	cc
 8002e4e:	460a      	movcc	r2, r1
 8002e50:	200c      	movs	r0, #12
 8002e52:	4348      	muls	r0, r1
 8002e54:	5a1c      	ldrh	r4, [r3, r0]
 8002e56:	b2a4      	uxth	r4, r4
 8002e58:	b11c      	cbz	r4, 8002e62 <scheduler+0x42>
 8002e5a:	5a1c      	ldrh	r4, [r3, r0]
 8002e5c:	3c01      	subs	r4, #1
 8002e5e:	b2a4      	uxth	r4, r4
 8002e60:	521c      	strh	r4, [r3, r0]
 8002e62:	3101      	adds	r1, #1
 8002e64:	2906      	cmp	r1, #6
 8002e66:	d1de      	bne.n	8002e26 <scheduler+0x6>
 8002e68:	230c      	movs	r3, #12
 8002e6a:	4353      	muls	r3, r2
 8002e6c:	18e9      	adds	r1, r5, r3
 8002e6e:	8849      	ldrh	r1, [r1, #2]
 8002e70:	b289      	uxth	r1, r1
 8002e72:	52e9      	strh	r1, [r5, r3]
 8002e74:	4b02      	ldr	r3, [pc, #8]	; (8002e80 <scheduler+0x60>)
 8002e76:	601a      	str	r2, [r3, #0]
 8002e78:	bd70      	pop	{r4, r5, r6, pc}
 8002e7a:	bf00      	nop
 8002e7c:	20000480 	.word	0x20000480
 8002e80:	200004c8 	.word	0x200004c8

08002e84 <SysTick_Handler>:
 8002e84:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002e88:	f3ef 8308 	mrs	r3, MSP
 8002e8c:	4c0d      	ldr	r4, [pc, #52]	; (8002ec4 <SysTick_Handler+0x40>)
 8002e8e:	4d0e      	ldr	r5, [pc, #56]	; (8002ec8 <SysTick_Handler+0x44>)
 8002e90:	6822      	ldr	r2, [r4, #0]
 8002e92:	3201      	adds	r2, #1
 8002e94:	bf1d      	ittte	ne
 8002e96:	6822      	ldrne	r2, [r4, #0]
 8002e98:	210c      	movne	r1, #12
 8002e9a:	fb01 5202 	mlane	r2, r1, r2, r5
 8002e9e:	2300      	moveq	r3, #0
 8002ea0:	bf14      	ite	ne
 8002ea2:	6093      	strne	r3, [r2, #8]
 8002ea4:	6023      	streq	r3, [r4, #0]
 8002ea6:	f7ff ffbb 	bl	8002e20 <scheduler>
 8002eaa:	6822      	ldr	r2, [r4, #0]
 8002eac:	230c      	movs	r3, #12
 8002eae:	fb03 5302 	mla	r3, r3, r2, r5
 8002eb2:	689a      	ldr	r2, [r3, #8]
 8002eb4:	f06f 0306 	mvn.w	r3, #6
 8002eb8:	469e      	mov	lr, r3
 8002eba:	f382 8808 	msr	MSP, r2
 8002ebe:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002ec2:	4770      	bx	lr
 8002ec4:	200004c8 	.word	0x200004c8
 8002ec8:	20000480 	.word	0x20000480

08002ecc <__aeabi_d2f>:
 8002ecc:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8002ed0:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
 8002ed4:	bf24      	itt	cs
 8002ed6:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
 8002eda:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
 8002ede:	d90d      	bls.n	8002efc <__aeabi_d2f+0x30>
 8002ee0:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
 8002ee4:	ea4f 02c0 	mov.w	r2, r0, lsl #3
 8002ee8:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
 8002eec:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
 8002ef0:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
 8002ef4:	bf08      	it	eq
 8002ef6:	f020 0001 	biceq.w	r0, r0, #1
 8002efa:	4770      	bx	lr
 8002efc:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
 8002f00:	d121      	bne.n	8002f46 <__aeabi_d2f+0x7a>
 8002f02:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
 8002f06:	bfbc      	itt	lt
 8002f08:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
 8002f0c:	4770      	bxlt	lr
 8002f0e:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 8002f12:	ea4f 5252 	mov.w	r2, r2, lsr #21
 8002f16:	f1c2 0218 	rsb	r2, r2, #24
 8002f1a:	f1c2 0c20 	rsb	ip, r2, #32
 8002f1e:	fa10 f30c 	lsls.w	r3, r0, ip
 8002f22:	fa20 f002 	lsr.w	r0, r0, r2
 8002f26:	bf18      	it	ne
 8002f28:	f040 0001 	orrne.w	r0, r0, #1
 8002f2c:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 8002f30:	ea4f 23d3 	mov.w	r3, r3, lsr #11
 8002f34:	fa03 fc0c 	lsl.w	ip, r3, ip
 8002f38:	ea40 000c 	orr.w	r0, r0, ip
 8002f3c:	fa23 f302 	lsr.w	r3, r3, r2
 8002f40:	ea4f 0343 	mov.w	r3, r3, lsl #1
 8002f44:	e7cc      	b.n	8002ee0 <__aeabi_d2f+0x14>
 8002f46:	ea7f 5362 	mvns.w	r3, r2, asr #21
 8002f4a:	d107      	bne.n	8002f5c <__aeabi_d2f+0x90>
 8002f4c:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
 8002f50:	bf1e      	ittt	ne
 8002f52:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
 8002f56:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
 8002f5a:	4770      	bxne	lr
 8002f5c:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
 8002f60:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
 8002f64:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
 8002f68:	4770      	bx	lr
 8002f6a:	bf00      	nop

08002f6c <_init>:
 8002f6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002f6e:	bf00      	nop
 8002f70:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002f72:	bc08      	pop	{r3}
 8002f74:	469e      	mov	lr, r3
 8002f76:	4770      	bx	lr

08002f78 <_fini>:
 8002f78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002f7a:	bf00      	nop
 8002f7c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002f7e:	bc08      	pop	{r3}
 8002f80:	469e      	mov	lr, r3
 8002f82:	4770      	bx	lr
 8002f84:	61646f6b 	.word	0x61646f6b
 8002f88:	6920616d 	.word	0x6920616d
 8002f8c:	2074696e 	.word	0x2074696e
 8002f90:	25206925 	.word	0x25206925
 8002f94:	203a2069 	.word	0x203a2069
 8002f98:	4f5b2000 	.word	0x4f5b2000
 8002f9c:	000a5d4b 	.word	0x000a5d4b
 8002fa0:	41465b20 	.word	0x41465b20
 8002fa4:	44454c49 	.word	0x44454c49
 8002fa8:	000a0a5d 	.word	0x000a0a5d
 8002fac:	432b5441 	.word	0x432b5441
 8002fb0:	554d5049 	.word	0x554d5049
 8002fb4:	0d313d58 	.word	0x0d313d58
 8002fb8:	5441000a 	.word	0x5441000a
 8002fbc:	5049432b 	.word	0x5049432b
 8002fc0:	3d58554d 	.word	0x3d58554d
 8002fc4:	000a0d30 	.word	0x000a0d30
 8002fc8:	432b5441 	.word	0x432b5441
 8002fcc:	444f4d57 	.word	0x444f4d57
 8002fd0:	0d313d45 	.word	0x0d313d45
 8002fd4:	5441000a 	.word	0x5441000a
 8002fd8:	4a57432b 	.word	0x4a57432b
 8002fdc:	223d5041 	.word	0x223d5041
 8002fe0:	54454e00 	.word	0x54454e00
 8002fe4:	52414547 	.word	0x52414547
 8002fe8:	6d003338 	.word	0x6d003338
 8002fec:	646f6c65 	.word	0x646f6c65
 8002ff0:	69686369 	.word	0x69686369
 8002ff4:	34356c6c 	.word	0x34356c6c
 8002ff8:	0d220036 	.word	0x0d220036
 8002ffc:	5441000a 	.word	0x5441000a
 8003000:	5049432b 	.word	0x5049432b
 8003004:	56524553 	.word	0x56524553
 8003008:	313d5245 	.word	0x313d5245
 800300c:	0d30382c 	.word	0x0d30382c
 8003010:	5441000a 	.word	0x5441000a
 8003014:	5049432b 	.word	0x5049432b
 8003018:	534f4c43 	.word	0x534f4c43
 800301c:	000a0d45 	.word	0x000a0d45
 8003020:	432b5441 	.word	0x432b5441
 8003024:	54535049 	.word	0x54535049
 8003028:	3d545241 	.word	0x3d545241
 800302c:	50435422 	.word	0x50435422
 8003030:	00222c22 	.word	0x00222c22
 8003034:	43002c22 	.word	0x43002c22
 8003038:	454e4e4f 	.word	0x454e4e4f
 800303c:	41005443 	.word	0x41005443
 8003040:	49432b54 	.word	0x49432b54
 8003044:	4e455350 	.word	0x4e455350
 8003048:	3e003d44 	.word	0x3e003d44
 800304c:	4e455300 	.word	0x4e455300
 8003050:	4b4f2044 	.word	0x4b4f2044
 8003054:	50492b00 	.word	0x50492b00
 8003058:	31002c44 	.word	0x31002c44
 800305c:	2e302e30 	.word	0x2e302e30
 8003060:	00322e30 	.word	0x00322e30
 8003064:	74737973 	.word	0x74737973
 8003068:	74206d65 	.word	0x74206d65
 800306c:	20656d69 	.word	0x20656d69
 8003070:	5b207525 	.word	0x5b207525
 8003074:	0a5d736d 	.word	0x0a5d736d
 8003078:	20692500 	.word	0x20692500
 800307c:	0a206925 	.word	0x0a206925
 8003080:	00          	.byte	0x00
 8003081:	69          	.byte	0x69
 8003082:	6c64      	.short	0x6c64
 8003084:	75252065 	.word	0x75252065
 8003088:	0000000a 	.word	0x0000000a

0800308c <__EH_FRAME_BEGIN__>:
 800308c:	00000000                                ....
