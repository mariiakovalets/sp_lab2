	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl __ZNKSt5ctypeIcE8do_widenEc
	.weak_definition __ZNKSt5ctypeIcE8do_widenEc
__ZNKSt5ctypeIcE8do_widenEc:
LFB2186:
	mov	w0, w1
	ret
LFE2186:
	.align	2
	.p2align 5,,15
	.globl __Z4fillRSt6vectorIiSaIiEE
__Z4fillRSt6vectorIiSaIiEE:
LFB2817:
	ldp	x3, x2, [x0]
	sub	x2, x2, x3
	asr	x2, x2, 2
	cmp	w2, 0
	ble	L3
	sub	w0, w2, #1
	cmp	w0, 2
	bls	L9
	adrp	x4, lC0@PAGE
	movi	v29.4s, 0x64
	movi	v28.4s, 0x4
	mov	x0, x3
	lsr	w1, w2, 2
	add	x1, x3, w1, uxtw 4
	ldr	q31, [x4, #lC0@PAGEOFF]
	adrp	x4, lC1@PAGE
	ldr	q30, [x4, #lC1@PAGEOFF]
	.p2align 5,,15
L6:
	smull	v0.2d, v31.2s, v30.2s
	mov	v27.16b, v31.16b
	smull2	v26.2d, v31.4s, v30.4s
	add	v31.4s, v31.4s, v28.4s
	uzp2	v26.4s, v0.4s, v26.4s
	sshr	v26.4s, v26.4s, 5
	mls	v27.4s, v26.4s, v29.4s
	str	q27, [x0], 16
	cmp	x0, x1
	bne	L6
	and	w0, w2, -4
	tst	x2, 3
	beq	L3
L5:
	mov	w4, 34079
	mov	w6, 100
	movk	w4, 0x51eb, lsl 16
	ubfiz	x7, x0, 2, 32
	add	w5, w0, 1
	umull	x1, w0, w4
	lsr	x1, x1, 37
	msub	w1, w1, w6, w0
	str	w1, [x3, x7]
	cmp	w5, w2
	bge	L3
	umull	x1, w5, w4
	add	x3, x3, x7
	add	w0, w0, 2
	lsr	x1, x1, 37
	msub	w1, w1, w6, w5
	str	w1, [x3, 4]
	cmp	w2, w0
	ble	L3
	umull	x4, w0, w4
	lsr	x4, x4, 37
	msub	w0, w4, w6, w0
	str	w0, [x3, 8]
L3:
	ret
L9:
	mov	w0, 0
	b	L5
LFE2817:
	.align	2
	.p2align 5,,15
	.globl __Z5scaleRKSt6vectorIiSaIiEERS1_i
__Z5scaleRKSt6vectorIiSaIiEERS1_i:
LFB2818:
	ldp	x4, x0, [x0]
	sub	x0, x0, x4
	asr	x0, x0, 2
	cmp	w0, 0
	ble	L15
	sub	w3, w0, #1
	ldr	x5, [x1]
	mov	x1, 0
	add	x3, x3, 1
	lsl	x3, x3, 2
	.p2align 5,,15
L17:
	ldr	w0, [x4, x1]
	mul	w0, w2, w0
	add	w0, w0, 1
	str	w0, [x5, x1]
	add	x1, x1, 4
	cmp	x3, x1
	bne	L17
L15:
	ret
LFE2818:
	.align	2
	.p2align 5,,15
	.globl __Z3sumRKSt6vectorIiSaIiEE
__Z3sumRKSt6vectorIiSaIiEE:
LFB2819:
	ldp	x3, x2, [x0]
	sub	x2, x2, x3
	asr	x2, x2, 2
	cmp	w2, 0
	ble	L25
	sub	w0, w2, #1
	cmp	w0, 2
	bls	L26
	movi	v31.4s, 0
	mov	x0, x3
	lsr	w1, w2, 2
	add	x1, x3, w1, uxtw 4
	.p2align 5,,15
L22:
	ldr	q30, [x0], 16
	saddw	v31.2d, v31.2d, v30.2s
	saddw2	v31.2d, v31.2d, v30.4s
	cmp	x1, x0
	bne	L22
	addp	d31, v31.2d
	and	w1, w2, -4
	fmov	x0, d31
	tst	x2, 3
	beq	L19
L21:
	ldrsw	x5, [x3, w1, uxtw 2]
	add	w4, w1, 1
	add	x0, x0, x5
	cmp	w4, w2
	bge	L19
	add	x3, x3, w1, uxtw 2
	ldrsw	x4, [x3, 4]
	add	w1, w1, 2
	add	x0, x0, x4
	cmp	w1, w2
	bge	L19
	ldrsw	x1, [x3, 8]
	add	x0, x0, x1
L19:
	ret
	.p2align 2,,3
L25:
	mov	x0, 0
	ret
L26:
	mov	w1, 0
	mov	x0, 0
	b	L21
LFE2819:
	.align	2
	.p2align 5,,15
	.globl __Z11count_aboveRKSt6vectorIiSaIiEEi
__Z11count_aboveRKSt6vectorIiSaIiEEi:
LFB2820:
	ldp	x4, x2, [x0]
	sub	x2, x2, x4
	asr	x2, x2, 2
	cmp	w2, 0
	ble	L43
	sub	w0, w2, #1
	cmp	w0, 2
	bls	L51
	dup	v29.4s, w1
	mov	x0, x4
	lsr	w3, w2, 2
	add	x3, x4, w3, uxtw 4
	movi	v30.4s, 0
	.p2align 5,,15
L41:
	ldr	q31, [x0], 16
	cmgt	v31.4s, v31.4s, v29.4s
	sub	v30.4s, v30.4s, v31.4s
	cmp	x0, x3
	bne	L41
	addv	s31, v30.4s
	and	w3, w2, -4
	fmov	w0, s31
	tst	x2, 3
	beq	L32
L34:
	ldr	w6, [x4, w3, uxtw 2]
	add	w5, w3, 1
	cmp	w1, w6
	cinc	w0, w0, lt
	cmp	w2, w5
	ble	L32
	add	x4, x4, w3, uxtw 2
	ldr	w5, [x4, 4]
	add	w3, w3, 2
	cmp	w1, w5
	cinc	w0, w0, lt
	cmp	w3, w2
	bge	L32
	ldr	w2, [x4, 8]
	cmp	w1, w2
	cinc	w0, w0, lt
L32:
	ret
	.p2align 2,,3
L43:
	mov	w0, 0
	ret
L51:
	mov	w3, 0
	mov	w0, 0
	b	L34
LFE2820:
	.cstring
	.align	3
lC2:
	.ascii "basic_string: construction from null is not valid\0"
	.align	3
lC3:
	.ascii "stoi\0"
	.align	3
lC4:
	.ascii "total = \0"
	.align	3
lC5:
	.ascii ", big = \0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB2821:
	stp	x29, x30, [sp, -112]!
LCFI0:
	mov	x29, sp
LCFI1:
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
LCFI2:
	cmp	w0, 1
	ble	L80
	add	x21, x29, 96
	ldr	x20, [x1, 8]
	str	x21, [x29, 80]
	cbz	x20, L102
	mov	x0, x20
	bl	_strlen
	mov	x19, x0
	cmp	x0, 15
	bhi	L103
	cmp	x0, 1
	beq	L104
	cbnz	x0, L105
L58:
	ldr	x0, [x29, 80]
	str	x19, [x29, 88]
	strb	wzr, [x0, x19]
	ldr	x19, [x29, 80]
LEHB0:
	bl	___error
	ldr	w20, [x0]
	bl	___error
LEHE0:
	mov	x3, x0
	add	x1, x29, 72
	mov	w2, 10
	mov	x0, x19
	str	wzr, [x3]
	bl	_strtol
	ldr	x1, [x29, 72]
	mov	x23, x0
	cmp	x19, x1
	beq	L106
LEHB1:
	bl	___error
LEHE1:
	ldr	w0, [x0]
	cmp	w0, 34
	beq	L60
	mov	x0, 2147483648
	mov	x1, 4294967295
	add	x0, x23, x0
	cmp	x0, x1
	bhi	L60
	bl	___error
	ldr	w0, [x0]
	cbz	w0, L107
L62:
	ldr	x0, [x29, 80]
	cmp	x0, x21
	beq	L53
	ldr	x1, [x29, 96]
	add	x1, x1, 1
	bl	__ZdlPvm
L53:
	mov	x0, 2304
	movk	x0, 0x3d, lsl 16
LEHB2:
	bl	__Znwm
LEHE2:
	mov	x2, 2300
	mov	x20, x0
	str	wzr, [x0], 4
	movk	x2, 0x3d, lsl 16
	mov	w1, 0
	bl	_memset
	mov	x0, 2304
	movk	x0, 0x3d, lsl 16
LEHB3:
	bl	__Znwm
LEHE3:
	mov	x2, 2300
	mov	x19, x0
	str	wzr, [x0], 4
	movk	x2, 0x3d, lsl 16
	mov	w1, 0
	bl	_memset
	adrp	x2, lC1@PAGE
	adrp	x0, lC0@PAGE
	movi	v29.4s, 0x64
	movi	v28.4s, 0x4
	add	x1, x20, 3997696
	ldr	q30, [x2, #lC1@PAGEOFF]
	add	x1, x1, 2304
	ldr	q31, [x0, #lC0@PAGEOFF]
	mov	x0, x20
	.p2align 5,,15
L68:
	smull	v0.2d, v31.2s, v30.2s
	mov	v27.16b, v31.16b
	smull2	v26.2d, v31.4s, v30.4s
	add	v31.4s, v31.4s, v28.4s
	uzp2	v26.4s, v0.4s, v26.4s
	sshr	v26.4s, v26.4s, 5
	mls	v27.4s, v26.4s, v29.4s
	str	q27, [x0], 16
	cmp	x0, x1
	bne	L68
	cmp	w23, 0
	ble	L81
	adrp	x0, lC6@PAGE
	add	x2, x19, 3997696
	mov	w5, 52429
	mov	x3, 2304
	ldr	q27, [x0, #lC6@PAGEOFF]
	mov	w4, 0
	mov	x21, 0
	mov	x22, 0
	add	x2, x2, 2304
	movk	w5, 0xcccc, lsl 16
	movk	x3, 0x3d, lsl 16
	.p2align 5,,15
L73:
	umull	x1, w4, w5
	mov	x0, 0
	lsr	x1, x1, 35
	add	w1, w1, w1, lsl 2
	sub	w1, w4, w1, lsl 1
	add	w1, w1, 1
	fmov	s31, w1
	.p2align 5,,15
L70:
	ldr	q29, [x20, x0]
	movi	v30.4s, 0x1
	mla	v30.4s, v29.4s, v31.s[0]
	str	q30, [x19, x0]
	add	x0, x0, 16
	cmp	x0, x3
	bne	L70
	movi	v31.4s, 0
	mov	x1, x19
	mov	x0, x19
	.p2align 5,,15
L71:
	ldr	q30, [x0], 16
	saddw	v31.2d, v31.2d, v30.2s
	saddw2	v31.2d, v31.2d, v30.4s
	cmp	x0, x2
	bne	L71
	addp	d31, v31.2d
	movi	v30.4s, 0
	fmov	x0, d31
	add	x22, x22, x0
	.p2align 5,,15
L72:
	ldr	q31, [x1], 16
	cmgt	v31.4s, v31.4s, v27.4s
	sub	v30.4s, v30.4s, v31.4s
	cmp	x2, x1
	bne	L72
	addv	s31, v30.4s
	add	w4, w4, 1
	fmov	w0, s31
	add	x21, x21, w0, sxtw
	cmp	w4, w23
	bne	L73
L69:
	adrp	x1, lC4@PAGE
	adrp	x0, __ZSt4cout@GOTPAGE
	ldr	x0, [x0, __ZSt4cout@GOTPAGEOFF]
	mov	x2, 8
	add	x1, x1, lC4@PAGEOFF;
LEHB4:
	bl	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, __ZSt4cout@GOTPAGE
	ldr	x0, [x0, __ZSt4cout@GOTPAGEOFF]
	mov	x1, x22
	bl	__ZNSo9_M_insertIxEERSoT_
	adrp	x1, lC5@PAGE
	mov	x2, 8
	add	x1, x1, lC5@PAGEOFF;
	mov	x22, x0
	bl	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, x21
	mov	x0, x22
	bl	__ZNSo9_M_insertIxEERSoT_
	mov	x22, x0
	ldr	x0, [x0]
	ldr	x0, [x0, -24]
	add	x0, x22, x0
	ldr	x21, [x0, 240]
	cbz	x21, L108
	ldrsb	w0, [x21, 56]
	cbz	w0, L75
	ldrsb	w1, [x21, 67]
L76:
	mov	x0, x22
	bl	__ZNSo3putEc
	bl	__ZNSo5flushEv
	mov	x1, 2304
	mov	x0, x19
	movk	x1, 0x3d, lsl 16
	bl	__ZdlPvm
	mov	x1, 2304
	mov	x0, x20
	movk	x1, 0x3d, lsl 16
	bl	__ZdlPvm
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
LCFI3:
	ret
L75:
LCFI4:
	mov	x0, x21
	bl	__ZNKSt5ctypeIcE13_M_widen_initEv
LEHE4:
	ldr	x1, [x21]
	adrp	x0, __ZNKSt5ctypeIcE8do_widenEc@GOTPAGE
	ldr	x0, [x0, __ZNKSt5ctypeIcE8do_widenEc@GOTPAGEOFF]
	ldr	x2, [x1, 48]
	cmp	x2, x0
	bne	L109
	mov	w1, 10
	b	L76
L80:
	mov	w23, 2000
	b	L53
L103:
	add	x0, x0, 1
LEHB5:
	bl	__Znwm
LEHE5:
	str	x0, [x29, 80]
	str	x19, [x29, 96]
L56:
	mov	x1, x20
	mov	x2, x19
	bl	_memcpy
	b	L58
L104:
	ldrsb	w0, [x20]
	strb	w0, [x29, 96]
	b	L58
L107:
	bl	___error
	str	w20, [x0]
	b	L62
L81:
	mov	x21, 0
	mov	x22, 0
	b	L69
L109:
	mov	x0, x21
	mov	w1, 10
LEHB6:
	blr	x2
LEHE6:
	mov	w1, w0
	b	L76
L105:
	mov	x0, x21
	b	L56
L85:
	mov	x19, x0
L67:
	ldr	x0, [x29, 80]
	cmp	x0, x21
	beq	L77
	ldr	x1, [x29, 96]
	add	x1, x1, 1
	bl	__ZdlPvm
L77:
	mov	x0, x19
LEHB7:
	bl	__Unwind_Resume
LEHE7:
L106:
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;
LEHB8:
	bl	__ZSt24__throw_invalid_argumentPKc
LEHE8:
L86:
	mov	x19, x0
	bl	___error
	ldr	w0, [x0]
	cbnz	w0, L67
	bl	___error
	str	w20, [x0]
	b	L67
L60:
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;
LEHB9:
	bl	__ZSt20__throw_out_of_rangePKc
LEHE9:
L84:
	mov	x1, 2304
	mov	x21, x0
	movk	x1, 0x3d, lsl 16
	mov	x0, x19
	bl	__ZdlPvm
L79:
	mov	x1, 2304
	mov	x0, x20
	movk	x1, 0x3d, lsl 16
	bl	__ZdlPvm
	mov	x0, x21
LEHB10:
	bl	__Unwind_Resume
LEHE10:
L83:
	mov	x21, x0
	b	L79
L108:
LEHB11:
	bl	__ZSt16__throw_bad_castv
LEHE11:
L102:
	adrp	x0, lC2@PAGE
	add	x0, x0, lC2@PAGEOFF;
LEHB12:
	bl	__ZSt19__throw_logic_errorPKc
LEHE12:
LFE2821:
	.section __TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
LLSDA2821:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 LLSDACSE2821-LLSDACSB2821
LLSDACSB2821:
	.uleb128 LEHB0-LFB2821
	.uleb128 LEHE0-LEHB0
	.uleb128 L85-LFB2821
	.uleb128 0
	.uleb128 LEHB1-LFB2821
	.uleb128 LEHE1-LEHB1
	.uleb128 L86-LFB2821
	.uleb128 0
	.uleb128 LEHB2-LFB2821
	.uleb128 LEHE2-LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 LEHB3-LFB2821
	.uleb128 LEHE3-LEHB3
	.uleb128 L83-LFB2821
	.uleb128 0
	.uleb128 LEHB4-LFB2821
	.uleb128 LEHE4-LEHB4
	.uleb128 L84-LFB2821
	.uleb128 0
	.uleb128 LEHB5-LFB2821
	.uleb128 LEHE5-LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 LEHB6-LFB2821
	.uleb128 LEHE6-LEHB6
	.uleb128 L84-LFB2821
	.uleb128 0
	.uleb128 LEHB7-LFB2821
	.uleb128 LEHE7-LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 LEHB8-LFB2821
	.uleb128 LEHE8-LEHB8
	.uleb128 L86-LFB2821
	.uleb128 0
	.uleb128 LEHB9-LFB2821
	.uleb128 LEHE9-LEHB9
	.uleb128 L86-LFB2821
	.uleb128 0
	.uleb128 LEHB10-LFB2821
	.uleb128 LEHE10-LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 LEHB11-LFB2821
	.uleb128 LEHE11-LEHB11
	.uleb128 L84-LFB2821
	.uleb128 0
	.uleb128 LEHB12-LFB2821
	.uleb128 LEHE12-LEHB12
	.uleb128 0
	.uleb128 0
LLSDACSE2821:
	.section __TEXT,__text_startup,regular,pure_instructions
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	2
	.p2align 5,,15
__GLOBAL__sub_I_arrays.cpp:
LFB3506:
	adrp	x1, __ZStL8__ioinit@PAGE
	stp	x29, x30, [sp, -32]!
LCFI5:
	mov	x29, sp
LCFI6:
	add	x1, x1, __ZStL8__ioinit@PAGEOFF;
	mov	x0, x1
	str	x1, [x29, 24]
	bl	__ZNSt8ios_base4InitC1Ev
	adrp	x2, ___dso_handle@PAGE
	ldr	x1, [x29, 24]
	add	x2, x2, ___dso_handle@PAGEOFF;
	ldp	x29, x30, [sp], 32
LCFI7:
	adrp	x0, __ZNSt8ios_base4InitD1Ev@GOTPAGE
	ldr	x0, [x0, __ZNSt8ios_base4InitD1Ev@GOTPAGEOFF]
	b	___cxa_atexit
LFE3506:
	.zerofill __DATA,__bss,__ZStL8__ioinit,1,0
	.literal16
	.align	4
lC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.align	4
lC1:
	.word	1374389535
	.word	1374389535
	.word	1374389535
	.word	1374389535
	.align	4
lC6:
	.word	500
	.word	500
	.word	500
	.word	500
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x3
	.ascii "zPLR\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x7
	.byte	0x9b
L_got_pcr0:
	.long	___gxx_personality_v0@GOT-L_got_pcr0
	.byte	0x10
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB2186-.
	.set L$set$2,LFE2186-LFB2186
	.quad L$set$2
	.uleb128 0x8
	.quad	0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB2817-.
	.set L$set$4,LFE2817-LFB2817
	.quad L$set$4
	.uleb128 0x8
	.quad	0
	.align	3
LEFDE3:
LSFDE5:
	.set L$set$5,LEFDE5-LASFDE5
	.long L$set$5
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB2818-.
	.set L$set$6,LFE2818-LFB2818
	.quad L$set$6
	.uleb128 0x8
	.quad	0
	.align	3
LEFDE5:
LSFDE7:
	.set L$set$7,LEFDE7-LASFDE7
	.long L$set$7
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB2819-.
	.set L$set$8,LFE2819-LFB2819
	.quad L$set$8
	.uleb128 0x8
	.quad	0
	.align	3
LEFDE7:
LSFDE9:
	.set L$set$9,LEFDE9-LASFDE9
	.long L$set$9
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB2820-.
	.set L$set$10,LFE2820-LFB2820
	.quad L$set$10
	.uleb128 0x8
	.quad	0
	.align	3
LEFDE9:
LSFDE11:
	.set L$set$11,LEFDE11-LASFDE11
	.long L$set$11
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB2821-.
	.set L$set$12,LFE2821-LFB2821
	.quad L$set$12
	.uleb128 0x8
	.quad	LLSDA2821-.
	.byte	0x4
	.set L$set$13,LCFI0-LFB2821
	.long L$set$13
	.byte	0xe
	.uleb128 0x70
	.byte	0x9d
	.uleb128 0xe
	.byte	0x9e
	.uleb128 0xd
	.byte	0x4
	.set L$set$14,LCFI1-LCFI0
	.long L$set$14
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.set L$set$15,LCFI2-LCFI1
	.long L$set$15
	.byte	0x93
	.uleb128 0xc
	.byte	0x94
	.uleb128 0xb
	.byte	0x95
	.uleb128 0xa
	.byte	0x96
	.uleb128 0x9
	.byte	0x97
	.uleb128 0x8
	.byte	0x4
	.set L$set$16,LCFI3-LCFI2
	.long L$set$16
	.byte	0xa
	.byte	0xde
	.byte	0xdd
	.byte	0xd7
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$17,LCFI4-LCFI3
	.long L$set$17
	.byte	0xb
	.align	3
LEFDE11:
LSFDE13:
	.set L$set$18,LEFDE13-LASFDE13
	.long L$set$18
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB3506-.
	.set L$set$19,LFE3506-LFB3506
	.quad L$set$19
	.uleb128 0x8
	.quad	0
	.byte	0x4
	.set L$set$20,LCFI5-LFB3506
	.long L$set$20
	.byte	0xe
	.uleb128 0x20
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$21,LCFI6-LCFI5
	.long L$set$21
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.set L$set$22,LCFI7-LCFI6
	.long L$set$22
	.byte	0xde
	.byte	0xdd
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LEFDE13:
	.private_extern ___dso_handle
	.ident	"GCC: (Homebrew GCC 15.2.0) 15.2.0"
	.mod_init_func
_Mod.init:
	.align	3
	.xword	__GLOBAL__sub_I_arrays.cpp
	.subsections_via_symbols
