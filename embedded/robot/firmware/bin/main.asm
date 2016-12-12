
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <_ZN7CKodama5init_Ev>:
 8000188:	b510      	push	{r4, lr}
 800018a:	4604      	mov	r4, r0
 800018c:	f001 fab2 	bl	80016f4 <_ZN5CGPIO9gpio_initEv>
 8000190:	2800      	cmp	r0, #0
 8000192:	da03      	bge.n	800019c <_ZN7CKodama5init_Ev+0x14>
 8000194:	f5a0 501c 	sub.w	r0, r0, #9984	; 0x2700
 8000198:	3810      	subs	r0, #16
 800019a:	bd10      	pop	{r4, pc}
 800019c:	4620      	mov	r0, r4
 800019e:	f001 fb45 	bl	800182c <_ZN9CTerminal13terminal_initEv>
 80001a2:	2800      	cmp	r0, #0
 80001a4:	da03      	bge.n	80001ae <_ZN7CKodama5init_Ev+0x26>
 80001a6:	f5a0 409c 	sub.w	r0, r0, #19968	; 0x4e00
 80001aa:	3820      	subs	r0, #32
 80001ac:	bd10      	pop	{r4, pc}
 80001ae:	480e      	ldr	r0, [pc, #56]	; (80001e8 <_ZN7CKodama5init_Ev+0x60>)
 80001b0:	f000 fc06 	bl	80009c0 <_ZN6CTimer10timer_initEv>
 80001b4:	2800      	cmp	r0, #0
 80001b6:	da03      	bge.n	80001c0 <_ZN7CKodama5init_Ev+0x38>
 80001b8:	f5a0 40ea 	sub.w	r0, r0, #29952	; 0x7500
 80001bc:	3830      	subs	r0, #48	; 0x30
 80001be:	bd10      	pop	{r4, pc}
 80001c0:	4620      	mov	r0, r4
 80001c2:	f000 fed3 	bl	8000f6c <_ZN8CSensors12sensors_initEv>
 80001c6:	2800      	cmp	r0, #0
 80001c8:	da03      	bge.n	80001d2 <_ZN7CKodama5init_Ev+0x4a>
 80001ca:	f5a0 401c 	sub.w	r0, r0, #39936	; 0x9c00
 80001ce:	3840      	subs	r0, #64	; 0x40
 80001d0:	bd10      	pop	{r4, pc}
 80001d2:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
 80001d6:	f000 feb9 	bl	8000f4c <_ZN6CMotor10motor_initEv>
 80001da:	2800      	cmp	r0, #0
 80001dc:	bfbc      	itt	lt
 80001de:	f5a0 4043 	sublt.w	r0, r0, #49920	; 0xc300
 80001e2:	3850      	sublt	r0, #80	; 0x50
 80001e4:	bd10      	pop	{r4, pc}
 80001e6:	bf00      	nop
 80001e8:	2000013c 	.word	0x2000013c

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
 8000202:	f001 fc53 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8000206:	4628      	mov	r0, r5
 8000208:	b91e      	cbnz	r6, 8000212 <_ZN7CKodama4initEv+0x26>
 800020a:	4907      	ldr	r1, [pc, #28]	; (8000228 <_ZN7CKodama4initEv+0x3c>)
 800020c:	f001 fc4e 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8000210:	e005      	b.n	800021e <_ZN7CKodama4initEv+0x32>
 8000212:	4906      	ldr	r1, [pc, #24]	; (800022c <_ZN7CKodama4initEv+0x40>)
 8000214:	3401      	adds	r4, #1
 8000216:	f001 fc49 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 800021a:	2c08      	cmp	r4, #8
 800021c:	d1e9      	bne.n	80001f2 <_ZN7CKodama4initEv+0x6>
 800021e:	4630      	mov	r0, r6
 8000220:	bd70      	pop	{r4, r5, r6, pc}
 8000222:	bf00      	nop
 8000224:	08002ce0 	.word	0x08002ce0
 8000228:	08002cf5 	.word	0x08002cf5
 800022c:	08002cfc 	.word	0x08002cfc

08000230 <_ZN7CKodama5sleepEv>:
 8000230:	b510      	push	{r4, lr}
 8000232:	2108      	movs	r1, #8
 8000234:	4604      	mov	r4, r0
 8000236:	f001 fabd 	bl	80017b4 <_ZN5CGPIO8gpio_offEm>
 800023a:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
 800023e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000242:	f000 bde7 	b.w	8000e14 <_ZN6CMotor11motor_sleepEv>

08000246 <_ZN7CKodama6wakeupEv>:
 8000246:	b510      	push	{r4, lr}
 8000248:	2108      	movs	r1, #8
 800024a:	4604      	mov	r4, r0
 800024c:	34c4      	adds	r4, #196	; 0xc4
 800024e:	f001 faa3 	bl	8001798 <_ZN5CGPIO7gpio_onEm>
 8000252:	2100      	movs	r1, #0
 8000254:	4620      	mov	r0, r4
 8000256:	460a      	mov	r2, r1
 8000258:	f000 fe72 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 800025c:	4620      	mov	r0, r4
 800025e:	2101      	movs	r1, #1
 8000260:	2200      	movs	r2, #0
 8000262:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000266:	f000 be6b 	b.w	8000f40 <_ZN6CMotor9set_motorEml>

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
 8000282:	f001 f911 	bl	80014a8 <_ZN4CIMU8imu_readEv>
 8000286:	4638      	mov	r0, r7
 8000288:	f001 fa32 	bl	80016f0 <_ZN4CIMU14get_imu_resultEv>
 800028c:	6883      	ldr	r3, [r0, #8]
 800028e:	2500      	movs	r5, #0
 8000290:	4498      	add	r8, r3
 8000292:	4821      	ldr	r0, [pc, #132]	; (8000318 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 8000294:	210a      	movs	r1, #10
 8000296:	f000 fbeb 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 800029a:	f109 06c4 	add.w	r6, r9, #196	; 0xc4
 800029e:	f1ba 0f00 	cmp.w	sl, #0
 80002a2:	d111      	bne.n	80002c8 <_ZN7CKodama12rotate_robotEllPFlvE+0x58>
 80002a4:	4638      	mov	r0, r7
 80002a6:	f001 f8ff 	bl	80014a8 <_ZN4CIMU8imu_readEv>
 80002aa:	4638      	mov	r0, r7
 80002ac:	f001 fa20 	bl	80016f0 <_ZN4CIMU14get_imu_resultEv>
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
 80002d4:	f000 fe34 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 80002d8:	4630      	mov	r0, r6
 80002da:	2101      	movs	r1, #1
 80002dc:	2200      	movs	r2, #0
 80002de:	f000 fe2f 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 80002e2:	480d      	ldr	r0, [pc, #52]	; (8000318 <_ZN7CKodama12rotate_robotEllPFlvE+0xa8>)
 80002e4:	2114      	movs	r1, #20
 80002e6:	b003      	add	sp, #12
 80002e8:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80002ec:	f000 bbc0 	b.w	8000a70 <_ZN6CTimer8delay_msEm>
 80002f0:	fb03 f205 	mul.w	r2, r3, r5
 80002f4:	4630      	mov	r0, r6
 80002f6:	2100      	movs	r1, #0
 80002f8:	9301      	str	r3, [sp, #4]
 80002fa:	f000 fe21 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 80002fe:	9b01      	ldr	r3, [sp, #4]
 8000300:	426a      	negs	r2, r5
 8000302:	4630      	mov	r0, r6
 8000304:	2101      	movs	r1, #1
 8000306:	435a      	muls	r2, r3
 8000308:	f000 fe1a 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 800030c:	2c00      	cmp	r4, #0
 800030e:	bfb8      	it	lt
 8000310:	4264      	neglt	r4, r4
 8000312:	2c31      	cmp	r4, #49	; 0x31
 8000314:	dcbd      	bgt.n	8000292 <_ZN7CKodama12rotate_robotEllPFlvE+0x22>
 8000316:	e7da      	b.n	80002ce <_ZN7CKodama12rotate_robotEllPFlvE+0x5e>
 8000318:	2000013c 	.word	0x2000013c

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
 800032c:	f001 fafe 	bl	800192c <_ZN9CTerminal7putcharEc>
 8000330:	e7f8      	b.n	8000324 <_ZN5CWifi12esp8266_sendEPc+0x4>
 8000332:	bd10      	pop	{r4, pc}
 8000334:	20000030 	.word	0x20000030

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
 8000372:	f000 fb6f 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 8000376:	4405      	add	r5, r0
 8000378:	4812      	ldr	r0, [pc, #72]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 800037a:	f001 fa45 	bl	8001808 <_ZN9CTerminal12clear_bufferEv>
 800037e:	2400      	movs	r4, #0
 8000380:	4810      	ldr	r0, [pc, #64]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 8000382:	f001 fadf 	bl	8001944 <_ZN9CTerminal6ischarEv>
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
 80003a0:	f001 fa32 	bl	8001808 <_ZN9CTerminal12clear_bufferEv>
 80003a4:	2001      	movs	r0, #1
 80003a6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80003a8:	2400      	movs	r4, #0
 80003aa:	4805      	ldr	r0, [pc, #20]	; (80003c0 <_ZN5CWifi19esp8266_find_streamEPcjj+0x58>)
 80003ac:	f000 fb52 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 80003b0:	42a8      	cmp	r0, r5
 80003b2:	d3e5      	bcc.n	8000380 <_ZN5CWifi19esp8266_find_streamEPcjj+0x18>
 80003b4:	4803      	ldr	r0, [pc, #12]	; (80003c4 <_ZN5CWifi19esp8266_find_streamEPcjj+0x5c>)
 80003b6:	f001 fa27 	bl	8001808 <_ZN9CTerminal12clear_bufferEv>
 80003ba:	2000      	movs	r0, #0
 80003bc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80003be:	bf00      	nop
 80003c0:	2000013c 	.word	0x2000013c
 80003c4:	20000030 	.word	0x20000030

080003c8 <_ZN5CWifi12esp8266_initEv>:
 80003c8:	b510      	push	{r4, lr}
 80003ca:	2300      	movs	r3, #0
 80003cc:	4604      	mov	r4, r0
 80003ce:	f640 31b8 	movw	r1, #3000	; 0xbb8
 80003d2:	6003      	str	r3, [r0, #0]
 80003d4:	4822      	ldr	r0, [pc, #136]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003d6:	f000 fb4b 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80003da:	7923      	ldrb	r3, [r4, #4]
 80003dc:	2b01      	cmp	r3, #1
 80003de:	bf0c      	ite	eq
 80003e0:	4920      	ldreq	r1, [pc, #128]	; (8000464 <_ZN5CWifi12esp8266_initEv+0x9c>)
 80003e2:	4921      	ldrne	r1, [pc, #132]	; (8000468 <_ZN5CWifi12esp8266_initEv+0xa0>)
 80003e4:	4620      	mov	r0, r4
 80003e6:	f7ff ff9b 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80003ea:	481d      	ldr	r0, [pc, #116]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003ec:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 80003f0:	f000 fb3e 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80003f4:	4620      	mov	r0, r4
 80003f6:	491d      	ldr	r1, [pc, #116]	; (800046c <_ZN5CWifi12esp8266_initEv+0xa4>)
 80003f8:	f7ff ff92 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80003fc:	4818      	ldr	r0, [pc, #96]	; (8000460 <_ZN5CWifi12esp8266_initEv+0x98>)
 80003fe:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 8000402:	f000 fb35 	bl	8000a70 <_ZN6CTimer8delay_msEm>
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
 8000450:	f000 fb0e 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8000454:	e002      	b.n	800045c <_ZN5CWifi12esp8266_initEv+0x94>
 8000456:	f06f 0001 	mvn.w	r0, #1
 800045a:	bd10      	pop	{r4, pc}
 800045c:	2000      	movs	r0, #0
 800045e:	bd10      	pop	{r4, pc}
 8000460:	2000013c 	.word	0x2000013c
 8000464:	08002d08 	.word	0x08002d08
 8000468:	08002d16 	.word	0x08002d16
 800046c:	08002d24 	.word	0x08002d24
 8000470:	08002d32 	.word	0x08002d32
 8000474:	08002d3d 	.word	0x08002d3d
 8000478:	08002d8c 	.word	0x08002d8c
 800047c:	08002d47 	.word	0x08002d47
 8000480:	08002d56 	.word	0x08002d56
 8000484:	08002dae 	.word	0x08002dae
 8000488:	08002d5a 	.word	0x08002d5a

0800048c <_ZN5CWifi4initEh>:
 800048c:	7101      	strb	r1, [r0, #4]
 800048e:	f7ff bf9b 	b.w	80003c8 <_ZN5CWifi12esp8266_initEv>
	...

08000494 <_ZN5CWifi23esp8266_get_nonblockingEPcjj>:
 8000494:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000496:	4617      	mov	r7, r2
 8000498:	461d      	mov	r5, r3
 800049a:	460e      	mov	r6, r1
 800049c:	460b      	mov	r3, r1
 800049e:	188a      	adds	r2, r1, r2
 80004a0:	4293      	cmp	r3, r2
 80004a2:	d003      	beq.n	80004ac <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x18>
 80004a4:	2100      	movs	r1, #0
 80004a6:	f803 1b01 	strb.w	r1, [r3], #1
 80004aa:	e7f9      	b.n	80004a0 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0xc>
 80004ac:	4810      	ldr	r0, [pc, #64]	; (80004f0 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x5c>)
 80004ae:	f000 fad1 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 80004b2:	2400      	movs	r4, #0
 80004b4:	4405      	add	r5, r0
 80004b6:	480f      	ldr	r0, [pc, #60]	; (80004f4 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x60>)
 80004b8:	f001 fa44 	bl	8001944 <_ZN9CTerminal6ischarEv>
 80004bc:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80004c0:	4298      	cmp	r0, r3
 80004c2:	bf1c      	itt	ne
 80004c4:	5530      	strbne	r0, [r6, r4]
 80004c6:	3401      	addne	r4, #1
 80004c8:	4809      	ldr	r0, [pc, #36]	; (80004f0 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x5c>)
 80004ca:	f000 fac3 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 80004ce:	42bc      	cmp	r4, r7
 80004d0:	d207      	bcs.n	80004e2 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x4e>
 80004d2:	4285      	cmp	r5, r0
 80004d4:	d8ef      	bhi.n	80004b6 <_ZN5CWifi23esp8266_get_nonblockingEPcjj+0x22>
 80004d6:	42a8      	cmp	r0, r5
 80004d8:	bf94      	ite	ls
 80004da:	4620      	movls	r0, r4
 80004dc:	f04f 30ff 	movhi.w	r0, #4294967295	; 0xffffffff
 80004e0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80004e2:	42a8      	cmp	r0, r5
 80004e4:	bf94      	ite	ls
 80004e6:	f06f 0001 	mvnls.w	r0, #1
 80004ea:	f04f 30ff 	movhi.w	r0, #4294967295	; 0xffffffff
 80004ee:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80004f0:	2000013c 	.word	0x2000013c
 80004f4:	20000030 	.word	0x20000030

080004f8 <_ZN5CWifi7connectEPcjS0_jS0_j>:
 80004f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80004fc:	461d      	mov	r5, r3
 80004fe:	6803      	ldr	r3, [r0, #0]
 8000500:	9e06      	ldr	r6, [sp, #24]
 8000502:	2b01      	cmp	r3, #1
 8000504:	4604      	mov	r4, r0
 8000506:	4688      	mov	r8, r1
 8000508:	4617      	mov	r7, r2
 800050a:	d029      	beq.n	8000560 <_ZN5CWifi7connectEPcjS0_jS0_j+0x68>
 800050c:	494b      	ldr	r1, [pc, #300]	; (800063c <_ZN5CWifi7connectEPcjS0_jS0_j+0x144>)
 800050e:	f7ff ff07 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000512:	484b      	ldr	r0, [pc, #300]	; (8000640 <_ZN5CWifi7connectEPcjS0_jS0_j+0x148>)
 8000514:	2164      	movs	r1, #100	; 0x64
 8000516:	f000 faab 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 800051a:	4620      	mov	r0, r4
 800051c:	4949      	ldr	r1, [pc, #292]	; (8000644 <_ZN5CWifi7connectEPcjS0_jS0_j+0x14c>)
 800051e:	f7ff feff 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000522:	4620      	mov	r0, r4
 8000524:	4641      	mov	r1, r8
 8000526:	f7ff fefb 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 800052a:	4620      	mov	r0, r4
 800052c:	4946      	ldr	r1, [pc, #280]	; (8000648 <_ZN5CWifi7connectEPcjS0_jS0_j+0x150>)
 800052e:	f7ff fef7 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000532:	4620      	mov	r0, r4
 8000534:	4639      	mov	r1, r7
 8000536:	f7ff feff 	bl	8000338 <_ZN5CWifi17esp8266_send_uintEj>
 800053a:	4620      	mov	r0, r4
 800053c:	4943      	ldr	r1, [pc, #268]	; (800064c <_ZN5CWifi7connectEPcjS0_jS0_j+0x154>)
 800053e:	f7ff feef 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000542:	4620      	mov	r0, r4
 8000544:	4942      	ldr	r1, [pc, #264]	; (8000650 <_ZN5CWifi7connectEPcjS0_jS0_j+0x158>)
 8000546:	2207      	movs	r2, #7
 8000548:	f44f 7361 	mov.w	r3, #900	; 0x384
 800054c:	f7ff ff0c 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 8000550:	b920      	cbnz	r0, 800055c <_ZN5CWifi7connectEPcjS0_jS0_j+0x64>
 8000552:	6020      	str	r0, [r4, #0]
 8000554:	f06f 0002 	mvn.w	r0, #2
 8000558:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800055c:	2301      	movs	r3, #1
 800055e:	6023      	str	r3, [r4, #0]
 8000560:	4620      	mov	r0, r4
 8000562:	493c      	ldr	r1, [pc, #240]	; (8000654 <_ZN5CWifi7connectEPcjS0_jS0_j+0x15c>)
 8000564:	f7ff fedc 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000568:	4620      	mov	r0, r4
 800056a:	4631      	mov	r1, r6
 800056c:	f7ff fee4 	bl	8000338 <_ZN5CWifi17esp8266_send_uintEj>
 8000570:	4620      	mov	r0, r4
 8000572:	4936      	ldr	r1, [pc, #216]	; (800064c <_ZN5CWifi7connectEPcjS0_jS0_j+0x154>)
 8000574:	f7ff fed4 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000578:	4620      	mov	r0, r4
 800057a:	4937      	ldr	r1, [pc, #220]	; (8000658 <_ZN5CWifi7connectEPcjS0_jS0_j+0x160>)
 800057c:	2201      	movs	r2, #1
 800057e:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8000582:	f7ff fef1 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 8000586:	4607      	mov	r7, r0
 8000588:	b108      	cbz	r0, 800058e <_ZN5CWifi7connectEPcjS0_jS0_j+0x96>
 800058a:	442e      	add	r6, r5
 800058c:	e00c      	b.n	80005a8 <_ZN5CWifi7connectEPcjS0_jS0_j+0xb0>
 800058e:	4620      	mov	r0, r4
 8000590:	492a      	ldr	r1, [pc, #168]	; (800063c <_ZN5CWifi7connectEPcjS0_jS0_j+0x144>)
 8000592:	f7ff fec5 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 8000596:	482a      	ldr	r0, [pc, #168]	; (8000640 <_ZN5CWifi7connectEPcjS0_jS0_j+0x148>)
 8000598:	2164      	movs	r1, #100	; 0x64
 800059a:	f000 fa69 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 800059e:	6027      	str	r7, [r4, #0]
 80005a0:	f06f 0003 	mvn.w	r0, #3
 80005a4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80005a8:	42b5      	cmp	r5, r6
 80005aa:	d005      	beq.n	80005b8 <_ZN5CWifi7connectEPcjS0_jS0_j+0xc0>
 80005ac:	482b      	ldr	r0, [pc, #172]	; (800065c <_ZN5CWifi7connectEPcjS0_jS0_j+0x164>)
 80005ae:	f815 1b01 	ldrb.w	r1, [r5], #1
 80005b2:	f001 f9bb 	bl	800192c <_ZN9CTerminal7putcharEc>
 80005b6:	e7f7      	b.n	80005a8 <_ZN5CWifi7connectEPcjS0_jS0_j+0xb0>
 80005b8:	4620      	mov	r0, r4
 80005ba:	4929      	ldr	r1, [pc, #164]	; (8000660 <_ZN5CWifi7connectEPcjS0_jS0_j+0x168>)
 80005bc:	2207      	movs	r2, #7
 80005be:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 80005c2:	f7ff fed1 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 80005c6:	4605      	mov	r5, r0
 80005c8:	4620      	mov	r0, r4
 80005ca:	b95d      	cbnz	r5, 80005e4 <_ZN5CWifi7connectEPcjS0_jS0_j+0xec>
 80005cc:	491b      	ldr	r1, [pc, #108]	; (800063c <_ZN5CWifi7connectEPcjS0_jS0_j+0x144>)
 80005ce:	f7ff fea7 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80005d2:	481b      	ldr	r0, [pc, #108]	; (8000640 <_ZN5CWifi7connectEPcjS0_jS0_j+0x148>)
 80005d4:	2164      	movs	r1, #100	; 0x64
 80005d6:	f000 fa4b 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80005da:	6025      	str	r5, [r4, #0]
 80005dc:	f06f 0004 	mvn.w	r0, #4
 80005e0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80005e4:	491f      	ldr	r1, [pc, #124]	; (8000664 <_ZN5CWifi7connectEPcjS0_jS0_j+0x16c>)
 80005e6:	2205      	movs	r2, #5
 80005e8:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 80005ec:	f7ff febc 	bl	8000368 <_ZN5CWifi19esp8266_find_streamEPcjj>
 80005f0:	4605      	mov	r5, r0
 80005f2:	b960      	cbnz	r0, 800060e <_ZN5CWifi7connectEPcjS0_jS0_j+0x116>
 80005f4:	4620      	mov	r0, r4
 80005f6:	4911      	ldr	r1, [pc, #68]	; (800063c <_ZN5CWifi7connectEPcjS0_jS0_j+0x144>)
 80005f8:	f7ff fe92 	bl	8000320 <_ZN5CWifi12esp8266_sendEPc>
 80005fc:	4810      	ldr	r0, [pc, #64]	; (8000640 <_ZN5CWifi7connectEPcjS0_jS0_j+0x148>)
 80005fe:	2164      	movs	r1, #100	; 0x64
 8000600:	f000 fa36 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8000604:	6025      	str	r5, [r4, #0]
 8000606:	f06f 0005 	mvn.w	r0, #5
 800060a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800060e:	2500      	movs	r5, #0
 8000610:	4812      	ldr	r0, [pc, #72]	; (800065c <_ZN5CWifi7connectEPcjS0_jS0_j+0x164>)
 8000612:	f001 f9b3 	bl	800197c <_ZN9CTerminal7getcharEv>
 8000616:	b2c0      	uxtb	r0, r0
 8000618:	283a      	cmp	r0, #58	; 0x3a
 800061a:	d005      	beq.n	8000628 <_ZN5CWifi7connectEPcjS0_jS0_j+0x130>
 800061c:	230a      	movs	r3, #10
 800061e:	fb03 0005 	mla	r0, r3, r5, r0
 8000622:	f1a0 0530 	sub.w	r5, r0, #48	; 0x30
 8000626:	e7f3      	b.n	8000610 <_ZN5CWifi7connectEPcjS0_jS0_j+0x118>
 8000628:	4620      	mov	r0, r4
 800062a:	9907      	ldr	r1, [sp, #28]
 800062c:	9a08      	ldr	r2, [sp, #32]
 800062e:	2314      	movs	r3, #20
 8000630:	f7ff ff30 	bl	8000494 <_ZN5CWifi23esp8266_get_nonblockingEPcjj>
 8000634:	4628      	mov	r0, r5
 8000636:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800063a:	bf00      	nop
 800063c:	08002d6e 	.word	0x08002d6e
 8000640:	2000013c 	.word	0x2000013c
 8000644:	08002d7c 	.word	0x08002d7c
 8000648:	08002d90 	.word	0x08002d90
 800064c:	08002d57 	.word	0x08002d57
 8000650:	08002d93 	.word	0x08002d93
 8000654:	08002d9b 	.word	0x08002d9b
 8000658:	08002da7 	.word	0x08002da7
 800065c:	20000030 	.word	0x20000030
 8000660:	08002da9 	.word	0x08002da9
 8000664:	08002db1 	.word	0x08002db1

08000668 <_ZN5CWifi11client_demoEv>:
 8000668:	b570      	push	{r4, r5, r6, lr}
 800066a:	4606      	mov	r6, r0
 800066c:	b08a      	sub	sp, #40	; 0x28
 800066e:	2400      	movs	r4, #0
 8000670:	ad04      	add	r5, sp, #16
 8000672:	2300      	movs	r3, #0
 8000674:	5563      	strb	r3, [r4, r5]
 8000676:	3401      	adds	r4, #1
 8000678:	2c0a      	cmp	r4, #10
 800067a:	d1f9      	bne.n	8000670 <_ZN5CWifi11client_demoEv+0x8>
 800067c:	2348      	movs	r3, #72	; 0x48
 800067e:	f88d 3010 	strb.w	r3, [sp, #16]
 8000682:	2365      	movs	r3, #101	; 0x65
 8000684:	f88d 3011 	strb.w	r3, [sp, #17]
 8000688:	236c      	movs	r3, #108	; 0x6c
 800068a:	f88d 3012 	strb.w	r3, [sp, #18]
 800068e:	f88d 3013 	strb.w	r3, [sp, #19]
 8000692:	234f      	movs	r3, #79	; 0x4f
 8000694:	f88d 3014 	strb.w	r3, [sp, #20]
 8000698:	2331      	movs	r3, #49	; 0x31
 800069a:	f88d 3015 	strb.w	r3, [sp, #21]
 800069e:	2332      	movs	r3, #50	; 0x32
 80006a0:	f88d 3016 	strb.w	r3, [sp, #22]
 80006a4:	2333      	movs	r3, #51	; 0x33
 80006a6:	f88d 3017 	strb.w	r3, [sp, #23]
 80006aa:	480e      	ldr	r0, [pc, #56]	; (80006e4 <_ZN5CWifi11client_demoEv+0x7c>)
 80006ac:	2334      	movs	r3, #52	; 0x34
 80006ae:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80006b2:	f88d 3018 	strb.w	r3, [sp, #24]
 80006b6:	f001 f86f 	bl	8001798 <_ZN5CGPIO7gpio_onEm>
 80006ba:	ab07      	add	r3, sp, #28
 80006bc:	9301      	str	r3, [sp, #4]
 80006be:	f240 72da 	movw	r2, #2010	; 0x7da
 80006c2:	462b      	mov	r3, r5
 80006c4:	9400      	str	r4, [sp, #0]
 80006c6:	9402      	str	r4, [sp, #8]
 80006c8:	4630      	mov	r0, r6
 80006ca:	4907      	ldr	r1, [pc, #28]	; (80006e8 <_ZN5CWifi11client_demoEv+0x80>)
 80006cc:	f7ff ff14 	bl	80004f8 <_ZN5CWifi7connectEPcjS0_jS0_j>
 80006d0:	4804      	ldr	r0, [pc, #16]	; (80006e4 <_ZN5CWifi11client_demoEv+0x7c>)
 80006d2:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80006d6:	f001 f86d 	bl	80017b4 <_ZN5CGPIO8gpio_offEm>
 80006da:	4804      	ldr	r0, [pc, #16]	; (80006ec <_ZN5CWifi11client_demoEv+0x84>)
 80006dc:	2164      	movs	r1, #100	; 0x64
 80006de:	f000 f9c7 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80006e2:	e7c4      	b.n	800066e <_ZN5CWifi11client_demoEv+0x6>
 80006e4:	20000030 	.word	0x20000030
 80006e8:	08002db7 	.word	0x08002db7
 80006ec:	2000013c 	.word	0x2000013c

080006f0 <_ZN13CLinePositionC1Ev>:
 80006f0:	2200      	movs	r2, #0
 80006f2:	6082      	str	r2, [r0, #8]
 80006f4:	60c2      	str	r2, [r0, #12]
 80006f6:	6102      	str	r2, [r0, #16]
 80006f8:	6142      	str	r2, [r0, #20]
 80006fa:	6042      	str	r2, [r0, #4]
 80006fc:	2200      	movs	r2, #0
 80006fe:	7002      	strb	r2, [r0, #0]
 8000700:	4770      	bx	lr
	...

08000704 <_ZN13CLinePosition7processEP10sRGBResult>:
 8000704:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000708:	2300      	movs	r3, #0
 800070a:	f101 0816 	add.w	r8, r1, #22
 800070e:	ed2d 8b02 	vpush	{d8}
 8000712:	460d      	mov	r5, r1
 8000714:	4604      	mov	r4, r0
 8000716:	7003      	strb	r3, [r0, #0]
 8000718:	4641      	mov	r1, r8
 800071a:	461a      	mov	r2, r3
 800071c:	f103 000c 	add.w	r0, r3, #12
 8000720:	f931 6f02 	ldrsh.w	r6, [r1, #2]!
 8000724:	f935 0010 	ldrsh.w	r0, [r5, r0, lsl #1]
 8000728:	4286      	cmp	r6, r0
 800072a:	bfb8      	it	lt
 800072c:	4613      	movlt	r3, r2
 800072e:	3201      	adds	r2, #1
 8000730:	2a04      	cmp	r2, #4
 8000732:	d1f3      	bne.n	800071c <_ZN13CLinePosition7processEP10sRGBResult+0x18>
 8000734:	330c      	adds	r3, #12
 8000736:	eddf 7a3b 	vldr	s15, [pc, #236]	; 8000824 <_ZN13CLinePosition7processEP10sRGBResult+0x120>
 800073a:	f935 3013 	ldrsh.w	r3, [r5, r3, lsl #1]
 800073e:	ee07 3a10 	vmov	s14, r3
 8000742:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 8000746:	eeb0 8a67 	vmov.f32	s16, s15
 800074a:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800074e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000752:	d563      	bpl.n	800081c <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 8000754:	f104 0608 	add.w	r6, r4, #8
 8000758:	eddf 8a33 	vldr	s17, [pc, #204]	; 8000828 <_ZN13CLinePosition7processEP10sRGBResult+0x124>
 800075c:	f104 0918 	add.w	r9, r4, #24
 8000760:	4637      	mov	r7, r6
 8000762:	f938 3f02 	ldrsh.w	r3, [r8, #2]!
 8000766:	4831      	ldr	r0, [pc, #196]	; (800082c <_ZN13CLinePosition7processEP10sRGBResult+0x128>)
 8000768:	425b      	negs	r3, r3
 800076a:	ee00 3a10 	vmov	s0, r3
 800076e:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
 8000772:	eca7 0a01 	vstmia	r7!, {s0}
 8000776:	f000 f8b1 	bl	80008dc <_ZN5CMath3absEf>
 800077a:	eef4 8ac0 	vcmpe.f32	s17, s0
 800077e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000782:	d506      	bpl.n	8000792 <_ZN13CLinePosition7processEP10sRGBResult+0x8e>
 8000784:	4829      	ldr	r0, [pc, #164]	; (800082c <_ZN13CLinePosition7processEP10sRGBResult+0x128>)
 8000786:	ed17 0a01 	vldr	s0, [r7, #-4]
 800078a:	f000 f8a7 	bl	80008dc <_ZN5CMath3absEf>
 800078e:	eef0 8a40 	vmov.f32	s17, s0
 8000792:	454f      	cmp	r7, r9
 8000794:	d1e5      	bne.n	8000762 <_ZN13CLinePosition7processEP10sRGBResult+0x5e>
 8000796:	edd6 7a00 	vldr	s15, [r6]
 800079a:	eec7 7aa8 	vdiv.f32	s15, s15, s17
 800079e:	ece6 7a01 	vstmia	r6!, {s15}
 80007a2:	454e      	cmp	r6, r9
 80007a4:	d1f7      	bne.n	8000796 <_ZN13CLinePosition7processEP10sRGBResult+0x92>
 80007a6:	2301      	movs	r3, #1
 80007a8:	7023      	strb	r3, [r4, #0]
 80007aa:	f9b5 3018 	ldrsh.w	r3, [r5, #24]
 80007ae:	eddf 7a1d 	vldr	s15, [pc, #116]	; 8000824 <_ZN13CLinePosition7processEP10sRGBResult+0x120>
 80007b2:	ee07 3a10 	vmov	s14, r3
 80007b6:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80007ba:	eeb4 7ac8 	vcmpe.f32	s14, s16
 80007be:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80007c2:	d501      	bpl.n	80007c8 <_ZN13CLinePosition7processEP10sRGBResult+0xc4>
 80007c4:	4b1a      	ldr	r3, [pc, #104]	; (8000830 <_ZN13CLinePosition7processEP10sRGBResult+0x12c>)
 80007c6:	e028      	b.n	800081a <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 80007c8:	f9b5 301e 	ldrsh.w	r3, [r5, #30]
 80007cc:	ee07 3a10 	vmov	s14, r3
 80007d0:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80007d4:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80007d8:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80007dc:	d502      	bpl.n	80007e4 <_ZN13CLinePosition7processEP10sRGBResult+0xe0>
 80007de:	f04f 537e 	mov.w	r3, #1065353216	; 0x3f800000
 80007e2:	e01a      	b.n	800081a <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 80007e4:	f9b5 301a 	ldrsh.w	r3, [r5, #26]
 80007e8:	ee07 3a10 	vmov	s14, r3
 80007ec:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 80007f0:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80007f4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80007f8:	d502      	bpl.n	8000800 <_ZN13CLinePosition7processEP10sRGBResult+0xfc>
 80007fa:	f04f 433f 	mov.w	r3, #3204448256	; 0xbf000000
 80007fe:	e00c      	b.n	800081a <_ZN13CLinePosition7processEP10sRGBResult+0x116>
 8000800:	f9b5 301c 	ldrsh.w	r3, [r5, #28]
 8000804:	ee07 3a10 	vmov	s14, r3
 8000808:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 800080c:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000810:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000814:	d502      	bpl.n	800081c <_ZN13CLinePosition7processEP10sRGBResult+0x118>
 8000816:	f04f 537c 	mov.w	r3, #1056964608	; 0x3f000000
 800081a:	6063      	str	r3, [r4, #4]
 800081c:	ecbd 8b02 	vpop	{d8}
 8000820:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000824:	c2a00000 	.word	0xc2a00000
 8000828:	38d1b717 	.word	0x38d1b717
 800082c:	20000108 	.word	0x20000108
 8000830:	bf800000 	.word	0xbf800000

08000834 <_ZN13CLinePosition7on_lineEv>:
 8000834:	7800      	ldrb	r0, [r0, #0]
 8000836:	4770      	bx	lr

08000838 <_ZN13CLinePosition17get_line_positionEv>:
 8000838:	ed90 0a01 	vldr	s0, [r0, #4]
 800083c:	4770      	bx	lr

0800083e <_ZN4CPID4initEffff>:
 800083e:	eef0 7a00 	vmov.f32	s15, #0	; 0x40000000  2.0
 8000842:	ee70 0a20 	vadd.f32	s1, s0, s1
 8000846:	ee91 0a67 	vfnma.f32	s0, s2, s15
 800084a:	2300      	movs	r3, #0
 800084c:	6003      	str	r3, [r0, #0]
 800084e:	ee70 0a81 	vadd.f32	s1, s1, s2
 8000852:	6043      	str	r3, [r0, #4]
 8000854:	6083      	str	r3, [r0, #8]
 8000856:	edc0 0a03 	vstr	s1, [r0, #12]
 800085a:	ed80 0a04 	vstr	s0, [r0, #16]
 800085e:	ed80 1a05 	vstr	s2, [r0, #20]
 8000862:	6183      	str	r3, [r0, #24]
 8000864:	edc0 1a07 	vstr	s3, [r0, #28]
 8000868:	4770      	bx	lr

0800086a <_ZN4CPIDC1Effff>:
 800086a:	b510      	push	{r4, lr}
 800086c:	4604      	mov	r4, r0
 800086e:	f7ff ffe6 	bl	800083e <_ZN4CPID4initEffff>
 8000872:	4620      	mov	r0, r4
 8000874:	bd10      	pop	{r4, pc}

08000876 <_ZN4CPID7processEf>:
 8000876:	edd0 7a00 	vldr	s15, [r0]
 800087a:	edd0 6a04 	vldr	s13, [r0, #16]
 800087e:	ed90 7a01 	vldr	s14, [r0, #4]
 8000882:	edc0 7a01 	vstr	s15, [r0, #4]
 8000886:	ee67 7aa6 	vmul.f32	s15, s15, s13
 800088a:	edd0 6a03 	vldr	s13, [r0, #12]
 800088e:	ed80 7a02 	vstr	s14, [r0, #8]
 8000892:	eee6 7a80 	vfma.f32	s15, s13, s0
 8000896:	edd0 6a05 	vldr	s13, [r0, #20]
 800089a:	ed80 0a00 	vstr	s0, [r0]
 800089e:	eee6 7a87 	vfma.f32	s15, s13, s14
 80008a2:	ed90 7a06 	vldr	s14, [r0, #24]
 80008a6:	ee77 7a87 	vadd.f32	s15, s15, s14
 80008aa:	ed90 7a07 	vldr	s14, [r0, #28]
 80008ae:	edc0 7a06 	vstr	s15, [r0, #24]
 80008b2:	eef4 7ac7 	vcmpe.f32	s15, s14
 80008b6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80008ba:	bfc8      	it	gt
 80008bc:	ed80 7a06 	vstrgt	s14, [r0, #24]
 80008c0:	edd0 7a06 	vldr	s15, [r0, #24]
 80008c4:	eeb1 7a47 	vneg.f32	s14, s14
 80008c8:	eef4 7ac7 	vcmpe.f32	s15, s14
 80008cc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80008d0:	bf48      	it	mi
 80008d2:	ed80 7a06 	vstrmi	s14, [r0, #24]
 80008d6:	ed90 0a06 	vldr	s0, [r0, #24]
 80008da:	4770      	bx	lr

080008dc <_ZN5CMath3absEf>:
 80008dc:	eeb5 0ac0 	vcmpe.f32	s0, #0.0
 80008e0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80008e4:	bf48      	it	mi
 80008e6:	eeb1 0a40 	vnegmi.f32	s0, s0
 80008ea:	4770      	bx	lr

080008ec <_ZN5CMath4randEv>:
 80008ec:	6803      	ldr	r3, [r0, #0]
 80008ee:	490b      	ldr	r1, [pc, #44]	; (800091c <_ZN5CMath4randEv+0x30>)
 80008f0:	f243 0239 	movw	r2, #12345	; 0x3039
 80008f4:	fb01 2203 	mla	r2, r1, r3, r2
 80008f8:	6841      	ldr	r1, [r0, #4]
 80008fa:	6002      	str	r2, [r0, #0]
 80008fc:	f341 0300 	sbfx	r3, r1, #0, #1
 8000900:	f023 533f 	bic.w	r3, r3, #801112064	; 0x2fc00000
 8000904:	f423 137f 	bic.w	r3, r3, #4177920	; 0x3fc000
 8000908:	f423 537f 	bic.w	r3, r3, #16320	; 0x3fc0
 800090c:	f023 033e 	bic.w	r3, r3, #62	; 0x3e
 8000910:	ea83 0351 	eor.w	r3, r3, r1, lsr #1
 8000914:	6043      	str	r3, [r0, #4]
 8000916:	ea83 0002 	eor.w	r0, r3, r2
 800091a:	4770      	bx	lr
 800091c:	41c64e6d 	.word	0x41c64e6d

08000920 <_ZN5CMath3rndEv>:
 8000920:	b508      	push	{r3, lr}
 8000922:	f7ff ffe3 	bl	80008ec <_ZN5CMath4randEv>
 8000926:	4b09      	ldr	r3, [pc, #36]	; (800094c <_ZN5CMath3rndEv+0x2c>)
 8000928:	fbb0 f2f3 	udiv	r2, r0, r3
 800092c:	fb02 0013 	mls	r0, r2, r3, r0
 8000930:	ee07 0a90 	vmov	s15, r0
 8000934:	ed9f 0a06 	vldr	s0, [pc, #24]	; 8000950 <_ZN5CMath3rndEv+0x30>
 8000938:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 800093c:	eec7 7a80 	vdiv.f32	s15, s15, s0
 8000940:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8000944:	ee37 0ac0 	vsub.f32	s0, s15, s0
 8000948:	bd08      	pop	{r3, pc}
 800094a:	bf00      	nop
 800094c:	001e8480 	.word	0x001e8480
 8000950:	49742400 	.word	0x49742400

08000954 <TIM3_IRQHandler>:
 8000954:	2300      	movs	r3, #0
 8000956:	4a15      	ldr	r2, [pc, #84]	; (80009ac <TIM3_IRQHandler+0x58>)
 8000958:	5cd1      	ldrb	r1, [r2, r3]
 800095a:	b111      	cbz	r1, 8000962 <TIM3_IRQHandler+0xe>
 800095c:	5cd1      	ldrb	r1, [r2, r3]
 800095e:	29ff      	cmp	r1, #255	; 0xff
 8000960:	d11e      	bne.n	80009a0 <TIM3_IRQHandler+0x4c>
 8000962:	4913      	ldr	r1, [pc, #76]	; (80009b0 <TIM3_IRQHandler+0x5c>)
 8000964:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
 8000968:	b128      	cbz	r0, 8000976 <TIM3_IRQHandler+0x22>
 800096a:	f851 2023 	ldr.w	r2, [r1, r3, lsl #2]
 800096e:	3a01      	subs	r2, #1
 8000970:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000974:	e009      	b.n	800098a <TIM3_IRQHandler+0x36>
 8000976:	480f      	ldr	r0, [pc, #60]	; (80009b4 <TIM3_IRQHandler+0x60>)
 8000978:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
 800097c:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
 8000980:	5cd2      	ldrb	r2, [r2, r3]
 8000982:	b912      	cbnz	r2, 800098a <TIM3_IRQHandler+0x36>
 8000984:	4a09      	ldr	r2, [pc, #36]	; (80009ac <TIM3_IRQHandler+0x58>)
 8000986:	2101      	movs	r1, #1
 8000988:	54d1      	strb	r1, [r2, r3]
 800098a:	3301      	adds	r3, #1
 800098c:	2b08      	cmp	r3, #8
 800098e:	d1e2      	bne.n	8000956 <TIM3_IRQHandler+0x2>
 8000990:	4a09      	ldr	r2, [pc, #36]	; (80009b8 <TIM3_IRQHandler+0x64>)
 8000992:	480a      	ldr	r0, [pc, #40]	; (80009bc <TIM3_IRQHandler+0x68>)
 8000994:	6813      	ldr	r3, [r2, #0]
 8000996:	2101      	movs	r1, #1
 8000998:	3301      	adds	r3, #1
 800099a:	6013      	str	r3, [r2, #0]
 800099c:	f001 bee0 	b.w	8002760 <TIM_ClearITPendingBit>
 80009a0:	5cd1      	ldrb	r1, [r2, r3]
 80009a2:	3101      	adds	r1, #1
 80009a4:	b2c9      	uxtb	r1, r1
 80009a6:	54d1      	strb	r1, [r2, r3]
 80009a8:	e7db      	b.n	8000962 <TIM3_IRQHandler+0xe>
 80009aa:	bf00      	nop
 80009ac:	20000130 	.word	0x20000130
 80009b0:	20000110 	.word	0x20000110
 80009b4:	20000140 	.word	0x20000140
 80009b8:	20000138 	.word	0x20000138
 80009bc:	40000400 	.word	0x40000400

080009c0 <_ZN6CTimer10timer_initEv>:
 80009c0:	b530      	push	{r4, r5, lr}
 80009c2:	4a1f      	ldr	r2, [pc, #124]	; (8000a40 <_ZN6CTimer10timer_initEv+0x80>)
 80009c4:	2300      	movs	r3, #0
 80009c6:	b085      	sub	sp, #20
 80009c8:	6013      	str	r3, [r2, #0]
 80009ca:	491e      	ldr	r1, [pc, #120]	; (8000a44 <_ZN6CTimer10timer_initEv+0x84>)
 80009cc:	f44f 6280 	mov.w	r2, #1024	; 0x400
 80009d0:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80009d4:	491c      	ldr	r1, [pc, #112]	; (8000a48 <_ZN6CTimer10timer_initEv+0x88>)
 80009d6:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80009da:	4a1c      	ldr	r2, [pc, #112]	; (8000a4c <_ZN6CTimer10timer_initEv+0x8c>)
 80009dc:	2400      	movs	r4, #0
 80009de:	54d4      	strb	r4, [r2, r3]
 80009e0:	3301      	adds	r3, #1
 80009e2:	2b08      	cmp	r3, #8
 80009e4:	d1f1      	bne.n	80009ca <_ZN6CTimer10timer_initEv+0xa>
 80009e6:	4d1a      	ldr	r5, [pc, #104]	; (8000a50 <_ZN6CTimer10timer_initEv+0x90>)
 80009e8:	2002      	movs	r0, #2
 80009ea:	2101      	movs	r1, #1
 80009ec:	f001 fe4c 	bl	8002688 <RCC_APB1PeriphClockCmd>
 80009f0:	f44f 738c 	mov.w	r3, #280	; 0x118
 80009f4:	f8ad 3004 	strh.w	r3, [sp, #4]
 80009f8:	4628      	mov	r0, r5
 80009fa:	2331      	movs	r3, #49	; 0x31
 80009fc:	a901      	add	r1, sp, #4
 80009fe:	9302      	str	r3, [sp, #8]
 8000a00:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000a04:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000a08:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000a0c:	f001 fe4a 	bl	80026a4 <TIM_TimeBaseInit>
 8000a10:	4628      	mov	r0, r5
 8000a12:	2101      	movs	r1, #1
 8000a14:	f001 fe96 	bl	8002744 <TIM_Cmd>
 8000a18:	68eb      	ldr	r3, [r5, #12]
 8000a1a:	f043 0301 	orr.w	r3, r3, #1
 8000a1e:	60eb      	str	r3, [r5, #12]
 8000a20:	231d      	movs	r3, #29
 8000a22:	f88d 3000 	strb.w	r3, [sp]
 8000a26:	4668      	mov	r0, sp
 8000a28:	2301      	movs	r3, #1
 8000a2a:	f88d 4001 	strb.w	r4, [sp, #1]
 8000a2e:	f88d 3002 	strb.w	r3, [sp, #2]
 8000a32:	f88d 3003 	strb.w	r3, [sp, #3]
 8000a36:	f001 ffcd 	bl	80029d4 <NVIC_Init>
 8000a3a:	4620      	mov	r0, r4
 8000a3c:	b005      	add	sp, #20
 8000a3e:	bd30      	pop	{r4, r5, pc}
 8000a40:	20000138 	.word	0x20000138
 8000a44:	20000110 	.word	0x20000110
 8000a48:	20000140 	.word	0x20000140
 8000a4c:	20000130 	.word	0x20000130
 8000a50:	40000400 	.word	0x40000400

08000a54 <_ZN6CTimer8get_timeEv>:
 8000a54:	b082      	sub	sp, #8
 8000a56:	b672      	cpsid	i
 8000a58:	4b04      	ldr	r3, [pc, #16]	; (8000a6c <_ZN6CTimer8get_timeEv+0x18>)
 8000a5a:	681b      	ldr	r3, [r3, #0]
 8000a5c:	9301      	str	r3, [sp, #4]
 8000a5e:	b662      	cpsie	i
 8000a60:	230a      	movs	r3, #10
 8000a62:	9801      	ldr	r0, [sp, #4]
 8000a64:	fbb0 f0f3 	udiv	r0, r0, r3
 8000a68:	b002      	add	sp, #8
 8000a6a:	4770      	bx	lr
 8000a6c:	20000138 	.word	0x20000138

08000a70 <_ZN6CTimer8delay_msEm>:
 8000a70:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000a72:	460c      	mov	r4, r1
 8000a74:	4605      	mov	r5, r0
 8000a76:	f7ff ffed 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 8000a7a:	4420      	add	r0, r4
 8000a7c:	9001      	str	r0, [sp, #4]
 8000a7e:	4628      	mov	r0, r5
 8000a80:	9c01      	ldr	r4, [sp, #4]
 8000a82:	f7ff ffe7 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 8000a86:	4284      	cmp	r4, r0
 8000a88:	d902      	bls.n	8000a90 <_ZN6CTimer8delay_msEm+0x20>
 8000a8a:	f001 ff9f 	bl	80029cc <core_yield>
 8000a8e:	e7f6      	b.n	8000a7e <_ZN6CTimer8delay_msEm+0xe>
 8000a90:	b003      	add	sp, #12
 8000a92:	bd30      	pop	{r4, r5, pc}

08000a94 <_ZN6CTimer22event_timer_set_periodEhm>:
 8000a94:	b672      	cpsid	i
 8000a96:	230a      	movs	r3, #10
 8000a98:	435a      	muls	r2, r3
 8000a9a:	4b05      	ldr	r3, [pc, #20]	; (8000ab0 <_ZN6CTimer22event_timer_set_periodEhm+0x1c>)
 8000a9c:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 8000aa0:	4b04      	ldr	r3, [pc, #16]	; (8000ab4 <_ZN6CTimer22event_timer_set_periodEhm+0x20>)
 8000aa2:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
 8000aa6:	4b04      	ldr	r3, [pc, #16]	; (8000ab8 <_ZN6CTimer22event_timer_set_periodEhm+0x24>)
 8000aa8:	2200      	movs	r2, #0
 8000aaa:	545a      	strb	r2, [r3, r1]
 8000aac:	b662      	cpsie	i
 8000aae:	4770      	bx	lr
 8000ab0:	20000110 	.word	0x20000110
 8000ab4:	20000140 	.word	0x20000140
 8000ab8:	20000130 	.word	0x20000130

08000abc <_ZN6CTimer17event_timer_checkEh>:
 8000abc:	4b05      	ldr	r3, [pc, #20]	; (8000ad4 <_ZN6CTimer17event_timer_checkEh+0x18>)
 8000abe:	5c5a      	ldrb	r2, [r3, r1]
 8000ac0:	f002 00ff 	and.w	r0, r2, #255	; 0xff
 8000ac4:	b12a      	cbz	r2, 8000ad2 <_ZN6CTimer17event_timer_checkEh+0x16>
 8000ac6:	b672      	cpsid	i
 8000ac8:	5c58      	ldrb	r0, [r3, r1]
 8000aca:	2200      	movs	r2, #0
 8000acc:	b2c0      	uxtb	r0, r0
 8000ace:	545a      	strb	r2, [r3, r1]
 8000ad0:	b662      	cpsie	i
 8000ad2:	4770      	bx	lr
 8000ad4:	20000130 	.word	0x20000130

08000ad8 <_ZN4CRGB8rgb_readEh>:
 8000ad8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8000adc:	4604      	mov	r4, r0
 8000ade:	4688      	mov	r8, r1
 8000ae0:	f000 fae0 	bl	80010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000ae4:	4620      	mov	r0, r4
 8000ae6:	2172      	movs	r1, #114	; 0x72
 8000ae8:	f000 fb06 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000aec:	21b4      	movs	r1, #180	; 0xb4
 8000aee:	4620      	mov	r0, r4
 8000af0:	f000 fb02 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000af4:	4620      	mov	r0, r4
 8000af6:	f000 fad5 	bl	80010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8000afa:	4620      	mov	r0, r4
 8000afc:	2173      	movs	r1, #115	; 0x73
 8000afe:	f000 fafb 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8000b02:	4620      	mov	r0, r4
 8000b04:	2101      	movs	r1, #1
 8000b06:	4622      	mov	r2, r4
 8000b08:	f000 fb37 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b0c:	7823      	ldrb	r3, [r4, #0]
 8000b0e:	83a3      	strh	r3, [r4, #28]
 8000b10:	7863      	ldrb	r3, [r4, #1]
 8000b12:	83e3      	strh	r3, [r4, #30]
 8000b14:	78a3      	ldrb	r3, [r4, #2]
 8000b16:	8423      	strh	r3, [r4, #32]
 8000b18:	78e3      	ldrb	r3, [r4, #3]
 8000b1a:	8463      	strh	r3, [r4, #34]	; 0x22
 8000b1c:	2101      	movs	r1, #1
 8000b1e:	4620      	mov	r0, r4
 8000b20:	4622      	mov	r2, r4
 8000b22:	f104 091a 	add.w	r9, r4, #26
 8000b26:	1e65      	subs	r5, r4, #1
 8000b28:	f000 fb27 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b2c:	1ca6      	adds	r6, r4, #2
 8000b2e:	f104 0722 	add.w	r7, r4, #34	; 0x22
 8000b32:	4629      	mov	r1, r5
 8000b34:	464b      	mov	r3, r9
 8000b36:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 8000b3a:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 8000b3e:	42bb      	cmp	r3, r7
 8000b40:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8000b44:	801a      	strh	r2, [r3, #0]
 8000b46:	d1f6      	bne.n	8000b36 <_ZN4CRGB8rgb_readEh+0x5e>
 8000b48:	4620      	mov	r0, r4
 8000b4a:	2101      	movs	r1, #1
 8000b4c:	4622      	mov	r2, r4
 8000b4e:	f000 fb14 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b52:	7823      	ldrb	r3, [r4, #0]
 8000b54:	80a3      	strh	r3, [r4, #4]
 8000b56:	7863      	ldrb	r3, [r4, #1]
 8000b58:	80e3      	strh	r3, [r4, #6]
 8000b5a:	78a3      	ldrb	r3, [r4, #2]
 8000b5c:	8123      	strh	r3, [r4, #8]
 8000b5e:	78e3      	ldrb	r3, [r4, #3]
 8000b60:	8163      	strh	r3, [r4, #10]
 8000b62:	2101      	movs	r1, #1
 8000b64:	4620      	mov	r0, r4
 8000b66:	4622      	mov	r2, r4
 8000b68:	f000 fb07 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b6c:	f104 0a0a 	add.w	sl, r4, #10
 8000b70:	4633      	mov	r3, r6
 8000b72:	4629      	mov	r1, r5
 8000b74:	f833 2f02 	ldrh.w	r2, [r3, #2]!
 8000b78:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 8000b7c:	4553      	cmp	r3, sl
 8000b7e:	ea42 2200 	orr.w	r2, r2, r0, lsl #8
 8000b82:	801a      	strh	r2, [r3, #0]
 8000b84:	d1f6      	bne.n	8000b74 <_ZN4CRGB8rgb_readEh+0x9c>
 8000b86:	4620      	mov	r0, r4
 8000b88:	2101      	movs	r1, #1
 8000b8a:	4622      	mov	r2, r4
 8000b8c:	f000 faf5 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000b90:	7823      	ldrb	r3, [r4, #0]
 8000b92:	81a3      	strh	r3, [r4, #12]
 8000b94:	7863      	ldrb	r3, [r4, #1]
 8000b96:	81e3      	strh	r3, [r4, #14]
 8000b98:	78a3      	ldrb	r3, [r4, #2]
 8000b9a:	8223      	strh	r3, [r4, #16]
 8000b9c:	78e3      	ldrb	r3, [r4, #3]
 8000b9e:	8263      	strh	r3, [r4, #18]
 8000ba0:	4622      	mov	r2, r4
 8000ba2:	4620      	mov	r0, r4
 8000ba4:	2101      	movs	r1, #1
 8000ba6:	f000 fae8 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000baa:	f104 0612 	add.w	r6, r4, #18
 8000bae:	462a      	mov	r2, r5
 8000bb0:	f83a 3f02 	ldrh.w	r3, [sl, #2]!
 8000bb4:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000bb8:	45b2      	cmp	sl, r6
 8000bba:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000bbe:	f8aa 3000 	strh.w	r3, [sl]
 8000bc2:	d1f5      	bne.n	8000bb0 <_ZN4CRGB8rgb_readEh+0xd8>
 8000bc4:	4620      	mov	r0, r4
 8000bc6:	2101      	movs	r1, #1
 8000bc8:	4622      	mov	r2, r4
 8000bca:	f000 fad6 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000bce:	7823      	ldrb	r3, [r4, #0]
 8000bd0:	82a3      	strh	r3, [r4, #20]
 8000bd2:	7863      	ldrb	r3, [r4, #1]
 8000bd4:	82e3      	strh	r3, [r4, #22]
 8000bd6:	78a3      	ldrb	r3, [r4, #2]
 8000bd8:	8323      	strh	r3, [r4, #24]
 8000bda:	78e3      	ldrb	r3, [r4, #3]
 8000bdc:	8363      	strh	r3, [r4, #26]
 8000bde:	4622      	mov	r2, r4
 8000be0:	4620      	mov	r0, r4
 8000be2:	2101      	movs	r1, #1
 8000be4:	f000 fac9 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000be8:	462a      	mov	r2, r5
 8000bea:	f836 3f02 	ldrh.w	r3, [r6, #2]!
 8000bee:	f812 1f01 	ldrb.w	r1, [r2, #1]!
 8000bf2:	454e      	cmp	r6, r9
 8000bf4:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000bf8:	8033      	strh	r3, [r6, #0]
 8000bfa:	d1f6      	bne.n	8000bea <_ZN4CRGB8rgb_readEh+0x112>
 8000bfc:	4620      	mov	r0, r4
 8000bfe:	2101      	movs	r1, #1
 8000c00:	4622      	mov	r2, r4
 8000c02:	f000 faba 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c06:	7823      	ldrb	r3, [r4, #0]
 8000c08:	84a3      	strh	r3, [r4, #36]	; 0x24
 8000c0a:	7863      	ldrb	r3, [r4, #1]
 8000c0c:	84e3      	strh	r3, [r4, #38]	; 0x26
 8000c0e:	78a3      	ldrb	r3, [r4, #2]
 8000c10:	8523      	strh	r3, [r4, #40]	; 0x28
 8000c12:	78e3      	ldrb	r3, [r4, #3]
 8000c14:	8563      	strh	r3, [r4, #42]	; 0x2a
 8000c16:	4622      	mov	r2, r4
 8000c18:	4620      	mov	r0, r4
 8000c1a:	2100      	movs	r1, #0
 8000c1c:	f000 faad 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 8000c20:	f104 022a 	add.w	r2, r4, #42	; 0x2a
 8000c24:	f837 3f02 	ldrh.w	r3, [r7, #2]!
 8000c28:	f815 1f01 	ldrb.w	r1, [r5, #1]!
 8000c2c:	4297      	cmp	r7, r2
 8000c2e:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
 8000c32:	803b      	strh	r3, [r7, #0]
 8000c34:	d1f6      	bne.n	8000c24 <_ZN4CRGB8rgb_readEh+0x14c>
 8000c36:	4620      	mov	r0, r4
 8000c38:	f000 fa49 	bl	80010ce <_ZN8CRGB_I2C11rgb_i2cStopEv>
 8000c3c:	f1b8 0f00 	cmp.w	r8, #0
 8000c40:	d025      	beq.n	8000c8e <_ZN4CRGB8rgb_readEh+0x1b6>
 8000c42:	2300      	movs	r3, #0
 8000c44:	88a1      	ldrh	r1, [r4, #4]
 8000c46:	f8b4 2044 	ldrh.w	r2, [r4, #68]	; 0x44
 8000c4a:	440a      	add	r2, r1
 8000c4c:	f8a4 2044 	strh.w	r2, [r4, #68]	; 0x44
 8000c50:	89a1      	ldrh	r1, [r4, #12]
 8000c52:	f8b4 204c 	ldrh.w	r2, [r4, #76]	; 0x4c
 8000c56:	440a      	add	r2, r1
 8000c58:	f8a4 204c 	strh.w	r2, [r4, #76]	; 0x4c
 8000c5c:	8aa1      	ldrh	r1, [r4, #20]
 8000c5e:	f8b4 2054 	ldrh.w	r2, [r4, #84]	; 0x54
 8000c62:	440a      	add	r2, r1
 8000c64:	f8a4 2054 	strh.w	r2, [r4, #84]	; 0x54
 8000c68:	8ca1      	ldrh	r1, [r4, #36]	; 0x24
 8000c6a:	f8b4 2064 	ldrh.w	r2, [r4, #100]	; 0x64
 8000c6e:	440a      	add	r2, r1
 8000c70:	f8a4 2064 	strh.w	r2, [r4, #100]	; 0x64
 8000c74:	8ba1      	ldrh	r1, [r4, #28]
 8000c76:	f8b4 205c 	ldrh.w	r2, [r4, #92]	; 0x5c
 8000c7a:	3301      	adds	r3, #1
 8000c7c:	440a      	add	r2, r1
 8000c7e:	2b04      	cmp	r3, #4
 8000c80:	f8a4 205c 	strh.w	r2, [r4, #92]	; 0x5c
 8000c84:	f104 0402 	add.w	r4, r4, #2
 8000c88:	d1dc      	bne.n	8000c44 <_ZN4CRGB8rgb_readEh+0x16c>
 8000c8a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000c8e:	4641      	mov	r1, r8
 8000c90:	b672      	cpsid	i
 8000c92:	88a3      	ldrh	r3, [r4, #4]
 8000c94:	f8b4 0044 	ldrh.w	r0, [r4, #68]	; 0x44
 8000c98:	f8b4 204c 	ldrh.w	r2, [r4, #76]	; 0x4c
 8000c9c:	f8b4 5054 	ldrh.w	r5, [r4, #84]	; 0x54
 8000ca0:	f8b4 6064 	ldrh.w	r6, [r4, #100]	; 0x64
 8000ca4:	1a18      	subs	r0, r3, r0
 8000ca6:	89a3      	ldrh	r3, [r4, #12]
 8000ca8:	1a9a      	subs	r2, r3, r2
 8000caa:	8aa3      	ldrh	r3, [r4, #20]
 8000cac:	1b5b      	subs	r3, r3, r5
 8000cae:	8ca5      	ldrh	r5, [r4, #36]	; 0x24
 8000cb0:	1bad      	subs	r5, r5, r6
 8000cb2:	84a5      	strh	r5, [r4, #36]	; 0x24
 8000cb4:	f8b4 605c 	ldrh.w	r6, [r4, #92]	; 0x5c
 8000cb8:	8ba5      	ldrh	r5, [r4, #28]
 8000cba:	b280      	uxth	r0, r0
 8000cbc:	b292      	uxth	r2, r2
 8000cbe:	b29b      	uxth	r3, r3
 8000cc0:	1bad      	subs	r5, r5, r6
 8000cc2:	80a0      	strh	r0, [r4, #4]
 8000cc4:	81a2      	strh	r2, [r4, #12]
 8000cc6:	82a3      	strh	r3, [r4, #20]
 8000cc8:	83a5      	strh	r5, [r4, #28]
 8000cca:	b662      	cpsie	i
 8000ccc:	b200      	sxth	r0, r0
 8000cce:	b212      	sxth	r2, r2
 8000cd0:	1885      	adds	r5, r0, r2
 8000cd2:	b21b      	sxth	r3, r3
 8000cd4:	18ed      	adds	r5, r5, r3
 8000cd6:	d00e      	beq.n	8000cf6 <_ZN4CRGB8rgb_readEh+0x21e>
 8000cd8:	ebc0 2000 	rsb	r0, r0, r0, lsl #8
 8000cdc:	ebc2 2202 	rsb	r2, r2, r2, lsl #8
 8000ce0:	fb90 f0f5 	sdiv	r0, r0, r5
 8000ce4:	fb92 f2f5 	sdiv	r2, r2, r5
 8000ce8:	ebc3 2303 	rsb	r3, r3, r3, lsl #8
 8000cec:	85a0      	strh	r0, [r4, #44]	; 0x2c
 8000cee:	fb93 f3f5 	sdiv	r3, r3, r5
 8000cf2:	86a2      	strh	r2, [r4, #52]	; 0x34
 8000cf4:	87a3      	strh	r3, [r4, #60]	; 0x3c
 8000cf6:	3101      	adds	r1, #1
 8000cf8:	2904      	cmp	r1, #4
 8000cfa:	f104 0402 	add.w	r4, r4, #2
 8000cfe:	d1c7      	bne.n	8000c90 <_ZN4CRGB8rgb_readEh+0x1b8>
 8000d00:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

08000d04 <_ZN4CRGB8rgb_initEv>:
 8000d04:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000d06:	4606      	mov	r6, r0
 8000d08:	4635      	mov	r5, r6
 8000d0a:	f000 f991 	bl	8001030 <_ZN8CRGB_I2C12rgb_i2c_initEv>
 8000d0e:	4633      	mov	r3, r6
 8000d10:	2200      	movs	r2, #0
 8000d12:	3201      	adds	r2, #1
 8000d14:	2400      	movs	r4, #0
 8000d16:	2a04      	cmp	r2, #4
 8000d18:	809c      	strh	r4, [r3, #4]
 8000d1a:	819c      	strh	r4, [r3, #12]
 8000d1c:	829c      	strh	r4, [r3, #20]
 8000d1e:	849c      	strh	r4, [r3, #36]	; 0x24
 8000d20:	839c      	strh	r4, [r3, #28]
 8000d22:	f8a3 4044 	strh.w	r4, [r3, #68]	; 0x44
 8000d26:	f8a3 404c 	strh.w	r4, [r3, #76]	; 0x4c
 8000d2a:	f8a3 4054 	strh.w	r4, [r3, #84]	; 0x54
 8000d2e:	f8a3 4064 	strh.w	r4, [r3, #100]	; 0x64
 8000d32:	f8a3 405c 	strh.w	r4, [r3, #92]	; 0x5c
 8000d36:	859c      	strh	r4, [r3, #44]	; 0x2c
 8000d38:	869c      	strh	r4, [r3, #52]	; 0x34
 8000d3a:	879c      	strh	r4, [r3, #60]	; 0x3c
 8000d3c:	f103 0302 	add.w	r3, r3, #2
 8000d40:	d1e7      	bne.n	8000d12 <_ZN4CRGB8rgb_initEv+0xe>
 8000d42:	4630      	mov	r0, r6
 8000d44:	2172      	movs	r1, #114	; 0x72
 8000d46:	2281      	movs	r2, #129	; 0x81
 8000d48:	23ff      	movs	r3, #255	; 0xff
 8000d4a:	f000 f9fe 	bl	800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000d4e:	4630      	mov	r0, r6
 8000d50:	2172      	movs	r1, #114	; 0x72
 8000d52:	2283      	movs	r2, #131	; 0x83
 8000d54:	23ff      	movs	r3, #255	; 0xff
 8000d56:	f000 f9f8 	bl	800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000d5a:	4630      	mov	r0, r6
 8000d5c:	2172      	movs	r1, #114	; 0x72
 8000d5e:	228d      	movs	r2, #141	; 0x8d
 8000d60:	4623      	mov	r3, r4
 8000d62:	f000 f9f2 	bl	800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000d66:	4630      	mov	r0, r6
 8000d68:	2172      	movs	r1, #114	; 0x72
 8000d6a:	2280      	movs	r2, #128	; 0x80
 8000d6c:	2303      	movs	r3, #3
 8000d6e:	f000 f9ec 	bl	800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000d72:	228f      	movs	r2, #143	; 0x8f
 8000d74:	2323      	movs	r3, #35	; 0x23
 8000d76:	4630      	mov	r0, r6
 8000d78:	2172      	movs	r1, #114	; 0x72
 8000d7a:	f000 f9e6 	bl	800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>
 8000d7e:	af01      	add	r7, sp, #4
 8000d80:	4630      	mov	r0, r6
 8000d82:	4621      	mov	r1, r4
 8000d84:	f7ff fea8 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 8000d88:	463b      	mov	r3, r7
 8000d8a:	4630      	mov	r0, r6
 8000d8c:	2172      	movs	r1, #114	; 0x72
 8000d8e:	2292      	movs	r2, #146	; 0x92
 8000d90:	f000 fa40 	bl	8001214 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>
 8000d94:	4623      	mov	r3, r4
 8000d96:	5cfa      	ldrb	r2, [r7, r3]
 8000d98:	2a69      	cmp	r2, #105	; 0x69
 8000d9a:	bf1c      	itt	ne
 8000d9c:	2201      	movne	r2, #1
 8000d9e:	409a      	lslne	r2, r3
 8000da0:	f103 0301 	add.w	r3, r3, #1
 8000da4:	bf18      	it	ne
 8000da6:	4314      	orrne	r4, r2
 8000da8:	2b04      	cmp	r3, #4
 8000daa:	d1f4      	bne.n	8000d96 <_ZN4CRGB8rgb_initEv+0x92>
 8000dac:	461f      	mov	r7, r3
 8000dae:	4630      	mov	r0, r6
 8000db0:	2101      	movs	r1, #1
 8000db2:	f7ff fe91 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 8000db6:	3f01      	subs	r7, #1
 8000db8:	d1f9      	bne.n	8000dae <_ZN4CRGB8rgb_initEv+0xaa>
 8000dba:	2104      	movs	r1, #4
 8000dbc:	f9b5 3044 	ldrsh.w	r3, [r5, #68]	; 0x44
 8000dc0:	089b      	lsrs	r3, r3, #2
 8000dc2:	f8a5 3044 	strh.w	r3, [r5, #68]	; 0x44
 8000dc6:	f9b5 304c 	ldrsh.w	r3, [r5, #76]	; 0x4c
 8000dca:	089b      	lsrs	r3, r3, #2
 8000dcc:	f8a5 304c 	strh.w	r3, [r5, #76]	; 0x4c
 8000dd0:	f9b5 3054 	ldrsh.w	r3, [r5, #84]	; 0x54
 8000dd4:	089b      	lsrs	r3, r3, #2
 8000dd6:	f8a5 3054 	strh.w	r3, [r5, #84]	; 0x54
 8000dda:	f9b5 3064 	ldrsh.w	r3, [r5, #100]	; 0x64
 8000dde:	089b      	lsrs	r3, r3, #2
 8000de0:	f8a5 3064 	strh.w	r3, [r5, #100]	; 0x64
 8000de4:	f9b5 305c 	ldrsh.w	r3, [r5, #92]	; 0x5c
 8000de8:	3901      	subs	r1, #1
 8000dea:	ea4f 0393 	mov.w	r3, r3, lsr #2
 8000dee:	f8a5 305c 	strh.w	r3, [r5, #92]	; 0x5c
 8000df2:	f105 0502 	add.w	r5, r5, #2
 8000df6:	d1e1      	bne.n	8000dbc <_ZN4CRGB8rgb_initEv+0xb8>
 8000df8:	4630      	mov	r0, r6
 8000dfa:	f7ff fe6d 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 8000dfe:	b114      	cbz	r4, 8000e06 <_ZN4CRGB8rgb_initEv+0x102>
 8000e00:	4802      	ldr	r0, [pc, #8]	; (8000e0c <_ZN4CRGB8rgb_initEv+0x108>)
 8000e02:	1b00      	subs	r0, r0, r4
 8000e04:	e000      	b.n	8000e08 <_ZN4CRGB8rgb_initEv+0x104>
 8000e06:	4620      	mov	r0, r4
 8000e08:	b003      	add	sp, #12
 8000e0a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e0c:	fffffc18 	.word	0xfffffc18

08000e10 <_ZN4CRGB14get_rgb_resultEv>:
 8000e10:	3004      	adds	r0, #4
 8000e12:	4770      	bx	lr

08000e14 <_ZN6CMotor11motor_sleepEv>:
 8000e14:	b510      	push	{r4, lr}
 8000e16:	4c07      	ldr	r4, [pc, #28]	; (8000e34 <_ZN6CMotor11motor_sleepEv+0x20>)
 8000e18:	21c0      	movs	r1, #192	; 0xc0
 8000e1a:	4620      	mov	r0, r4
 8000e1c:	2200      	movs	r2, #0
 8000e1e:	2318      	movs	r3, #24
 8000e20:	f000 fadc 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000e24:	4620      	mov	r0, r4
 8000e26:	21c2      	movs	r1, #194	; 0xc2
 8000e28:	2200      	movs	r2, #0
 8000e2a:	2318      	movs	r3, #24
 8000e2c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000e30:	f000 bad4 	b.w	80013dc <_ZN4CI2C9write_regEhhh>
 8000e34:	20000160 	.word	0x20000160

08000e38 <_ZN6CMotor13motor_refreshEv>:
 8000e38:	b570      	push	{r4, r5, r6, lr}
 8000e3a:	e890 0030 	ldmia.w	r0, {r4, r5}
 8000e3e:	2c2c      	cmp	r4, #44	; 0x2c
 8000e40:	dc74      	bgt.n	8000f2c <_ZN6CMotor13motor_refreshEv+0xf4>
 8000e42:	f114 0f2c 	cmn.w	r4, #44	; 0x2c
 8000e46:	db11      	blt.n	8000e6c <_ZN6CMotor13motor_refreshEv+0x34>
 8000e48:	2d2c      	cmp	r5, #44	; 0x2c
 8000e4a:	dc5e      	bgt.n	8000f0a <_ZN6CMotor13motor_refreshEv+0xd2>
 8000e4c:	f115 0f2c 	cmn.w	r5, #44	; 0x2c
 8000e50:	db33      	blt.n	8000eba <_ZN6CMotor13motor_refreshEv+0x82>
 8000e52:	b1dc      	cbz	r4, 8000e8c <_ZN6CMotor13motor_refreshEv+0x54>
 8000e54:	e001      	b.n	8000e5a <_ZN6CMotor13motor_refreshEv+0x22>
 8000e56:	f06f 052b 	mvn.w	r5, #43	; 0x2b
 8000e5a:	2c00      	cmp	r4, #0
 8000e5c:	dd0d      	ble.n	8000e7a <_ZN6CMotor13motor_refreshEv+0x42>
 8000e5e:	2c06      	cmp	r4, #6
 8000e60:	bfb8      	it	lt
 8000e62:	2406      	movlt	r4, #6
 8000e64:	00a4      	lsls	r4, r4, #2
 8000e66:	f044 0402 	orr.w	r4, r4, #2
 8000e6a:	e00d      	b.n	8000e88 <_ZN6CMotor13motor_refreshEv+0x50>
 8000e6c:	2d2c      	cmp	r5, #44	; 0x2c
 8000e6e:	f06f 042b 	mvn.w	r4, #43	; 0x2b
 8000e72:	dc60      	bgt.n	8000f36 <_ZN6CMotor13motor_refreshEv+0xfe>
 8000e74:	42a5      	cmp	r5, r4
 8000e76:	bfb8      	it	lt
 8000e78:	4625      	movlt	r5, r4
 8000e7a:	4264      	negs	r4, r4
 8000e7c:	2c06      	cmp	r4, #6
 8000e7e:	bfb8      	it	lt
 8000e80:	2406      	movlt	r4, #6
 8000e82:	00a4      	lsls	r4, r4, #2
 8000e84:	f044 0401 	orr.w	r4, r4, #1
 8000e88:	b2e4      	uxtb	r4, r4
 8000e8a:	e000      	b.n	8000e8e <_ZN6CMotor13motor_refreshEv+0x56>
 8000e8c:	241b      	movs	r4, #27
 8000e8e:	2200      	movs	r2, #0
 8000e90:	4613      	mov	r3, r2
 8000e92:	482a      	ldr	r0, [pc, #168]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000e94:	21c0      	movs	r1, #192	; 0xc0
 8000e96:	f000 faa1 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000e9a:	4828      	ldr	r0, [pc, #160]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000e9c:	21c0      	movs	r1, #192	; 0xc0
 8000e9e:	2200      	movs	r2, #0
 8000ea0:	4623      	mov	r3, r4
 8000ea2:	f000 fa9b 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000ea6:	2d00      	cmp	r5, #0
 8000ea8:	d020      	beq.n	8000eec <_ZN6CMotor13motor_refreshEv+0xb4>
 8000eaa:	dd16      	ble.n	8000eda <_ZN6CMotor13motor_refreshEv+0xa2>
 8000eac:	2d06      	cmp	r5, #6
 8000eae:	bfb8      	it	lt
 8000eb0:	2506      	movlt	r5, #6
 8000eb2:	00ad      	lsls	r5, r5, #2
 8000eb4:	f045 0501 	orr.w	r5, r5, #1
 8000eb8:	e016      	b.n	8000ee8 <_ZN6CMotor13motor_refreshEv+0xb0>
 8000eba:	2c00      	cmp	r4, #0
 8000ebc:	d1cb      	bne.n	8000e56 <_ZN6CMotor13motor_refreshEv+0x1e>
 8000ebe:	481f      	ldr	r0, [pc, #124]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000ec0:	21c0      	movs	r1, #192	; 0xc0
 8000ec2:	4622      	mov	r2, r4
 8000ec4:	4623      	mov	r3, r4
 8000ec6:	f000 fa89 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000eca:	481c      	ldr	r0, [pc, #112]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000ecc:	21c0      	movs	r1, #192	; 0xc0
 8000ece:	4622      	mov	r2, r4
 8000ed0:	231b      	movs	r3, #27
 8000ed2:	f000 fa83 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000ed6:	f06f 052b 	mvn.w	r5, #43	; 0x2b
 8000eda:	426d      	negs	r5, r5
 8000edc:	2d06      	cmp	r5, #6
 8000ede:	bfb8      	it	lt
 8000ee0:	2506      	movlt	r5, #6
 8000ee2:	00ad      	lsls	r5, r5, #2
 8000ee4:	f045 0502 	orr.w	r5, r5, #2
 8000ee8:	b2ed      	uxtb	r5, r5
 8000eea:	e000      	b.n	8000eee <_ZN6CMotor13motor_refreshEv+0xb6>
 8000eec:	251b      	movs	r5, #27
 8000eee:	2200      	movs	r2, #0
 8000ef0:	4613      	mov	r3, r2
 8000ef2:	4812      	ldr	r0, [pc, #72]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000ef4:	21c2      	movs	r1, #194	; 0xc2
 8000ef6:	f000 fa71 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000efa:	462b      	mov	r3, r5
 8000efc:	480f      	ldr	r0, [pc, #60]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000efe:	21c2      	movs	r1, #194	; 0xc2
 8000f00:	2200      	movs	r2, #0
 8000f02:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000f06:	f000 ba69 	b.w	80013dc <_ZN4CI2C9write_regEhhh>
 8000f0a:	b96c      	cbnz	r4, 8000f28 <_ZN6CMotor13motor_refreshEv+0xf0>
 8000f0c:	480b      	ldr	r0, [pc, #44]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f0e:	21c0      	movs	r1, #192	; 0xc0
 8000f10:	4622      	mov	r2, r4
 8000f12:	4623      	mov	r3, r4
 8000f14:	f000 fa62 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000f18:	4808      	ldr	r0, [pc, #32]	; (8000f3c <_ZN6CMotor13motor_refreshEv+0x104>)
 8000f1a:	21c0      	movs	r1, #192	; 0xc0
 8000f1c:	4622      	mov	r2, r4
 8000f1e:	231b      	movs	r3, #27
 8000f20:	f000 fa5c 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8000f24:	252c      	movs	r5, #44	; 0x2c
 8000f26:	e7c4      	b.n	8000eb2 <_ZN6CMotor13motor_refreshEv+0x7a>
 8000f28:	252c      	movs	r5, #44	; 0x2c
 8000f2a:	e796      	b.n	8000e5a <_ZN6CMotor13motor_refreshEv+0x22>
 8000f2c:	242c      	movs	r4, #44	; 0x2c
 8000f2e:	42a5      	cmp	r5, r4
 8000f30:	dd8c      	ble.n	8000e4c <_ZN6CMotor13motor_refreshEv+0x14>
 8000f32:	4625      	mov	r5, r4
 8000f34:	e796      	b.n	8000e64 <_ZN6CMotor13motor_refreshEv+0x2c>
 8000f36:	252c      	movs	r5, #44	; 0x2c
 8000f38:	e79f      	b.n	8000e7a <_ZN6CMotor13motor_refreshEv+0x42>
 8000f3a:	bf00      	nop
 8000f3c:	20000160 	.word	0x20000160

08000f40 <_ZN6CMotor9set_motorEml>:
 8000f40:	2901      	cmp	r1, #1
 8000f42:	bf98      	it	ls
 8000f44:	f840 2021 	strls.w	r2, [r0, r1, lsl #2]
 8000f48:	f7ff bf76 	b.w	8000e38 <_ZN6CMotor13motor_refreshEv>

08000f4c <_ZN6CMotor10motor_initEv>:
 8000f4c:	b510      	push	{r4, lr}
 8000f4e:	2100      	movs	r1, #0
 8000f50:	4604      	mov	r4, r0
 8000f52:	460a      	mov	r2, r1
 8000f54:	f7ff fff4 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8000f58:	4620      	mov	r0, r4
 8000f5a:	2101      	movs	r1, #1
 8000f5c:	2200      	movs	r2, #0
 8000f5e:	f7ff ffef 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8000f62:	4620      	mov	r0, r4
 8000f64:	f7ff ff68 	bl	8000e38 <_ZN6CMotor13motor_refreshEv>
 8000f68:	2000      	movs	r0, #0
 8000f6a:	bd10      	pop	{r4, pc}

08000f6c <_ZN8CSensors12sensors_initEv>:
 8000f6c:	b510      	push	{r4, lr}
 8000f6e:	4604      	mov	r4, r0
 8000f70:	4808      	ldr	r0, [pc, #32]	; (8000f94 <_ZN8CSensors12sensors_initEv+0x28>)
 8000f72:	f000 f9b1 	bl	80012d8 <_ZN4CI2C4initEv>
 8000f76:	4620      	mov	r0, r4
 8000f78:	f7ff fec4 	bl	8000d04 <_ZN4CRGB8rgb_initEv>
 8000f7c:	b110      	cbz	r0, 8000f84 <_ZN8CSensors12sensors_initEv+0x18>
 8000f7e:	f5a0 707a 	sub.w	r0, r0, #1000	; 0x3e8
 8000f82:	bd10      	pop	{r4, pc}
 8000f84:	f104 0084 	add.w	r0, r4, #132	; 0x84
 8000f88:	f000 fb36 	bl	80015f8 <_ZN4CIMU8imu_initEv>
 8000f8c:	b108      	cbz	r0, 8000f92 <_ZN8CSensors12sensors_initEv+0x26>
 8000f8e:	f5a0 60fa 	sub.w	r0, r0, #2000	; 0x7d0
 8000f92:	bd10      	pop	{r4, pc}
 8000f94:	20000160 	.word	0x20000160

08000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>:
 8000f98:	2365      	movs	r3, #101	; 0x65
 8000f9a:	3b01      	subs	r3, #1
 8000f9c:	d001      	beq.n	8000fa2 <_ZN8CRGB_I2C13rgb_i2c_delayEv+0xa>
 8000f9e:	bf00      	nop
 8000fa0:	e7fb      	b.n	8000f9a <_ZN8CRGB_I2C13rgb_i2c_delayEv+0x2>
 8000fa2:	4770      	bx	lr

08000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>:
 8000fa4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000fa6:	2301      	movs	r3, #1
 8000fa8:	2203      	movs	r2, #3
 8000faa:	4605      	mov	r5, r0
 8000fac:	24f0      	movs	r4, #240	; 0xf0
 8000fae:	f88d 3004 	strb.w	r3, [sp, #4]
 8000fb2:	f88d 3006 	strb.w	r3, [sp, #6]
 8000fb6:	4669      	mov	r1, sp
 8000fb8:	2300      	movs	r3, #0
 8000fba:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000fbe:	f88d 2005 	strb.w	r2, [sp, #5]
 8000fc2:	f88d 3007 	strb.w	r3, [sp, #7]
 8000fc6:	9400      	str	r4, [sp, #0]
 8000fc8:	f001 fd4a 	bl	8002a60 <GPIO_Init>
 8000fcc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000fd0:	4628      	mov	r0, r5
 8000fd2:	851c      	strh	r4, [r3, #40]	; 0x28
 8000fd4:	f7ff ffe0 	bl	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 8000fd8:	b003      	add	sp, #12
 8000fda:	bd30      	pop	{r4, r5, pc}

08000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>:
 8000fdc:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000fde:	2300      	movs	r3, #0
 8000fe0:	2203      	movs	r2, #3
 8000fe2:	4605      	mov	r5, r0
 8000fe4:	24f0      	movs	r4, #240	; 0xf0
 8000fe6:	4669      	mov	r1, sp
 8000fe8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000fec:	f88d 3004 	strb.w	r3, [sp, #4]
 8000ff0:	f88d 2005 	strb.w	r2, [sp, #5]
 8000ff4:	f88d 3007 	strb.w	r3, [sp, #7]
 8000ff8:	9400      	str	r4, [sp, #0]
 8000ffa:	f001 fd31 	bl	8002a60 <GPIO_Init>
 8000ffe:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001002:	4628      	mov	r0, r5
 8001004:	619c      	str	r4, [r3, #24]
 8001006:	f7ff ffc7 	bl	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 800100a:	b003      	add	sp, #12
 800100c:	bd30      	pop	{r4, r5, pc}
	...

08001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>:
 8001010:	4b02      	ldr	r3, [pc, #8]	; (800101c <_ZN8CRGB_I2C12RGBSetLowSCLEv+0xc>)
 8001012:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8001016:	851a      	strh	r2, [r3, #40]	; 0x28
 8001018:	f7ff bfbe 	b.w	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 800101c:	48000800 	.word	0x48000800

08001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>:
 8001020:	4b02      	ldr	r3, [pc, #8]	; (800102c <_ZN8CRGB_I2C13RGBSetHighSCLEv+0xc>)
 8001022:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8001026:	619a      	str	r2, [r3, #24]
 8001028:	f7ff bfb6 	b.w	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>
 800102c:	48000800 	.word	0x48000800

08001030 <_ZN8CRGB_I2C12rgb_i2c_initEv>:
 8001030:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001032:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8001036:	4605      	mov	r5, r0
 8001038:	2400      	movs	r4, #0
 800103a:	9300      	str	r3, [sp, #0]
 800103c:	2703      	movs	r7, #3
 800103e:	2301      	movs	r3, #1
 8001040:	4817      	ldr	r0, [pc, #92]	; (80010a0 <_ZN8CRGB_I2C12rgb_i2c_initEv+0x70>)
 8001042:	f88d 3004 	strb.w	r3, [sp, #4]
 8001046:	4669      	mov	r1, sp
 8001048:	26f0      	movs	r6, #240	; 0xf0
 800104a:	f88d 7005 	strb.w	r7, [sp, #5]
 800104e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001052:	f88d 4007 	strb.w	r4, [sp, #7]
 8001056:	f001 fd03 	bl	8002a60 <GPIO_Init>
 800105a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800105e:	4669      	mov	r1, sp
 8001060:	9600      	str	r6, [sp, #0]
 8001062:	f88d 4004 	strb.w	r4, [sp, #4]
 8001066:	f88d 7005 	strb.w	r7, [sp, #5]
 800106a:	f88d 4007 	strb.w	r4, [sp, #7]
 800106e:	f001 fcf7 	bl	8002a60 <GPIO_Init>
 8001072:	4631      	mov	r1, r6
 8001074:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001078:	f001 fd34 	bl	8002ae4 <GPIO_SetBits>
 800107c:	4628      	mov	r0, r5
 800107e:	f7ff ffcf 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8001082:	4628      	mov	r0, r5
 8001084:	f7ff ff8e 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8001088:	4628      	mov	r0, r5
 800108a:	f7ff ffa7 	bl	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 800108e:	f242 7311 	movw	r3, #10001	; 0x2711
 8001092:	3b01      	subs	r3, #1
 8001094:	d001      	beq.n	800109a <_ZN8CRGB_I2C12rgb_i2c_initEv+0x6a>
 8001096:	bf00      	nop
 8001098:	e7fb      	b.n	8001092 <_ZN8CRGB_I2C12rgb_i2c_initEv+0x62>
 800109a:	b003      	add	sp, #12
 800109c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800109e:	bf00      	nop
 80010a0:	48000800 	.word	0x48000800

080010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>:
 80010a4:	b510      	push	{r4, lr}
 80010a6:	4604      	mov	r4, r0
 80010a8:	f7ff ffba 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80010ac:	4620      	mov	r0, r4
 80010ae:	f7ff ff95 	bl	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 80010b2:	4620      	mov	r0, r4
 80010b4:	f7ff ffb4 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80010b8:	4620      	mov	r0, r4
 80010ba:	f7ff ff73 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 80010be:	4620      	mov	r0, r4
 80010c0:	f7ff ffa6 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 80010c4:	4620      	mov	r0, r4
 80010c6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010ca:	f7ff bf87 	b.w	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>

080010ce <_ZN8CRGB_I2C11rgb_i2cStopEv>:
 80010ce:	b510      	push	{r4, lr}
 80010d0:	4604      	mov	r4, r0
 80010d2:	f7ff ff9d 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 80010d6:	4620      	mov	r0, r4
 80010d8:	f7ff ff64 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 80010dc:	4620      	mov	r0, r4
 80010de:	f7ff ff9f 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80010e2:	4620      	mov	r0, r4
 80010e4:	f7ff ff5e 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 80010e8:	4620      	mov	r0, r4
 80010ea:	f7ff ff99 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80010ee:	4620      	mov	r0, r4
 80010f0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010f4:	f7ff bf72 	b.w	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>

080010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>:
 80010f8:	b570      	push	{r4, r5, r6, lr}
 80010fa:	4604      	mov	r4, r0
 80010fc:	460e      	mov	r6, r1
 80010fe:	2508      	movs	r5, #8
 8001100:	4620      	mov	r0, r4
 8001102:	f7ff ff85 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001106:	0633      	lsls	r3, r6, #24
 8001108:	4620      	mov	r0, r4
 800110a:	d502      	bpl.n	8001112 <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1a>
 800110c:	f7ff ff66 	bl	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8001110:	e001      	b.n	8001116 <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x1e>
 8001112:	f7ff ff47 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 8001116:	4620      	mov	r0, r4
 8001118:	3d01      	subs	r5, #1
 800111a:	f7ff ff81 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800111e:	0076      	lsls	r6, r6, #1
 8001120:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001124:	b2f6      	uxtb	r6, r6
 8001126:	d1eb      	bne.n	8001100 <_ZN8CRGB_I2C12rgb_i2cWriteEh+0x8>
 8001128:	4620      	mov	r0, r4
 800112a:	f7ff ff71 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 800112e:	4620      	mov	r0, r4
 8001130:	f7ff ff54 	bl	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 8001134:	4620      	mov	r0, r4
 8001136:	f7ff ff73 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 800113a:	4620      	mov	r0, r4
 800113c:	f7ff ff68 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001140:	4620      	mov	r0, r4
 8001142:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001146:	f7ff bf27 	b.w	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

0800114a <_ZN8CRGB_I2C17rgb_i2c_write_regEhhh>:
 800114a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800114c:	4604      	mov	r4, r0
 800114e:	460f      	mov	r7, r1
 8001150:	4616      	mov	r6, r2
 8001152:	461d      	mov	r5, r3
 8001154:	f7ff ffa6 	bl	80010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8001158:	4620      	mov	r0, r4
 800115a:	4639      	mov	r1, r7
 800115c:	f7ff ffcc 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8001160:	4620      	mov	r0, r4
 8001162:	4631      	mov	r1, r6
 8001164:	f7ff ffc8 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8001168:	4620      	mov	r0, r4
 800116a:	4629      	mov	r1, r5
 800116c:	f7ff ffc4 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8001170:	4620      	mov	r0, r4
 8001172:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8001176:	f7ff bfaa 	b.w	80010ce <_ZN8CRGB_I2C11rgb_i2cStopEv>

0800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>:
 800117a:	2300      	movs	r3, #0
 800117c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001180:	4605      	mov	r5, r0
 8001182:	7013      	strb	r3, [r2, #0]
 8001184:	7053      	strb	r3, [r2, #1]
 8001186:	7093      	strb	r3, [r2, #2]
 8001188:	70d3      	strb	r3, [r2, #3]
 800118a:	460e      	mov	r6, r1
 800118c:	4614      	mov	r4, r2
 800118e:	1cd7      	adds	r7, r2, #3
 8001190:	f7ff ff3e 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 8001194:	4628      	mov	r0, r5
 8001196:	f7ff ff21 	bl	8000fdc <_ZN8CRGB_I2C13RGBSetHighSDAEv>
 800119a:	f04f 0808 	mov.w	r8, #8
 800119e:	1e63      	subs	r3, r4, #1
 80011a0:	f813 2f01 	ldrb.w	r2, [r3, #1]!
 80011a4:	0052      	lsls	r2, r2, #1
 80011a6:	42bb      	cmp	r3, r7
 80011a8:	701a      	strb	r2, [r3, #0]
 80011aa:	d1f9      	bne.n	80011a0 <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x26>
 80011ac:	4628      	mov	r0, r5
 80011ae:	f7ff ff37 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 80011b2:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80011b6:	8a1b      	ldrh	r3, [r3, #16]
 80011b8:	b29b      	uxth	r3, r3
 80011ba:	06d8      	lsls	r0, r3, #27
 80011bc:	bf42      	ittt	mi
 80011be:	7822      	ldrbmi	r2, [r4, #0]
 80011c0:	f042 0201 	orrmi.w	r2, r2, #1
 80011c4:	7022      	strbmi	r2, [r4, #0]
 80011c6:	0699      	lsls	r1, r3, #26
 80011c8:	bf42      	ittt	mi
 80011ca:	7862      	ldrbmi	r2, [r4, #1]
 80011cc:	f042 0201 	orrmi.w	r2, r2, #1
 80011d0:	7062      	strbmi	r2, [r4, #1]
 80011d2:	065a      	lsls	r2, r3, #25
 80011d4:	bf42      	ittt	mi
 80011d6:	78a2      	ldrbmi	r2, [r4, #2]
 80011d8:	f042 0201 	orrmi.w	r2, r2, #1
 80011dc:	70a2      	strbmi	r2, [r4, #2]
 80011de:	061b      	lsls	r3, r3, #24
 80011e0:	bf42      	ittt	mi
 80011e2:	78e3      	ldrbmi	r3, [r4, #3]
 80011e4:	f043 0301 	orrmi.w	r3, r3, #1
 80011e8:	70e3      	strbmi	r3, [r4, #3]
 80011ea:	4628      	mov	r0, r5
 80011ec:	f7ff ff10 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 80011f0:	f1b8 0801 	subs.w	r8, r8, #1
 80011f4:	d1d3      	bne.n	800119e <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x24>
 80011f6:	b116      	cbz	r6, 80011fe <_ZN8CRGB_I2C11rgb_i2cReadEhPh+0x84>
 80011f8:	4628      	mov	r0, r5
 80011fa:	f7ff fed3 	bl	8000fa4 <_ZN8CRGB_I2C12RGBSetLowSDAEv>
 80011fe:	4628      	mov	r0, r5
 8001200:	f7ff ff0e 	bl	8001020 <_ZN8CRGB_I2C13RGBSetHighSCLEv>
 8001204:	4628      	mov	r0, r5
 8001206:	f7ff ff03 	bl	8001010 <_ZN8CRGB_I2C12RGBSetLowSCLEv>
 800120a:	4628      	mov	r0, r5
 800120c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8001210:	f7ff bec2 	b.w	8000f98 <_ZN8CRGB_I2C13rgb_i2c_delayEv>

08001214 <_ZN8CRGB_I2C16rgb_i2c_read_regEhhPh>:
 8001214:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001216:	4604      	mov	r4, r0
 8001218:	460d      	mov	r5, r1
 800121a:	4617      	mov	r7, r2
 800121c:	461e      	mov	r6, r3
 800121e:	f7ff ff41 	bl	80010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8001222:	4620      	mov	r0, r4
 8001224:	4629      	mov	r1, r5
 8001226:	f7ff ff67 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 800122a:	4639      	mov	r1, r7
 800122c:	4620      	mov	r0, r4
 800122e:	f7ff ff63 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8001232:	4620      	mov	r0, r4
 8001234:	f7ff ff36 	bl	80010a4 <_ZN8CRGB_I2C12rgb_i2cStartEv>
 8001238:	4620      	mov	r0, r4
 800123a:	f045 0101 	orr.w	r1, r5, #1
 800123e:	f7ff ff5b 	bl	80010f8 <_ZN8CRGB_I2C12rgb_i2cWriteEh>
 8001242:	4620      	mov	r0, r4
 8001244:	4632      	mov	r2, r6
 8001246:	2100      	movs	r1, #0
 8001248:	f7ff ff97 	bl	800117a <_ZN8CRGB_I2C11rgb_i2cReadEhPh>
 800124c:	4620      	mov	r0, r4
 800124e:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8001252:	f7ff bf3c 	b.w	80010ce <_ZN8CRGB_I2C11rgb_i2cStopEv>

08001256 <_ZN4CI2C5delayEv>:
 8001256:	230b      	movs	r3, #11
 8001258:	3b01      	subs	r3, #1
 800125a:	d001      	beq.n	8001260 <_ZN4CI2C5delayEv+0xa>
 800125c:	bf00      	nop
 800125e:	e7fb      	b.n	8001258 <_ZN4CI2C5delayEv+0x2>
 8001260:	4770      	bx	lr
	...

08001264 <_ZN4CI2C9SetLowSDAEv>:
 8001264:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8001266:	4c0c      	ldr	r4, [pc, #48]	; (8001298 <_ZN4CI2C9SetLowSDAEv+0x34>)
 8001268:	2301      	movs	r3, #1
 800126a:	2203      	movs	r2, #3
 800126c:	4606      	mov	r6, r0
 800126e:	2580      	movs	r5, #128	; 0x80
 8001270:	f88d 3004 	strb.w	r3, [sp, #4]
 8001274:	f88d 3006 	strb.w	r3, [sp, #6]
 8001278:	4620      	mov	r0, r4
 800127a:	2300      	movs	r3, #0
 800127c:	4669      	mov	r1, sp
 800127e:	f88d 2005 	strb.w	r2, [sp, #5]
 8001282:	f88d 3007 	strb.w	r3, [sp, #7]
 8001286:	9500      	str	r5, [sp, #0]
 8001288:	f001 fbea 	bl	8002a60 <GPIO_Init>
 800128c:	8525      	strh	r5, [r4, #40]	; 0x28
 800128e:	4630      	mov	r0, r6
 8001290:	f7ff ffe1 	bl	8001256 <_ZN4CI2C5delayEv>
 8001294:	b002      	add	sp, #8
 8001296:	bd70      	pop	{r4, r5, r6, pc}
 8001298:	48000400 	.word	0x48000400

0800129c <_ZN4CI2C10SetHighSDAEv>:
 800129c:	4b05      	ldr	r3, [pc, #20]	; (80012b4 <_ZN4CI2C10SetHighSDAEv+0x18>)
 800129e:	681a      	ldr	r2, [r3, #0]
 80012a0:	f422 4240 	bic.w	r2, r2, #49152	; 0xc000
 80012a4:	601a      	str	r2, [r3, #0]
 80012a6:	681a      	ldr	r2, [r3, #0]
 80012a8:	601a      	str	r2, [r3, #0]
 80012aa:	2280      	movs	r2, #128	; 0x80
 80012ac:	619a      	str	r2, [r3, #24]
 80012ae:	f7ff bfd2 	b.w	8001256 <_ZN4CI2C5delayEv>
 80012b2:	bf00      	nop
 80012b4:	48000400 	.word	0x48000400

080012b8 <_ZN4CI2C9SetLowSCLEv>:
 80012b8:	4b02      	ldr	r3, [pc, #8]	; (80012c4 <_ZN4CI2C9SetLowSCLEv+0xc>)
 80012ba:	2240      	movs	r2, #64	; 0x40
 80012bc:	851a      	strh	r2, [r3, #40]	; 0x28
 80012be:	f7ff bfca 	b.w	8001256 <_ZN4CI2C5delayEv>
 80012c2:	bf00      	nop
 80012c4:	48000400 	.word	0x48000400

080012c8 <_ZN4CI2C10SetHighSCLEv>:
 80012c8:	4b02      	ldr	r3, [pc, #8]	; (80012d4 <_ZN4CI2C10SetHighSCLEv+0xc>)
 80012ca:	2240      	movs	r2, #64	; 0x40
 80012cc:	619a      	str	r2, [r3, #24]
 80012ce:	f7ff bfc2 	b.w	8001256 <_ZN4CI2C5delayEv>
 80012d2:	bf00      	nop
 80012d4:	48000400 	.word	0x48000400

080012d8 <_ZN4CI2C4initEv>:
 80012d8:	b513      	push	{r0, r1, r4, lr}
 80012da:	4604      	mov	r4, r0
 80012dc:	2101      	movs	r1, #1
 80012de:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80012e2:	f001 f9b5 	bl	8002650 <RCC_AHBPeriphClockCmd>
 80012e6:	23c0      	movs	r3, #192	; 0xc0
 80012e8:	9300      	str	r3, [sp, #0]
 80012ea:	2301      	movs	r3, #1
 80012ec:	2203      	movs	r2, #3
 80012ee:	4669      	mov	r1, sp
 80012f0:	f88d 3004 	strb.w	r3, [sp, #4]
 80012f4:	f88d 3006 	strb.w	r3, [sp, #6]
 80012f8:	4809      	ldr	r0, [pc, #36]	; (8001320 <_ZN4CI2C4initEv+0x48>)
 80012fa:	f88d 2005 	strb.w	r2, [sp, #5]
 80012fe:	2300      	movs	r3, #0
 8001300:	f88d 3007 	strb.w	r3, [sp, #7]
 8001304:	f001 fbac 	bl	8002a60 <GPIO_Init>
 8001308:	4620      	mov	r0, r4
 800130a:	f7ff ffdd 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 800130e:	4620      	mov	r0, r4
 8001310:	f7ff ffa8 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 8001314:	4620      	mov	r0, r4
 8001316:	f7ff ffc1 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 800131a:	b002      	add	sp, #8
 800131c:	bd10      	pop	{r4, pc}
 800131e:	bf00      	nop
 8001320:	48000400 	.word	0x48000400

08001324 <_ZN4CI2C5StartEv>:
 8001324:	b510      	push	{r4, lr}
 8001326:	4604      	mov	r4, r0
 8001328:	f7ff ffce 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 800132c:	4620      	mov	r0, r4
 800132e:	f7ff ffb5 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 8001332:	4620      	mov	r0, r4
 8001334:	f7ff ffc8 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 8001338:	4620      	mov	r0, r4
 800133a:	f7ff ff93 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 800133e:	4620      	mov	r0, r4
 8001340:	f7ff ffba 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 8001344:	4620      	mov	r0, r4
 8001346:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800134a:	f7ff bfa7 	b.w	800129c <_ZN4CI2C10SetHighSDAEv>

0800134e <_ZN4CI2C4StopEv>:
 800134e:	b510      	push	{r4, lr}
 8001350:	4604      	mov	r4, r0
 8001352:	f7ff ffb1 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 8001356:	4620      	mov	r0, r4
 8001358:	f7ff ff84 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 800135c:	4620      	mov	r0, r4
 800135e:	f7ff ffb3 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 8001362:	4620      	mov	r0, r4
 8001364:	f7ff ff7e 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 8001368:	4620      	mov	r0, r4
 800136a:	f7ff ffad 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 800136e:	4620      	mov	r0, r4
 8001370:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8001374:	f7ff bf92 	b.w	800129c <_ZN4CI2C10SetHighSDAEv>

08001378 <_ZN4CI2C5WriteEh>:
 8001378:	b570      	push	{r4, r5, r6, lr}
 800137a:	4604      	mov	r4, r0
 800137c:	460e      	mov	r6, r1
 800137e:	2508      	movs	r5, #8
 8001380:	4620      	mov	r0, r4
 8001382:	f7ff ff99 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 8001386:	0633      	lsls	r3, r6, #24
 8001388:	4620      	mov	r0, r4
 800138a:	d502      	bpl.n	8001392 <_ZN4CI2C5WriteEh+0x1a>
 800138c:	f7ff ff86 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 8001390:	e001      	b.n	8001396 <_ZN4CI2C5WriteEh+0x1e>
 8001392:	f7ff ff67 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 8001396:	4620      	mov	r0, r4
 8001398:	3d01      	subs	r5, #1
 800139a:	f7ff ff95 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 800139e:	0076      	lsls	r6, r6, #1
 80013a0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80013a4:	b2f6      	uxtb	r6, r6
 80013a6:	d1eb      	bne.n	8001380 <_ZN4CI2C5WriteEh+0x8>
 80013a8:	4620      	mov	r0, r4
 80013aa:	f7ff ff85 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 80013ae:	4620      	mov	r0, r4
 80013b0:	f7ff ff74 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 80013b4:	4620      	mov	r0, r4
 80013b6:	f7ff ff87 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 80013ba:	4b07      	ldr	r3, [pc, #28]	; (80013d8 <_ZN4CI2C5WriteEh+0x60>)
 80013bc:	8a1d      	ldrh	r5, [r3, #16]
 80013be:	4620      	mov	r0, r4
 80013c0:	f7ff ff7a 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 80013c4:	b2ad      	uxth	r5, r5
 80013c6:	4620      	mov	r0, r4
 80013c8:	f7ff ff45 	bl	8001256 <_ZN4CI2C5delayEv>
 80013cc:	f085 0080 	eor.w	r0, r5, #128	; 0x80
 80013d0:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80013d4:	bd70      	pop	{r4, r5, r6, pc}
 80013d6:	bf00      	nop
 80013d8:	48000400 	.word	0x48000400

080013dc <_ZN4CI2C9write_regEhhh>:
 80013dc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80013de:	4604      	mov	r4, r0
 80013e0:	460f      	mov	r7, r1
 80013e2:	4616      	mov	r6, r2
 80013e4:	461d      	mov	r5, r3
 80013e6:	f7ff ff9d 	bl	8001324 <_ZN4CI2C5StartEv>
 80013ea:	4639      	mov	r1, r7
 80013ec:	4620      	mov	r0, r4
 80013ee:	f7ff ffc3 	bl	8001378 <_ZN4CI2C5WriteEh>
 80013f2:	4631      	mov	r1, r6
 80013f4:	4620      	mov	r0, r4
 80013f6:	f7ff ffbf 	bl	8001378 <_ZN4CI2C5WriteEh>
 80013fa:	4620      	mov	r0, r4
 80013fc:	4629      	mov	r1, r5
 80013fe:	f7ff ffbb 	bl	8001378 <_ZN4CI2C5WriteEh>
 8001402:	4620      	mov	r0, r4
 8001404:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8001408:	f7ff bfa1 	b.w	800134e <_ZN4CI2C4StopEv>

0800140c <_ZN4CI2C4ReadEh>:
 800140c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800140e:	4605      	mov	r5, r0
 8001410:	460f      	mov	r7, r1
 8001412:	f7ff ff51 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 8001416:	2608      	movs	r6, #8
 8001418:	2400      	movs	r4, #0
 800141a:	4628      	mov	r0, r5
 800141c:	f7ff ff54 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 8001420:	4b10      	ldr	r3, [pc, #64]	; (8001464 <_ZN4CI2C4ReadEh+0x58>)
 8001422:	8a1b      	ldrh	r3, [r3, #16]
 8001424:	0064      	lsls	r4, r4, #1
 8001426:	061b      	lsls	r3, r3, #24
 8001428:	b2e4      	uxtb	r4, r4
 800142a:	4628      	mov	r0, r5
 800142c:	f106 36ff 	add.w	r6, r6, #4294967295	; 0xffffffff
 8001430:	bf48      	it	mi
 8001432:	f044 0401 	orrmi.w	r4, r4, #1
 8001436:	f7ff ff3f 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 800143a:	f016 06ff 	ands.w	r6, r6, #255	; 0xff
 800143e:	d1ec      	bne.n	800141a <_ZN4CI2C4ReadEh+0xe>
 8001440:	4628      	mov	r0, r5
 8001442:	b117      	cbz	r7, 800144a <_ZN4CI2C4ReadEh+0x3e>
 8001444:	f7ff ff0e 	bl	8001264 <_ZN4CI2C9SetLowSDAEv>
 8001448:	e001      	b.n	800144e <_ZN4CI2C4ReadEh+0x42>
 800144a:	f7ff ff27 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 800144e:	4628      	mov	r0, r5
 8001450:	f7ff ff3a 	bl	80012c8 <_ZN4CI2C10SetHighSCLEv>
 8001454:	4628      	mov	r0, r5
 8001456:	f7ff ff2f 	bl	80012b8 <_ZN4CI2C9SetLowSCLEv>
 800145a:	4628      	mov	r0, r5
 800145c:	f7ff ff1e 	bl	800129c <_ZN4CI2C10SetHighSDAEv>
 8001460:	4620      	mov	r0, r4
 8001462:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001464:	48000400 	.word	0x48000400

08001468 <_ZN4CI2C8read_regEhh>:
 8001468:	b570      	push	{r4, r5, r6, lr}
 800146a:	4604      	mov	r4, r0
 800146c:	460d      	mov	r5, r1
 800146e:	4616      	mov	r6, r2
 8001470:	f7ff ff58 	bl	8001324 <_ZN4CI2C5StartEv>
 8001474:	4629      	mov	r1, r5
 8001476:	4620      	mov	r0, r4
 8001478:	f7ff ff7e 	bl	8001378 <_ZN4CI2C5WriteEh>
 800147c:	4631      	mov	r1, r6
 800147e:	4620      	mov	r0, r4
 8001480:	f7ff ff7a 	bl	8001378 <_ZN4CI2C5WriteEh>
 8001484:	4620      	mov	r0, r4
 8001486:	f7ff ff4d 	bl	8001324 <_ZN4CI2C5StartEv>
 800148a:	f045 0101 	orr.w	r1, r5, #1
 800148e:	4620      	mov	r0, r4
 8001490:	f7ff ff72 	bl	8001378 <_ZN4CI2C5WriteEh>
 8001494:	2100      	movs	r1, #0
 8001496:	4620      	mov	r0, r4
 8001498:	f7ff ffb8 	bl	800140c <_ZN4CI2C4ReadEh>
 800149c:	4605      	mov	r5, r0
 800149e:	4620      	mov	r0, r4
 80014a0:	f7ff ff55 	bl	800134e <_ZN4CI2C4StopEv>
 80014a4:	4628      	mov	r0, r5
 80014a6:	bd70      	pop	{r4, r5, r6, pc}

080014a8 <_ZN4CIMU8imu_readEv>:
 80014a8:	b570      	push	{r4, r5, r6, lr}
 80014aa:	4c52      	ldr	r4, [pc, #328]	; (80015f4 <_ZN4CIMU8imu_readEv+0x14c>)
 80014ac:	4605      	mov	r5, r0
 80014ae:	4620      	mov	r0, r4
 80014b0:	f7ff ff38 	bl	8001324 <_ZN4CI2C5StartEv>
 80014b4:	4620      	mov	r0, r4
 80014b6:	21d4      	movs	r1, #212	; 0xd4
 80014b8:	f7ff ff5e 	bl	8001378 <_ZN4CI2C5WriteEh>
 80014bc:	21a8      	movs	r1, #168	; 0xa8
 80014be:	4620      	mov	r0, r4
 80014c0:	f7ff ff5a 	bl	8001378 <_ZN4CI2C5WriteEh>
 80014c4:	4620      	mov	r0, r4
 80014c6:	f7ff ff2d 	bl	8001324 <_ZN4CI2C5StartEv>
 80014ca:	4620      	mov	r0, r4
 80014cc:	21d5      	movs	r1, #213	; 0xd5
 80014ce:	f7ff ff53 	bl	8001378 <_ZN4CI2C5WriteEh>
 80014d2:	4620      	mov	r0, r4
 80014d4:	2101      	movs	r1, #1
 80014d6:	f7ff ff99 	bl	800140c <_ZN4CI2C4ReadEh>
 80014da:	2101      	movs	r1, #1
 80014dc:	b286      	uxth	r6, r0
 80014de:	4620      	mov	r0, r4
 80014e0:	f7ff ff94 	bl	800140c <_ZN4CI2C4ReadEh>
 80014e4:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 80014e8:	b200      	sxth	r0, r0
 80014ea:	6268      	str	r0, [r5, #36]	; 0x24
 80014ec:	2101      	movs	r1, #1
 80014ee:	4620      	mov	r0, r4
 80014f0:	f7ff ff8c 	bl	800140c <_ZN4CI2C4ReadEh>
 80014f4:	2101      	movs	r1, #1
 80014f6:	b286      	uxth	r6, r0
 80014f8:	4620      	mov	r0, r4
 80014fa:	f7ff ff87 	bl	800140c <_ZN4CI2C4ReadEh>
 80014fe:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001502:	b200      	sxth	r0, r0
 8001504:	62a8      	str	r0, [r5, #40]	; 0x28
 8001506:	2101      	movs	r1, #1
 8001508:	4620      	mov	r0, r4
 800150a:	f7ff ff7f 	bl	800140c <_ZN4CI2C4ReadEh>
 800150e:	2100      	movs	r1, #0
 8001510:	b286      	uxth	r6, r0
 8001512:	4620      	mov	r0, r4
 8001514:	f7ff ff7a 	bl	800140c <_ZN4CI2C4ReadEh>
 8001518:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 800151c:	b200      	sxth	r0, r0
 800151e:	62e8      	str	r0, [r5, #44]	; 0x2c
 8001520:	4620      	mov	r0, r4
 8001522:	f7ff ff14 	bl	800134e <_ZN4CI2C4StopEv>
 8001526:	4620      	mov	r0, r4
 8001528:	f7ff fefc 	bl	8001324 <_ZN4CI2C5StartEv>
 800152c:	4620      	mov	r0, r4
 800152e:	213c      	movs	r1, #60	; 0x3c
 8001530:	f7ff ff22 	bl	8001378 <_ZN4CI2C5WriteEh>
 8001534:	21a8      	movs	r1, #168	; 0xa8
 8001536:	4620      	mov	r0, r4
 8001538:	f7ff ff1e 	bl	8001378 <_ZN4CI2C5WriteEh>
 800153c:	4620      	mov	r0, r4
 800153e:	f7ff fef1 	bl	8001324 <_ZN4CI2C5StartEv>
 8001542:	4620      	mov	r0, r4
 8001544:	213d      	movs	r1, #61	; 0x3d
 8001546:	f7ff ff17 	bl	8001378 <_ZN4CI2C5WriteEh>
 800154a:	4620      	mov	r0, r4
 800154c:	2101      	movs	r1, #1
 800154e:	f7ff ff5d 	bl	800140c <_ZN4CI2C4ReadEh>
 8001552:	2101      	movs	r1, #1
 8001554:	b286      	uxth	r6, r0
 8001556:	4620      	mov	r0, r4
 8001558:	f7ff ff58 	bl	800140c <_ZN4CI2C4ReadEh>
 800155c:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001560:	b200      	sxth	r0, r0
 8001562:	6328      	str	r0, [r5, #48]	; 0x30
 8001564:	2101      	movs	r1, #1
 8001566:	4620      	mov	r0, r4
 8001568:	f7ff ff50 	bl	800140c <_ZN4CI2C4ReadEh>
 800156c:	2101      	movs	r1, #1
 800156e:	b286      	uxth	r6, r0
 8001570:	4620      	mov	r0, r4
 8001572:	f7ff ff4b 	bl	800140c <_ZN4CI2C4ReadEh>
 8001576:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 800157a:	b200      	sxth	r0, r0
 800157c:	6368      	str	r0, [r5, #52]	; 0x34
 800157e:	2101      	movs	r1, #1
 8001580:	4620      	mov	r0, r4
 8001582:	f7ff ff43 	bl	800140c <_ZN4CI2C4ReadEh>
 8001586:	2100      	movs	r1, #0
 8001588:	b286      	uxth	r6, r0
 800158a:	4620      	mov	r0, r4
 800158c:	f7ff ff3e 	bl	800140c <_ZN4CI2C4ReadEh>
 8001590:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
 8001594:	b200      	sxth	r0, r0
 8001596:	63a8      	str	r0, [r5, #56]	; 0x38
 8001598:	4620      	mov	r0, r4
 800159a:	f7ff fed8 	bl	800134e <_ZN4CI2C4StopEv>
 800159e:	686a      	ldr	r2, [r5, #4]
 80015a0:	6aab      	ldr	r3, [r5, #40]	; 0x28
 80015a2:	68a8      	ldr	r0, [r5, #8]
 80015a4:	1a9b      	subs	r3, r3, r2
 80015a6:	68ea      	ldr	r2, [r5, #12]
 80015a8:	26c8      	movs	r6, #200	; 0xc8
 80015aa:	fb93 f3f6 	sdiv	r3, r3, r6
 80015ae:	441a      	add	r2, r3
 80015b0:	6beb      	ldr	r3, [r5, #60]	; 0x3c
 80015b2:	60ea      	str	r2, [r5, #12]
 80015b4:	2155      	movs	r1, #85	; 0x55
 80015b6:	4359      	muls	r1, r3
 80015b8:	f640 14e2 	movw	r4, #2530	; 0x9e2
 80015bc:	434a      	muls	r2, r1
 80015be:	6a6b      	ldr	r3, [r5, #36]	; 0x24
 80015c0:	fb92 f2f4 	sdiv	r2, r2, r4
 80015c4:	61aa      	str	r2, [r5, #24]
 80015c6:	682a      	ldr	r2, [r5, #0]
 80015c8:	1a9b      	subs	r3, r3, r2
 80015ca:	692a      	ldr	r2, [r5, #16]
 80015cc:	fb93 f3f6 	sdiv	r3, r3, r6
 80015d0:	441a      	add	r2, r3
 80015d2:	612a      	str	r2, [r5, #16]
 80015d4:	434a      	muls	r2, r1
 80015d6:	fb92 f2f4 	sdiv	r2, r2, r4
 80015da:	61ea      	str	r2, [r5, #28]
 80015dc:	6aea      	ldr	r2, [r5, #44]	; 0x2c
 80015de:	1a12      	subs	r2, r2, r0
 80015e0:	fb92 f0f6 	sdiv	r0, r2, r6
 80015e4:	696a      	ldr	r2, [r5, #20]
 80015e6:	1883      	adds	r3, r0, r2
 80015e8:	616b      	str	r3, [r5, #20]
 80015ea:	434b      	muls	r3, r1
 80015ec:	fb93 f3f4 	sdiv	r3, r3, r4
 80015f0:	622b      	str	r3, [r5, #32]
 80015f2:	bd70      	pop	{r4, r5, r6, pc}
 80015f4:	20000160 	.word	0x20000160

080015f8 <_ZN4CIMU8imu_initEv>:
 80015f8:	230a      	movs	r3, #10
 80015fa:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80015fe:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001600:	2300      	movs	r3, #0
 8001602:	4604      	mov	r4, r0
 8001604:	6003      	str	r3, [r0, #0]
 8001606:	6043      	str	r3, [r0, #4]
 8001608:	6083      	str	r3, [r0, #8]
 800160a:	60c3      	str	r3, [r0, #12]
 800160c:	6103      	str	r3, [r0, #16]
 800160e:	6143      	str	r3, [r0, #20]
 8001610:	f242 7511 	movw	r5, #10001	; 0x2711
 8001614:	3d01      	subs	r5, #1
 8001616:	d001      	beq.n	800161c <_ZN4CIMU8imu_initEv+0x24>
 8001618:	bf00      	nop
 800161a:	e7fb      	b.n	8001614 <_ZN4CIMU8imu_initEv+0x1c>
 800161c:	4832      	ldr	r0, [pc, #200]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 800161e:	21d4      	movs	r1, #212	; 0xd4
 8001620:	220f      	movs	r2, #15
 8001622:	f7ff ff21 	bl	8001468 <_ZN4CI2C8read_regEhh>
 8001626:	28d4      	cmp	r0, #212	; 0xd4
 8001628:	4606      	mov	r6, r0
 800162a:	d155      	bne.n	80016d8 <_ZN4CIMU8imu_initEv+0xe0>
 800162c:	482e      	ldr	r0, [pc, #184]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 800162e:	213c      	movs	r1, #60	; 0x3c
 8001630:	220f      	movs	r2, #15
 8001632:	f7ff ff19 	bl	8001468 <_ZN4CI2C8read_regEhh>
 8001636:	2849      	cmp	r0, #73	; 0x49
 8001638:	d152      	bne.n	80016e0 <_ZN4CIMU8imu_initEv+0xe8>
 800163a:	4631      	mov	r1, r6
 800163c:	482a      	ldr	r0, [pc, #168]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 800163e:	2220      	movs	r2, #32
 8001640:	23ff      	movs	r3, #255	; 0xff
 8001642:	f7ff fecb 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8001646:	4631      	mov	r1, r6
 8001648:	4827      	ldr	r0, [pc, #156]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 800164a:	4e28      	ldr	r6, [pc, #160]	; (80016ec <_ZN4CIMU8imu_initEv+0xf4>)
 800164c:	2223      	movs	r2, #35	; 0x23
 800164e:	2310      	movs	r3, #16
 8001650:	f7ff fec4 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8001654:	4824      	ldr	r0, [pc, #144]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 8001656:	213c      	movs	r1, #60	; 0x3c
 8001658:	221f      	movs	r2, #31
 800165a:	462b      	mov	r3, r5
 800165c:	f7ff febe 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8001660:	4821      	ldr	r0, [pc, #132]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 8001662:	213c      	movs	r1, #60	; 0x3c
 8001664:	2220      	movs	r2, #32
 8001666:	2367      	movs	r3, #103	; 0x67
 8001668:	f7ff feb8 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 800166c:	481e      	ldr	r0, [pc, #120]	; (80016e8 <_ZN4CIMU8imu_initEv+0xf0>)
 800166e:	213c      	movs	r1, #60	; 0x3c
 8001670:	2221      	movs	r2, #33	; 0x21
 8001672:	462b      	mov	r3, r5
 8001674:	f7ff feb2 	bl	80013dc <_ZN4CI2C9write_regEhhh>
 8001678:	3e01      	subs	r6, #1
 800167a:	d001      	beq.n	8001680 <_ZN4CIMU8imu_initEv+0x88>
 800167c:	bf00      	nop
 800167e:	e7fb      	b.n	8001678 <_ZN4CIMU8imu_initEv+0x80>
 8001680:	4620      	mov	r0, r4
 8001682:	f7ff ff11 	bl	80014a8 <_ZN4CIMU8imu_readEv>
 8001686:	2564      	movs	r5, #100	; 0x64
 8001688:	4637      	mov	r7, r6
 800168a:	46b0      	mov	r8, r6
 800168c:	2365      	movs	r3, #101	; 0x65
 800168e:	3b01      	subs	r3, #1
 8001690:	d001      	beq.n	8001696 <_ZN4CIMU8imu_initEv+0x9e>
 8001692:	bf00      	nop
 8001694:	e7fb      	b.n	800168e <_ZN4CIMU8imu_initEv+0x96>
 8001696:	4620      	mov	r0, r4
 8001698:	f7ff ff06 	bl	80014a8 <_ZN4CIMU8imu_readEv>
 800169c:	6a63      	ldr	r3, [r4, #36]	; 0x24
 800169e:	4498      	add	r8, r3
 80016a0:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 80016a2:	441f      	add	r7, r3
 80016a4:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 80016a6:	3d01      	subs	r5, #1
 80016a8:	441e      	add	r6, r3
 80016aa:	d1ef      	bne.n	800168c <_ZN4CIMU8imu_initEv+0x94>
 80016ac:	2264      	movs	r2, #100	; 0x64
 80016ae:	6325      	str	r5, [r4, #48]	; 0x30
 80016b0:	fb98 f3f2 	sdiv	r3, r8, r2
 80016b4:	fb97 f7f2 	sdiv	r7, r7, r2
 80016b8:	fb96 f6f2 	sdiv	r6, r6, r2
 80016bc:	6023      	str	r3, [r4, #0]
 80016be:	6067      	str	r7, [r4, #4]
 80016c0:	60a6      	str	r6, [r4, #8]
 80016c2:	6365      	str	r5, [r4, #52]	; 0x34
 80016c4:	63a5      	str	r5, [r4, #56]	; 0x38
 80016c6:	6265      	str	r5, [r4, #36]	; 0x24
 80016c8:	62a5      	str	r5, [r4, #40]	; 0x28
 80016ca:	62e5      	str	r5, [r4, #44]	; 0x2c
 80016cc:	61a5      	str	r5, [r4, #24]
 80016ce:	61e5      	str	r5, [r4, #28]
 80016d0:	6225      	str	r5, [r4, #32]
 80016d2:	4628      	mov	r0, r5
 80016d4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80016d8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80016dc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80016e0:	f06f 0001 	mvn.w	r0, #1
 80016e4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80016e8:	20000160 	.word	0x20000160
 80016ec:	000186a1 	.word	0x000186a1

080016f0 <_ZN4CIMU14get_imu_resultEv>:
 80016f0:	3018      	adds	r0, #24
 80016f2:	4770      	bx	lr

080016f4 <_ZN5CGPIO9gpio_initEv>:
 80016f4:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 80016f8:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80016fc:	2101      	movs	r1, #1
 80016fe:	f000 ffa7 	bl	8002650 <RCC_AHBPeriphClockCmd>
 8001702:	4f22      	ldr	r7, [pc, #136]	; (800178c <_ZN5CGPIO9gpio_initEv+0x98>)
 8001704:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001708:	2101      	movs	r1, #1
 800170a:	f000 ffa1 	bl	8002650 <RCC_AHBPeriphClockCmd>
 800170e:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8001712:	2101      	movs	r1, #1
 8001714:	f000 ff9c 	bl	8002650 <RCC_AHBPeriphClockCmd>
 8001718:	2400      	movs	r4, #0
 800171a:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800171e:	2503      	movs	r5, #3
 8001720:	f04f 0801 	mov.w	r8, #1
 8001724:	4638      	mov	r0, r7
 8001726:	4669      	mov	r1, sp
 8001728:	9300      	str	r3, [sp, #0]
 800172a:	2608      	movs	r6, #8
 800172c:	f88d 8004 	strb.w	r8, [sp, #4]
 8001730:	f88d 4006 	strb.w	r4, [sp, #6]
 8001734:	f88d 5005 	strb.w	r5, [sp, #5]
 8001738:	f88d 4007 	strb.w	r4, [sp, #7]
 800173c:	f001 f990 	bl	8002a60 <GPIO_Init>
 8001740:	4669      	mov	r1, sp
 8001742:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001746:	9600      	str	r6, [sp, #0]
 8001748:	f88d 8004 	strb.w	r8, [sp, #4]
 800174c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001750:	f88d 5005 	strb.w	r5, [sp, #5]
 8001754:	f88d 4007 	strb.w	r4, [sp, #7]
 8001758:	f001 f982 	bl	8002a60 <GPIO_Init>
 800175c:	f44f 7300 	mov.w	r3, #512	; 0x200
 8001760:	4638      	mov	r0, r7
 8001762:	4669      	mov	r1, sp
 8001764:	9300      	str	r3, [sp, #0]
 8001766:	f88d 4004 	strb.w	r4, [sp, #4]
 800176a:	f88d 5005 	strb.w	r5, [sp, #5]
 800176e:	f88d 4007 	strb.w	r4, [sp, #7]
 8001772:	f001 f975 	bl	8002a60 <GPIO_Init>
 8001776:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800177a:	4620      	mov	r0, r4
 800177c:	851e      	strh	r6, [r3, #40]	; 0x28
 800177e:	4b04      	ldr	r3, [pc, #16]	; (8001790 <_ZN5CGPIO9gpio_initEv+0x9c>)
 8001780:	601c      	str	r4, [r3, #0]
 8001782:	4b04      	ldr	r3, [pc, #16]	; (8001794 <_ZN5CGPIO9gpio_initEv+0xa0>)
 8001784:	601c      	str	r4, [r3, #0]
 8001786:	b002      	add	sp, #8
 8001788:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800178c:	48000400 	.word	0x48000400
 8001790:	20000164 	.word	0x20000164
 8001794:	20000168 	.word	0x20000168

08001798 <_ZN5CGPIO7gpio_onEm>:
 8001798:	2908      	cmp	r1, #8
 800179a:	d005      	beq.n	80017a8 <_ZN5CGPIO7gpio_onEm+0x10>
 800179c:	f5b1 4f00 	cmp.w	r1, #32768	; 0x8000
 80017a0:	d105      	bne.n	80017ae <_ZN5CGPIO7gpio_onEm+0x16>
 80017a2:	4b03      	ldr	r3, [pc, #12]	; (80017b0 <_ZN5CGPIO7gpio_onEm+0x18>)
 80017a4:	6199      	str	r1, [r3, #24]
 80017a6:	4770      	bx	lr
 80017a8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80017ac:	8519      	strh	r1, [r3, #40]	; 0x28
 80017ae:	4770      	bx	lr
 80017b0:	48000400 	.word	0x48000400

080017b4 <_ZN5CGPIO8gpio_offEm>:
 80017b4:	2908      	cmp	r1, #8
 80017b6:	d005      	beq.n	80017c4 <_ZN5CGPIO8gpio_offEm+0x10>
 80017b8:	f5b1 4f00 	cmp.w	r1, #32768	; 0x8000
 80017bc:	d105      	bne.n	80017ca <_ZN5CGPIO8gpio_offEm+0x16>
 80017be:	4b03      	ldr	r3, [pc, #12]	; (80017cc <_ZN5CGPIO8gpio_offEm+0x18>)
 80017c0:	8519      	strh	r1, [r3, #40]	; 0x28
 80017c2:	4770      	bx	lr
 80017c4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80017c8:	6199      	str	r1, [r3, #24]
 80017ca:	4770      	bx	lr
 80017cc:	48000400 	.word	0x48000400

080017d0 <_ZN5CGPIO7gpio_inEm>:
 80017d0:	4b02      	ldr	r3, [pc, #8]	; (80017dc <_ZN5CGPIO7gpio_inEm+0xc>)
 80017d2:	8a18      	ldrh	r0, [r3, #16]
 80017d4:	b280      	uxth	r0, r0
 80017d6:	ea21 0000 	bic.w	r0, r1, r0
 80017da:	4770      	bx	lr
 80017dc:	48000400 	.word	0x48000400

080017e0 <EXTI9_5_IRQHandler>:
 80017e0:	4a03      	ldr	r2, [pc, #12]	; (80017f0 <EXTI9_5_IRQHandler+0x10>)
 80017e2:	6813      	ldr	r3, [r2, #0]
 80017e4:	2006      	movs	r0, #6
 80017e6:	3301      	adds	r3, #1
 80017e8:	6013      	str	r3, [r2, #0]
 80017ea:	f001 b92d 	b.w	8002a48 <EXTI_ClearITPendingBit>
 80017ee:	bf00      	nop
 80017f0:	20000164 	.word	0x20000164

080017f4 <EXTI15_10_IRQHandler>:
 80017f4:	4a03      	ldr	r2, [pc, #12]	; (8001804 <EXTI15_10_IRQHandler+0x10>)
 80017f6:	6813      	ldr	r3, [r2, #0]
 80017f8:	200c      	movs	r0, #12
 80017fa:	3301      	adds	r3, #1
 80017fc:	6013      	str	r3, [r2, #0]
 80017fe:	f001 b923 	b.w	8002a48 <EXTI_ClearITPendingBit>
 8001802:	bf00      	nop
 8001804:	20000168 	.word	0x20000168

08001808 <_ZN9CTerminal12clear_bufferEv>:
 8001808:	4a05      	ldr	r2, [pc, #20]	; (8001820 <_ZN9CTerminal12clear_bufferEv+0x18>)
 800180a:	2300      	movs	r3, #0
 800180c:	6013      	str	r3, [r2, #0]
 800180e:	4a05      	ldr	r2, [pc, #20]	; (8001824 <_ZN9CTerminal12clear_bufferEv+0x1c>)
 8001810:	6013      	str	r3, [r2, #0]
 8001812:	4a05      	ldr	r2, [pc, #20]	; (8001828 <_ZN9CTerminal12clear_bufferEv+0x20>)
 8001814:	2100      	movs	r1, #0
 8001816:	54d1      	strb	r1, [r2, r3]
 8001818:	3301      	adds	r3, #1
 800181a:	2b10      	cmp	r3, #16
 800181c:	d1f9      	bne.n	8001812 <_ZN9CTerminal12clear_bufferEv+0xa>
 800181e:	4770      	bx	lr
 8001820:	2000016c 	.word	0x2000016c
 8001824:	20000180 	.word	0x20000180
 8001828:	20000170 	.word	0x20000170

0800182c <_ZN9CTerminal13terminal_initEv>:
 800182c:	b570      	push	{r4, r5, r6, lr}
 800182e:	b08a      	sub	sp, #40	; 0x28
 8001830:	f7ff ffea 	bl	8001808 <_ZN9CTerminal12clear_bufferEv>
 8001834:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001838:	2101      	movs	r1, #1
 800183a:	f000 ff09 	bl	8002650 <RCC_AHBPeriphClockCmd>
 800183e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001842:	2101      	movs	r1, #1
 8001844:	f000 ff12 	bl	800266c <RCC_APB2PeriphClockCmd>
 8001848:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 800184c:	9302      	str	r3, [sp, #8]
 800184e:	2302      	movs	r3, #2
 8001850:	2400      	movs	r4, #0
 8001852:	f88d 300c 	strb.w	r3, [sp, #12]
 8001856:	a902      	add	r1, sp, #8
 8001858:	2303      	movs	r3, #3
 800185a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800185e:	f88d 300d 	strb.w	r3, [sp, #13]
 8001862:	f88d 400e 	strb.w	r4, [sp, #14]
 8001866:	f88d 400f 	strb.w	r4, [sp, #15]
 800186a:	f001 f8f9 	bl	8002a60 <GPIO_Init>
 800186e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001872:	2109      	movs	r1, #9
 8001874:	2207      	movs	r2, #7
 8001876:	f001 f939 	bl	8002aec <GPIO_PinAFConfig>
 800187a:	4d18      	ldr	r5, [pc, #96]	; (80018dc <_ZN9CTerminal13terminal_initEv+0xb0>)
 800187c:	2207      	movs	r2, #7
 800187e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001882:	210a      	movs	r1, #10
 8001884:	f001 f932 	bl	8002aec <GPIO_PinAFConfig>
 8001888:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 800188c:	9304      	str	r3, [sp, #16]
 800188e:	4628      	mov	r0, r5
 8001890:	230c      	movs	r3, #12
 8001892:	a904      	add	r1, sp, #16
 8001894:	9308      	str	r3, [sp, #32]
 8001896:	9405      	str	r4, [sp, #20]
 8001898:	9406      	str	r4, [sp, #24]
 800189a:	9407      	str	r4, [sp, #28]
 800189c:	9409      	str	r4, [sp, #36]	; 0x24
 800189e:	f000 ff65 	bl	800276c <USART_Init>
 80018a2:	4628      	mov	r0, r5
 80018a4:	2101      	movs	r1, #1
 80018a6:	f000 ffc3 	bl	8002830 <USART_Cmd>
 80018aa:	2201      	movs	r2, #1
 80018ac:	4628      	mov	r0, r5
 80018ae:	490c      	ldr	r1, [pc, #48]	; (80018e0 <_ZN9CTerminal13terminal_initEv+0xb4>)
 80018b0:	f000 ffce 	bl	8002850 <USART_ITConfig>
 80018b4:	2601      	movs	r6, #1
 80018b6:	2325      	movs	r3, #37	; 0x25
 80018b8:	a801      	add	r0, sp, #4
 80018ba:	f88d 3004 	strb.w	r3, [sp, #4]
 80018be:	f88d 4005 	strb.w	r4, [sp, #5]
 80018c2:	f88d 4006 	strb.w	r4, [sp, #6]
 80018c6:	f88d 6007 	strb.w	r6, [sp, #7]
 80018ca:	f001 f883 	bl	80029d4 <NVIC_Init>
 80018ce:	4628      	mov	r0, r5
 80018d0:	4631      	mov	r1, r6
 80018d2:	f000 ffad 	bl	8002830 <USART_Cmd>
 80018d6:	4620      	mov	r0, r4
 80018d8:	b00a      	add	sp, #40	; 0x28
 80018da:	bd70      	pop	{r4, r5, r6, pc}
 80018dc:	40013800 	.word	0x40013800
 80018e0:	00050105 	.word	0x00050105

080018e4 <USART1_IRQHandler>:
 80018e4:	b508      	push	{r3, lr}
 80018e6:	480d      	ldr	r0, [pc, #52]	; (800191c <USART1_IRQHandler+0x38>)
 80018e8:	490d      	ldr	r1, [pc, #52]	; (8001920 <USART1_IRQHandler+0x3c>)
 80018ea:	f000 ffcb 	bl	8002884 <USART_GetITStatus>
 80018ee:	b178      	cbz	r0, 8001910 <USART1_IRQHandler+0x2c>
 80018f0:	480a      	ldr	r0, [pc, #40]	; (800191c <USART1_IRQHandler+0x38>)
 80018f2:	f000 ffa8 	bl	8002846 <USART_ReceiveData>
 80018f6:	4b0b      	ldr	r3, [pc, #44]	; (8001924 <USART1_IRQHandler+0x40>)
 80018f8:	490b      	ldr	r1, [pc, #44]	; (8001928 <USART1_IRQHandler+0x44>)
 80018fa:	681a      	ldr	r2, [r3, #0]
 80018fc:	b2c0      	uxtb	r0, r0
 80018fe:	5488      	strb	r0, [r1, r2]
 8001900:	681a      	ldr	r2, [r3, #0]
 8001902:	3201      	adds	r2, #1
 8001904:	601a      	str	r2, [r3, #0]
 8001906:	681a      	ldr	r2, [r3, #0]
 8001908:	2a0f      	cmp	r2, #15
 800190a:	bf84      	itt	hi
 800190c:	2200      	movhi	r2, #0
 800190e:	601a      	strhi	r2, [r3, #0]
 8001910:	4802      	ldr	r0, [pc, #8]	; (800191c <USART1_IRQHandler+0x38>)
 8001912:	4903      	ldr	r1, [pc, #12]	; (8001920 <USART1_IRQHandler+0x3c>)
 8001914:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001918:	f000 bfd2 	b.w	80028c0 <USART_ClearITPendingBit>
 800191c:	40013800 	.word	0x40013800
 8001920:	00050105 	.word	0x00050105
 8001924:	2000016c 	.word	0x2000016c
 8001928:	20000170 	.word	0x20000170

0800192c <_ZN9CTerminal7putcharEc>:
 800192c:	4b04      	ldr	r3, [pc, #16]	; (8001940 <_ZN9CTerminal7putcharEc+0x14>)
 800192e:	69da      	ldr	r2, [r3, #28]
 8001930:	0612      	lsls	r2, r2, #24
 8001932:	d401      	bmi.n	8001938 <_ZN9CTerminal7putcharEc+0xc>
 8001934:	bf00      	nop
 8001936:	e7f9      	b.n	800192c <_ZN9CTerminal7putcharEc>
 8001938:	b289      	uxth	r1, r1
 800193a:	8519      	strh	r1, [r3, #40]	; 0x28
 800193c:	4770      	bx	lr
 800193e:	bf00      	nop
 8001940:	40013800 	.word	0x40013800

08001944 <_ZN9CTerminal6ischarEv>:
 8001944:	4b0a      	ldr	r3, [pc, #40]	; (8001970 <_ZN9CTerminal6ischarEv+0x2c>)
 8001946:	4a0b      	ldr	r2, [pc, #44]	; (8001974 <_ZN9CTerminal6ischarEv+0x30>)
 8001948:	6819      	ldr	r1, [r3, #0]
 800194a:	6812      	ldr	r2, [r2, #0]
 800194c:	4291      	cmp	r1, r2
 800194e:	d00c      	beq.n	800196a <_ZN9CTerminal6ischarEv+0x26>
 8001950:	681a      	ldr	r2, [r3, #0]
 8001952:	4909      	ldr	r1, [pc, #36]	; (8001978 <_ZN9CTerminal6ischarEv+0x34>)
 8001954:	5c88      	ldrb	r0, [r1, r2]
 8001956:	681a      	ldr	r2, [r3, #0]
 8001958:	3201      	adds	r2, #1
 800195a:	601a      	str	r2, [r3, #0]
 800195c:	681a      	ldr	r2, [r3, #0]
 800195e:	2a0f      	cmp	r2, #15
 8001960:	b2c0      	uxtb	r0, r0
 8001962:	d904      	bls.n	800196e <_ZN9CTerminal6ischarEv+0x2a>
 8001964:	2200      	movs	r2, #0
 8001966:	601a      	str	r2, [r3, #0]
 8001968:	4770      	bx	lr
 800196a:	f64f 70ff 	movw	r0, #65535	; 0xffff
 800196e:	4770      	bx	lr
 8001970:	20000180 	.word	0x20000180
 8001974:	2000016c 	.word	0x2000016c
 8001978:	20000170 	.word	0x20000170

0800197c <_ZN9CTerminal7getcharEv>:
 800197c:	b510      	push	{r4, lr}
 800197e:	4604      	mov	r4, r0
 8001980:	4620      	mov	r0, r4
 8001982:	f7ff ffdf 	bl	8001944 <_ZN9CTerminal6ischarEv>
 8001986:	f64f 73ff 	movw	r3, #65535	; 0xffff
 800198a:	4298      	cmp	r0, r3
 800198c:	d101      	bne.n	8001992 <_ZN9CTerminal7getcharEv+0x16>
 800198e:	bf00      	nop
 8001990:	e7f6      	b.n	8001980 <_ZN9CTerminal7getcharEv+0x4>
 8001992:	bd10      	pop	{r4, pc}

08001994 <_ZN9CTerminal4putsEPc>:
 8001994:	b538      	push	{r3, r4, r5, lr}
 8001996:	4605      	mov	r5, r0
 8001998:	1e4c      	subs	r4, r1, #1
 800199a:	f814 1f01 	ldrb.w	r1, [r4, #1]!
 800199e:	b119      	cbz	r1, 80019a8 <_ZN9CTerminal4putsEPc+0x14>
 80019a0:	4628      	mov	r0, r5
 80019a2:	f7ff ffc3 	bl	800192c <_ZN9CTerminal7putcharEc>
 80019a6:	e7f8      	b.n	800199a <_ZN9CTerminal4putsEPc+0x6>
 80019a8:	2001      	movs	r0, #1
 80019aa:	bd38      	pop	{r3, r4, r5, pc}

080019ac <_ZN9CTerminal4putiEl>:
 80019ac:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80019ae:	1e0b      	subs	r3, r1, #0
 80019b0:	f04f 0200 	mov.w	r2, #0
 80019b4:	bfba      	itte	lt
 80019b6:	425b      	neglt	r3, r3
 80019b8:	2501      	movlt	r5, #1
 80019ba:	4615      	movge	r5, r2
 80019bc:	f88d 200f 	strb.w	r2, [sp, #15]
 80019c0:	210a      	movs	r1, #10
 80019c2:	220a      	movs	r2, #10
 80019c4:	ac01      	add	r4, sp, #4
 80019c6:	fb93 f6f2 	sdiv	r6, r3, r2
 80019ca:	fb02 3316 	mls	r3, r2, r6, r3
 80019ce:	3330      	adds	r3, #48	; 0x30
 80019d0:	550b      	strb	r3, [r1, r4]
 80019d2:	1e4a      	subs	r2, r1, #1
 80019d4:	4633      	mov	r3, r6
 80019d6:	b10e      	cbz	r6, 80019dc <_ZN9CTerminal4putiEl+0x30>
 80019d8:	4611      	mov	r1, r2
 80019da:	e7f2      	b.n	80019c2 <_ZN9CTerminal4putiEl+0x16>
 80019dc:	b12d      	cbz	r5, 80019ea <_ZN9CTerminal4putiEl+0x3e>
 80019de:	ab04      	add	r3, sp, #16
 80019e0:	4413      	add	r3, r2
 80019e2:	212d      	movs	r1, #45	; 0x2d
 80019e4:	f803 1c0c 	strb.w	r1, [r3, #-12]
 80019e8:	4611      	mov	r1, r2
 80019ea:	4421      	add	r1, r4
 80019ec:	f7ff ffd2 	bl	8001994 <_ZN9CTerminal4putsEPc>
 80019f0:	b004      	add	sp, #16
 80019f2:	bd70      	pop	{r4, r5, r6, pc}

080019f4 <_ZN9CTerminal5putuiEm>:
 80019f4:	b530      	push	{r4, r5, lr}
 80019f6:	b085      	sub	sp, #20
 80019f8:	2300      	movs	r3, #0
 80019fa:	f88d 300f 	strb.w	r3, [sp, #15]
 80019fe:	220a      	movs	r2, #10
 8001a00:	230a      	movs	r3, #10
 8001a02:	ac01      	add	r4, sp, #4
 8001a04:	fbb1 f5f3 	udiv	r5, r1, r3
 8001a08:	fb03 1315 	mls	r3, r3, r5, r1
 8001a0c:	3330      	adds	r3, #48	; 0x30
 8001a0e:	5513      	strb	r3, [r2, r4]
 8001a10:	4629      	mov	r1, r5
 8001a12:	1e53      	subs	r3, r2, #1
 8001a14:	b10d      	cbz	r5, 8001a1a <_ZN9CTerminal5putuiEm+0x26>
 8001a16:	461a      	mov	r2, r3
 8001a18:	e7f2      	b.n	8001a00 <_ZN9CTerminal5putuiEm+0xc>
 8001a1a:	18a1      	adds	r1, r4, r2
 8001a1c:	f7ff ffba 	bl	8001994 <_ZN9CTerminal4putsEPc>
 8001a20:	b005      	add	sp, #20
 8001a22:	bd30      	pop	{r4, r5, pc}

08001a24 <_ZN9CTerminal4putxEm>:
 8001a24:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8001a26:	2300      	movs	r3, #0
 8001a28:	f88d 300f 	strb.w	r3, [sp, #15]
 8001a2c:	220a      	movs	r2, #10
 8001a2e:	f001 030f 	and.w	r3, r1, #15
 8001a32:	2b09      	cmp	r3, #9
 8001a34:	ac01      	add	r4, sp, #4
 8001a36:	bfd4      	ite	le
 8001a38:	3330      	addle	r3, #48	; 0x30
 8001a3a:	3357      	addgt	r3, #87	; 0x57
 8001a3c:	0909      	lsrs	r1, r1, #4
 8001a3e:	54a3      	strb	r3, [r4, r2]
 8001a40:	f102 33ff 	add.w	r3, r2, #4294967295	; 0xffffffff
 8001a44:	d001      	beq.n	8001a4a <_ZN9CTerminal4putxEm+0x26>
 8001a46:	461a      	mov	r2, r3
 8001a48:	e7f1      	b.n	8001a2e <_ZN9CTerminal4putxEm+0xa>
 8001a4a:	18a1      	adds	r1, r4, r2
 8001a4c:	f7ff ffa2 	bl	8001994 <_ZN9CTerminal4putsEPc>
 8001a50:	b004      	add	sp, #16
 8001a52:	bd10      	pop	{r4, pc}

08001a54 <_ZN9CTerminal4putfEfj>:
 8001a54:	b538      	push	{r3, r4, r5, lr}
 8001a56:	2200      	movs	r2, #0
 8001a58:	4605      	mov	r5, r0
 8001a5a:	2301      	movs	r3, #1
 8001a5c:	428a      	cmp	r2, r1
 8001a5e:	d003      	beq.n	8001a68 <_ZN9CTerminal4putfEfj+0x14>
 8001a60:	200a      	movs	r0, #10
 8001a62:	4343      	muls	r3, r0
 8001a64:	3201      	adds	r2, #1
 8001a66:	e7f9      	b.n	8001a5c <_ZN9CTerminal4putfEfj+0x8>
 8001a68:	eebd 7ac0 	vcvt.s32.f32	s14, s0
 8001a6c:	4628      	mov	r0, r5
 8001a6e:	eef8 7ac7 	vcvt.f32.s32	s15, s14
 8001a72:	ee17 1a10 	vmov	r1, s14
 8001a76:	ee30 0a67 	vsub.f32	s0, s0, s15
 8001a7a:	ee07 3a90 	vmov	s15, r3
 8001a7e:	eef8 7a67 	vcvt.f32.u32	s15, s15
 8001a82:	ee20 0a27 	vmul.f32	s0, s0, s15
 8001a86:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 8001a8a:	ee17 4a90 	vmov	r4, s15
 8001a8e:	f7ff ff8d 	bl	80019ac <_ZN9CTerminal4putiEl>
 8001a92:	4628      	mov	r0, r5
 8001a94:	212e      	movs	r1, #46	; 0x2e
 8001a96:	f7ff ff49 	bl	800192c <_ZN9CTerminal7putcharEc>
 8001a9a:	ea84 71e4 	eor.w	r1, r4, r4, asr #31
 8001a9e:	4628      	mov	r0, r5
 8001aa0:	eba1 71e4 	sub.w	r1, r1, r4, asr #31
 8001aa4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001aa8:	f7ff bf80 	b.w	80019ac <_ZN9CTerminal4putiEl>

08001aac <_ZN9CTerminal6printfEPKcz>:
 8001aac:	b40e      	push	{r1, r2, r3}
 8001aae:	b577      	push	{r0, r1, r2, r4, r5, r6, lr}
 8001ab0:	ab07      	add	r3, sp, #28
 8001ab2:	4604      	mov	r4, r0
 8001ab4:	f853 6b04 	ldr.w	r6, [r3], #4
 8001ab8:	9301      	str	r3, [sp, #4]
 8001aba:	2500      	movs	r5, #0
 8001abc:	5d71      	ldrb	r1, [r6, r5]
 8001abe:	2900      	cmp	r1, #0
 8001ac0:	d054      	beq.n	8001b6c <_ZN9CTerminal6printfEPKcz+0xc0>
 8001ac2:	2925      	cmp	r1, #37	; 0x25
 8001ac4:	d004      	beq.n	8001ad0 <_ZN9CTerminal6printfEPKcz+0x24>
 8001ac6:	4620      	mov	r0, r4
 8001ac8:	f7ff ff30 	bl	800192c <_ZN9CTerminal7putcharEc>
 8001acc:	3501      	adds	r5, #1
 8001ace:	e7f5      	b.n	8001abc <_ZN9CTerminal6printfEPKcz+0x10>
 8001ad0:	1973      	adds	r3, r6, r5
 8001ad2:	7859      	ldrb	r1, [r3, #1]
 8001ad4:	2969      	cmp	r1, #105	; 0x69
 8001ad6:	d016      	beq.n	8001b06 <_ZN9CTerminal6printfEPKcz+0x5a>
 8001ad8:	d807      	bhi.n	8001aea <_ZN9CTerminal6printfEPKcz+0x3e>
 8001ada:	2963      	cmp	r1, #99	; 0x63
 8001adc:	d02b      	beq.n	8001b36 <_ZN9CTerminal6printfEPKcz+0x8a>
 8001ade:	2966      	cmp	r1, #102	; 0x66
 8001ae0:	d031      	beq.n	8001b46 <_ZN9CTerminal6printfEPKcz+0x9a>
 8001ae2:	2925      	cmp	r1, #37	; 0x25
 8001ae4:	d140      	bne.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001ae6:	4620      	mov	r0, r4
 8001ae8:	e02a      	b.n	8001b40 <_ZN9CTerminal6printfEPKcz+0x94>
 8001aea:	2975      	cmp	r1, #117	; 0x75
 8001aec:	d013      	beq.n	8001b16 <_ZN9CTerminal6printfEPKcz+0x6a>
 8001aee:	2978      	cmp	r1, #120	; 0x78
 8001af0:	d019      	beq.n	8001b26 <_ZN9CTerminal6printfEPKcz+0x7a>
 8001af2:	2973      	cmp	r1, #115	; 0x73
 8001af4:	d138      	bne.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001af6:	9b01      	ldr	r3, [sp, #4]
 8001af8:	4620      	mov	r0, r4
 8001afa:	1d1a      	adds	r2, r3, #4
 8001afc:	6819      	ldr	r1, [r3, #0]
 8001afe:	9201      	str	r2, [sp, #4]
 8001b00:	f7ff ff48 	bl	8001994 <_ZN9CTerminal4putsEPc>
 8001b04:	e030      	b.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b06:	9b01      	ldr	r3, [sp, #4]
 8001b08:	4620      	mov	r0, r4
 8001b0a:	1d1a      	adds	r2, r3, #4
 8001b0c:	6819      	ldr	r1, [r3, #0]
 8001b0e:	9201      	str	r2, [sp, #4]
 8001b10:	f7ff ff4c 	bl	80019ac <_ZN9CTerminal4putiEl>
 8001b14:	e028      	b.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b16:	9b01      	ldr	r3, [sp, #4]
 8001b18:	4620      	mov	r0, r4
 8001b1a:	1d1a      	adds	r2, r3, #4
 8001b1c:	6819      	ldr	r1, [r3, #0]
 8001b1e:	9201      	str	r2, [sp, #4]
 8001b20:	f7ff ff68 	bl	80019f4 <_ZN9CTerminal5putuiEm>
 8001b24:	e020      	b.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b26:	9b01      	ldr	r3, [sp, #4]
 8001b28:	4620      	mov	r0, r4
 8001b2a:	1d1a      	adds	r2, r3, #4
 8001b2c:	6819      	ldr	r1, [r3, #0]
 8001b2e:	9201      	str	r2, [sp, #4]
 8001b30:	f7ff ff78 	bl	8001a24 <_ZN9CTerminal4putxEm>
 8001b34:	e018      	b.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b36:	9b01      	ldr	r3, [sp, #4]
 8001b38:	1d1a      	adds	r2, r3, #4
 8001b3a:	7819      	ldrb	r1, [r3, #0]
 8001b3c:	9201      	str	r2, [sp, #4]
 8001b3e:	4620      	mov	r0, r4
 8001b40:	f7ff fef4 	bl	800192c <_ZN9CTerminal7putcharEc>
 8001b44:	e010      	b.n	8001b68 <_ZN9CTerminal6printfEPKcz+0xbc>
 8001b46:	9b01      	ldr	r3, [sp, #4]
 8001b48:	3307      	adds	r3, #7
 8001b4a:	f023 0307 	bic.w	r3, r3, #7
 8001b4e:	f103 0208 	add.w	r2, r3, #8
 8001b52:	e9d3 0100 	ldrd	r0, r1, [r3]
 8001b56:	9201      	str	r2, [sp, #4]
 8001b58:	f001 f866 	bl	8002c28 <__aeabi_d2f>
 8001b5c:	2103      	movs	r1, #3
 8001b5e:	ee00 0a10 	vmov	s0, r0
 8001b62:	4620      	mov	r0, r4
 8001b64:	f7ff ff76 	bl	8001a54 <_ZN9CTerminal4putfEfj>
 8001b68:	3502      	adds	r5, #2
 8001b6a:	e7a7      	b.n	8001abc <_ZN9CTerminal6printfEPKcz+0x10>
 8001b6c:	b003      	add	sp, #12
 8001b6e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001b72:	b003      	add	sp, #12
 8001b74:	4770      	bx	lr

08001b76 <_ZN10MathVectorILj4EE4initEv>:
 8001b76:	2300      	movs	r3, #0
 8001b78:	6003      	str	r3, [r0, #0]
 8001b7a:	6043      	str	r3, [r0, #4]
 8001b7c:	6083      	str	r3, [r0, #8]
 8001b7e:	60c3      	str	r3, [r0, #12]
 8001b80:	4770      	bx	lr

08001b82 <_ZN10MathVectorILj3EE3mixERS0_f>:
 8001b82:	f100 030c 	add.w	r3, r0, #12
 8001b86:	ecf1 7a01 	vldmia	r1!, {s15}
 8001b8a:	edd0 6a00 	vldr	s13, [r0]
 8001b8e:	eeb7 7a00 	vmov.f32	s14, #112	; 0x3f800000  1.0
 8001b92:	ee37 7a40 	vsub.f32	s14, s14, s0
 8001b96:	ee60 7a27 	vmul.f32	s15, s0, s15
 8001b9a:	eee7 7a26 	vfma.f32	s15, s14, s13
 8001b9e:	ece0 7a01 	vstmia	r0!, {s15}
 8001ba2:	4298      	cmp	r0, r3
 8001ba4:	d1ef      	bne.n	8001b86 <_ZN10MathVectorILj3EE3mixERS0_f+0x4>
 8001ba6:	4770      	bx	lr

08001ba8 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>:
 8001ba8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001baa:	eddf 6a17 	vldr	s13, [pc, #92]	; 8001c08 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x60>
 8001bae:	4603      	mov	r3, r0
 8001bb0:	2600      	movs	r6, #0
 8001bb2:	f8d0 01c0 	ldr.w	r0, [r0, #448]	; 0x1c0
 8001bb6:	461c      	mov	r4, r3
 8001bb8:	4635      	mov	r5, r6
 8001bba:	4285      	cmp	r5, r0
 8001bbc:	d019      	beq.n	8001bf2 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x4a>
 8001bbe:	eddf 7a13 	vldr	s15, [pc, #76]	; 8001c0c <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x64>
 8001bc2:	468e      	mov	lr, r1
 8001bc4:	f104 0710 	add.w	r7, r4, #16
 8001bc8:	ecb4 6a01 	vldmia	r4!, {s12}
 8001bcc:	ecbe 7a01 	vldmia	lr!, {s14}
 8001bd0:	ee37 7a46 	vsub.f32	s14, s14, s12
 8001bd4:	42bc      	cmp	r4, r7
 8001bd6:	eee7 7a07 	vfma.f32	s15, s14, s14
 8001bda:	d1f5      	bne.n	8001bc8 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x20>
 8001bdc:	eef4 7ae6 	vcmpe.f32	s15, s13
 8001be0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001be4:	bf44      	itt	mi
 8001be6:	462e      	movmi	r6, r5
 8001be8:	eef0 6a67 	vmovmi.f32	s13, s15
 8001bec:	3501      	adds	r5, #1
 8001bee:	463c      	mov	r4, r7
 8001bf0:	e7e3      	b.n	8001bba <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE+0x12>
 8001bf2:	f503 7380 	add.w	r3, r3, #256	; 0x100
 8001bf6:	210c      	movs	r1, #12
 8001bf8:	4610      	mov	r0, r2
 8001bfa:	fb01 3106 	mla	r1, r1, r6, r3
 8001bfe:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8001c02:	f7ff ffbe 	bl	8001b82 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001c06:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001c08:	4cbebc20 	.word	0x4cbebc20
 8001c0c:	00000000 	.word	0x00000000

08001c10 <_ZN21CLearningLineFollower3runEv>:
 8001c10:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8001c14:	2308      	movs	r3, #8
 8001c16:	ed2d 8b06 	vpush	{d8-d10}
 8001c1a:	f100 0650 	add.w	r6, r0, #80	; 0x50
 8001c1e:	f8c0 3210 	str.w	r3, [r0, #528]	; 0x210
 8001c22:	4bcb      	ldr	r3, [pc, #812]	; (8001f50 <_ZN21CLearningLineFollower3runEv+0x340>)
 8001c24:	f8c0 3214 	str.w	r3, [r0, #532]	; 0x214
 8001c28:	4604      	mov	r4, r0
 8001c2a:	f500 78a8 	add.w	r8, r0, #336	; 0x150
 8001c2e:	4635      	mov	r5, r6
 8001c30:	f105 0710 	add.w	r7, r5, #16
 8001c34:	48c7      	ldr	r0, [pc, #796]	; (8001f54 <_ZN21CLearningLineFollower3runEv+0x344>)
 8001c36:	f7fe fe73 	bl	8000920 <_ZN5CMath3rndEv>
 8001c3a:	eca5 0a01 	vstmia	r5!, {s0}
 8001c3e:	42bd      	cmp	r5, r7
 8001c40:	d1f8      	bne.n	8001c34 <_ZN21CLearningLineFollower3runEv+0x24>
 8001c42:	4545      	cmp	r5, r8
 8001c44:	d1f4      	bne.n	8001c30 <_ZN21CLearningLineFollower3runEv+0x20>
 8001c46:	4623      	mov	r3, r4
 8001c48:	f104 02c0 	add.w	r2, r4, #192	; 0xc0
 8001c4c:	eddf 8ac2 	vldr	s17, [pc, #776]	; 8001f58 <_ZN21CLearningLineFollower3runEv+0x348>
 8001c50:	330c      	adds	r3, #12
 8001c52:	edc3 8a51 	vstr	s17, [r3, #324]	; 0x144
 8001c56:	edc3 8a52 	vstr	s17, [r3, #328]	; 0x148
 8001c5a:	edc3 8a53 	vstr	s17, [r3, #332]	; 0x14c
 8001c5e:	4293      	cmp	r3, r2
 8001c60:	d1f4      	bne.n	8001c4c <_ZN21CLearningLineFollower3runEv+0x3c>
 8001c62:	2300      	movs	r3, #0
 8001c64:	f104 0530 	add.w	r5, r4, #48	; 0x30
 8001c68:	62a3      	str	r3, [r4, #40]	; 0x28
 8001c6a:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001c6c:	4628      	mov	r0, r5
 8001c6e:	f104 0940 	add.w	r9, r4, #64	; 0x40
 8001c72:	f7ff ff80 	bl	8001b76 <_ZN10MathVectorILj4EE4initEv>
 8001c76:	4648      	mov	r0, r9
 8001c78:	f7ff ff7d 	bl	8001b76 <_ZN10MathVectorILj4EE4initEv>
 8001c7c:	eebf aa00 	vmov.f32	s20, #240	; 0xbf800000 -1.0
 8001c80:	edc4 8a86 	vstr	s17, [r4, #536]	; 0x218
 8001c84:	edc4 8a87 	vstr	s17, [r4, #540]	; 0x21c
 8001c88:	edc4 8a88 	vstr	s17, [r4, #544]	; 0x220
 8001c8c:	2100      	movs	r1, #0
 8001c8e:	48b3      	ldr	r0, [pc, #716]	; (8001f5c <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001c90:	f7fe ff22 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 8001c94:	48b1      	ldr	r0, [pc, #708]	; (8001f5c <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001c96:	f7ff f8bb 	bl	8000e10 <_ZN4CRGB14get_rgb_resultEv>
 8001c9a:	4601      	mov	r1, r0
 8001c9c:	4620      	mov	r0, r4
 8001c9e:	f7fe fd31 	bl	8000704 <_ZN13CLinePosition7processEP10sRGBResult>
 8001ca2:	4620      	mov	r0, r4
 8001ca4:	f7fe fdc8 	bl	8000838 <_ZN13CLinePosition17get_line_positionEv>
 8001ca8:	6a23      	ldr	r3, [r4, #32]
 8001caa:	6263      	str	r3, [r4, #36]	; 0x24
 8001cac:	69e3      	ldr	r3, [r4, #28]
 8001cae:	6223      	str	r3, [r4, #32]
 8001cb0:	69a3      	ldr	r3, [r4, #24]
 8001cb2:	61e3      	str	r3, [r4, #28]
 8001cb4:	ed84 0a06 	vstr	s0, [r4, #24]
 8001cb8:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
 8001cbc:	f104 0740 	add.w	r7, r4, #64	; 0x40
 8001cc0:	e887 000f 	stmia.w	r7, {r0, r1, r2, r3}
 8001cc4:	f104 0318 	add.w	r3, r4, #24
 8001cc8:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8001cca:	f504 7706 	add.w	r7, r4, #536	; 0x218
 8001cce:	e885 000f 	stmia.w	r5, {r0, r1, r2, r3}
 8001cd2:	463a      	mov	r2, r7
 8001cd4:	4630      	mov	r0, r6
 8001cd6:	4629      	mov	r1, r5
 8001cd8:	f7ff ff66 	bl	8001ba8 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 8001cdc:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 8001cde:	62a3      	str	r3, [r4, #40]	; 0x28
 8001ce0:	489c      	ldr	r0, [pc, #624]	; (8001f54 <_ZN21CLearningLineFollower3runEv+0x344>)
 8001ce2:	f7fe fe03 	bl	80008ec <_ZN5CMath4randEv>
 8001ce6:	2364      	movs	r3, #100	; 0x64
 8001ce8:	fbb0 f2f3 	udiv	r2, r0, r3
 8001cec:	fb02 0013 	mls	r0, r2, r3, r0
 8001cf0:	2813      	cmp	r0, #19
 8001cf2:	d80b      	bhi.n	8001d0c <_ZN21CLearningLineFollower3runEv+0xfc>
 8001cf4:	4897      	ldr	r0, [pc, #604]	; (8001f54 <_ZN21CLearningLineFollower3runEv+0x344>)
 8001cf6:	f7fe fdf9 	bl	80008ec <_ZN5CMath4randEv>
 8001cfa:	f04f 0a03 	mov.w	sl, #3
 8001cfe:	fbb0 fafa 	udiv	sl, r0, sl
 8001d02:	eb0a 0a4a 	add.w	sl, sl, sl, lsl #1
 8001d06:	ebca 0a00 	rsb	sl, sl, r0
 8001d0a:	e012      	b.n	8001d32 <_ZN21CLearningLineFollower3runEv+0x122>
 8001d0c:	f04f 0a00 	mov.w	sl, #0
 8001d10:	463a      	mov	r2, r7
 8001d12:	4653      	mov	r3, sl
 8001d14:	eb04 018a 	add.w	r1, r4, sl, lsl #2
 8001d18:	ecb2 7a01 	vldmia	r2!, {s14}
 8001d1c:	edd1 7a86 	vldr	s15, [r1, #536]	; 0x218
 8001d20:	eeb4 7a67 	vcmp.f32	s14, s15
 8001d24:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001d28:	bfc8      	it	gt
 8001d2a:	469a      	movgt	sl, r3
 8001d2c:	3301      	adds	r3, #1
 8001d2e:	2b03      	cmp	r3, #3
 8001d30:	d1f0      	bne.n	8001d14 <_ZN21CLearningLineFollower3runEv+0x104>
 8001d32:	f1ba 0f01 	cmp.w	sl, #1
 8001d36:	f8c4 a02c 	str.w	sl, [r4, #44]	; 0x2c
 8001d3a:	d014      	beq.n	8001d66 <_ZN21CLearningLineFollower3runEv+0x156>
 8001d3c:	d30b      	bcc.n	8001d56 <_ZN21CLearningLineFollower3runEv+0x146>
 8001d3e:	f1ba 0f02 	cmp.w	sl, #2
 8001d42:	d11a      	bne.n	8001d7a <_ZN21CLearningLineFollower3runEv+0x16a>
 8001d44:	4886      	ldr	r0, [pc, #536]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d46:	2100      	movs	r1, #0
 8001d48:	220e      	movs	r2, #14
 8001d4a:	f7ff f8f9 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001d4e:	4884      	ldr	r0, [pc, #528]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d50:	2101      	movs	r1, #1
 8001d52:	2200      	movs	r2, #0
 8001d54:	e00f      	b.n	8001d76 <_ZN21CLearningLineFollower3runEv+0x166>
 8001d56:	4882      	ldr	r0, [pc, #520]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d58:	2100      	movs	r1, #0
 8001d5a:	220e      	movs	r2, #14
 8001d5c:	f7ff f8f0 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001d60:	487f      	ldr	r0, [pc, #508]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d62:	2101      	movs	r1, #1
 8001d64:	e006      	b.n	8001d74 <_ZN21CLearningLineFollower3runEv+0x164>
 8001d66:	2100      	movs	r1, #0
 8001d68:	487d      	ldr	r0, [pc, #500]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d6a:	460a      	mov	r2, r1
 8001d6c:	f7ff f8e8 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001d70:	487b      	ldr	r0, [pc, #492]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001d72:	4651      	mov	r1, sl
 8001d74:	220e      	movs	r2, #14
 8001d76:	f7ff f8e3 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001d7a:	487a      	ldr	r0, [pc, #488]	; (8001f64 <_ZN21CLearningLineFollower3runEv+0x354>)
 8001d7c:	2132      	movs	r1, #50	; 0x32
 8001d7e:	f7fe fe77 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8001d82:	2100      	movs	r1, #0
 8001d84:	4875      	ldr	r0, [pc, #468]	; (8001f5c <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001d86:	f7fe fea7 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 8001d8a:	4874      	ldr	r0, [pc, #464]	; (8001f5c <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001d8c:	f7ff f840 	bl	8000e10 <_ZN4CRGB14get_rgb_resultEv>
 8001d90:	4601      	mov	r1, r0
 8001d92:	4620      	mov	r0, r4
 8001d94:	f7fe fcb6 	bl	8000704 <_ZN13CLinePosition7processEP10sRGBResult>
 8001d98:	4620      	mov	r0, r4
 8001d9a:	f7fe fd4d 	bl	8000838 <_ZN13CLinePosition17get_line_positionEv>
 8001d9e:	486d      	ldr	r0, [pc, #436]	; (8001f54 <_ZN21CLearningLineFollower3runEv+0x344>)
 8001da0:	f7fe fd9c 	bl	80008dc <_ZN5CMath3absEf>
 8001da4:	eef7 9a00 	vmov.f32	s19, #112	; 0x3f800000  1.0
 8001da8:	f8d4 b02c 	ldr.w	fp, [r4, #44]	; 0x2c
 8001dac:	f8d4 a028 	ldr.w	sl, [r4, #40]	; 0x28
 8001db0:	ee39 0ac0 	vsub.f32	s0, s19, s0
 8001db4:	eef6 7a00 	vmov.f32	s15, #96	; 0x3f000000  0.5
 8001db8:	4630      	mov	r0, r6
 8001dba:	4629      	mov	r1, r5
 8001dbc:	463a      	mov	r2, r7
 8001dbe:	eb04 0b8b 	add.w	fp, r4, fp, lsl #2
 8001dc2:	ee30 9a67 	vsub.f32	s18, s0, s15
 8001dc6:	f7ff feef 	bl	8001ba8 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 8001dca:	edd4 7a86 	vldr	s15, [r4, #536]	; 0x218
 8001dce:	ed9b 8a86 	vldr	s16, [fp, #536]	; 0x218
 8001dd2:	eeb4 8a67 	vcmp.f32	s16, s15
 8001dd6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001dda:	bf48      	it	mi
 8001ddc:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001de0:	edd4 7a87 	vldr	s15, [r4, #540]	; 0x21c
 8001de4:	eeb4 8a67 	vcmp.f32	s16, s15
 8001de8:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001dec:	bf48      	it	mi
 8001dee:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001df2:	edd4 7a88 	vldr	s15, [r4, #544]	; 0x220
 8001df6:	eeb4 8a67 	vcmp.f32	s16, s15
 8001dfa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001dfe:	4630      	mov	r0, r6
 8001e00:	4649      	mov	r1, r9
 8001e02:	463a      	mov	r2, r7
 8001e04:	bf48      	it	mi
 8001e06:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001e0a:	f7ff fecd 	bl	8001ba8 <_ZN17AssociativeMemoryILi4ELi3ELi16EE4loadER10MathVectorILj4EERS1_ILj3EE>
 8001e0e:	eddf 7a56 	vldr	s15, [pc, #344]	; 8001f68 <_ZN21CLearningLineFollower3runEv+0x358>
 8001e12:	f8d4 0210 	ldr.w	r0, [r4, #528]	; 0x210
 8001e16:	eddf 6a55 	vldr	s13, [pc, #340]	; 8001f6c <_ZN21CLearningLineFollower3runEv+0x35c>
 8001e1a:	eeb0 7a49 	vmov.f32	s14, s18
 8001e1e:	eea8 7a27 	vfma.f32	s14, s16, s15
 8001e22:	eb04 0a8a 	add.w	sl, r4, sl, lsl #2
 8001e26:	2100      	movs	r1, #0
 8001e28:	46b6      	mov	lr, r6
 8001e2a:	ed8a 7a86 	vstr	s14, [sl, #536]	; 0x218
 8001e2e:	460a      	mov	r2, r1
 8001e30:	4282      	cmp	r2, r0
 8001e32:	f104 0340 	add.w	r3, r4, #64	; 0x40
 8001e36:	d018      	beq.n	8001e6a <_ZN21CLearningLineFollower3runEv+0x25a>
 8001e38:	eddf 7a47 	vldr	s15, [pc, #284]	; 8001f58 <_ZN21CLearningLineFollower3runEv+0x348>
 8001e3c:	46f4      	mov	ip, lr
 8001e3e:	ecb3 7a01 	vldmia	r3!, {s14}
 8001e42:	ecbc 6a01 	vldmia	ip!, {s12}
 8001e46:	ee37 7a46 	vsub.f32	s14, s14, s12
 8001e4a:	42b3      	cmp	r3, r6
 8001e4c:	eee7 7a07 	vfma.f32	s15, s14, s14
 8001e50:	d1f5      	bne.n	8001e3e <_ZN21CLearningLineFollower3runEv+0x22e>
 8001e52:	eef4 7ae6 	vcmpe.f32	s15, s13
 8001e56:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001e5a:	bf44      	itt	mi
 8001e5c:	4611      	movmi	r1, r2
 8001e5e:	eef0 6a67 	vmovmi.f32	s13, s15
 8001e62:	3201      	adds	r2, #1
 8001e64:	f10e 0e10 	add.w	lr, lr, #16
 8001e68:	e7e2      	b.n	8001e30 <_ZN21CLearningLineFollower3runEv+0x220>
 8001e6a:	280f      	cmp	r0, #15
 8001e6c:	d81a      	bhi.n	8001ea4 <_ZN21CLearningLineFollower3runEv+0x294>
 8001e6e:	1d42      	adds	r2, r0, #5
 8001e70:	eb04 1202 	add.w	r2, r4, r2, lsl #4
 8001e74:	ecf3 7a01 	vldmia	r3!, {s15}
 8001e78:	ed92 7a00 	vldr	s14, [r2]
 8001e7c:	eee7 7a28 	vfma.f32	s15, s14, s17
 8001e80:	42b3      	cmp	r3, r6
 8001e82:	ece2 7a01 	vstmia	r2!, {s15}
 8001e86:	d1f5      	bne.n	8001e74 <_ZN21CLearningLineFollower3runEv+0x264>
 8001e88:	230c      	movs	r3, #12
 8001e8a:	fb03 8000 	mla	r0, r3, r0, r8
 8001e8e:	4639      	mov	r1, r7
 8001e90:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 8001e94:	f7ff fe75 	bl	8001b82 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001e98:	f8d4 3210 	ldr.w	r3, [r4, #528]	; 0x210
 8001e9c:	3301      	adds	r3, #1
 8001e9e:	f8c4 3210 	str.w	r3, [r4, #528]	; 0x210
 8001ea2:	e01a      	b.n	8001eda <_ZN21CLearningLineFollower3runEv+0x2ca>
 8001ea4:	1d4a      	adds	r2, r1, #5
 8001ea6:	edd4 6a85 	vldr	s13, [r4, #532]	; 0x214
 8001eaa:	eb04 1202 	add.w	r2, r4, r2, lsl #4
 8001eae:	ecf3 7a01 	vldmia	r3!, {s15}
 8001eb2:	ed92 6a00 	vldr	s12, [r2]
 8001eb6:	ee39 7ae6 	vsub.f32	s14, s19, s13
 8001eba:	ee66 7aa7 	vmul.f32	s15, s13, s15
 8001ebe:	42b3      	cmp	r3, r6
 8001ec0:	eee7 7a06 	vfma.f32	s15, s14, s12
 8001ec4:	ece2 7a01 	vstmia	r2!, {s15}
 8001ec8:	d1f1      	bne.n	8001eae <_ZN21CLearningLineFollower3runEv+0x29e>
 8001eca:	200c      	movs	r0, #12
 8001ecc:	fb00 8001 	mla	r0, r0, r1, r8
 8001ed0:	ed94 0a85 	vldr	s0, [r4, #532]	; 0x214
 8001ed4:	4639      	mov	r1, r7
 8001ed6:	f7ff fe54 	bl	8001b82 <_ZN10MathVectorILj3EE3mixERS0_f>
 8001eda:	4620      	mov	r0, r4
 8001edc:	f7fe fcaa 	bl	8000834 <_ZN13CLinePosition7on_lineEv>
 8001ee0:	4607      	mov	r7, r0
 8001ee2:	b9f0      	cbnz	r0, 8001f22 <_ZN21CLearningLineFollower3runEv+0x312>
 8001ee4:	481e      	ldr	r0, [pc, #120]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001ee6:	4639      	mov	r1, r7
 8001ee8:	f06f 020d 	mvn.w	r2, #13
 8001eec:	f7ff f828 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001ef0:	f06f 020d 	mvn.w	r2, #13
 8001ef4:	481a      	ldr	r0, [pc, #104]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001ef6:	2101      	movs	r1, #1
 8001ef8:	f7ff f822 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001efc:	4819      	ldr	r0, [pc, #100]	; (8001f64 <_ZN21CLearningLineFollower3runEv+0x354>)
 8001efe:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8001f02:	f7fe fdb5 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8001f06:	4816      	ldr	r0, [pc, #88]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001f08:	4639      	mov	r1, r7
 8001f0a:	463a      	mov	r2, r7
 8001f0c:	f7ff f818 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001f10:	4813      	ldr	r0, [pc, #76]	; (8001f60 <_ZN21CLearningLineFollower3runEv+0x350>)
 8001f12:	2101      	movs	r1, #1
 8001f14:	463a      	mov	r2, r7
 8001f16:	f7ff f813 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8001f1a:	4812      	ldr	r0, [pc, #72]	; (8001f64 <_ZN21CLearningLineFollower3runEv+0x354>)
 8001f1c:	2164      	movs	r1, #100	; 0x64
 8001f1e:	f7fe fda7 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8001f22:	ed9f 0a13 	vldr	s0, [pc, #76]	; 8001f70 <_ZN21CLearningLineFollower3runEv+0x360>
 8001f26:	eddf 7a13 	vldr	s15, [pc, #76]	; 8001f74 <_ZN21CLearningLineFollower3runEv+0x364>
 8001f2a:	480c      	ldr	r0, [pc, #48]	; (8001f5c <_ZN21CLearningLineFollower3runEv+0x34c>)
 8001f2c:	4912      	ldr	r1, [pc, #72]	; (8001f78 <_ZN21CLearningLineFollower3runEv+0x368>)
 8001f2e:	ee29 9a00 	vmul.f32	s18, s18, s0
 8001f32:	eeaa 9a27 	vfma.f32	s18, s20, s15
 8001f36:	eddf 7a11 	vldr	s15, [pc, #68]	; 8001f7c <_ZN21CLearningLineFollower3runEv+0x36c>
 8001f3a:	ee69 7a27 	vmul.f32	s15, s18, s15
 8001f3e:	eeb0 aa49 	vmov.f32	s20, s18
 8001f42:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8001f46:	ee17 2a90 	vmov	r2, s15
 8001f4a:	f7ff fdaf 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8001f4e:	e69d      	b.n	8001c8c <_ZN21CLearningLineFollower3runEv+0x7c>
 8001f50:	3dcccccd 	.word	0x3dcccccd
 8001f54:	20000108 	.word	0x20000108
 8001f58:	00000000 	.word	0x00000000
 8001f5c:	20000030 	.word	0x20000030
 8001f60:	200000f4 	.word	0x200000f4
 8001f64:	2000013c 	.word	0x2000013c
 8001f68:	3f666666 	.word	0x3f666666
 8001f6c:	4cbebc20 	.word	0x4cbebc20
 8001f70:	3c23d70a 	.word	0x3c23d70a
 8001f74:	3f7d70a4 	.word	0x3f7d70a4
 8001f78:	08002dd8 	.word	0x08002dd8
 8001f7c:	447a0000 	.word	0x447a0000

08001f80 <_ZN5CDemo4initEv>:
 8001f80:	4770      	bx	lr
	...

08001f84 <_ZN5CDemo10blink_taskEv>:
 8001f84:	b508      	push	{r3, lr}
 8001f86:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001f8a:	480a      	ldr	r0, [pc, #40]	; (8001fb4 <_ZN5CDemo10blink_taskEv+0x30>)
 8001f8c:	f7ff fc04 	bl	8001798 <_ZN5CGPIO7gpio_onEm>
 8001f90:	4809      	ldr	r0, [pc, #36]	; (8001fb8 <_ZN5CDemo10blink_taskEv+0x34>)
 8001f92:	f7fe fd5f 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 8001f96:	4909      	ldr	r1, [pc, #36]	; (8001fbc <_ZN5CDemo10blink_taskEv+0x38>)
 8001f98:	4602      	mov	r2, r0
 8001f9a:	4806      	ldr	r0, [pc, #24]	; (8001fb4 <_ZN5CDemo10blink_taskEv+0x30>)
 8001f9c:	f7ff fd86 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8001fa0:	4805      	ldr	r0, [pc, #20]	; (8001fb8 <_ZN5CDemo10blink_taskEv+0x34>)
 8001fa2:	210a      	movs	r1, #10
 8001fa4:	f7fe fd64 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8001fa8:	4802      	ldr	r0, [pc, #8]	; (8001fb4 <_ZN5CDemo10blink_taskEv+0x30>)
 8001faa:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001fae:	f7ff fc01 	bl	80017b4 <_ZN5CGPIO8gpio_offEm>
 8001fb2:	e7e8      	b.n	8001f86 <_ZN5CDemo10blink_taskEv+0x2>
 8001fb4:	20000030 	.word	0x20000030
 8001fb8:	2000013c 	.word	0x2000013c
 8001fbc:	08002dc0 	.word	0x08002dc0

08001fc0 <_ZN5CDemo16wifi_client_taskEv>:
 8001fc0:	b507      	push	{r0, r1, r2, lr}
 8001fc2:	4668      	mov	r0, sp
 8001fc4:	f7fe f9aa 	bl	800031c <_ZN5CWifiC1Ev>
 8001fc8:	2100      	movs	r1, #0
 8001fca:	4668      	mov	r0, sp
 8001fcc:	f7fe fa5e 	bl	800048c <_ZN5CWifi4initEh>
 8001fd0:	4668      	mov	r0, sp
 8001fd2:	f7fe fb49 	bl	8000668 <_ZN5CWifi11client_demoEv>
 8001fd6:	4668      	mov	r0, sp
 8001fd8:	f7fe f9a1 	bl	800031e <_ZN5CWifiD1Ev>
 8001fdc:	b003      	add	sp, #12
 8001fde:	f85d fb04 	ldr.w	pc, [sp], #4
	...

08001fe4 <_ZN5CDemo10moves_taskEv>:
 8001fe4:	b570      	push	{r4, r5, r6, lr}
 8001fe6:	4c1c      	ldr	r4, [pc, #112]	; (8002058 <_ZN5CDemo10moves_taskEv+0x74>)
 8001fe8:	4d1c      	ldr	r5, [pc, #112]	; (800205c <_ZN5CDemo10moves_taskEv+0x78>)
 8001fea:	4620      	mov	r0, r4
 8001fec:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001ff0:	2216      	movs	r2, #22
 8001ff2:	2300      	movs	r3, #0
 8001ff4:	f7fe f93c 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8001ff8:	4620      	mov	r0, r4
 8001ffa:	f44f 7161 	mov.w	r1, #900	; 0x384
 8001ffe:	2216      	movs	r2, #22
 8002000:	2300      	movs	r3, #0
 8002002:	f7fe f935 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002006:	4620      	mov	r0, r4
 8002008:	f44f 7161 	mov.w	r1, #900	; 0x384
 800200c:	2216      	movs	r2, #22
 800200e:	2300      	movs	r3, #0
 8002010:	f7fe f92e 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002014:	4620      	mov	r0, r4
 8002016:	f44f 7161 	mov.w	r1, #900	; 0x384
 800201a:	2216      	movs	r2, #22
 800201c:	2300      	movs	r3, #0
 800201e:	f7fe f927 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002022:	4620      	mov	r0, r4
 8002024:	4629      	mov	r1, r5
 8002026:	2216      	movs	r2, #22
 8002028:	2300      	movs	r3, #0
 800202a:	f7fe f921 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800202e:	4620      	mov	r0, r4
 8002030:	4629      	mov	r1, r5
 8002032:	2216      	movs	r2, #22
 8002034:	2300      	movs	r3, #0
 8002036:	f7fe f91b 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 800203a:	4620      	mov	r0, r4
 800203c:	4629      	mov	r1, r5
 800203e:	2216      	movs	r2, #22
 8002040:	2300      	movs	r3, #0
 8002042:	f7fe f915 	bl	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002046:	4620      	mov	r0, r4
 8002048:	4629      	mov	r1, r5
 800204a:	2216      	movs	r2, #22
 800204c:	2300      	movs	r3, #0
 800204e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8002052:	f7fe b90d 	b.w	8000270 <_ZN7CKodama12rotate_robotEllPFlvE>
 8002056:	bf00      	nop
 8002058:	20000030 	.word	0x20000030
 800205c:	fffffc7c 	.word	0xfffffc7c

08002060 <_ZN5CDemo24basic_line_follower_taskEv>:
 8002060:	b510      	push	{r4, lr}
 8002062:	b08e      	sub	sp, #56	; 0x38
 8002064:	4668      	mov	r0, sp
 8002066:	f7fe fb43 	bl	80006f0 <_ZN13CLinePositionC1Ev>
 800206a:	a806      	add	r0, sp, #24
 800206c:	eeb2 0a04 	vmov.f32	s0, #36	; 0x41200000  10.0
 8002070:	eddf 0a38 	vldr	s1, [pc, #224]	; 8002154 <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 8002074:	eddf 1a38 	vldr	s3, [pc, #224]	; 8002158 <_ZN5CDemo24basic_line_follower_taskEv+0xf8>
 8002078:	eeb2 1a00 	vmov.f32	s2, #32	; 0x41000000  8.0
 800207c:	f7fe fbf5 	bl	800086a <_ZN4CPIDC1Effff>
 8002080:	4836      	ldr	r0, [pc, #216]	; (800215c <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 8002082:	2100      	movs	r1, #0
 8002084:	220a      	movs	r2, #10
 8002086:	f7fe fd05 	bl	8000a94 <_ZN6CTimer22event_timer_set_periodEhm>
 800208a:	4834      	ldr	r0, [pc, #208]	; (800215c <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 800208c:	2100      	movs	r1, #0
 800208e:	f7fe fd15 	bl	8000abc <_ZN6CTimer17event_timer_checkEh>
 8002092:	2800      	cmp	r0, #0
 8002094:	d0f9      	beq.n	800208a <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8002096:	2100      	movs	r1, #0
 8002098:	4831      	ldr	r0, [pc, #196]	; (8002160 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 800209a:	f7fe fd1d 	bl	8000ad8 <_ZN4CRGB8rgb_readEh>
 800209e:	4830      	ldr	r0, [pc, #192]	; (8002160 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 80020a0:	f7fe feb6 	bl	8000e10 <_ZN4CRGB14get_rgb_resultEv>
 80020a4:	4601      	mov	r1, r0
 80020a6:	4668      	mov	r0, sp
 80020a8:	f7fe fb2c 	bl	8000704 <_ZN13CLinePosition7processEP10sRGBResult>
 80020ac:	4668      	mov	r0, sp
 80020ae:	f7fe fbc1 	bl	8000834 <_ZN13CLinePosition7on_lineEv>
 80020b2:	4604      	mov	r4, r0
 80020b4:	4668      	mov	r0, sp
 80020b6:	f7fe fbbf 	bl	8000838 <_ZN13CLinePosition17get_line_positionEv>
 80020ba:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8002164 <_ZN5CDemo24basic_line_follower_taskEv+0x104>
 80020be:	4828      	ldr	r0, [pc, #160]	; (8002160 <_ZN5CDemo24basic_line_follower_taskEv+0x100>)
 80020c0:	4929      	ldr	r1, [pc, #164]	; (8002168 <_ZN5CDemo24basic_line_follower_taskEv+0x108>)
 80020c2:	ee20 0a27 	vmul.f32	s0, s0, s15
 80020c6:	4622      	mov	r2, r4
 80020c8:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 80020cc:	ee17 3a90 	vmov	r3, s15
 80020d0:	f7ff fcec 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 80020d4:	4668      	mov	r0, sp
 80020d6:	f7fe fbad 	bl	8000834 <_ZN13CLinePosition7on_lineEv>
 80020da:	4604      	mov	r4, r0
 80020dc:	b1d0      	cbz	r0, 8002114 <_ZN5CDemo24basic_line_follower_taskEv+0xb4>
 80020de:	4668      	mov	r0, sp
 80020e0:	f7fe fbaa 	bl	8000838 <_ZN13CLinePosition17get_line_positionEv>
 80020e4:	eddf 7a1b 	vldr	s15, [pc, #108]	; 8002154 <_ZN5CDemo24basic_line_follower_taskEv+0xf4>
 80020e8:	a806      	add	r0, sp, #24
 80020ea:	ee37 0ac0 	vsub.f32	s0, s15, s0
 80020ee:	f7fe fbc2 	bl	8000876 <_ZN4CPID7processEf>
 80020f2:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 80020f6:	481d      	ldr	r0, [pc, #116]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 80020f8:	ee17 4a90 	vmov	r4, s15
 80020fc:	2100      	movs	r1, #0
 80020fe:	f104 020b 	add.w	r2, r4, #11
 8002102:	f7fe ff1d 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8002106:	4819      	ldr	r0, [pc, #100]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002108:	2101      	movs	r1, #1
 800210a:	f1c4 020b 	rsb	r2, r4, #11
 800210e:	f7fe ff17 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8002112:	e7ba      	b.n	800208a <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8002114:	4621      	mov	r1, r4
 8002116:	4815      	ldr	r0, [pc, #84]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002118:	f06f 020a 	mvn.w	r2, #10
 800211c:	f7fe ff10 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8002120:	f06f 020a 	mvn.w	r2, #10
 8002124:	4811      	ldr	r0, [pc, #68]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002126:	2101      	movs	r1, #1
 8002128:	f7fe ff0a 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 800212c:	480b      	ldr	r0, [pc, #44]	; (800215c <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 800212e:	f44f 7196 	mov.w	r1, #300	; 0x12c
 8002132:	f7fe fc9d 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8002136:	4621      	mov	r1, r4
 8002138:	4622      	mov	r2, r4
 800213a:	480c      	ldr	r0, [pc, #48]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 800213c:	f7fe ff00 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 8002140:	480a      	ldr	r0, [pc, #40]	; (800216c <_ZN5CDemo24basic_line_follower_taskEv+0x10c>)
 8002142:	2101      	movs	r1, #1
 8002144:	4622      	mov	r2, r4
 8002146:	f7fe fefb 	bl	8000f40 <_ZN6CMotor9set_motorEml>
 800214a:	4804      	ldr	r0, [pc, #16]	; (800215c <_ZN5CDemo24basic_line_follower_taskEv+0xfc>)
 800214c:	2164      	movs	r1, #100	; 0x64
 800214e:	f7fe fc8f 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 8002152:	e79a      	b.n	800208a <_ZN5CDemo24basic_line_follower_taskEv+0x2a>
 8002154:	00000000 	.word	0x00000000
 8002158:	42300000 	.word	0x42300000
 800215c:	2000013c 	.word	0x2000013c
 8002160:	20000030 	.word	0x20000030
 8002164:	447a0000 	.word	0x447a0000
 8002168:	08002dd5 	.word	0x08002dd5
 800216c:	200000f4 	.word	0x200000f4

08002170 <_ZN5CDemo3runEj>:
 8002170:	3901      	subs	r1, #1
 8002172:	b508      	push	{r3, lr}
 8002174:	2903      	cmp	r1, #3
 8002176:	d812      	bhi.n	800219e <_ZN5CDemo3runEj+0x2e>
 8002178:	e8df f001 	tbb	[pc, r1]
 800217c:	0c0a0602 	.word	0x0c0a0602
 8002180:	f7ff ff30 	bl	8001fe4 <_ZN5CDemo10moves_taskEv>
 8002184:	f7ff fefe 	bl	8001f84 <_ZN5CDemo10blink_taskEv>
 8002188:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800218c:	f7ff bf18 	b.w	8001fc0 <_ZN5CDemo16wifi_client_taskEv>
 8002190:	f7ff ff66 	bl	8002060 <_ZN5CDemo24basic_line_follower_taskEv>
 8002194:	4802      	ldr	r0, [pc, #8]	; (80021a0 <_ZN5CDemo3runEj+0x30>)
 8002196:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800219a:	f7ff bd39 	b.w	8001c10 <_ZN21CLearningLineFollower3runEv>
 800219e:	bd08      	pop	{r3, pc}
 80021a0:	20000184 	.word	0x20000184
 80021a4:	00000000 	.word	0x00000000

080021a8 <main>:
 80021a8:	b530      	push	{r4, r5, lr}
 80021aa:	b08f      	sub	sp, #60	; 0x3c
 80021ac:	f000 fc10 	bl	80029d0 <sytem_clock_init>
 80021b0:	4863      	ldr	r0, [pc, #396]	; (8002340 <main+0x198>)
 80021b2:	f7fe f81b 	bl	80001ec <_ZN7CKodama4initEv>
 80021b6:	210a      	movs	r1, #10
 80021b8:	4861      	ldr	r0, [pc, #388]	; (8002340 <main+0x198>)
 80021ba:	f7fe f856 	bl	800026a <_ZN7CKodama6set_dtEl>
 80021be:	a548      	add	r5, pc, #288	; (adr r5, 80022e0 <main+0x138>)
 80021c0:	e9d5 4500 	ldrd	r4, r5, [r5]
 80021c4:	485e      	ldr	r0, [pc, #376]	; (8002340 <main+0x198>)
 80021c6:	f7fe f833 	bl	8000230 <_ZN7CKodama5sleepEv>
 80021ca:	2204      	movs	r2, #4
 80021cc:	2308      	movs	r3, #8
 80021ce:	9300      	str	r3, [sp, #0]
 80021d0:	485b      	ldr	r0, [pc, #364]	; (8002340 <main+0x198>)
 80021d2:	495c      	ldr	r1, [pc, #368]	; (8002344 <main+0x19c>)
 80021d4:	4613      	mov	r3, r2
 80021d6:	f7ff fc69 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 80021da:	4859      	ldr	r0, [pc, #356]	; (8002340 <main+0x198>)
 80021dc:	495a      	ldr	r1, [pc, #360]	; (8002348 <main+0x1a0>)
 80021de:	4622      	mov	r2, r4
 80021e0:	462b      	mov	r3, r5
 80021e2:	f7ff fc63 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 80021e6:	4b59      	ldr	r3, [pc, #356]	; (800234c <main+0x1a4>)
 80021e8:	4855      	ldr	r0, [pc, #340]	; (8002340 <main+0x198>)
 80021ea:	4959      	ldr	r1, [pc, #356]	; (8002350 <main+0x1a8>)
 80021ec:	2200      	movs	r2, #0
 80021ee:	e9cd 2300 	strd	r2, r3, [sp]
 80021f2:	a33d      	add	r3, pc, #244	; (adr r3, 80022e8 <main+0x140>)
 80021f4:	e9d3 2300 	ldrd	r2, r3, [r3]
 80021f8:	e9cd 2302 	strd	r2, r3, [sp, #8]
 80021fc:	a33c      	add	r3, pc, #240	; (adr r3, 80022f0 <main+0x148>)
 80021fe:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002202:	e9cd 2306 	strd	r2, r3, [sp, #24]
 8002206:	a33c      	add	r3, pc, #240	; (adr r3, 80022f8 <main+0x150>)
 8002208:	e9d3 2300 	ldrd	r2, r3, [r3]
 800220c:	e9cd 2308 	strd	r2, r3, [sp, #32]
 8002210:	a33b      	add	r3, pc, #236	; (adr r3, 8002300 <main+0x158>)
 8002212:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002216:	e9cd 230a 	strd	r2, r3, [sp, #40]	; 0x28
 800221a:	a33b      	add	r3, pc, #236	; (adr r3, 8002308 <main+0x160>)
 800221c:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002220:	e9cd 4504 	strd	r4, r5, [sp, #16]
 8002224:	e9cd 230c 	strd	r2, r3, [sp, #48]	; 0x30
 8002228:	2200      	movs	r2, #0
 800222a:	2300      	movs	r3, #0
 800222c:	f7ff fc3e 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8002230:	4b48      	ldr	r3, [pc, #288]	; (8002354 <main+0x1ac>)
 8002232:	4843      	ldr	r0, [pc, #268]	; (8002340 <main+0x198>)
 8002234:	4946      	ldr	r1, [pc, #280]	; (8002350 <main+0x1a8>)
 8002236:	2200      	movs	r2, #0
 8002238:	e9cd 2300 	strd	r2, r3, [sp]
 800223c:	a334      	add	r3, pc, #208	; (adr r3, 8002310 <main+0x168>)
 800223e:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002242:	e9cd 2302 	strd	r2, r3, [sp, #8]
 8002246:	a334      	add	r3, pc, #208	; (adr r3, 8002318 <main+0x170>)
 8002248:	e9d3 2300 	ldrd	r2, r3, [r3]
 800224c:	e9cd 2304 	strd	r2, r3, [sp, #16]
 8002250:	a333      	add	r3, pc, #204	; (adr r3, 8002320 <main+0x178>)
 8002252:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002256:	e9cd 2306 	strd	r2, r3, [sp, #24]
 800225a:	a333      	add	r3, pc, #204	; (adr r3, 8002328 <main+0x180>)
 800225c:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002260:	e9cd 2308 	strd	r2, r3, [sp, #32]
 8002264:	a332      	add	r3, pc, #200	; (adr r3, 8002330 <main+0x188>)
 8002266:	e9d3 2300 	ldrd	r2, r3, [r3]
 800226a:	e9cd 230a 	strd	r2, r3, [sp, #40]	; 0x28
 800226e:	a332      	add	r3, pc, #200	; (adr r3, 8002338 <main+0x190>)
 8002270:	e9d3 2300 	ldrd	r2, r3, [r3]
 8002274:	e9cd 230c 	strd	r2, r3, [sp, #48]	; 0x30
 8002278:	2200      	movs	r2, #0
 800227a:	f04f 4300 	mov.w	r3, #2147483648	; 0x80000000
 800227e:	f7ff fc15 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 8002282:	482f      	ldr	r0, [pc, #188]	; (8002340 <main+0x198>)
 8002284:	f44f 7100 	mov.w	r1, #512	; 0x200
 8002288:	f7ff faa2 	bl	80017d0 <_ZN5CGPIO7gpio_inEm>
 800228c:	b148      	cbz	r0, 80022a2 <main+0xfa>
 800228e:	482c      	ldr	r0, [pc, #176]	; (8002340 <main+0x198>)
 8002290:	f7fd ffd9 	bl	8000246 <_ZN7CKodama6wakeupEv>
 8002294:	4830      	ldr	r0, [pc, #192]	; (8002358 <main+0x1b0>)
 8002296:	f7ff fe73 	bl	8001f80 <_ZN5CDemo4initEv>
 800229a:	482f      	ldr	r0, [pc, #188]	; (8002358 <main+0x1b0>)
 800229c:	2102      	movs	r1, #2
 800229e:	f7ff ff67 	bl	8002170 <_ZN5CDemo3runEj>
 80022a2:	4827      	ldr	r0, [pc, #156]	; (8002340 <main+0x198>)
 80022a4:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80022a8:	f7ff fa76 	bl	8001798 <_ZN5CGPIO7gpio_onEm>
 80022ac:	482b      	ldr	r0, [pc, #172]	; (800235c <main+0x1b4>)
 80022ae:	210a      	movs	r1, #10
 80022b0:	f7fe fbde 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80022b4:	4822      	ldr	r0, [pc, #136]	; (8002340 <main+0x198>)
 80022b6:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80022ba:	f7ff fa7b 	bl	80017b4 <_ZN5CGPIO8gpio_offEm>
 80022be:	f44f 7196 	mov.w	r1, #300	; 0x12c
 80022c2:	4826      	ldr	r0, [pc, #152]	; (800235c <main+0x1b4>)
 80022c4:	f7fe fbd4 	bl	8000a70 <_ZN6CTimer8delay_msEm>
 80022c8:	4824      	ldr	r0, [pc, #144]	; (800235c <main+0x1b4>)
 80022ca:	f7fe fbc3 	bl	8000a54 <_ZN6CTimer8get_timeEv>
 80022ce:	4924      	ldr	r1, [pc, #144]	; (8002360 <main+0x1b8>)
 80022d0:	4602      	mov	r2, r0
 80022d2:	481b      	ldr	r0, [pc, #108]	; (8002340 <main+0x198>)
 80022d4:	f7ff fbea 	bl	8001aac <_ZN9CTerminal6printfEPKcz>
 80022d8:	e7d3      	b.n	8002282 <main+0xda>
 80022da:	bf00      	nop
 80022dc:	f3af 8000 	nop.w
 80022e0:	60000000 	.word	0x60000000
 80022e4:	400921fb 	.word	0x400921fb
 80022e8:	00000000 	.word	0x00000000
 80022ec:	3fbf9ad0 	.word	0x3fbf9ad0
 80022f0:	20000000 	.word	0x20000000
 80022f4:	40406251 	.word	0x40406251
 80022f8:	60000000 	.word	0x60000000
 80022fc:	40934a45 	.word	0x40934a45
 8002300:	c0000000 	.word	0xc0000000
 8002304:	4016cccc 	.word	0x4016cccc
 8002308:	a0000000 	.word	0xa0000000
 800230c:	4016e147 	.word	0x4016e147
 8002310:	00000000 	.word	0x00000000
 8002314:	bfbf9ad0 	.word	0xbfbf9ad0
 8002318:	60000000 	.word	0x60000000
 800231c:	c00921fb 	.word	0xc00921fb
 8002320:	20000000 	.word	0x20000000
 8002324:	c0406251 	.word	0xc0406251
 8002328:	60000000 	.word	0x60000000
 800232c:	c0934a45 	.word	0xc0934a45
 8002330:	c0000000 	.word	0xc0000000
 8002334:	c016cccc 	.word	0xc016cccc
 8002338:	a0000000 	.word	0xa0000000
 800233c:	c016e147 	.word	0xc016e147
 8002340:	20000030 	.word	0x20000030
 8002344:	08002ddd 	.word	0x08002ddd
 8002348:	08002dfd 	.word	0x08002dfd
 800234c:	3ff00000 	.word	0x3ff00000
 8002350:	08002e0f 	.word	0x08002e0f
 8002354:	bff00000 	.word	0xbff00000
 8002358:	200003a8 	.word	0x200003a8
 800235c:	2000013c 	.word	0x2000013c
 8002360:	08002e28 	.word	0x08002e28

08002364 <RCC_GetClocksFreq>:
 8002364:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8002368:	4f9b      	ldr	r7, [pc, #620]	; (80025d8 <RCC_GetClocksFreq+0x274>)
 800236a:	687b      	ldr	r3, [r7, #4]
 800236c:	f003 030c 	and.w	r3, r3, #12
 8002370:	2b04      	cmp	r3, #4
 8002372:	d005      	beq.n	8002380 <RCC_GetClocksFreq+0x1c>
 8002374:	2b08      	cmp	r3, #8
 8002376:	d006      	beq.n	8002386 <RCC_GetClocksFreq+0x22>
 8002378:	4a98      	ldr	r2, [pc, #608]	; (80025dc <RCC_GetClocksFreq+0x278>)
 800237a:	6002      	str	r2, [r0, #0]
 800237c:	b9b3      	cbnz	r3, 80023ac <RCC_GetClocksFreq+0x48>
 800237e:	e016      	b.n	80023ae <RCC_GetClocksFreq+0x4a>
 8002380:	4b96      	ldr	r3, [pc, #600]	; (80025dc <RCC_GetClocksFreq+0x278>)
 8002382:	6003      	str	r3, [r0, #0]
 8002384:	e012      	b.n	80023ac <RCC_GetClocksFreq+0x48>
 8002386:	687b      	ldr	r3, [r7, #4]
 8002388:	6879      	ldr	r1, [r7, #4]
 800238a:	f3c3 4383 	ubfx	r3, r3, #18, #4
 800238e:	1c9a      	adds	r2, r3, #2
 8002390:	03cb      	lsls	r3, r1, #15
 8002392:	bf49      	itett	mi
 8002394:	6afb      	ldrmi	r3, [r7, #44]	; 0x2c
 8002396:	4b92      	ldrpl	r3, [pc, #584]	; (80025e0 <RCC_GetClocksFreq+0x27c>)
 8002398:	4990      	ldrmi	r1, [pc, #576]	; (80025dc <RCC_GetClocksFreq+0x278>)
 800239a:	f003 030f 	andmi.w	r3, r3, #15
 800239e:	bf44      	itt	mi
 80023a0:	3301      	addmi	r3, #1
 80023a2:	fbb1 f3f3 	udivmi	r3, r1, r3
 80023a6:	4353      	muls	r3, r2
 80023a8:	6003      	str	r3, [r0, #0]
 80023aa:	e000      	b.n	80023ae <RCC_GetClocksFreq+0x4a>
 80023ac:	2300      	movs	r3, #0
 80023ae:	687a      	ldr	r2, [r7, #4]
 80023b0:	4e8c      	ldr	r6, [pc, #560]	; (80025e4 <RCC_GetClocksFreq+0x280>)
 80023b2:	f8df c234 	ldr.w	ip, [pc, #564]	; 80025e8 <RCC_GetClocksFreq+0x284>
 80023b6:	f3c2 1203 	ubfx	r2, r2, #4, #4
 80023ba:	5cb4      	ldrb	r4, [r6, r2]
 80023bc:	6802      	ldr	r2, [r0, #0]
 80023be:	b2e4      	uxtb	r4, r4
 80023c0:	fa22 f104 	lsr.w	r1, r2, r4
 80023c4:	6041      	str	r1, [r0, #4]
 80023c6:	687d      	ldr	r5, [r7, #4]
 80023c8:	f3c5 2502 	ubfx	r5, r5, #8, #3
 80023cc:	5d75      	ldrb	r5, [r6, r5]
 80023ce:	fa21 fe05 	lsr.w	lr, r1, r5
 80023d2:	f8c0 e008 	str.w	lr, [r0, #8]
 80023d6:	687d      	ldr	r5, [r7, #4]
 80023d8:	f3c5 25c2 	ubfx	r5, r5, #11, #3
 80023dc:	5d75      	ldrb	r5, [r6, r5]
 80023de:	b2ed      	uxtb	r5, r5
 80023e0:	40e9      	lsrs	r1, r5
 80023e2:	60c1      	str	r1, [r0, #12]
 80023e4:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 80023e6:	f3c6 1804 	ubfx	r8, r6, #4, #5
 80023ea:	f008 060f 	and.w	r6, r8, #15
 80023ee:	f018 0f10 	tst.w	r8, #16
 80023f2:	f83c 6016 	ldrh.w	r6, [ip, r6, lsl #1]
 80023f6:	46e0      	mov	r8, ip
 80023f8:	b2b6      	uxth	r6, r6
 80023fa:	d004      	beq.n	8002406 <RCC_GetClocksFreq+0xa2>
 80023fc:	b11e      	cbz	r6, 8002406 <RCC_GetClocksFreq+0xa2>
 80023fe:	fbb3 f6f6 	udiv	r6, r3, r6
 8002402:	6106      	str	r6, [r0, #16]
 8002404:	e000      	b.n	8002408 <RCC_GetClocksFreq+0xa4>
 8002406:	6102      	str	r2, [r0, #16]
 8002408:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 800240a:	f3c6 2c44 	ubfx	ip, r6, #9, #5
 800240e:	f00c 060f 	and.w	r6, ip, #15
 8002412:	f01c 0f10 	tst.w	ip, #16
 8002416:	f838 6016 	ldrh.w	r6, [r8, r6, lsl #1]
 800241a:	b2b6      	uxth	r6, r6
 800241c:	d004      	beq.n	8002428 <RCC_GetClocksFreq+0xc4>
 800241e:	b11e      	cbz	r6, 8002428 <RCC_GetClocksFreq+0xc4>
 8002420:	fbb3 f6f6 	udiv	r6, r3, r6
 8002424:	6146      	str	r6, [r0, #20]
 8002426:	e000      	b.n	800242a <RCC_GetClocksFreq+0xc6>
 8002428:	6142      	str	r2, [r0, #20]
 800242a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800242c:	06f6      	lsls	r6, r6, #27
 800242e:	bf5a      	itte	pl
 8002430:	4e6a      	ldrpl	r6, [pc, #424]	; (80025dc <RCC_GetClocksFreq+0x278>)
 8002432:	6186      	strpl	r6, [r0, #24]
 8002434:	6182      	strmi	r2, [r0, #24]
 8002436:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002438:	06b6      	lsls	r6, r6, #26
 800243a:	bf5a      	itte	pl
 800243c:	4e67      	ldrpl	r6, [pc, #412]	; (80025dc <RCC_GetClocksFreq+0x278>)
 800243e:	61c6      	strpl	r6, [r0, #28]
 8002440:	61c2      	strmi	r2, [r0, #28]
 8002442:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002444:	0676      	lsls	r6, r6, #25
 8002446:	bf5a      	itte	pl
 8002448:	4e64      	ldrpl	r6, [pc, #400]	; (80025dc <RCC_GetClocksFreq+0x278>)
 800244a:	6206      	strpl	r6, [r0, #32]
 800244c:	6202      	strmi	r2, [r0, #32]
 800244e:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002450:	05f6      	lsls	r6, r6, #23
 8002452:	d506      	bpl.n	8002462 <RCC_GetClocksFreq+0xfe>
 8002454:	429a      	cmp	r2, r3
 8002456:	d104      	bne.n	8002462 <RCC_GetClocksFreq+0xfe>
 8002458:	42a5      	cmp	r5, r4
 800245a:	d102      	bne.n	8002462 <RCC_GetClocksFreq+0xfe>
 800245c:	0056      	lsls	r6, r2, #1
 800245e:	6246      	str	r6, [r0, #36]	; 0x24
 8002460:	e000      	b.n	8002464 <RCC_GetClocksFreq+0x100>
 8002462:	6241      	str	r1, [r0, #36]	; 0x24
 8002464:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002466:	04f6      	lsls	r6, r6, #19
 8002468:	d506      	bpl.n	8002478 <RCC_GetClocksFreq+0x114>
 800246a:	429a      	cmp	r2, r3
 800246c:	d104      	bne.n	8002478 <RCC_GetClocksFreq+0x114>
 800246e:	42a5      	cmp	r5, r4
 8002470:	d102      	bne.n	8002478 <RCC_GetClocksFreq+0x114>
 8002472:	0056      	lsls	r6, r2, #1
 8002474:	6286      	str	r6, [r0, #40]	; 0x28
 8002476:	e000      	b.n	800247a <RCC_GetClocksFreq+0x116>
 8002478:	6281      	str	r1, [r0, #40]	; 0x28
 800247a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800247c:	05b6      	lsls	r6, r6, #22
 800247e:	d506      	bpl.n	800248e <RCC_GetClocksFreq+0x12a>
 8002480:	429a      	cmp	r2, r3
 8002482:	d104      	bne.n	800248e <RCC_GetClocksFreq+0x12a>
 8002484:	42a5      	cmp	r5, r4
 8002486:	d102      	bne.n	800248e <RCC_GetClocksFreq+0x12a>
 8002488:	0056      	lsls	r6, r2, #1
 800248a:	62c6      	str	r6, [r0, #44]	; 0x2c
 800248c:	e000      	b.n	8002490 <RCC_GetClocksFreq+0x12c>
 800248e:	62c1      	str	r1, [r0, #44]	; 0x2c
 8002490:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8002492:	0576      	lsls	r6, r6, #21
 8002494:	d506      	bpl.n	80024a4 <RCC_GetClocksFreq+0x140>
 8002496:	429a      	cmp	r2, r3
 8002498:	d104      	bne.n	80024a4 <RCC_GetClocksFreq+0x140>
 800249a:	42a5      	cmp	r5, r4
 800249c:	d102      	bne.n	80024a4 <RCC_GetClocksFreq+0x140>
 800249e:	0056      	lsls	r6, r2, #1
 80024a0:	64c6      	str	r6, [r0, #76]	; 0x4c
 80024a2:	e000      	b.n	80024a6 <RCC_GetClocksFreq+0x142>
 80024a4:	64c1      	str	r1, [r0, #76]	; 0x4c
 80024a6:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80024a8:	0536      	lsls	r6, r6, #20
 80024aa:	d506      	bpl.n	80024ba <RCC_GetClocksFreq+0x156>
 80024ac:	429a      	cmp	r2, r3
 80024ae:	d104      	bne.n	80024ba <RCC_GetClocksFreq+0x156>
 80024b0:	42a5      	cmp	r5, r4
 80024b2:	d102      	bne.n	80024ba <RCC_GetClocksFreq+0x156>
 80024b4:	0056      	lsls	r6, r2, #1
 80024b6:	6506      	str	r6, [r0, #80]	; 0x50
 80024b8:	e000      	b.n	80024bc <RCC_GetClocksFreq+0x158>
 80024ba:	6501      	str	r1, [r0, #80]	; 0x50
 80024bc:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80024be:	04b6      	lsls	r6, r6, #18
 80024c0:	d506      	bpl.n	80024d0 <RCC_GetClocksFreq+0x16c>
 80024c2:	429a      	cmp	r2, r3
 80024c4:	d104      	bne.n	80024d0 <RCC_GetClocksFreq+0x16c>
 80024c6:	42a5      	cmp	r5, r4
 80024c8:	d102      	bne.n	80024d0 <RCC_GetClocksFreq+0x16c>
 80024ca:	0056      	lsls	r6, r2, #1
 80024cc:	6546      	str	r6, [r0, #84]	; 0x54
 80024ce:	e000      	b.n	80024d2 <RCC_GetClocksFreq+0x16e>
 80024d0:	6501      	str	r1, [r0, #80]	; 0x50
 80024d2:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80024d4:	0436      	lsls	r6, r6, #16
 80024d6:	d506      	bpl.n	80024e6 <RCC_GetClocksFreq+0x182>
 80024d8:	429a      	cmp	r2, r3
 80024da:	d104      	bne.n	80024e6 <RCC_GetClocksFreq+0x182>
 80024dc:	42a5      	cmp	r5, r4
 80024de:	d102      	bne.n	80024e6 <RCC_GetClocksFreq+0x182>
 80024e0:	0053      	lsls	r3, r2, #1
 80024e2:	6583      	str	r3, [r0, #88]	; 0x58
 80024e4:	e000      	b.n	80024e8 <RCC_GetClocksFreq+0x184>
 80024e6:	6581      	str	r1, [r0, #88]	; 0x58
 80024e8:	6b3c      	ldr	r4, [r7, #48]	; 0x30
 80024ea:	4b3b      	ldr	r3, [pc, #236]	; (80025d8 <RCC_GetClocksFreq+0x274>)
 80024ec:	07a4      	lsls	r4, r4, #30
 80024ee:	d101      	bne.n	80024f4 <RCC_GetClocksFreq+0x190>
 80024f0:	6381      	str	r1, [r0, #56]	; 0x38
 80024f2:	e015      	b.n	8002520 <RCC_GetClocksFreq+0x1bc>
 80024f4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80024f6:	f001 0103 	and.w	r1, r1, #3
 80024fa:	2901      	cmp	r1, #1
 80024fc:	d101      	bne.n	8002502 <RCC_GetClocksFreq+0x19e>
 80024fe:	6382      	str	r2, [r0, #56]	; 0x38
 8002500:	e00e      	b.n	8002520 <RCC_GetClocksFreq+0x1bc>
 8002502:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002504:	f001 0103 	and.w	r1, r1, #3
 8002508:	2902      	cmp	r1, #2
 800250a:	d102      	bne.n	8002512 <RCC_GetClocksFreq+0x1ae>
 800250c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002510:	e005      	b.n	800251e <RCC_GetClocksFreq+0x1ba>
 8002512:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002514:	f003 0303 	and.w	r3, r3, #3
 8002518:	2b03      	cmp	r3, #3
 800251a:	d101      	bne.n	8002520 <RCC_GetClocksFreq+0x1bc>
 800251c:	4b2f      	ldr	r3, [pc, #188]	; (80025dc <RCC_GetClocksFreq+0x278>)
 800251e:	6383      	str	r3, [r0, #56]	; 0x38
 8002520:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8002522:	4b2d      	ldr	r3, [pc, #180]	; (80025d8 <RCC_GetClocksFreq+0x274>)
 8002524:	f411 3f40 	tst.w	r1, #196608	; 0x30000
 8002528:	d102      	bne.n	8002530 <RCC_GetClocksFreq+0x1cc>
 800252a:	f8c0 e03c 	str.w	lr, [r0, #60]	; 0x3c
 800252e:	e018      	b.n	8002562 <RCC_GetClocksFreq+0x1fe>
 8002530:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002532:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002536:	f5b1 3f80 	cmp.w	r1, #65536	; 0x10000
 800253a:	d101      	bne.n	8002540 <RCC_GetClocksFreq+0x1dc>
 800253c:	63c2      	str	r2, [r0, #60]	; 0x3c
 800253e:	e010      	b.n	8002562 <RCC_GetClocksFreq+0x1fe>
 8002540:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002542:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8002546:	f5b1 3f00 	cmp.w	r1, #131072	; 0x20000
 800254a:	d102      	bne.n	8002552 <RCC_GetClocksFreq+0x1ee>
 800254c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002550:	e006      	b.n	8002560 <RCC_GetClocksFreq+0x1fc>
 8002552:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002554:	f403 3340 	and.w	r3, r3, #196608	; 0x30000
 8002558:	f5b3 3f40 	cmp.w	r3, #196608	; 0x30000
 800255c:	d101      	bne.n	8002562 <RCC_GetClocksFreq+0x1fe>
 800255e:	4b1f      	ldr	r3, [pc, #124]	; (80025dc <RCC_GetClocksFreq+0x278>)
 8002560:	63c3      	str	r3, [r0, #60]	; 0x3c
 8002562:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8002564:	4b1c      	ldr	r3, [pc, #112]	; (80025d8 <RCC_GetClocksFreq+0x274>)
 8002566:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 800256a:	d102      	bne.n	8002572 <RCC_GetClocksFreq+0x20e>
 800256c:	f8c0 e040 	str.w	lr, [r0, #64]	; 0x40
 8002570:	e018      	b.n	80025a4 <RCC_GetClocksFreq+0x240>
 8002572:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002574:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002578:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 800257c:	d101      	bne.n	8002582 <RCC_GetClocksFreq+0x21e>
 800257e:	6402      	str	r2, [r0, #64]	; 0x40
 8002580:	e010      	b.n	80025a4 <RCC_GetClocksFreq+0x240>
 8002582:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002584:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002588:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 800258c:	d102      	bne.n	8002594 <RCC_GetClocksFreq+0x230>
 800258e:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002592:	e006      	b.n	80025a2 <RCC_GetClocksFreq+0x23e>
 8002594:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002596:	f403 2340 	and.w	r3, r3, #786432	; 0xc0000
 800259a:	f5b3 2f40 	cmp.w	r3, #786432	; 0xc0000
 800259e:	d101      	bne.n	80025a4 <RCC_GetClocksFreq+0x240>
 80025a0:	4b0e      	ldr	r3, [pc, #56]	; (80025dc <RCC_GetClocksFreq+0x278>)
 80025a2:	6403      	str	r3, [r0, #64]	; 0x40
 80025a4:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80025a6:	4b0c      	ldr	r3, [pc, #48]	; (80025d8 <RCC_GetClocksFreq+0x274>)
 80025a8:	f411 1f40 	tst.w	r1, #3145728	; 0x300000
 80025ac:	d102      	bne.n	80025b4 <RCC_GetClocksFreq+0x250>
 80025ae:	f8c0 e044 	str.w	lr, [r0, #68]	; 0x44
 80025b2:	e023      	b.n	80025fc <RCC_GetClocksFreq+0x298>
 80025b4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80025b6:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 80025ba:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 80025be:	d101      	bne.n	80025c4 <RCC_GetClocksFreq+0x260>
 80025c0:	6442      	str	r2, [r0, #68]	; 0x44
 80025c2:	e01b      	b.n	80025fc <RCC_GetClocksFreq+0x298>
 80025c4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80025c6:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 80025ca:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 80025ce:	d10d      	bne.n	80025ec <RCC_GetClocksFreq+0x288>
 80025d0:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80025d4:	e011      	b.n	80025fa <RCC_GetClocksFreq+0x296>
 80025d6:	bf00      	nop
 80025d8:	40021000 	.word	0x40021000
 80025dc:	007a1200 	.word	0x007a1200
 80025e0:	003d0900 	.word	0x003d0900
 80025e4:	20000020 	.word	0x20000020
 80025e8:	20000000 	.word	0x20000000
 80025ec:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80025ee:	f403 1340 	and.w	r3, r3, #3145728	; 0x300000
 80025f2:	f5b3 1f40 	cmp.w	r3, #3145728	; 0x300000
 80025f6:	d101      	bne.n	80025fc <RCC_GetClocksFreq+0x298>
 80025f8:	4b13      	ldr	r3, [pc, #76]	; (8002648 <RCC_GetClocksFreq+0x2e4>)
 80025fa:	6443      	str	r3, [r0, #68]	; 0x44
 80025fc:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80025fe:	4b13      	ldr	r3, [pc, #76]	; (800264c <RCC_GetClocksFreq+0x2e8>)
 8002600:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8002604:	d103      	bne.n	800260e <RCC_GetClocksFreq+0x2aa>
 8002606:	f8c0 e048 	str.w	lr, [r0, #72]	; 0x48
 800260a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800260e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002610:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8002614:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8002618:	d102      	bne.n	8002620 <RCC_GetClocksFreq+0x2bc>
 800261a:	6482      	str	r2, [r0, #72]	; 0x48
 800261c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8002620:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8002622:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 8002626:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 800262a:	d102      	bne.n	8002632 <RCC_GetClocksFreq+0x2ce>
 800262c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8002630:	e006      	b.n	8002640 <RCC_GetClocksFreq+0x2dc>
 8002632:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002634:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8002638:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 800263c:	d101      	bne.n	8002642 <RCC_GetClocksFreq+0x2de>
 800263e:	4b02      	ldr	r3, [pc, #8]	; (8002648 <RCC_GetClocksFreq+0x2e4>)
 8002640:	6483      	str	r3, [r0, #72]	; 0x48
 8002642:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8002646:	bf00      	nop
 8002648:	007a1200 	.word	0x007a1200
 800264c:	40021000 	.word	0x40021000

08002650 <RCC_AHBPeriphClockCmd>:
 8002650:	bf00      	nop
 8002652:	bf00      	nop
 8002654:	4b04      	ldr	r3, [pc, #16]	; (8002668 <RCC_AHBPeriphClockCmd+0x18>)
 8002656:	695a      	ldr	r2, [r3, #20]
 8002658:	b109      	cbz	r1, 800265e <RCC_AHBPeriphClockCmd+0xe>
 800265a:	4310      	orrs	r0, r2
 800265c:	e001      	b.n	8002662 <RCC_AHBPeriphClockCmd+0x12>
 800265e:	ea22 0000 	bic.w	r0, r2, r0
 8002662:	6158      	str	r0, [r3, #20]
 8002664:	4770      	bx	lr
 8002666:	bf00      	nop
 8002668:	40021000 	.word	0x40021000

0800266c <RCC_APB2PeriphClockCmd>:
 800266c:	bf00      	nop
 800266e:	bf00      	nop
 8002670:	4b04      	ldr	r3, [pc, #16]	; (8002684 <RCC_APB2PeriphClockCmd+0x18>)
 8002672:	699a      	ldr	r2, [r3, #24]
 8002674:	b109      	cbz	r1, 800267a <RCC_APB2PeriphClockCmd+0xe>
 8002676:	4310      	orrs	r0, r2
 8002678:	e001      	b.n	800267e <RCC_APB2PeriphClockCmd+0x12>
 800267a:	ea22 0000 	bic.w	r0, r2, r0
 800267e:	6198      	str	r0, [r3, #24]
 8002680:	4770      	bx	lr
 8002682:	bf00      	nop
 8002684:	40021000 	.word	0x40021000

08002688 <RCC_APB1PeriphClockCmd>:
 8002688:	bf00      	nop
 800268a:	bf00      	nop
 800268c:	4b04      	ldr	r3, [pc, #16]	; (80026a0 <RCC_APB1PeriphClockCmd+0x18>)
 800268e:	69da      	ldr	r2, [r3, #28]
 8002690:	b109      	cbz	r1, 8002696 <RCC_APB1PeriphClockCmd+0xe>
 8002692:	4310      	orrs	r0, r2
 8002694:	e001      	b.n	800269a <RCC_APB1PeriphClockCmd+0x12>
 8002696:	ea22 0000 	bic.w	r0, r2, r0
 800269a:	61d8      	str	r0, [r3, #28]
 800269c:	4770      	bx	lr
 800269e:	bf00      	nop
 80026a0:	40021000 	.word	0x40021000

080026a4 <TIM_TimeBaseInit>:
 80026a4:	bf00      	nop
 80026a6:	bf00      	nop
 80026a8:	bf00      	nop
 80026aa:	4a24      	ldr	r2, [pc, #144]	; (800273c <TIM_TimeBaseInit+0x98>)
 80026ac:	8803      	ldrh	r3, [r0, #0]
 80026ae:	4290      	cmp	r0, r2
 80026b0:	b29b      	uxth	r3, r3
 80026b2:	d012      	beq.n	80026da <TIM_TimeBaseInit+0x36>
 80026b4:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80026b8:	4290      	cmp	r0, r2
 80026ba:	d00e      	beq.n	80026da <TIM_TimeBaseInit+0x36>
 80026bc:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80026c0:	d00b      	beq.n	80026da <TIM_TimeBaseInit+0x36>
 80026c2:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 80026c6:	4290      	cmp	r0, r2
 80026c8:	d007      	beq.n	80026da <TIM_TimeBaseInit+0x36>
 80026ca:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80026ce:	4290      	cmp	r0, r2
 80026d0:	d003      	beq.n	80026da <TIM_TimeBaseInit+0x36>
 80026d2:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 80026d6:	4290      	cmp	r0, r2
 80026d8:	d103      	bne.n	80026e2 <TIM_TimeBaseInit+0x3e>
 80026da:	884a      	ldrh	r2, [r1, #2]
 80026dc:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80026e0:	4313      	orrs	r3, r2
 80026e2:	4a17      	ldr	r2, [pc, #92]	; (8002740 <TIM_TimeBaseInit+0x9c>)
 80026e4:	4290      	cmp	r0, r2
 80026e6:	d008      	beq.n	80026fa <TIM_TimeBaseInit+0x56>
 80026e8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80026ec:	4290      	cmp	r0, r2
 80026ee:	bf1f      	itttt	ne
 80026f0:	f423 7340 	bicne.w	r3, r3, #768	; 0x300
 80026f4:	890a      	ldrhne	r2, [r1, #8]
 80026f6:	b29b      	uxthne	r3, r3
 80026f8:	4313      	orrne	r3, r2
 80026fa:	8003      	strh	r3, [r0, #0]
 80026fc:	684b      	ldr	r3, [r1, #4]
 80026fe:	62c3      	str	r3, [r0, #44]	; 0x2c
 8002700:	880b      	ldrh	r3, [r1, #0]
 8002702:	8503      	strh	r3, [r0, #40]	; 0x28
 8002704:	4b0d      	ldr	r3, [pc, #52]	; (800273c <TIM_TimeBaseInit+0x98>)
 8002706:	4298      	cmp	r0, r3
 8002708:	d013      	beq.n	8002732 <TIM_TimeBaseInit+0x8e>
 800270a:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 800270e:	4298      	cmp	r0, r3
 8002710:	d00f      	beq.n	8002732 <TIM_TimeBaseInit+0x8e>
 8002712:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8002716:	4298      	cmp	r0, r3
 8002718:	d00b      	beq.n	8002732 <TIM_TimeBaseInit+0x8e>
 800271a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800271e:	4298      	cmp	r0, r3
 8002720:	d007      	beq.n	8002732 <TIM_TimeBaseInit+0x8e>
 8002722:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8002726:	4298      	cmp	r0, r3
 8002728:	d003      	beq.n	8002732 <TIM_TimeBaseInit+0x8e>
 800272a:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 800272e:	4298      	cmp	r0, r3
 8002730:	d101      	bne.n	8002736 <TIM_TimeBaseInit+0x92>
 8002732:	894b      	ldrh	r3, [r1, #10]
 8002734:	8603      	strh	r3, [r0, #48]	; 0x30
 8002736:	2301      	movs	r3, #1
 8002738:	6143      	str	r3, [r0, #20]
 800273a:	4770      	bx	lr
 800273c:	40012c00 	.word	0x40012c00
 8002740:	40001000 	.word	0x40001000

08002744 <TIM_Cmd>:
 8002744:	bf00      	nop
 8002746:	bf00      	nop
 8002748:	8803      	ldrh	r3, [r0, #0]
 800274a:	b119      	cbz	r1, 8002754 <TIM_Cmd+0x10>
 800274c:	b29b      	uxth	r3, r3
 800274e:	f043 0301 	orr.w	r3, r3, #1
 8002752:	e003      	b.n	800275c <TIM_Cmd+0x18>
 8002754:	f023 0301 	bic.w	r3, r3, #1
 8002758:	041b      	lsls	r3, r3, #16
 800275a:	0c1b      	lsrs	r3, r3, #16
 800275c:	8003      	strh	r3, [r0, #0]
 800275e:	4770      	bx	lr

08002760 <TIM_ClearITPendingBit>:
 8002760:	bf00      	nop
 8002762:	43c9      	mvns	r1, r1
 8002764:	b289      	uxth	r1, r1
 8002766:	6101      	str	r1, [r0, #16]
 8002768:	4770      	bx	lr
	...

0800276c <USART_Init>:
 800276c:	b530      	push	{r4, r5, lr}
 800276e:	4604      	mov	r4, r0
 8002770:	b099      	sub	sp, #100	; 0x64
 8002772:	460d      	mov	r5, r1
 8002774:	bf00      	nop
 8002776:	bf00      	nop
 8002778:	bf00      	nop
 800277a:	bf00      	nop
 800277c:	bf00      	nop
 800277e:	bf00      	nop
 8002780:	bf00      	nop
 8002782:	6803      	ldr	r3, [r0, #0]
 8002784:	f023 0301 	bic.w	r3, r3, #1
 8002788:	6003      	str	r3, [r0, #0]
 800278a:	6843      	ldr	r3, [r0, #4]
 800278c:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 8002790:	688b      	ldr	r3, [r1, #8]
 8002792:	68c9      	ldr	r1, [r1, #12]
 8002794:	4313      	orrs	r3, r2
 8002796:	6043      	str	r3, [r0, #4]
 8002798:	686a      	ldr	r2, [r5, #4]
 800279a:	6803      	ldr	r3, [r0, #0]
 800279c:	4311      	orrs	r1, r2
 800279e:	692a      	ldr	r2, [r5, #16]
 80027a0:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 80027a4:	430a      	orrs	r2, r1
 80027a6:	f023 030c 	bic.w	r3, r3, #12
 80027aa:	4313      	orrs	r3, r2
 80027ac:	6003      	str	r3, [r0, #0]
 80027ae:	6883      	ldr	r3, [r0, #8]
 80027b0:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 80027b4:	696b      	ldr	r3, [r5, #20]
 80027b6:	4313      	orrs	r3, r2
 80027b8:	6083      	str	r3, [r0, #8]
 80027ba:	a801      	add	r0, sp, #4
 80027bc:	f7ff fdd2 	bl	8002364 <RCC_GetClocksFreq>
 80027c0:	4b17      	ldr	r3, [pc, #92]	; (8002820 <USART_Init+0xb4>)
 80027c2:	429c      	cmp	r4, r3
 80027c4:	d101      	bne.n	80027ca <USART_Init+0x5e>
 80027c6:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 80027c8:	e00e      	b.n	80027e8 <USART_Init+0x7c>
 80027ca:	4b16      	ldr	r3, [pc, #88]	; (8002824 <USART_Init+0xb8>)
 80027cc:	429c      	cmp	r4, r3
 80027ce:	d101      	bne.n	80027d4 <USART_Init+0x68>
 80027d0:	9b10      	ldr	r3, [sp, #64]	; 0x40
 80027d2:	e009      	b.n	80027e8 <USART_Init+0x7c>
 80027d4:	4b14      	ldr	r3, [pc, #80]	; (8002828 <USART_Init+0xbc>)
 80027d6:	429c      	cmp	r4, r3
 80027d8:	d101      	bne.n	80027de <USART_Init+0x72>
 80027da:	9b11      	ldr	r3, [sp, #68]	; 0x44
 80027dc:	e004      	b.n	80027e8 <USART_Init+0x7c>
 80027de:	4b13      	ldr	r3, [pc, #76]	; (800282c <USART_Init+0xc0>)
 80027e0:	429c      	cmp	r4, r3
 80027e2:	bf0c      	ite	eq
 80027e4:	9b12      	ldreq	r3, [sp, #72]	; 0x48
 80027e6:	9b13      	ldrne	r3, [sp, #76]	; 0x4c
 80027e8:	6822      	ldr	r2, [r4, #0]
 80027ea:	6829      	ldr	r1, [r5, #0]
 80027ec:	f412 4f00 	tst.w	r2, #32768	; 0x8000
 80027f0:	bf18      	it	ne
 80027f2:	005b      	lslne	r3, r3, #1
 80027f4:	fbb3 f2f1 	udiv	r2, r3, r1
 80027f8:	fb01 3312 	mls	r3, r1, r2, r3
 80027fc:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
 8002800:	6823      	ldr	r3, [r4, #0]
 8002802:	bf28      	it	cs
 8002804:	3201      	addcs	r2, #1
 8002806:	041b      	lsls	r3, r3, #16
 8002808:	bf41      	itttt	mi
 800280a:	f64f 73f0 	movwmi	r3, #65520	; 0xfff0
 800280e:	f3c2 0142 	ubfxmi	r1, r2, #1, #3
 8002812:	4013      	andmi	r3, r2
 8002814:	ea41 0203 	orrmi.w	r2, r1, r3
 8002818:	b292      	uxth	r2, r2
 800281a:	81a2      	strh	r2, [r4, #12]
 800281c:	b019      	add	sp, #100	; 0x64
 800281e:	bd30      	pop	{r4, r5, pc}
 8002820:	40013800 	.word	0x40013800
 8002824:	40004400 	.word	0x40004400
 8002828:	40004800 	.word	0x40004800
 800282c:	40004c00 	.word	0x40004c00

08002830 <USART_Cmd>:
 8002830:	bf00      	nop
 8002832:	bf00      	nop
 8002834:	6803      	ldr	r3, [r0, #0]
 8002836:	b111      	cbz	r1, 800283e <USART_Cmd+0xe>
 8002838:	f043 0301 	orr.w	r3, r3, #1
 800283c:	e001      	b.n	8002842 <USART_Cmd+0x12>
 800283e:	f023 0301 	bic.w	r3, r3, #1
 8002842:	6003      	str	r3, [r0, #0]
 8002844:	4770      	bx	lr

08002846 <USART_ReceiveData>:
 8002846:	bf00      	nop
 8002848:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 800284a:	f3c0 0008 	ubfx	r0, r0, #0, #9
 800284e:	4770      	bx	lr

08002850 <USART_ITConfig>:
 8002850:	b510      	push	{r4, lr}
 8002852:	bf00      	nop
 8002854:	bf00      	nop
 8002856:	bf00      	nop
 8002858:	f3c1 2407 	ubfx	r4, r1, #8, #8
 800285c:	2301      	movs	r3, #1
 800285e:	b2c9      	uxtb	r1, r1
 8002860:	2c02      	cmp	r4, #2
 8002862:	fa03 f301 	lsl.w	r3, r3, r1
 8002866:	d101      	bne.n	800286c <USART_ITConfig+0x1c>
 8002868:	3004      	adds	r0, #4
 800286a:	e002      	b.n	8002872 <USART_ITConfig+0x22>
 800286c:	2c03      	cmp	r4, #3
 800286e:	bf08      	it	eq
 8002870:	3008      	addeq	r0, #8
 8002872:	b112      	cbz	r2, 800287a <USART_ITConfig+0x2a>
 8002874:	6802      	ldr	r2, [r0, #0]
 8002876:	4313      	orrs	r3, r2
 8002878:	e002      	b.n	8002880 <USART_ITConfig+0x30>
 800287a:	6802      	ldr	r2, [r0, #0]
 800287c:	ea22 0303 	bic.w	r3, r2, r3
 8002880:	6003      	str	r3, [r0, #0]
 8002882:	bd10      	pop	{r4, pc}

08002884 <USART_GetITStatus>:
 8002884:	b510      	push	{r4, lr}
 8002886:	bf00      	nop
 8002888:	bf00      	nop
 800288a:	f3c1 2207 	ubfx	r2, r1, #8, #8
 800288e:	b2cc      	uxtb	r4, r1
 8002890:	2301      	movs	r3, #1
 8002892:	2a01      	cmp	r2, #1
 8002894:	fa03 f304 	lsl.w	r3, r3, r4
 8002898:	d101      	bne.n	800289e <USART_GetITStatus+0x1a>
 800289a:	6802      	ldr	r2, [r0, #0]
 800289c:	e003      	b.n	80028a6 <USART_GetITStatus+0x22>
 800289e:	2a02      	cmp	r2, #2
 80028a0:	bf0c      	ite	eq
 80028a2:	6842      	ldreq	r2, [r0, #4]
 80028a4:	6882      	ldrne	r2, [r0, #8]
 80028a6:	4013      	ands	r3, r2
 80028a8:	69c2      	ldr	r2, [r0, #28]
 80028aa:	b13b      	cbz	r3, 80028bc <USART_GetITStatus+0x38>
 80028ac:	0c09      	lsrs	r1, r1, #16
 80028ae:	2301      	movs	r3, #1
 80028b0:	408b      	lsls	r3, r1
 80028b2:	4213      	tst	r3, r2
 80028b4:	bf14      	ite	ne
 80028b6:	2001      	movne	r0, #1
 80028b8:	2000      	moveq	r0, #0
 80028ba:	bd10      	pop	{r4, pc}
 80028bc:	4618      	mov	r0, r3
 80028be:	bd10      	pop	{r4, pc}

080028c0 <USART_ClearITPendingBit>:
 80028c0:	bf00      	nop
 80028c2:	bf00      	nop
 80028c4:	2301      	movs	r3, #1
 80028c6:	0c09      	lsrs	r1, r1, #16
 80028c8:	408b      	lsls	r3, r1
 80028ca:	6203      	str	r3, [r0, #32]
 80028cc:	4770      	bx	lr
	...

080028d0 <SystemInit>:
 80028d0:	4a39      	ldr	r2, [pc, #228]	; (80029b8 <SystemInit+0xe8>)
 80028d2:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 80028d6:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 80028da:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 80028de:	4b37      	ldr	r3, [pc, #220]	; (80029bc <SystemInit+0xec>)
 80028e0:	681a      	ldr	r2, [r3, #0]
 80028e2:	f042 0201 	orr.w	r2, r2, #1
 80028e6:	601a      	str	r2, [r3, #0]
 80028e8:	6859      	ldr	r1, [r3, #4]
 80028ea:	4a35      	ldr	r2, [pc, #212]	; (80029c0 <SystemInit+0xf0>)
 80028ec:	400a      	ands	r2, r1
 80028ee:	605a      	str	r2, [r3, #4]
 80028f0:	681a      	ldr	r2, [r3, #0]
 80028f2:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80028f6:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80028fa:	601a      	str	r2, [r3, #0]
 80028fc:	681a      	ldr	r2, [r3, #0]
 80028fe:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8002902:	601a      	str	r2, [r3, #0]
 8002904:	685a      	ldr	r2, [r3, #4]
 8002906:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 800290a:	605a      	str	r2, [r3, #4]
 800290c:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800290e:	f022 020f 	bic.w	r2, r2, #15
 8002912:	62da      	str	r2, [r3, #44]	; 0x2c
 8002914:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002916:	4a2b      	ldr	r2, [pc, #172]	; (80029c4 <SystemInit+0xf4>)
 8002918:	b082      	sub	sp, #8
 800291a:	400a      	ands	r2, r1
 800291c:	631a      	str	r2, [r3, #48]	; 0x30
 800291e:	2200      	movs	r2, #0
 8002920:	609a      	str	r2, [r3, #8]
 8002922:	9200      	str	r2, [sp, #0]
 8002924:	9201      	str	r2, [sp, #4]
 8002926:	681a      	ldr	r2, [r3, #0]
 8002928:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 800292c:	601a      	str	r2, [r3, #0]
 800292e:	681a      	ldr	r2, [r3, #0]
 8002930:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8002934:	9201      	str	r2, [sp, #4]
 8002936:	9a00      	ldr	r2, [sp, #0]
 8002938:	3201      	adds	r2, #1
 800293a:	9200      	str	r2, [sp, #0]
 800293c:	9a01      	ldr	r2, [sp, #4]
 800293e:	b91a      	cbnz	r2, 8002948 <SystemInit+0x78>
 8002940:	9a00      	ldr	r2, [sp, #0]
 8002942:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002946:	d1f2      	bne.n	800292e <SystemInit+0x5e>
 8002948:	681a      	ldr	r2, [r3, #0]
 800294a:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 800294e:	bf18      	it	ne
 8002950:	2201      	movne	r2, #1
 8002952:	9201      	str	r2, [sp, #4]
 8002954:	9a01      	ldr	r2, [sp, #4]
 8002956:	2a01      	cmp	r2, #1
 8002958:	d005      	beq.n	8002966 <SystemInit+0x96>
 800295a:	4b17      	ldr	r3, [pc, #92]	; (80029b8 <SystemInit+0xe8>)
 800295c:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8002960:	609a      	str	r2, [r3, #8]
 8002962:	b002      	add	sp, #8
 8002964:	4770      	bx	lr
 8002966:	4a18      	ldr	r2, [pc, #96]	; (80029c8 <SystemInit+0xf8>)
 8002968:	2112      	movs	r1, #18
 800296a:	6011      	str	r1, [r2, #0]
 800296c:	685a      	ldr	r2, [r3, #4]
 800296e:	605a      	str	r2, [r3, #4]
 8002970:	685a      	ldr	r2, [r3, #4]
 8002972:	605a      	str	r2, [r3, #4]
 8002974:	685a      	ldr	r2, [r3, #4]
 8002976:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 800297a:	605a      	str	r2, [r3, #4]
 800297c:	685a      	ldr	r2, [r3, #4]
 800297e:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8002982:	605a      	str	r2, [r3, #4]
 8002984:	685a      	ldr	r2, [r3, #4]
 8002986:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 800298a:	605a      	str	r2, [r3, #4]
 800298c:	681a      	ldr	r2, [r3, #0]
 800298e:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8002992:	601a      	str	r2, [r3, #0]
 8002994:	6819      	ldr	r1, [r3, #0]
 8002996:	4a09      	ldr	r2, [pc, #36]	; (80029bc <SystemInit+0xec>)
 8002998:	0189      	lsls	r1, r1, #6
 800299a:	d5fb      	bpl.n	8002994 <SystemInit+0xc4>
 800299c:	6851      	ldr	r1, [r2, #4]
 800299e:	f021 0103 	bic.w	r1, r1, #3
 80029a2:	6051      	str	r1, [r2, #4]
 80029a4:	6851      	ldr	r1, [r2, #4]
 80029a6:	f041 0102 	orr.w	r1, r1, #2
 80029aa:	6051      	str	r1, [r2, #4]
 80029ac:	685a      	ldr	r2, [r3, #4]
 80029ae:	f002 020c 	and.w	r2, r2, #12
 80029b2:	2a08      	cmp	r2, #8
 80029b4:	d1fa      	bne.n	80029ac <SystemInit+0xdc>
 80029b6:	e7d0      	b.n	800295a <SystemInit+0x8a>
 80029b8:	e000ed00 	.word	0xe000ed00
 80029bc:	40021000 	.word	0x40021000
 80029c0:	f87fc00c 	.word	0xf87fc00c
 80029c4:	ff00fccc 	.word	0xff00fccc
 80029c8:	40022000 	.word	0x40022000

080029cc <core_yield>:
 80029cc:	bf00      	nop
 80029ce:	4770      	bx	lr

080029d0 <sytem_clock_init>:
 80029d0:	f7ff bf7e 	b.w	80028d0 <SystemInit>

080029d4 <NVIC_Init>:
 80029d4:	b510      	push	{r4, lr}
 80029d6:	bf00      	nop
 80029d8:	bf00      	nop
 80029da:	bf00      	nop
 80029dc:	78c2      	ldrb	r2, [r0, #3]
 80029de:	7803      	ldrb	r3, [r0, #0]
 80029e0:	b312      	cbz	r2, 8002a28 <NVIC_Init+0x54>
 80029e2:	4a17      	ldr	r2, [pc, #92]	; (8002a40 <NVIC_Init+0x6c>)
 80029e4:	68d1      	ldr	r1, [r2, #12]
 80029e6:	7842      	ldrb	r2, [r0, #1]
 80029e8:	43c9      	mvns	r1, r1
 80029ea:	f3c1 2102 	ubfx	r1, r1, #8, #3
 80029ee:	f1c1 0404 	rsb	r4, r1, #4
 80029f2:	b2e4      	uxtb	r4, r4
 80029f4:	40a2      	lsls	r2, r4
 80029f6:	b2d4      	uxtb	r4, r2
 80029f8:	220f      	movs	r2, #15
 80029fa:	410a      	asrs	r2, r1
 80029fc:	7881      	ldrb	r1, [r0, #2]
 80029fe:	400a      	ands	r2, r1
 8002a00:	4322      	orrs	r2, r4
 8002a02:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8002a06:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8002a0a:	0112      	lsls	r2, r2, #4
 8002a0c:	b2d2      	uxtb	r2, r2
 8002a0e:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8002a12:	7803      	ldrb	r3, [r0, #0]
 8002a14:	2201      	movs	r2, #1
 8002a16:	0959      	lsrs	r1, r3, #5
 8002a18:	f003 031f 	and.w	r3, r3, #31
 8002a1c:	fa02 f303 	lsl.w	r3, r2, r3
 8002a20:	4a08      	ldr	r2, [pc, #32]	; (8002a44 <NVIC_Init+0x70>)
 8002a22:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8002a26:	bd10      	pop	{r4, pc}
 8002a28:	095a      	lsrs	r2, r3, #5
 8002a2a:	2101      	movs	r1, #1
 8002a2c:	f003 031f 	and.w	r3, r3, #31
 8002a30:	4099      	lsls	r1, r3
 8002a32:	f102 0320 	add.w	r3, r2, #32
 8002a36:	4a03      	ldr	r2, [pc, #12]	; (8002a44 <NVIC_Init+0x70>)
 8002a38:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8002a3c:	bd10      	pop	{r4, pc}
 8002a3e:	bf00      	nop
 8002a40:	e000ed00 	.word	0xe000ed00
 8002a44:	e000e100 	.word	0xe000e100

08002a48 <EXTI_ClearITPendingBit>:
 8002a48:	f020 011f 	bic.w	r1, r0, #31
 8002a4c:	2301      	movs	r3, #1
 8002a4e:	f000 001f 	and.w	r0, r0, #31
 8002a52:	4a02      	ldr	r2, [pc, #8]	; (8002a5c <EXTI_ClearITPendingBit+0x14>)
 8002a54:	4083      	lsls	r3, r0
 8002a56:	508b      	str	r3, [r1, r2]
 8002a58:	4770      	bx	lr
 8002a5a:	bf00      	nop
 8002a5c:	40010414 	.word	0x40010414

08002a60 <GPIO_Init>:
 8002a60:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002a62:	bf00      	nop
 8002a64:	bf00      	nop
 8002a66:	bf00      	nop
 8002a68:	bf00      	nop
 8002a6a:	2300      	movs	r3, #0
 8002a6c:	680e      	ldr	r6, [r1, #0]
 8002a6e:	461c      	mov	r4, r3
 8002a70:	2501      	movs	r5, #1
 8002a72:	40a5      	lsls	r5, r4
 8002a74:	ea05 0e06 	and.w	lr, r5, r6
 8002a78:	45ae      	cmp	lr, r5
 8002a7a:	d12d      	bne.n	8002ad8 <GPIO_Init+0x78>
 8002a7c:	790f      	ldrb	r7, [r1, #4]
 8002a7e:	1e7a      	subs	r2, r7, #1
 8002a80:	2a01      	cmp	r2, #1
 8002a82:	d817      	bhi.n	8002ab4 <GPIO_Init+0x54>
 8002a84:	bf00      	nop
 8002a86:	2203      	movs	r2, #3
 8002a88:	6885      	ldr	r5, [r0, #8]
 8002a8a:	409a      	lsls	r2, r3
 8002a8c:	ea25 0202 	bic.w	r2, r5, r2
 8002a90:	6082      	str	r2, [r0, #8]
 8002a92:	794d      	ldrb	r5, [r1, #5]
 8002a94:	6882      	ldr	r2, [r0, #8]
 8002a96:	409d      	lsls	r5, r3
 8002a98:	4315      	orrs	r5, r2
 8002a9a:	6085      	str	r5, [r0, #8]
 8002a9c:	bf00      	nop
 8002a9e:	8882      	ldrh	r2, [r0, #4]
 8002aa0:	b292      	uxth	r2, r2
 8002aa2:	ea22 020e 	bic.w	r2, r2, lr
 8002aa6:	8082      	strh	r2, [r0, #4]
 8002aa8:	798a      	ldrb	r2, [r1, #6]
 8002aaa:	8885      	ldrh	r5, [r0, #4]
 8002aac:	40a2      	lsls	r2, r4
 8002aae:	432a      	orrs	r2, r5
 8002ab0:	b292      	uxth	r2, r2
 8002ab2:	8082      	strh	r2, [r0, #4]
 8002ab4:	2203      	movs	r2, #3
 8002ab6:	6805      	ldr	r5, [r0, #0]
 8002ab8:	409a      	lsls	r2, r3
 8002aba:	43d2      	mvns	r2, r2
 8002abc:	4015      	ands	r5, r2
 8002abe:	6005      	str	r5, [r0, #0]
 8002ac0:	6805      	ldr	r5, [r0, #0]
 8002ac2:	409f      	lsls	r7, r3
 8002ac4:	432f      	orrs	r7, r5
 8002ac6:	6007      	str	r7, [r0, #0]
 8002ac8:	68c7      	ldr	r7, [r0, #12]
 8002aca:	4017      	ands	r7, r2
 8002acc:	79ca      	ldrb	r2, [r1, #7]
 8002ace:	fa02 f503 	lsl.w	r5, r2, r3
 8002ad2:	ea47 0205 	orr.w	r2, r7, r5
 8002ad6:	60c2      	str	r2, [r0, #12]
 8002ad8:	3401      	adds	r4, #1
 8002ada:	2c10      	cmp	r4, #16
 8002adc:	f103 0302 	add.w	r3, r3, #2
 8002ae0:	d1c6      	bne.n	8002a70 <GPIO_Init+0x10>
 8002ae2:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002ae4 <GPIO_SetBits>:
 8002ae4:	bf00      	nop
 8002ae6:	bf00      	nop
 8002ae8:	6181      	str	r1, [r0, #24]
 8002aea:	4770      	bx	lr

08002aec <GPIO_PinAFConfig>:
 8002aec:	b510      	push	{r4, lr}
 8002aee:	bf00      	nop
 8002af0:	bf00      	nop
 8002af2:	bf00      	nop
 8002af4:	f001 0307 	and.w	r3, r1, #7
 8002af8:	08c9      	lsrs	r1, r1, #3
 8002afa:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002afe:	009b      	lsls	r3, r3, #2
 8002b00:	6a04      	ldr	r4, [r0, #32]
 8002b02:	210f      	movs	r1, #15
 8002b04:	4099      	lsls	r1, r3
 8002b06:	ea24 0101 	bic.w	r1, r4, r1
 8002b0a:	6201      	str	r1, [r0, #32]
 8002b0c:	6a01      	ldr	r1, [r0, #32]
 8002b0e:	409a      	lsls	r2, r3
 8002b10:	430a      	orrs	r2, r1
 8002b12:	6202      	str	r2, [r0, #32]
 8002b14:	bd10      	pop	{r4, pc}

08002b16 <Default_Handler>:
 8002b16:	4668      	mov	r0, sp
 8002b18:	f020 0107 	bic.w	r1, r0, #7
 8002b1c:	468d      	mov	sp, r1
 8002b1e:	b501      	push	{r0, lr}
 8002b20:	bf00      	nop
 8002b22:	e8bd 4001 	ldmia.w	sp!, {r0, lr}
 8002b26:	4685      	mov	sp, r0
 8002b28:	4770      	bx	lr

08002b2a <HardFault_Handler>:
 8002b2a:	bf00      	nop
 8002b2c:	e7fd      	b.n	8002b2a <HardFault_Handler>
	...

08002b30 <_reset_init>:
 8002b30:	490e      	ldr	r1, [pc, #56]	; (8002b6c <_reset_init+0x3c>)
 8002b32:	4b0f      	ldr	r3, [pc, #60]	; (8002b70 <_reset_init+0x40>)
 8002b34:	1a5b      	subs	r3, r3, r1
 8002b36:	109b      	asrs	r3, r3, #2
 8002b38:	2200      	movs	r2, #0
 8002b3a:	429a      	cmp	r2, r3
 8002b3c:	d006      	beq.n	8002b4c <_reset_init+0x1c>
 8002b3e:	480d      	ldr	r0, [pc, #52]	; (8002b74 <_reset_init+0x44>)
 8002b40:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
 8002b44:	f841 0022 	str.w	r0, [r1, r2, lsl #2]
 8002b48:	3201      	adds	r2, #1
 8002b4a:	e7f6      	b.n	8002b3a <_reset_init+0xa>
 8002b4c:	4a0a      	ldr	r2, [pc, #40]	; (8002b78 <_reset_init+0x48>)
 8002b4e:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8002b52:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8002b56:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8002b5a:	f502 720c 	add.w	r2, r2, #560	; 0x230
 8002b5e:	6853      	ldr	r3, [r2, #4]
 8002b60:	f023 4340 	bic.w	r3, r3, #3221225472	; 0xc0000000
 8002b64:	6053      	str	r3, [r2, #4]
 8002b66:	f7ff bb1f 	b.w	80021a8 <main>
 8002b6a:	bf00      	nop
 8002b6c:	20000000 	.word	0x20000000
 8002b70:	20000030 	.word	0x20000030
 8002b74:	08002e38 	.word	0x08002e38
 8002b78:	e000ed00 	.word	0xe000ed00

08002b7c <scheduler>:
 8002b7c:	b570      	push	{r4, r5, r6, lr}
 8002b7e:	2200      	movs	r2, #0
 8002b80:	4611      	mov	r1, r2
 8002b82:	4b15      	ldr	r3, [pc, #84]	; (8002bd8 <scheduler+0x5c>)
 8002b84:	200c      	movs	r0, #12
 8002b86:	fb00 f401 	mul.w	r4, r0, r1
 8002b8a:	191e      	adds	r6, r3, r4
 8002b8c:	6875      	ldr	r5, [r6, #4]
 8002b8e:	f015 0f02 	tst.w	r5, #2
 8002b92:	461d      	mov	r5, r3
 8002b94:	d10a      	bne.n	8002bac <scheduler+0x30>
 8002b96:	6876      	ldr	r6, [r6, #4]
 8002b98:	07f6      	lsls	r6, r6, #31
 8002b9a:	d507      	bpl.n	8002bac <scheduler+0x30>
 8002b9c:	4350      	muls	r0, r2
 8002b9e:	5b1c      	ldrh	r4, [r3, r4]
 8002ba0:	5a18      	ldrh	r0, [r3, r0]
 8002ba2:	b2a4      	uxth	r4, r4
 8002ba4:	b280      	uxth	r0, r0
 8002ba6:	4284      	cmp	r4, r0
 8002ba8:	bf38      	it	cc
 8002baa:	460a      	movcc	r2, r1
 8002bac:	200c      	movs	r0, #12
 8002bae:	4348      	muls	r0, r1
 8002bb0:	5a1c      	ldrh	r4, [r3, r0]
 8002bb2:	b2a4      	uxth	r4, r4
 8002bb4:	b11c      	cbz	r4, 8002bbe <scheduler+0x42>
 8002bb6:	5a1c      	ldrh	r4, [r3, r0]
 8002bb8:	3c01      	subs	r4, #1
 8002bba:	b2a4      	uxth	r4, r4
 8002bbc:	521c      	strh	r4, [r3, r0]
 8002bbe:	3101      	adds	r1, #1
 8002bc0:	2906      	cmp	r1, #6
 8002bc2:	d1de      	bne.n	8002b82 <scheduler+0x6>
 8002bc4:	230c      	movs	r3, #12
 8002bc6:	4353      	muls	r3, r2
 8002bc8:	18e9      	adds	r1, r5, r3
 8002bca:	8849      	ldrh	r1, [r1, #2]
 8002bcc:	b289      	uxth	r1, r1
 8002bce:	52e9      	strh	r1, [r5, r3]
 8002bd0:	4b02      	ldr	r3, [pc, #8]	; (8002bdc <scheduler+0x60>)
 8002bd2:	601a      	str	r2, [r3, #0]
 8002bd4:	bd70      	pop	{r4, r5, r6, pc}
 8002bd6:	bf00      	nop
 8002bd8:	20000468 	.word	0x20000468
 8002bdc:	200004b0 	.word	0x200004b0

08002be0 <SysTick_Handler>:
 8002be0:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002be4:	f3ef 8308 	mrs	r3, MSP
 8002be8:	4c0d      	ldr	r4, [pc, #52]	; (8002c20 <SysTick_Handler+0x40>)
 8002bea:	4d0e      	ldr	r5, [pc, #56]	; (8002c24 <SysTick_Handler+0x44>)
 8002bec:	6822      	ldr	r2, [r4, #0]
 8002bee:	3201      	adds	r2, #1
 8002bf0:	bf1d      	ittte	ne
 8002bf2:	6822      	ldrne	r2, [r4, #0]
 8002bf4:	210c      	movne	r1, #12
 8002bf6:	fb01 5202 	mlane	r2, r1, r2, r5
 8002bfa:	2300      	moveq	r3, #0
 8002bfc:	bf14      	ite	ne
 8002bfe:	6093      	strne	r3, [r2, #8]
 8002c00:	6023      	streq	r3, [r4, #0]
 8002c02:	f7ff ffbb 	bl	8002b7c <scheduler>
 8002c06:	6822      	ldr	r2, [r4, #0]
 8002c08:	230c      	movs	r3, #12
 8002c0a:	fb03 5302 	mla	r3, r3, r2, r5
 8002c0e:	689a      	ldr	r2, [r3, #8]
 8002c10:	f06f 0306 	mvn.w	r3, #6
 8002c14:	469e      	mov	lr, r3
 8002c16:	f382 8808 	msr	MSP, r2
 8002c1a:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8002c1e:	4770      	bx	lr
 8002c20:	200004b0 	.word	0x200004b0
 8002c24:	20000468 	.word	0x20000468

08002c28 <__aeabi_d2f>:
 8002c28:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8002c2c:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
 8002c30:	bf24      	itt	cs
 8002c32:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
 8002c36:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
 8002c3a:	d90d      	bls.n	8002c58 <__aeabi_d2f+0x30>
 8002c3c:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
 8002c40:	ea4f 02c0 	mov.w	r2, r0, lsl #3
 8002c44:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
 8002c48:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
 8002c4c:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
 8002c50:	bf08      	it	eq
 8002c52:	f020 0001 	biceq.w	r0, r0, #1
 8002c56:	4770      	bx	lr
 8002c58:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
 8002c5c:	d121      	bne.n	8002ca2 <__aeabi_d2f+0x7a>
 8002c5e:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
 8002c62:	bfbc      	itt	lt
 8002c64:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
 8002c68:	4770      	bxlt	lr
 8002c6a:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 8002c6e:	ea4f 5252 	mov.w	r2, r2, lsr #21
 8002c72:	f1c2 0218 	rsb	r2, r2, #24
 8002c76:	f1c2 0c20 	rsb	ip, r2, #32
 8002c7a:	fa10 f30c 	lsls.w	r3, r0, ip
 8002c7e:	fa20 f002 	lsr.w	r0, r0, r2
 8002c82:	bf18      	it	ne
 8002c84:	f040 0001 	orrne.w	r0, r0, #1
 8002c88:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 8002c8c:	ea4f 23d3 	mov.w	r3, r3, lsr #11
 8002c90:	fa03 fc0c 	lsl.w	ip, r3, ip
 8002c94:	ea40 000c 	orr.w	r0, r0, ip
 8002c98:	fa23 f302 	lsr.w	r3, r3, r2
 8002c9c:	ea4f 0343 	mov.w	r3, r3, lsl #1
 8002ca0:	e7cc      	b.n	8002c3c <__aeabi_d2f+0x14>
 8002ca2:	ea7f 5362 	mvns.w	r3, r2, asr #21
 8002ca6:	d107      	bne.n	8002cb8 <__aeabi_d2f+0x90>
 8002ca8:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
 8002cac:	bf1e      	ittt	ne
 8002cae:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
 8002cb2:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
 8002cb6:	4770      	bxne	lr
 8002cb8:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
 8002cbc:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
 8002cc0:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
 8002cc4:	4770      	bx	lr
 8002cc6:	bf00      	nop

08002cc8 <_init>:
 8002cc8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002cca:	bf00      	nop
 8002ccc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002cce:	bc08      	pop	{r3}
 8002cd0:	469e      	mov	lr, r3
 8002cd2:	4770      	bx	lr

08002cd4 <_fini>:
 8002cd4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002cd6:	bf00      	nop
 8002cd8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002cda:	bc08      	pop	{r3}
 8002cdc:	469e      	mov	lr, r3
 8002cde:	4770      	bx	lr
 8002ce0:	61646f6b 	.word	0x61646f6b
 8002ce4:	6920616d 	.word	0x6920616d
 8002ce8:	2074696e 	.word	0x2074696e
 8002cec:	25206925 	.word	0x25206925
 8002cf0:	203a2069 	.word	0x203a2069
 8002cf4:	4f5b2000 	.word	0x4f5b2000
 8002cf8:	000a5d4b 	.word	0x000a5d4b
 8002cfc:	41465b20 	.word	0x41465b20
 8002d00:	44454c49 	.word	0x44454c49
 8002d04:	000a0a5d 	.word	0x000a0a5d
 8002d08:	432b5441 	.word	0x432b5441
 8002d0c:	554d5049 	.word	0x554d5049
 8002d10:	0d313d58 	.word	0x0d313d58
 8002d14:	5441000a 	.word	0x5441000a
 8002d18:	5049432b 	.word	0x5049432b
 8002d1c:	3d58554d 	.word	0x3d58554d
 8002d20:	000a0d30 	.word	0x000a0d30
 8002d24:	432b5441 	.word	0x432b5441
 8002d28:	444f4d57 	.word	0x444f4d57
 8002d2c:	0d313d45 	.word	0x0d313d45
 8002d30:	5441000a 	.word	0x5441000a
 8002d34:	4a57432b 	.word	0x4a57432b
 8002d38:	223d5041 	.word	0x223d5041
 8002d3c:	54454e00 	.word	0x54454e00
 8002d40:	52414547 	.word	0x52414547
 8002d44:	6d003338 	.word	0x6d003338
 8002d48:	646f6c65 	.word	0x646f6c65
 8002d4c:	69686369 	.word	0x69686369
 8002d50:	34356c6c 	.word	0x34356c6c
 8002d54:	0d220036 	.word	0x0d220036
 8002d58:	5441000a 	.word	0x5441000a
 8002d5c:	5049432b 	.word	0x5049432b
 8002d60:	56524553 	.word	0x56524553
 8002d64:	313d5245 	.word	0x313d5245
 8002d68:	0d30382c 	.word	0x0d30382c
 8002d6c:	5441000a 	.word	0x5441000a
 8002d70:	5049432b 	.word	0x5049432b
 8002d74:	534f4c43 	.word	0x534f4c43
 8002d78:	000a0d45 	.word	0x000a0d45
 8002d7c:	432b5441 	.word	0x432b5441
 8002d80:	54535049 	.word	0x54535049
 8002d84:	3d545241 	.word	0x3d545241
 8002d88:	50435422 	.word	0x50435422
 8002d8c:	00222c22 	.word	0x00222c22
 8002d90:	43002c22 	.word	0x43002c22
 8002d94:	454e4e4f 	.word	0x454e4e4f
 8002d98:	41005443 	.word	0x41005443
 8002d9c:	49432b54 	.word	0x49432b54
 8002da0:	4e455350 	.word	0x4e455350
 8002da4:	3e003d44 	.word	0x3e003d44
 8002da8:	4e455300 	.word	0x4e455300
 8002dac:	4b4f2044 	.word	0x4b4f2044
 8002db0:	50492b00 	.word	0x50492b00
 8002db4:	31002c44 	.word	0x31002c44
 8002db8:	2e302e30 	.word	0x2e302e30
 8002dbc:	00322e30 	.word	0x00322e30
 8002dc0:	74737973 	.word	0x74737973
 8002dc4:	74206d65 	.word	0x74206d65
 8002dc8:	20656d69 	.word	0x20656d69
 8002dcc:	5b207525 	.word	0x5b207525
 8002dd0:	0a5d736d 	.word	0x0a5d736d
 8002dd4:	20692500 	.word	0x20692500
 8002dd8:	0a206925 	.word	0x0a206925
 8002ddc:	00          	.byte	0x00
 8002ddd:	74          	.byte	0x74
 8002dde:	7365      	.short	0x7365
 8002de0:	676e6974 	.word	0x676e6974
 8002de4:	6d756e20 	.word	0x6d756e20
 8002de8:	20726562 	.word	0x20726562
 8002dec:	6e697270 	.word	0x6e697270
 8002df0:	75252074 	.word	0x75252074
 8002df4:	20752520 	.word	0x20752520
 8002df8:	0a3a7525 	.word	0x0a3a7525
 8002dfc:	6f6c6600 	.word	0x6f6c6600
 8002e00:	6e207461 	.word	0x6e207461
 8002e04:	65626d75 	.word	0x65626d75
 8002e08:	66252072 	.word	0x66252072
 8002e0c:	25000a20 	.word	0x25000a20
 8002e10:	66252066 	.word	0x66252066
 8002e14:	20662520 	.word	0x20662520
 8002e18:	25206625 	.word	0x25206625
 8002e1c:	66252066 	.word	0x66252066
 8002e20:	20662520 	.word	0x20662520
 8002e24:	000a6625 	.word	0x000a6625
 8002e28:	656c6469 	.word	0x656c6469
 8002e2c:	0a752520 	.word	0x0a752520
 8002e30:	00000000 	.word	0x00000000

08002e34 <__EH_FRAME_BEGIN__>:
 8002e34:	00000000                                ....
