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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r0, r1, lsl #4
	bic	r1, r1, #1
	ldrsh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	sub	sp, sp, #12
	ldrb	r4, [sp, #48]	@ zero_extendqisi2
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	ldrb	r0, [sp, #48]	@ zero_extendqisi2
	lsl	ip, ip, #16
	ldrb	lr, [sp, #48]	@ zero_extendqisi2
	orr	ip, ip, r4, lsl #24
	orr	ip, ip, lr
	sub	r7, r2, #1
	orr	ip, ip, r0, lsl #8
	cmp	r7, #1
	str	ip, [sp, #4]
	and	ip, r6, #1
	bls	.L38
	and	r8, r6, r2
	ands	r8, r8, #1
	beq	.L14
	cmp	r3, #0
	ble	.L7
	mov	r7, #0
	ldr	r4, .L40
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	ldr	r5, [r4]
	rsb	r3, r3, r3, lsl #4
	rsb	r0, r1, r1, lsl #4
	ldr	r4, [r4, #4]
	add	r2, r6, r3, lsl #4
	add	r0, r6, r0, lsl #4
	orr	lr, lr, #-2130706432
	add	r6, sp, #4
.L17:
	bic	r8, r0, #1
	ldrsh	r3, [r5, r8]
	ldrb	r1, [sp, #48]	@ zero_extendqisi2
	cmp	ip, #0
	and	r1, r1, #255
	and	r9, r3, #255
	andeq	r3, r3, #65280
	orreq	r1, r3, r1
	add	r3, r0, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	orrne	r1, r9, r1, lsl #8
	add	r3, r5, r3
	cmp	r2, r0
	strh	r1, [r5, r8]	@ movhi
	str	r7, [r4, #44]
	str	r6, [r4, #36]
	str	r3, [r4, #40]
	str	lr, [r4, #44]
	bne	.L17
.L7:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	bic	r0, r6, r2
	ands	r0, r0, #1
	bne	.L39
	orr	lr, r6, r2
	ands	lr, lr, #1
	bne	.L24
	cmp	r3, #0
	ble	.L7
	ldr	r5, .L40
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	rsb	r0, r1, r1, lsl #4
	mov	ip, lr
	rsb	r3, r3, r3, lsl #4
	asr	lr, r2, #1
	ldr	r4, [r5]
	ldr	r1, [r5, #4]
	add	r2, r6, r3, lsl #4
	add	r0, r6, r0, lsl #4
	orr	lr, lr, #-2130706432
	add	r6, sp, #4
.L25:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r4, r3
	cmp	r2, r0
	str	ip, [r1, #44]
	str	r6, [r1, #36]
	str	r3, [r1, #40]
	str	lr, [r1, #44]
	bne	.L25
	b	.L7
.L38:
	cmp	r3, #0
	ble	.L7
	ldr	r2, .L40
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [r2]
	add	r4, r6, r3, lsl #4
	add	r0, r6, r1, lsl #4
.L12:
	bic	r1, r0, #1
	ldrsh	r2, [lr, r1]
	ldrb	r3, [sp, #48]	@ zero_extendqisi2
	cmp	ip, #0
	and	r3, r3, #255
	and	r5, r2, #255
	add	r0, r0, #240
	andeq	r2, r2, #65280
	orrne	r3, r5, r3, lsl #8
	orreq	r3, r2, r3
	cmp	r4, r0
	strh	r3, [lr, r1]	@ movhi
	bne	.L12
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	cmp	r3, #0
	ble	.L7
	ldr	r4, .L40
	add	lr, r6, r2
	add	r3, r1, r3
	add	r10, r7, r7, lsr #31
	sub	lr, lr, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r10, r10, #1
	ldm	r4, {r5, r9}
	add	r3, r6, r3, lsl #4
	add	r0, r6, r1, lsl #4
	and	lr, lr, #1
	orr	r10, r10, #-2130706432
	add	r6, sp, #4
.L23:
	bic	r4, r0, #1
	ldrsh	r1, [r5, r4]
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	cmp	ip, #0
	and	r2, r2, #255
	and	fp, r1, #255
	andeq	r1, r1, #65280
	orrne	r2, fp, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [r5, r4]	@ movhi
	add	r1, r7, r0
	bic	r1, r1, #1
	ldrh	r2, [r5, r1]
	ldrb	r4, [sp, #48]	@ zero_extendqisi2
	cmp	lr, #0
	and	fp, r2, #255
	and	r4, r4, #255
	biceq	r2, r2, #255
	orreq	r4, r2, r4
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r0, r0, #240
	orrne	r4, fp, r4, lsl #8
	add	r2, r5, r2
	cmp	r3, r0
	strh	r4, [r5, r1]	@ movhi
	str	r8, [r9, #44]
	str	r6, [r9, #36]
	str	r2, [r9, #40]
	str	r10, [r9, #44]
	bne	.L23
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	eor	ip, ip, #1
	tst	ip, r2
	beq	.L7
	cmp	r3, #0
	ble	.L7
	add	r2, r6, r2
	add	r3, r1, r3
	mov	ip, r0
	add	r9, r7, r7, lsr #31
	ldr	r0, .L40
	sub	r2, r2, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r9, r9, #1
	ldr	r5, [r0]
	ldr	r4, [r0, #4]
	add	r3, r6, r3, lsl #4
	add	r0, r6, r1, lsl #4
	and	r2, r2, #1
	orr	r9, r9, #-2130706432
	add	r6, sp, #4
.L28:
	add	r1, r7, r0
	bic	r1, r1, #1
	ldrsh	lr, [r5, r1]
	ldrb	r8, [sp, #48]	@ zero_extendqisi2
	cmp	r2, #0
	and	r10, lr, #255
	and	r8, r8, #255
	andeq	lr, lr, #65280
	orreq	r8, lr, r8
	add	lr, r0, r0, lsr #31
	bic	lr, lr, #1
	add	r0, r0, #240
	orrne	r8, r10, r8, lsl #8
	add	lr, r5, lr
	cmp	r3, r0
	strh	r8, [r5, r1]	@ movhi
	str	ip, [r4, #44]
	str	r6, [r4, #36]
	str	lr, [r4, #40]
	str	r9, [r4, #44]
	bne	.L28
	b	.L7
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L44
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, r0, lsl #24
	orr	r3, r3, r2
	ldm	r1, {r0, r2}
	ldr	r1, .L44+4
	orr	r3, r3, ip, lsl #8
	add	ip, sp, #12
	str	r3, [sp, #12]
	str	lr, [r2, #44]
	str	ip, [r2, #36]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L54
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L48:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L48
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullScreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullScreenImage4, %function
drawFullScreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L57
	ldr	r1, .L57+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullScreenImage4, .-drawFullScreenImage4
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r6, #0
	ldr	ip, .L70
	ldr	r8, .L70+4
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	lsl	r7, r3, #24
	ldr	r5, [ip]
	add	r4, r0, r1, lsl #4
	add	r8, r8, r2, lsl #4
	asr	r7, r7, #16
.L60:
	mov	r1, #0
	add	lr, r8, r6
.L63:
	ldrb	ip, [lr], #1	@ zero_extendqisi2
	add	r2, r1, r4
	cmp	ip, #0
	add	r9, r1, r0
	bic	r2, r2, #1
	beq	.L61
	ldrsh	ip, [r5, r2]
	tst	r9, #1
	and	r9, ip, #255
	biceq	ip, ip, #255
	orr	r9, r7, r9
	orreq	ip, ip, r3
	strhne	r9, [r5, r2]	@ movhi
	strheq	ip, [r5, r2]	@ movhi
.L61:
	add	r1, r1, #1
	cmp	r1, #6
	bne	.L63
	add	r6, r6, #6
	cmp	r6, #48
	add	r4, r4, #240
	bne	.L60
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	fontdata_6x8
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L72
	mov	r5, r1
.L74:
	mov	r1, r5
	bl	drawChar4
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r0, r0, #6
	bne	.L74
.L72:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L81:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L81
	mov	r2, #67108864
.L82:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L82
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L89
	moveq	r2, #100663296
	ldr	r0, .L89+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L90:
	.align	2
.L89:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L93
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L94:
	.align	2
.L93:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L99
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L101
.L99:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L101:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L99
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
