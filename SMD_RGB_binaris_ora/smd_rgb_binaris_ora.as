opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	16F628
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\header.h"
	psect config,class=CONFIG,delta=2 ;#
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\header.h"
	dw 0x3FFF & 0x3FFF & 0x3F7F & 0x3FBF & 0x3FDF & 0x3FF7 & 0x3FFB & 0x3FED ;#
	FNCALL	_main,_init_setup
	FNCALL	_main,_random_szam
	FNCALL	_main,_SR74HC595
	FNCALL	_random_szam,_rand
	FNCALL	_random_szam,___awmod
	FNCALL	_rand,_srand
	FNCALL	_rand,___lmul
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_randx
	global	_mp_1
	global	_mp_10
	global	_ora_1
	global	_ora_10
	global	_perc_1
	global	_perc_10
	global	_randf
	global	_timer_count
	global	_CCP1CON
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:
_CCP1CON	set	23
	global	_CMCON
_CMCON	set	31
	global	_INTCON
_INTCON	set	11
	global	_PORTB
_PORTB	set	6
	global	_T2CON
_T2CON	set	18
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA5
_RA5	set	45
	global	_RB7
_RB7	set	55
	global	_TMR2IF
_TMR2IF	set	97
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TMR2IE
_TMR2IE	set	1121
	file	"smd_rgb_binaris_ora.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timer_count:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_randx:
       ds      4

_mp_1:
       ds      1

_mp_10:
       ds      1

_ora_1:
       ds      1

_ora_10:
       ds      1

_perc_1:
       ds      1

_perc_10:
       ds      1

_randf:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_setup
?_init_setup:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	ds	2
	global	??_init_setup
??_init_setup:	; 0 bytes @ 0x2
	global	?_SR74HC595
?_SR74HC595:	; 0 bytes @ 0x2
	global	?_srand
?_srand:	; 0 bytes @ 0x2
	global	?___lmul
?___lmul:	; 4 bytes @ 0x2
	global	SR74HC595@szin
SR74HC595@szin:	; 2 bytes @ 0x2
	global	srand@x
srand@x:	; 2 bytes @ 0x2
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x2
	ds	2
	global	??_SR74HC595
??_SR74HC595:	; 0 bytes @ 0x4
	global	??_srand
??_srand:	; 0 bytes @ 0x4
	ds	1
	global	SR74HC595@shift
SR74HC595@shift:	; 1 bytes @ 0x5
	ds	1
	global	SR74HC595@ADAT
SR74HC595@ADAT:	; 1 bytes @ 0x6
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x6
	ds	1
	global	SR74HC595@i
SR74HC595@i:	; 1 bytes @ 0x7
	ds	3
	global	??_random_szam
??_random_szam:	; 0 bytes @ 0xA
	global	??___lmul
??___lmul:	; 0 bytes @ 0xA
	global	??___awmod
??___awmod:	; 0 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x0
	ds	4
	global	?___awmod
?___awmod:	; 2 bytes @ 0x4
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x4
	ds	2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x6
	ds	2
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x8
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x9
	ds	1
	global	?_rand
?_rand:	; 2 bytes @ 0xA
	ds	2
	global	??_rand
??_rand:	; 0 bytes @ 0xC
	ds	4
	global	?_random_szam
?_random_szam:	; 2 bytes @ 0x10
	global	random_szam@mettol
random_szam@mettol:	; 2 bytes @ 0x10
	ds	2
	global	random_szam@meddig
random_szam@meddig:	; 2 bytes @ 0x12
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	7
	global	_main$216
_main$216:	; 2 bytes @ 0x1B
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0x1D
	ds	1
	global	main@randszam
main@randszam:	; 1 bytes @ 0x1E
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      12
;; BANK0           80     31      42
;; BANK1           80      0       0
;; BANK2           48      0       0

;;
;; Pointer list with targets:

;; ?_rand	int  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?_random_szam	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _rand->___lmul
;;   ___awmod->___lmul
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_random_szam
;;   _random_szam->_rand
;;   _rand->___awmod
;;   ___awmod->___lmul
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 7, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                11    11      0    1634
;;                                             20 BANK0     11    11      0
;;                         _init_setup
;;                        _random_szam
;;                          _SR74HC595
;; ---------------------------------------------------------------------------------
;; (1) _random_szam                                          4     0      4     640
;;                                             16 BANK0      4     0      4
;;                               _rand
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) _rand                                                 6     4      2     114
;;                                             10 BANK0      6     4      2
;;                              _srand
;;                             ___lmul
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              6     2      4     433
;;                                              4 BANK0      6     2      4
;;                              _srand (ARG)
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___lmul                                              12     4      8      92
;;                                              2 COMMON     8     0      8
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (3) _srand                                                2     0      2      22
;;                                              2 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _SR74HC595                                            6     4      2     291
;;                                              2 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _init_setup                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_setup
;;   _random_szam
;;     _rand
;;       _srand
;;       ___lmul
;;       ___awmod (ARG)
;;         _srand (ARG)
;;         ___lmul (ARG)
;;     ___awmod
;;       _srand (ARG)
;;       ___lmul (ARG)
;;   _SR74HC595
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     1F      2A       3       52.5%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      36       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK2            30      0       0       8        0.0%
;;BANK2               30      0       0       9        0.0%
;;DATA                 0      0      39      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 89 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  randszam        1   30[BANK0 ] unsigned char 
;;  i               1   29[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       7       0       0
;;      Totals:         0      11       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_init_setup
;;		_random_szam
;;		_SR74HC595
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
	line	89
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	92
	
l1431:	
;main.c: 90: unsigned char i, randszam;
;main.c: 92: init_setup();
	fcall	_init_setup
	line	96
	
l1433:	
;main.c: 96: if(RA2==0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u1021
	goto	u1020
u1021:
	goto	l363
u1020:
	line	97
	
l364:	
	btfss	(42/8),(42)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l364
u1030:
	line	98
	
l1437:	
;main.c: 98: perc_1++;
	incf	(_perc_1),f
	line	99
	
l1439:	
;main.c: 99: if(perc_1==10){
	movf	(_perc_1),w
	xorlw	0Ah
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l1465
u1040:
	line	100
	
l1441:	
;main.c: 100: perc_1 = 0;
	clrf	(_perc_1)
	line	101
	
l1443:	
;main.c: 101: perc_10++;
	incf	(_perc_10),f
	line	102
	
l1445:	
;main.c: 102: if(perc_10==6){
	movf	(_perc_10),w
	xorlw	06h
	skipz
	goto	u1051
	goto	u1050
u1051:
	goto	l1465
u1050:
	line	103
	
l1447:	
;main.c: 103: perc_10 = 0;
	clrf	(_perc_10)
	goto	l1465
	line	106
	
l363:	
	btfsc	(45/8),(45)&7
	goto	u1061
	goto	u1060
u1061:
	goto	l1465
u1060:
	line	107
	
l371:	
	btfss	(45/8),(45)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l371
u1070:
	line	108
	
l1451:	
;main.c: 108: ora_1++;
	incf	(_ora_1),f
	line	109
	
l1453:	
;main.c: 109: if(ora_1==10){
	movf	(_ora_1),w
	xorlw	0Ah
	skipz
	goto	u1081
	goto	u1080
u1081:
	goto	l1465
u1080:
	line	110
	
l1455:	
;main.c: 110: ora_1 = 0;
	clrf	(_ora_1)
	line	111
	
l1457:	
;main.c: 111: ora_10++;
	incf	(_ora_10),f
	line	112
	
l1459:	
;main.c: 112: if(ora_10==2 & ora_1==4){
	movf	(_ora_10),w
	xorlw	02h
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l1465
u1090:
	
l1461:	
	movf	(_ora_1),w
	xorlw	04h
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l1465
u1100:
	line	113
	
l1463:	
;main.c: 113: ora_1 = 0;
	clrf	(_ora_1)
	line	114
;main.c: 114: ora_10 = 0;
	clrf	(_ora_10)
	line	119
	
l1465:	
;main.c: 115: }
;main.c: 116: }
;main.c: 117: }
;main.c: 119: if(mp_1==0){
	movf	(_mp_1),f
	skipz
	goto	u1111
	goto	u1110
u1111:
	goto	l1469
u1110:
	line	120
	
l1467:	
;main.c: 120: randszam = random_szam(1,3);
	clrf	(?_random_szam)
	incf	(?_random_szam),f
	clrf	(?_random_szam+1)
	movlw	03h
	movwf	0+(?_random_szam)+02h
	clrf	1+(?_random_szam)+02h
	fcall	_random_szam
	movf	(0+(?_random_szam)),w
	movwf	(main@randszam)
	line	122
	
l1469:	
;main.c: 121: }
;main.c: 122: PORTB = 0xFE;
	movlw	(0FEh)
	movwf	(6)	;volatile
	line	123
	
l1471:	
;main.c: 123: for(i=0; i<6; i++){
	clrf	(main@i)
	line	125
	
l1477:	
;main.c: 125: PORTB = i==0 ? PORTB : (PORTB<<1)|1;
	movf	(6),w	;volatile
	movwf	(_main$216)
	clrf	(_main$216+1)
	
l1479:	
	clrc
	rlf	(_main$216),f
	rlf	(_main$216+1),f
	
l1481:	
	bsf	(_main$216)+(0/8),(0)&7
	
l1483:	
	movf	(main@i),f
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l380
u1120:
	
l1485:	
	movf	(6),w	;volatile
	movwf	(_main$216)
	clrf	(_main$216+1)
	
l380:	
	movf	(_main$216),w
	movwf	(6)	;volatile
	line	126
	
l1487:	
;main.c: 126: if(i==0){
	movf	(main@i),f
	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l1495
u1130:
	line	127
	
l1489:	
;main.c: 127: SR74HC595((mp_1>>3)|((mp_1>>1)&2)|((mp_1<<1)&4)|((mp_1 << 3)&8), randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_mp_1),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_mp_1),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_mp_1),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_mp_1),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	128
	
l1491:	
;main.c: 128: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1207:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1207
	nop2	;nop
	clrwdt
opt asmopt_on

	line	129
	
l1493:	
;main.c: 129: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	line	130
;main.c: 130: }else if(i==1){
	goto	l382
	
l1495:	
	decf	(main@i),w
	skipz
	goto	u1141
	goto	u1140
u1141:
	goto	l1503
u1140:
	line	131
	
l1497:	
;main.c: 131: SR74HC595((mp_10>>3)|((mp_10>>1)&2)|((mp_10<<1)&4)|((mp_10<<3)&8),randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_mp_10),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_mp_10),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_mp_10),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_mp_10),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	132
	
l1499:	
;main.c: 132: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1217:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1217
	nop2	;nop
	clrwdt
opt asmopt_on

	line	133
	
l1501:	
;main.c: 133: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	line	134
;main.c: 134: }else if(i==2){
	goto	l382
	
l1503:	
	movf	(main@i),w
	xorlw	02h
	skipz
	goto	u1151
	goto	u1150
u1151:
	goto	l1511
u1150:
	line	135
	
l1505:	
;main.c: 135: SR74HC595((perc_1>>3)|((perc_1>>1)&2)|((perc_1<<1)&4)|((perc_1<<3)&8),randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_perc_1),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_perc_1),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_perc_1),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_perc_1),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	136
	
l1507:	
;main.c: 136: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1227:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1227
	nop2	;nop
	clrwdt
opt asmopt_on

	line	137
	
l1509:	
;main.c: 137: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	line	138
;main.c: 138: }else if(i==3){
	goto	l382
	
l1511:	
	movf	(main@i),w
	xorlw	03h
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l1519
u1160:
	line	139
	
l1513:	
;main.c: 139: SR74HC595((perc_10>>3)|((perc_10>>1)&2)|((perc_10<<1)&4)|((perc_10<<3)&8),randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_perc_10),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_perc_10),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_perc_10),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_perc_10),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	140
	
l1515:	
;main.c: 140: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1237:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1237
	nop2	;nop
	clrwdt
opt asmopt_on

	line	141
	
l1517:	
;main.c: 141: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	line	142
;main.c: 142: }else if(i==4){
	goto	l382
	
l1519:	
	movf	(main@i),w
	xorlw	04h
	skipz
	goto	u1171
	goto	u1170
u1171:
	goto	l1527
u1170:
	line	143
	
l1521:	
;main.c: 143: SR74HC595((ora_1>>3)|((ora_1>>1)&2)|((ora_1<<1)&4)|((ora_1<<3)&8),randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_ora_1),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_ora_1),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_ora_1),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_ora_1),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	144
	
l1523:	
;main.c: 144: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1247:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1247
	nop2	;nop
	clrwdt
opt asmopt_on

	line	145
	
l1525:	
;main.c: 145: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	line	146
;main.c: 146: }else if(i==5){
	goto	l382
	
l1527:	
	movf	(main@i),w
	xorlw	05h
	skipz
	goto	u1181
	goto	u1180
u1181:
	goto	l386
u1180:
	line	147
	
l1529:	
;main.c: 147: SR74HC595((ora_10>>3)|((ora_10>>1)&2)|((ora_10<<1)&4)|((ora_10<<3)&8),randszam);
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movf	(_ora_10),w
	movwf	(??_main+0)+0
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	clrc
	rlf	(??_main+0)+0,f
	movlw	(08h)
	andwf	0+(??_main+0)+0,w
	movwf	(??_main+1)+0
	movf	(_ora_10),w
	movwf	(??_main+2)+0
	clrc
	rlf	(??_main+2)+0,f
	movlw	(04h)
	andwf	0+(??_main+2)+0,w
	movwf	(??_main+3)+0
	movf	(_ora_10),w
	movwf	(??_main+4)+0
	clrc
	rrf	(??_main+4)+0,f
	movlw	(02h)
	andwf	0+(??_main+4)+0,w
	movwf	(??_main+5)+0
	movf	(_ora_10),w
	movwf	(??_main+6)+0
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	clrc
	rrf	(??_main+6)+0,f
	movf	0+(??_main+6)+0,w
	iorwf	0+(??_main+5)+0,w
	iorwf	0+(??_main+3)+0,w
	iorwf	0+(??_main+1)+0,w
	fcall	_SR74HC595
	line	148
	
l1531:	
;main.c: 148: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1257:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1257
	nop2	;nop
	clrwdt
opt asmopt_on

	line	149
	
l1533:	
;main.c: 149: SR74HC595(0,randszam);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@randszam),w
	movwf	(?_SR74HC595)
	clrf	(?_SR74HC595+1)
	movlw	(0)
	fcall	_SR74HC595
	goto	l382
	line	154
	
l386:	
	
l382:	
;main.c: 150: }
;main.c: 154: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1267:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1267
	nop2	;nop
	clrwdt
opt asmopt_on

	line	123
	
l1535:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@i),f
	
l1537:	
	movlw	(06h)
	subwf	(main@i),w
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l1477
u1190:
	line	158
	
l1539:	
;main.c: 156: }
;main.c: 158: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1277:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1277
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l1433
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	161
	signat	_main,88
	global	_random_szam
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:

;; *************** function _random_szam *****************
;; Defined at:
;;		line 220 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;  mettol          2   16[BANK0 ] unsigned int 
;;  meddig          2   18[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   16[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_rand
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text232
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
	line	220
	global	__size_of_random_szam
	__size_of_random_szam	equ	__end_of_random_szam-_random_szam
	
_random_szam:	
	opt	stack 7
; Regs used in _random_szam: [wreg+status,2+status,0+pclath+cstack]
	line	221
	
l1427:	
;main.c: 221: return rand() % (meddig-mettol+1) + mettol;
	movf	(random_szam@meddig+1),w
	movwf	(?___awmod+1)
	movf	(random_szam@meddig),w
	movwf	(?___awmod)
	movf	(random_szam@mettol),w
	subwf	(?___awmod),f
	movf	(random_szam@mettol+1),w
	skipc
	decf	(?___awmod+1),f
	subwf	(?___awmod+1),f
	incf	(?___awmod),f
	skipnz
	incf	(?___awmod+1),f
	fcall	_rand
	movf	(1+(?_rand)),w
	movwf	1+(?___awmod)+02h
	movf	(0+(?_rand)),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(random_szam@mettol),w
	addwf	(0+(?___awmod)),w
	movwf	(?_random_szam)
	movf	(random_szam@mettol+1),w
	skipnc
	incf	(random_szam@mettol+1),w
	addwf	(1+(?___awmod)),w
	movwf	1+(?_random_szam)
	line	222
	
l417:	
	return
	opt stack 0
GLOBAL	__end_of_random_szam
	__end_of_random_szam:
;; =============== function _random_szam ends ============

	signat	_random_szam,8314
	global	_rand
psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:

;; *************** function _rand *****************
;; Defined at:
;;		line 14 in file "../../common/rand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   10[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_srand
;;		___lmul
;; This function is called by:
;;		_random_szam
;; This function uses a non-reentrant model
;;
psect	text233
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\rand.c"
	line	14
	global	__size_of_rand
	__size_of_rand	equ	__end_of_rand-_rand
	
_rand:	
	opt	stack 6
; Regs used in _rand: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l1267:	
	movf	(_randf),f
	skipz
	goto	u751
	goto	u750
u751:
	goto	l427
u750:
	line	16
	
l1269:	
	clrf	(?_srand)
	incf	(?_srand),f
	clrf	(?_srand+1)
	fcall	_srand
	
l427:	
	line	17
	movlw	039h
	movwf	((??_rand+0)+0)
	movlw	030h
	movwf	((??_rand+0)+0+1)
	movlw	0
	movwf	((??_rand+0)+0+2)
	movlw	0
	movwf	((??_rand+0)+0+3)
	movf	(_randx+3),w
	movwf	(?___lmul+3)
	movf	(_randx+2),w
	movwf	(?___lmul+2)
	movf	(_randx+1),w
	movwf	(?___lmul+1)
	movf	(_randx),w
	movwf	(?___lmul)

	movlw	041h
	movwf	3+(?___lmul)+04h
	movlw	0C6h
	movwf	2+(?___lmul)+04h
	movlw	04Eh
	movwf	1+(?___lmul)+04h
	movlw	06Dh
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(0+(?___lmul)),w
	addwf	(??_rand+0)+0,f
	movf	(1+(?___lmul)),w
	skipnc
	incfsz	(1+(?___lmul)),w
	goto	u760
	goto	u761
u760:
	addwf	(??_rand+0)+1,f
u761:
	movf	(2+(?___lmul)),w
	skipnc
	incfsz	(2+(?___lmul)),w
	goto	u762
	goto	u763
u762:
	addwf	(??_rand+0)+2,f
u763:
	movf	(3+(?___lmul)),w
	skipnc
	incf	(3+(?___lmul)),w
	addwf	(??_rand+0)+3,f
	movf	3+(??_rand+0)+0,w
	movwf	(_randx+3)
	movf	2+(??_rand+0)+0,w
	movwf	(_randx+2)
	movf	1+(??_rand+0)+0,w
	movwf	(_randx+1)
	movf	0+(??_rand+0)+0,w
	movwf	(_randx)

	movf	1+((((_randx)))+2),w
	movwf	(?_rand+1)
	movf	0+((((_randx)))+2),w
	movwf	(?_rand)
	
l1271:	
	bcf	(?_rand)+(15/8),(15)&7
	line	18
	
l428:	
	return
	opt stack 0
GLOBAL	__end_of_rand
	__end_of_rand:
;; =============== function _rand ends ============

	signat	_rand,90
	global	___awmod
psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    4[BANK0 ] int 
;;  dividend        2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    9[BANK0 ] unsigned char 
;;  counter         1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_random_szam
;; This function uses a non-reentrant model
;;
psect	text234
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l1391:	
	clrf	(___awmod@sign)
	line	9
	
l1393:	
	btfss	(___awmod@dividend+1),7
	goto	u951
	goto	u950
u951:
	goto	l1399
u950:
	line	10
	
l1395:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	
l1397:	
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	13
	
l1399:	
	btfss	(___awmod@divisor+1),7
	goto	u961
	goto	u960
u961:
	goto	l1403
u960:
	line	14
	
l1401:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	15
	
l1403:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u971
	goto	u970
u971:
	goto	l1419
u970:
	line	16
	
l1405:	
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	17
	goto	l1409
	line	18
	
l1407:	
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	19
	incf	(___awmod@counter),f
	line	17
	
l1409:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u981
	goto	u980
u981:
	goto	l1407
u980:
	line	22
	
l1411:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u995
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u995:
	skipc
	goto	u991
	goto	u990
u991:
	goto	l1415
u990:
	line	23
	
l1413:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	24
	
l1415:	
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	25
	
l1417:	
	decfsz	(___awmod@counter),f
	goto	u1001
	goto	u1000
u1001:
	goto	l1411
u1000:
	line	27
	
l1419:	
	movf	(___awmod@sign),w
	skipz
	goto	u1010
	goto	l1423
u1010:
	line	28
	
l1421:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	29
	
l1423:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	30
	
l655:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lmul
psect	text235,local,class=CODE,delta=2
global __ptext235
__ptext235:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    2[COMMON] unsigned long 
;;  multiplicand    4    6[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    0[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    2[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         8       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       0       0       0
;;      Totals:         8       4       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text235
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l1219:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l512:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u651
	goto	u650
u651:
	goto	l1223
u650:
	line	8
	
l1221:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u661
	addwf	(___lmul@product+1),f
u661:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u662
	addwf	(___lmul@product+2),f
u662:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u663
	addwf	(___lmul@product+3),f
u663:

	line	9
	
l1223:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l1225:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u671
	goto	u670
u671:
	goto	l512
u670:
	line	12
	
l1227:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l515:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_srand
psect	text236,local,class=CODE,delta=2
global __ptext236
__ptext236:

;; *************** function _srand *****************
;; Defined at:
;;		line 8 in file "../../common/rand.c"
;; Parameters:    Size  Location     Type
;;  x               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text236
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\rand.c"
	line	8
	global	__size_of_srand
	__size_of_srand	equ	__end_of_srand-_srand
	
_srand:	
	opt	stack 5
; Regs used in _srand: [wreg]
	line	9
	
l1215:	
	movf	(srand@x),w
	movwf	(_randx)
	movf	(srand@x+1),w
	movwf	((_randx))+1
	clrf	2+((_randx))
	clrf	3+((_randx))
	line	10
	
l1217:	
	clrf	(_randf)
	incf	(_randf),f
	line	11
	
l424:	
	return
	opt stack 0
GLOBAL	__end_of_srand
	__end_of_srand:
;; =============== function _srand ends ============

	signat	_srand,4216
	global	_SR74HC595
psect	text237,local,class=CODE,delta=2
global __ptext237
__ptext237:

;; *************** function _SR74HC595 *****************
;; Defined at:
;;		line 186 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;  ADAT            1    wreg     unsigned char 
;;  szin            2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  ADAT            1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;;  shift           1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text237
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
	line	186
	global	__size_of_SR74HC595
	__size_of_SR74HC595	equ	__end_of_SR74HC595-_SR74HC595
	
_SR74HC595:	
	opt	stack 7
; Regs used in _SR74HC595: [wreg+status,2+status,0]
;SR74HC595@ADAT stored from wreg
	line	188
	movwf	(SR74HC595@ADAT)
	
l1175:	
;main.c: 187: unsigned char i, shift;
;main.c: 188: if(szin==1){
	decf	(SR74HC595@szin),w
	iorwf	(SR74HC595@szin+1),w

	skipz
	goto	u561
	goto	u560
u561:
	goto	l1181
u560:
	line	189
	
l1177:	
;main.c: 189: RA1=0;
	bcf	(41/8),(41)&7
	line	190
	
l1179:	
;main.c: 190: shift = ADAT<<4;
	swapf	(SR74HC595@ADAT),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(SR74HC595@shift)
	line	191
;main.c: 191: }else if(szin==2){
	goto	l1193
	
l1181:	
		movf	(SR74HC595@szin),w
	xorlw	2
	iorwf	(SR74HC595@szin+1),w

	skipz
	goto	u571
	goto	u570
u571:
	goto	l1187
u570:
	line	192
	
l1183:	
;main.c: 192: RB7=0;
	bcf	(55/8),(55)&7
	goto	l1179
	line	194
	
l1187:	
		movf	(SR74HC595@szin),w
	xorlw	3
	iorwf	(SR74HC595@szin+1),w

	skipz
	goto	u581
	goto	u580
u581:
	goto	l1193
u580:
	line	195
	
l1189:	
;main.c: 195: RA1=0;
	bcf	(41/8),(41)&7
	line	196
	
l1191:	
;main.c: 196: shift = ADAT;
	movf	(SR74HC595@ADAT),w
	movwf	(SR74HC595@shift)
	line	199
	
l1193:	
;main.c: 197: }
;main.c: 199: for(i=0; i<8; i++){
	clrf	(SR74HC595@i)
	line	200
	
l1199:	
;main.c: 200: if((shift>>i)&1==1){
	movf	(SR74HC595@shift),w
	movwf	(??_SR74HC595+0)+0
	incf	(SR74HC595@i),w
	goto	u594
u595:
	clrc
	rrf	(??_SR74HC595+0)+0,f
u594:
	addlw	-1
	skipz
	goto	u595
	btfss	0+(??_SR74HC595+0)+0,(0)&7
	goto	u601
	goto	u600
u601:
	goto	l407
u600:
	line	201
	
l1201:	
;main.c: 201: RA0=1;
	bsf	(40/8),(40)&7
	line	202
;main.c: 202: RA3=1;
	bsf	(43/8),(43)&7
	line	203
;main.c: 203: RA3=0;
	bcf	(43/8),(43)&7
	line	204
;main.c: 204: }else{
	goto	l1203
	
l407:	
	line	205
;main.c: 205: RA0=0;
	bcf	(40/8),(40)&7
	line	206
;main.c: 206: RA3=1;
	bsf	(43/8),(43)&7
	line	207
;main.c: 207: RA3=0;
	bcf	(43/8),(43)&7
	line	199
	
l1203:	
	incf	(SR74HC595@i),f
	
l1205:	
	movlw	(08h)
	subwf	(SR74HC595@i),w
	skipc
	goto	u611
	goto	u610
u611:
	goto	l1199
u610:
	line	210
	
l1207:	
;main.c: 208: }
;main.c: 209: }
;main.c: 210: if(szin==1||szin==3){
	decf	(SR74HC595@szin),w
	iorwf	(SR74HC595@szin+1),w

	skipnz
	goto	u621
	goto	u620
u621:
	goto	l411
u620:
	
l1209:	
		movf	(SR74HC595@szin),w
	xorlw	3
	iorwf	(SR74HC595@szin+1),w

	skipz
	goto	u631
	goto	u630
u631:
	goto	l1211
u630:
	
l411:	
	line	211
;main.c: 211: RA1=1;
	bsf	(41/8),(41)&7
	line	212
;main.c: 212: }else if(szin==2){
	goto	l412
	
l1211:	
		movf	(SR74HC595@szin),w
	xorlw	2
	iorwf	(SR74HC595@szin+1),w

	skipz
	goto	u641
	goto	u640
u641:
	goto	l412
u640:
	line	213
	
l1213:	
;main.c: 213: RB7=1;
	bsf	(55/8),(55)&7
	line	215
	
l412:	
;main.c: 214: }
;main.c: 215: RA0=0;
	bcf	(40/8),(40)&7
	line	216
;main.c: 216: RA3=0;
	bcf	(43/8),(43)&7
	line	217
	
l414:	
	return
	opt stack 0
GLOBAL	__end_of_SR74HC595
	__end_of_SR74HC595:
;; =============== function _SR74HC595 ends ============

	signat	_SR74HC595,8312
	global	_init_setup
psect	text238,local,class=CODE,delta=2
global __ptext238
__ptext238:

;; *************** function _init_setup *****************
;; Defined at:
;;		line 164 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text238
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
	line	164
	global	__size_of_init_setup
	__size_of_init_setup	equ	__end_of_init_setup-_init_setup
	
_init_setup:	
	opt	stack 7
; Regs used in _init_setup: [wreg+status,2]
	line	165
	
l1153:	
;main.c: 165: CMCON = 7;
	movlw	(07h)
	movwf	(31)	;volatile
	line	166
	
l1155:	
;main.c: 166: CCP1CON = 0;
	clrf	(23)	;volatile
	line	167
	
l1157:	
;main.c: 167: INTCON = 0;
	clrf	(11)	;volatile
	line	168
	
l1159:	
;main.c: 168: PEIE = 1;
	bsf	(94/8),(94)&7
	line	169
	
l1161:	
;main.c: 169: GIE = 1;
	bsf	(95/8),(95)&7
	line	172
;main.c: 172: PR2 = 249;
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	173
;main.c: 173: T2CON = 5;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	174
	
l1163:	
;main.c: 174: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	175
	
l1165:	
;main.c: 175: PEIE = 1;
	bsf	(94/8),(94)&7
	line	176
	
l1167:	
;main.c: 176: GIE = 1;
	bsf	(95/8),(95)&7
	line	178
;main.c: 178: TRISA = 0x24;
	movlw	(024h)
	movwf	(133)^080h	;volatile
	line	179
	
l1169:	
;main.c: 179: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	181
	
l1171:	
;main.c: 181: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	182
	
l1173:	
;main.c: 182: RB7 = 1;
	bsf	(55/8),(55)&7
	line	183
	
l397:	
	return
	opt stack 0
GLOBAL	__end_of_init_setup
	__end_of_init_setup:
;; =============== function _init_setup ends ============

	signat	_init_setup,88
	global	_isr
psect	text239,local,class=CODE,delta=2
global __ptext239
__ptext239:

;; *************** function _isr *****************
;; Defined at:
;;		line 43 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  346[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text239
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\SMD_RGB_binaris_ora\main.c"
	line	43
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 4
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	pclath,w
	movwf	(??_isr+1)
	ljmp	_isr
psect	text239
	line	44
	
i1l1107:	
;main.c: 44: timer_count++;
	incf	(_timer_count),f
	skipnz
	incf	(_timer_count+1),f
	line	45
	
i1l1109:	
;main.c: 45: if(timer_count == 1000){
		movf	(_timer_count+1),w
	xorlw	3
	movlw	232
	skipnz
	xorwf	(_timer_count),w

	skipz
	goto	u48_21
	goto	u48_20
u48_21:
	goto	i1l1151
u48_20:
	line	46
	
i1l1111:	
;main.c: 46: timer_count = 0;
	clrf	(_timer_count)
	clrf	(_timer_count+1)
	line	47
	
i1l1113:	
;main.c: 47: if(mp_1<9){
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_mp_1),w
	skipnc
	goto	u49_21
	goto	u49_20
u49_21:
	goto	i1l1117
u49_20:
	line	48
	
i1l1115:	
;main.c: 48: mp_1++;
	incf	(_mp_1),f
	line	49
;main.c: 49: }else{
	goto	i1l1145
	line	50
	
i1l1117:	
;main.c: 50: mp_1 = 0;
	clrf	(_mp_1)
	line	52
	
i1l1119:	
;main.c: 52: if(mp_10<5){
	movlw	(05h)
	subwf	(_mp_10),w
	skipnc
	goto	u50_21
	goto	u50_20
u50_21:
	goto	i1l1123
u50_20:
	line	53
	
i1l1121:	
;main.c: 53: mp_10++;
	incf	(_mp_10),f
	line	54
;main.c: 54: }else{
	goto	i1l1145
	line	55
	
i1l1123:	
;main.c: 55: mp_10 = 0;
	clrf	(_mp_10)
	line	57
	
i1l1125:	
;main.c: 57: if(perc_1<9){
	movlw	(09h)
	subwf	(_perc_1),w
	skipnc
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l1129
u51_20:
	line	58
	
i1l1127:	
;main.c: 58: perc_1++;
	incf	(_perc_1),f
	line	59
;main.c: 59: }else{
	goto	i1l1145
	line	60
	
i1l1129:	
;main.c: 60: perc_1 = 0;
	clrf	(_perc_1)
	line	62
	
i1l1131:	
;main.c: 62: if(perc_10<5){
	movlw	(05h)
	subwf	(_perc_10),w
	skipnc
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l1135
u52_20:
	line	63
	
i1l1133:	
;main.c: 63: perc_10++;
	incf	(_perc_10),f
	line	64
;main.c: 64: }else{
	goto	i1l1145
	line	65
	
i1l1135:	
;main.c: 65: perc_10 = 0;
	clrf	(_perc_10)
	line	67
	
i1l1137:	
;main.c: 67: if(ora_1<9){
	movlw	(09h)
	subwf	(_ora_1),w
	skipnc
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l1141
u53_20:
	line	68
	
i1l1139:	
;main.c: 68: ora_1++;
	incf	(_ora_1),f
	line	69
;main.c: 69: }else{
	goto	i1l1145
	line	70
	
i1l1141:	
;main.c: 70: ora_1 = 0;
	clrf	(_ora_1)
	line	71
	
i1l1143:	
;main.c: 71: ora_10++;
	incf	(_ora_10),f
	line	77
	
i1l1145:	
;main.c: 72: }
;main.c: 73: }
;main.c: 74: }
;main.c: 75: }
;main.c: 76: }
;main.c: 77: if(ora_10==2 & ora_1==4){
	movf	(_ora_10),w
	xorlw	02h
	skipz
	goto	u54_21
	goto	u54_20
u54_21:
	goto	i1l1151
u54_20:
	
i1l1147:	
	movf	(_ora_1),w
	xorlw	04h
	skipz
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l1151
u55_20:
	line	78
	
i1l1149:	
;main.c: 78: ora_10 = 0;
	clrf	(_ora_10)
	line	79
;main.c: 79: ora_1 = 0;
	clrf	(_ora_1)
	line	80
;main.c: 80: perc_10 = 0;
	clrf	(_perc_10)
	line	81
;main.c: 81: perc_1 = 0;
	clrf	(_perc_1)
	line	82
;main.c: 82: mp_10 = 0;
	clrf	(_mp_10)
	line	83
;main.c: 83: mp_1 = 0;
	clrf	(_mp_1)
	line	86
	
i1l1151:	
;main.c: 84: }
;main.c: 85: }
;main.c: 86: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	87
	
i1l359:	
	movf	(??_isr+1),w
	movwf	pclath
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
psect	text240,local,class=CODE,delta=2
global __ptext240
__ptext240:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
