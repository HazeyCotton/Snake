	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #249
	ldr	r3, .L27
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	mov	r7, #252
	ldr	r4, .L27+4
	ldr	r6, .L27+8
	add	r5, r4, #64
.L2:
	str	r7, [sp]
	add	r4, r4, #16
	ldr	r3, [r4, #-8]
	ldr	r2, [r4, #-4]
	ldr	r1, [r4, #-16]
	ldr	r0, [r4, #-12]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L2
	ldr	r4, .L27+12
	add	r5, r4, #400
	b	.L4
.L3:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L24
.L4:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L3
	ldrb	r1, [r4, #32]	@ zero_extendqisi2
	ldr	r3, [r4, #24]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r4, r4, #40
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L4
.L24:
	ldr	r4, .L27+16
	ldr	r7, .L27+20
	ldr	r6, .L27+24
	add	r5, r4, #200
	b	.L6
.L5:
	add	r4, r4, #20
	cmp	r4, r5
	beq	.L25
.L6:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L5
	str	r7, [sp]
	add	r4, r4, #20
	ldr	r3, [r4, #-12]
	ldr	r2, [r4, #-8]
	ldr	r1, [r4, #-20]
	ldr	r0, [r4, #-16]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L6
.L25:
	ldr	r4, .L27+28
	ldr	r7, .L27+32
	ldr	r6, .L27+24
	add	r5, r4, #80
.L8:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L26
.L7:
	add	r4, r4, #20
	cmp	r5, r4
	bne	.L8
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L26:
	str	r7, [sp]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	b	.L7
.L28:
	.align	2
.L27:
	.word	fillScreen4
	.word	boundaries
	.word	drawRect4
	.word	vaultDwellers
	.word	nukaCola
	.word	NukaColaCapBitmap
	.word	drawImage4
	.word	radRoaches
	.word	RadRoachBitmap
	.size	drawGame, .-drawGame
	.align	2
	.global	initBoundary
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoundary, %function
initBoundary:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #19
	mov	r1, #2
	mov	r4, #139
	mov	lr, #219
	mov	ip, #120
	mov	r0, #200
	ldr	r3, .L31
	str	r4, [r3, #16]
	str	lr, [r3, #36]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	ip, [r3, #8]
	str	ip, [r3, #40]
	str	r1, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #44]
	str	r1, [r3, #56]
	str	r0, [r3, #28]
	str	r0, [r3, #60]
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	boundaries
	.size	initBoundary, .-initBoundary
	.align	2
	.global	drawBoundaries
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoundaries, %function
drawBoundaries:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #252
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp]
	ldr	r4, .L35
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	drawRect4
	.size	drawBoundaries, .-drawBoundaries
	.align	2
	.global	updateBoundaries
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoundaries, %function
updateBoundaries:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L43
	ldm	r0, {r1, r2, r4, lr}
	ldr	r3, [ip, #24]
	sub	sp, sp, #16
	stmib	sp, {r1, lr}
	str	r4, [sp, #12]
	str	r2, [sp]
	ldr	r1, [ip]
	mov	r2, r3
	ldr	r0, [ip, #4]
	ldr	r4, .L43+4
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L43+8
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	vaultDwellers
	.word	collision
	.word	collide
	.size	updateBoundaries, .-updateBoundaries
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r1, .L51
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, r2
	mov	r3, r1
	mov	r5, #5
	mvn	r4, #0
	mov	r8, #80
	mov	r7, #120
	mov	r6, #1
	b	.L49
.L46:
	ldr	lr, [r3, #-32]
	ldr	ip, [r3, #-28]
	cmp	r2, #9
	stmib	r3, {ip, lr}
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r5, [r3, #24]
	strb	r4, [r3, #32]
	str	r0, [r3, #36]
	str	r0, [r3, #28]
	str	lr, [r3]
	str	ip, [r3, #12]
	beq	.L45
.L47:
	add	r2, r2, #1
	add	r3, r3, #40
.L49:
	cmp	r2, #0
	bne	.L46
	str	r8, [r1]
	str	r7, [r1, #4]
	str	r8, [r1, #12]
	str	r7, [r1, #8]
	str	r2, [r1, #16]
	str	r2, [r1, #20]
	str	r5, [r1, #24]
	strb	r4, [r1, #32]
	str	r6, [r1, #36]
	str	r6, [r1, #28]
	b	.L47
.L45:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	vaultDwellers
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L54
	ldr	r2, .L67
	ldrh	ip, [r2, #48]
	ldr	r3, [r0]
	ldr	r1, [r0, #4]
	tst	ip, #64
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bne	.L55
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r2, .L67+4
	b	.L56
.L54:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bne	.L64
.L65:
	ldr	r2, .L67+4
.L56:
	ldr	r3, .L67+8
	ldr	r3, [r3]
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #36]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #36]
	bx	lr
.L64:
	ldr	ip, [r0]
	ldr	r3, [r0, #4]
	ldr	r2, .L67+4
	sub	r1, r1, #1
	str	ip, [r0, #8]
	str	r3, [r0, #12]
	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #3
	ldr	ip, [r1, #8]
	ldr	r3, [r1, #12]
	str	ip, [r0]
	str	r3, [r0, #4]
	b	.L56
.L55:
	ldrh	ip, [r2, #48]
	tst	ip, #128
	beq	.L66
	ldrh	r3, [r2, #48]
	tst	r3, #32
	bne	.L58
	sub	r1, r1, #1
	str	r1, [r0, #4]
	ldr	r2, .L67+4
	b	.L56
.L66:
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r2, .L67+4
	b	.L56
.L58:
	ldrh	r3, [r2, #48]
	tst	r3, #16
	addeq	r1, r1, #1
	streq	r1, [r0, #4]
	b	.L65
.L68:
	.align	2
.L67:
	.word	67109120
	.word	vaultDwellers
	.word	vaultLength
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r1, [r0, #32]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r0]
	ldr	r4, .L78
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	drawRect4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initNukaColaCap
	.syntax unified
	.arm
	.fpu softvfp
	.type	initNukaColaCap, %function
initNukaColaCap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L86
	mov	r9, #0
	mov	r8, r7
	mov	r10, #16
	ldr	r4, .L86+4
	ldr	r6, .L86+8
	ldr	r5, .L86+12
	b	.L84
.L82:
	add	r9, r9, #1
	add	r8, r8, #20
.L84:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #20
	str	r0, [r8]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r9, #0
	sub	r0, r0, r3, lsl #3
	moveq	r3, #1
	add	r0, r0, #20
	str	r10, [r8, #8]
	str	r10, [r8, #12]
	str	r0, [r8, #4]
	streq	r3, [r7, #16]
	beq	.L82
	mov	r3, #0
	cmp	r9, #9
	str	r3, [r8, #16]
	bne	.L82
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	nukaCola
	.word	rand
	.word	-2004318071
	.word	1374389535
	.size	initNukaColaCap, .-initNukaColaCap
	.align	2
	.global	updateNukaColaCap
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNukaColaCap, %function
updateNukaColaCap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L110
.L89:
	mov	r2, #0
	ldr	r4, .L111
	mov	r1, r2
	mov	ip, r2
	mov	r3, r4
	ldr	lr, .L111+4
	str	r2, [lr]
	add	r0, r4, #200
.L94:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	movne	r1, #1
	add	r3, r3, #20
	movne	ip, r1
	cmp	r0, r3
	bne	.L94
	cmp	r1, #0
	beq	.L95
	cmp	ip, #0
	str	ip, [lr]
	beq	.L95
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	ldr	r3, .L111+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L111+12
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl r1
	add	r0, r0, r0, lsl #2
	add	r4, r4, r0, lsl #2
	str	r1, [r4, #16]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L110:
	mov	r4, r0
	ldr	r0, .L111+16
	ldr	r6, [r4, #8]
	ldr	ip, [r4, #12]
	ldr	r3, [r0, #24]
	ldr	lr, [r4]
	mov	r5, r1
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	mov	r2, r3
	stm	sp, {ip, lr}
	ldr	r6, .L111+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L89
	mov	r3, #0
	mov	r2, #1
	cmp	r5, #9
	str	r3, [r4, #16]
	addne	r1, r5, r2
	ldrne	r3, .L111
	ldreq	r3, .L111
	addne	r1, r1, r1, lsl #2
	addne	r1, r3, r1, lsl #2
	streq	r2, [r3, #16]
	strne	r2, [r1, #16]
	ldr	r2, .L111+24
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	nukaCola
	.word	noNukaColaCapActives
	.word	rand
	.word	1717986919
	.word	vaultDwellers
	.word	collision
	.word	vaultLength
	.size	updateNukaColaCap, .-updateNukaColaCap
	.align	2
	.global	drawNukaColaCap
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNukaColaCap, %function
drawNukaColaCap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L122
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L122+4
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	NukaColaCapBitmap
	.word	drawImage4
	.size	drawNukaColaCap, .-drawNukaColaCap
	.align	2
	.global	initRadRoachX
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRadRoachX, %function
initRadRoachX:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #20
	mov	r7, #16
	ldr	r9, .L128
	ldr	r6, .L128+4
	ldr	r5, .L128+8
	add	r4, r9, #80
.L125:
	mov	lr, pc
	bx	r6
	mov	r1, #32
	mov	r2, #0
	smull	r3, ip, r5, r0
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #6
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #20
	str	r8, [r9, #4]
	str	r7, [r9, #8]
	str	r0, [r9]
	str	r1, [r9, #12]
	str	r2, [r9, #16]
	add	r9, r9, #20
	cmp	r9, r4
	bne	.L125
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	radRoaches
	.word	rand
	.word	-2004318071
	.size	initRadRoachX, .-initRadRoachX
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	bl	initPlayer
	bl	initBoundary
	bl	initRadRoachX
	bl	initNukaColaCap
	mov	r1, #0
	mov	lr, #10
	ldr	r2, .L132
	ldr	r0, .L132+4
	ldr	ip, .L132+8
	str	r1, [r2]
	str	r1, [r0]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L132+12
	ldr	r4, .L132+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	ip, sp
	ldr	r3, .L132+20
	ldm	r3, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	ldr	r2, .L132+24
	ldrh	r1, [sp]
	strh	r3, [ip]	@ movhi
	strh	r1, [r2, #242]	@ movhi
	ldrh	r3, [sp, #2]
	strh	r3, [r2, #244]	@ movhi
	ldrh	r3, [sp, #4]
	strh	r3, [r2, #246]	@ movhi
	ldrh	r3, [sp, #6]
	strh	r3, [r2, #248]	@ movhi
	ldrh	r3, [sp, #8]
	strh	r3, [r2, #250]	@ movhi
	ldrh	r3, [sp, #10]
	strh	r3, [r2, #252]	@ movhi
	ldrh	r3, [sp, #12]
	strh	r3, [r2, #254]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	vaultLength
	.word	collide
	.word	colaCapsRemaining
	.word	NukaColaCapPal
	.word	DMANow
	.word	.LANCHOR0
	.word	83886336
	.size	initGame, .-initGame
	.align	2
	.global	updateRadRoachX
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRadRoachX, %function
updateRadRoachX:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	r5, r0
	sub	sp, sp, #16
	beq	.L135
	ldr	r4, .L158
	mov	r8, #0
	ldr	r0, [r0, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r7, .L158+4
	add	r6, r4, #200
	b	.L138
.L136:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L156
.L138:
	ldr	ip, [r4, #16]
	cmp	ip, #0
	beq	.L136
	ldr	lr, [r4, #8]
	ldr	ip, [r4, #12]
	str	lr, [sp, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r4, #16]
	add	r4, r4, #20
	cmp	r4, r6
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	bne	.L138
.L156:
	ldr	r4, .L158+8
	ldr	ip, [r4, #24]
	ldr	lr, [r4]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L157
.L139:
	mov	r8, #0
	ldr	r4, .L158+12
	add	r6, r4, #64
.L141:
	add	r0, r4, #8
	ldm	r4, {r2, r3}
	ldm	r0, {r0, r1}
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	add	r4, r4, #16
	cmp	r0, #0
	strne	r8, [r5, #16]
	cmp	r4, r6
	bne	.L141
	ldr	r3, [r5, #4]
	add	r3, r3, #1
	str	r3, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	mov	r1, #0
	ldr	r2, .L158+16
	ldr	r3, [r2]
	sub	r0, r3, #1
	add	r3, r3, r3, lsl #2
	add	r4, r4, r3, lsl #3
	str	r0, [r2]
	str	r1, [r4, #36]
	b	.L139
.L135:
	mov	r2, #20
	ldr	r3, .L158+20
	str	r2, [r0, #4]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L158+24
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #20
	str	r0, [r5]
	str	r1, [r5, #16]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	nukaCola
	.word	collision
	.word	vaultDwellers
	.word	boundaries
	.word	vaultLength
	.word	rand
	.word	-2004318071
	.size	updateRadRoachX, .-updateRadRoachX
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r0, .L166
.L161:
	mov	r1, r4
	bl	updatePlayer
	add	r4, r4, #1
	cmp	r4, #10
	add	r0, r0, #40
	bne	.L161
	ldr	r0, .L166+4
	bl	updateBoundaries
	ldr	r0, .L166+8
	bl	updateBoundaries
	ldr	r0, .L166+12
	bl	updateBoundaries
	ldr	r0, .L166+16
	bl	updateBoundaries
	mov	r4, #0
	ldr	r5, .L166+20
.L162:
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	bl	updateNukaColaCap
	cmp	r4, #10
	add	r5, r5, #20
	bne	.L162
	ldr	r0, .L166+24
	bl	updateRadRoachX
	ldr	r0, .L166+28
	bl	updateRadRoachX
	ldr	r0, .L166+32
	bl	updateRadRoachX
	ldr	r0, .L166+36
	pop	{r4, r5, r6, lr}
	b	updateRadRoachX
.L167:
	.align	2
.L166:
	.word	vaultDwellers
	.word	boundaries
	.word	boundaries+16
	.word	boundaries+32
	.word	boundaries+48
	.word	nukaCola
	.word	radRoaches
	.word	radRoaches+20
	.word	radRoaches+40
	.word	radRoaches+60
	.size	updateGame, .-updateGame
	.align	2
	.global	drawRadRoachX
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRadRoachX, %function
drawRadRoachX:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L177
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L177+4
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	RadRoachBitmap
	.word	drawImage4
	.size	drawRadRoachX, .-drawRadRoachX
	.comm	noNukaColaCapActives,4,4
	.comm	collide,4,4
	.comm	colaCapsRemaining,4,4
	.comm	vaultLength,4,4
	.comm	boundaries,64,4
	.comm	nukaCola,200,4
	.comm	radRoaches,80,4
	.comm	vaultDwellers,400,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	28274
	.short	21152
	.short	16668
	.short	32767
	.short	15855
	.short	26437
	.ident	"GCC: (devkitARM release 53) 9.1.0"
