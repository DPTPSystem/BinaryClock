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
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\header.h"
	psect config,class=CONFIG,delta=2 ;#
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\header.h"
	dw 0x3FFF & 0x3FFF & 0x3F7F & 0x3FBF & 0x3FDF & 0x3FF7 & 0x3FFB & 0x3FED ;#
	FNCALL	_main,_init_setup
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_timer_count
	global	_mp_1
	global	_mp_10
	global	_ora_1
	global	_ora_10
	global	_perc_1
	global	_perc_10
	global	_CCP1CON
psect	text42,local,class=CODE,delta=2
global __ptext42
__ptext42:
_CCP1CON	set	23
	global	_CMCON
_CMCON	set	31
	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_T2CON
_T2CON	set	18
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB6
_RB6	set	54
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
	file	"binaris_ora.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timer_count:
       ds      2

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

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
	clrf	((__pbssCOMMON)+6)&07Fh
	clrf	((__pbssCOMMON)+7)&07Fh
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
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     135
;;                                              2 COMMON     2     2      0
;;                         _init_setup
;; ---------------------------------------------------------------------------------
;; (1) _init_setup                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_setup
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       0       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0       C       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK2            30      0       0       8        0.0%
;;BANK2               30      0       0       9        0.0%
;;DATA                 0      0       D      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 72 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    3[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init_setup
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
	line	72
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	75
	
l831:	
;main.c: 73: unsigned char i;
;main.c: 75: init_setup();
	fcall	_init_setup
	line	79
	
l833:	
;main.c: 79: if(RB6==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u91
	goto	u90
u91:
	goto	l357
u90:
	line	80
	
l358:	
	btfsc	(54/8),(54)&7
	goto	u101
	goto	u100
u101:
	goto	l358
u100:
	line	81
	
l837:	
;main.c: 81: perc_1++;
	incf	(_perc_1),f
	line	82
	
l839:	
;main.c: 82: if(perc_1==10){
	movf	(_perc_1),w
	xorlw	0Ah
	skipz
	goto	u111
	goto	u110
u111:
	goto	l363
u110:
	line	83
	
l841:	
;main.c: 83: perc_1 = 0;
	clrf	(_perc_1)
	line	84
	
l843:	
;main.c: 84: perc_10++;
	incf	(_perc_10),f
	line	85
	
l845:	
;main.c: 85: if(perc_10==6){
	movf	(_perc_10),w
	xorlw	06h
	skipz
	goto	u121
	goto	u120
u121:
	goto	l363
u120:
	line	86
	
l847:	
;main.c: 86: perc_10 = 0;
	clrf	(_perc_10)
	goto	l363
	line	89
	
l357:	
	btfss	(55/8),(55)&7
	goto	u131
	goto	u130
u131:
	goto	l363
u130:
	line	90
	
l365:	
	btfsc	(55/8),(55)&7
	goto	u141
	goto	u140
u141:
	goto	l365
u140:
	line	91
	
l851:	
;main.c: 91: ora_1++;
	incf	(_ora_1),f
	line	92
	
l853:	
;main.c: 92: if(ora_1==10){
	movf	(_ora_1),w
	xorlw	0Ah
	skipz
	goto	u151
	goto	u150
u151:
	goto	l363
u150:
	line	93
	
l855:	
;main.c: 93: ora_1 = 0;
	clrf	(_ora_1)
	line	94
	
l857:	
;main.c: 94: ora_10++;
	incf	(_ora_10),f
	line	95
	
l859:	
;main.c: 95: if(ora_10==2 & ora_1==4){
	movf	(_ora_10),w
	xorlw	02h
	skipz
	goto	u161
	goto	u160
u161:
	goto	l363
u160:
	
l861:	
	movf	(_ora_1),w
	xorlw	04h
	skipz
	goto	u171
	goto	u170
u171:
	goto	l363
u170:
	line	96
	
l863:	
;main.c: 96: ora_1 = 0;
	clrf	(_ora_1)
	line	97
;main.c: 97: ora_10 = 0;
	clrf	(_ora_10)
	line	102
	
l363:	
;main.c: 98: }
;main.c: 99: }
;main.c: 100: }
;main.c: 102: for(i=0; i<6; i++){
	clrf	(main@i)
	
l865:	
	movlw	(06h)
	subwf	(main@i),w
	skipc
	goto	u181
	goto	u180
u181:
	goto	l869
u180:
	goto	l915
	line	103
	
l869:	
;main.c: 103: PORTB = (0x01<<i);
	movlw	(01h)
	movwf	(??_main+0)+0
	incf	(main@i),w
	goto	u194
u195:
	clrc
	rlf	(??_main+0)+0,f
u194:
	addlw	-1
	skipz
	goto	u195
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	104
	
l871:	
;main.c: 104: if(i==0){
	movf	(main@i),f
	skipz
	goto	u201
	goto	u200
u201:
	goto	l877
u200:
	line	105
	
l873:	
;main.c: 105: PORTA = ora_10;
	movf	(_ora_10),w
	movwf	(5)	;volatile
	line	106
;main.c: 106: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u267:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u267
	nop2	;nop
	clrwdt
opt asmopt_on

	line	107
	
l875:	
;main.c: 107: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	108
;main.c: 108: }else if(i==1){
	goto	l907
	
l877:	
	decf	(main@i),w
	skipz
	goto	u211
	goto	u210
u211:
	goto	l883
u210:
	line	109
	
l879:	
;main.c: 109: PORTA = ora_1;
	movf	(_ora_1),w
	movwf	(5)	;volatile
	line	110
;main.c: 110: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u277:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u277
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l875
	line	112
	
l883:	
	movf	(main@i),w
	xorlw	02h
	skipz
	goto	u221
	goto	u220
u221:
	goto	l889
u220:
	line	113
	
l885:	
;main.c: 113: PORTA = perc_10;
	movf	(_perc_10),w
	movwf	(5)	;volatile
	line	114
;main.c: 114: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u287:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u287
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l875
	line	116
	
l889:	
	movf	(main@i),w
	xorlw	03h
	skipz
	goto	u231
	goto	u230
u231:
	goto	l895
u230:
	line	117
	
l891:	
;main.c: 117: PORTA = perc_1;
	movf	(_perc_1),w
	movwf	(5)	;volatile
	line	118
;main.c: 118: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u297:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u297
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l875
	line	120
	
l895:	
	movf	(main@i),w
	xorlw	04h
	skipz
	goto	u241
	goto	u240
u241:
	goto	l901
u240:
	line	121
	
l897:	
;main.c: 121: PORTA = mp_10;
	movf	(_mp_10),w
	movwf	(5)	;volatile
	line	122
;main.c: 122: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u307:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u307
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l875
	line	124
	
l901:	
	movf	(main@i),w
	xorlw	05h
	skipz
	goto	u251
	goto	u250
u251:
	goto	l377
u250:
	line	125
	
l903:	
;main.c: 125: PORTA = mp_1;
	movf	(_mp_1),w
	movwf	(5)	;volatile
	line	126
;main.c: 126: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u317:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u317
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l875
	line	130
	
l377:	
	
l907:	
;main.c: 128: }
;main.c: 130: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u327:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u327
	nop2	;nop
	clrwdt
opt asmopt_on

	line	131
;main.c: 131: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	132
	
l909:	
;main.c: 132: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u337:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u337
	nop2	;nop
	clrwdt
opt asmopt_on

	line	102
	
l911:	
	incf	(main@i),f
	goto	l865
	line	136
	
l915:	
;main.c: 134: }
;main.c: 136: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u347:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u347
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l833
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	139
	signat	_main,88
	global	_init_setup
psect	text43,local,class=CODE,delta=2
global __ptext43
__ptext43:

;; *************** function _init_setup *****************
;; Defined at:
;;		line 142 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
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
psect	text43
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
	line	142
	global	__size_of_init_setup
	__size_of_init_setup	equ	__end_of_init_setup-_init_setup
	
_init_setup:	
	opt	stack 7
; Regs used in _init_setup: [wreg+status,2]
	line	143
	
l807:	
;main.c: 143: CMCON = 7;
	movlw	(07h)
	movwf	(31)	;volatile
	line	144
	
l809:	
;main.c: 144: CCP1CON = 0;
	clrf	(23)	;volatile
	line	145
	
l811:	
;main.c: 145: INTCON = 0;
	clrf	(11)	;volatile
	line	146
	
l813:	
;main.c: 146: PEIE = 1;
	bsf	(94/8),(94)&7
	line	147
	
l815:	
;main.c: 147: GIE = 1;
	bsf	(95/8),(95)&7
	line	150
;main.c: 150: PR2 = 249;
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	151
;main.c: 151: T2CON = 5;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	152
	
l817:	
;main.c: 152: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	153
	
l819:	
;main.c: 153: PEIE = 1;
	bsf	(94/8),(94)&7
	line	154
	
l821:	
;main.c: 154: GIE = 1;
	bsf	(95/8),(95)&7
	line	156
	
l823:	
;main.c: 156: TRISA = 0;
	clrf	(133)^080h	;volatile
	line	157
	
l825:	
;main.c: 157: TRISB = 0b11000000;
	movlw	(0C0h)
	movwf	(134)^080h	;volatile
	line	160
	
l827:	
;main.c: 160: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	161
	
l829:	
;main.c: 161: RB7 = 0;
	bcf	(55/8),(55)&7
	line	162
	
l388:	
	return
	opt stack 0
GLOBAL	__end_of_init_setup
	__end_of_init_setup:
;; =============== function _init_setup ends ============

	signat	_init_setup,88
	global	_isr
psect	text44,local,class=CODE,delta=2
global __ptext44
__ptext44:

;; *************** function _isr *****************
;; Defined at:
;;		line 26 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  340[COMMON] int 
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
psect	text44
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P16F628\binaris_ora\main.c"
	line	26
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 6
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
psect	text44
	line	27
	
i1l761:	
;main.c: 27: timer_count++;
	incf	(_timer_count),f
	skipnz
	incf	(_timer_count+1),f
	line	28
	
i1l763:	
;main.c: 28: if(timer_count == 1000){
		movf	(_timer_count+1),w
	xorlw	3
	movlw	232
	skipnz
	xorwf	(_timer_count),w

	skipz
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l805
u1_20:
	line	29
	
i1l765:	
;main.c: 29: timer_count = 0;
	clrf	(_timer_count)
	clrf	(_timer_count+1)
	line	30
	
i1l767:	
;main.c: 30: if(mp_1<9){
	movlw	(09h)
	subwf	(_mp_1),w
	skipnc
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l771
u2_20:
	line	31
	
i1l769:	
;main.c: 31: mp_1++;
	incf	(_mp_1),f
	line	32
;main.c: 32: }else{
	goto	i1l799
	line	33
	
i1l771:	
;main.c: 33: mp_1 = 0;
	clrf	(_mp_1)
	line	35
	
i1l773:	
;main.c: 35: if(mp_10<5){
	movlw	(05h)
	subwf	(_mp_10),w
	skipnc
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l777
u3_20:
	line	36
	
i1l775:	
;main.c: 36: mp_10++;
	incf	(_mp_10),f
	line	37
;main.c: 37: }else{
	goto	i1l799
	line	38
	
i1l777:	
;main.c: 38: mp_10 = 0;
	clrf	(_mp_10)
	line	40
	
i1l779:	
;main.c: 40: if(perc_1<9){
	movlw	(09h)
	subwf	(_perc_1),w
	skipnc
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l783
u4_20:
	line	41
	
i1l781:	
;main.c: 41: perc_1++;
	incf	(_perc_1),f
	line	42
;main.c: 42: }else{
	goto	i1l799
	line	43
	
i1l783:	
;main.c: 43: perc_1 = 0;
	clrf	(_perc_1)
	line	45
	
i1l785:	
;main.c: 45: if(perc_10<5){
	movlw	(05h)
	subwf	(_perc_10),w
	skipnc
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l789
u5_20:
	line	46
	
i1l787:	
;main.c: 46: perc_10++;
	incf	(_perc_10),f
	line	47
;main.c: 47: }else{
	goto	i1l799
	line	48
	
i1l789:	
;main.c: 48: perc_10 = 0;
	clrf	(_perc_10)
	line	50
	
i1l791:	
;main.c: 50: if(ora_1<9){
	movlw	(09h)
	subwf	(_ora_1),w
	skipnc
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l795
u6_20:
	line	51
	
i1l793:	
;main.c: 51: ora_1++;
	incf	(_ora_1),f
	line	52
;main.c: 52: }else{
	goto	i1l799
	line	53
	
i1l795:	
;main.c: 53: ora_1 = 0;
	clrf	(_ora_1)
	line	54
	
i1l797:	
;main.c: 54: ora_10++;
	incf	(_ora_10),f
	line	60
	
i1l799:	
;main.c: 55: }
;main.c: 56: }
;main.c: 57: }
;main.c: 58: }
;main.c: 59: }
;main.c: 60: if(ora_10==2 & ora_1==4){
	movf	(_ora_10),w
	xorlw	02h
	skipz
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l805
u7_20:
	
i1l801:	
	movf	(_ora_1),w
	xorlw	04h
	skipz
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l805
u8_20:
	line	61
	
i1l803:	
;main.c: 61: ora_10 = 0;
	clrf	(_ora_10)
	line	62
;main.c: 62: ora_1 = 0;
	clrf	(_ora_1)
	line	63
;main.c: 63: perc_10 = 0;
	clrf	(_perc_10)
	line	64
;main.c: 64: perc_1 = 0;
	clrf	(_perc_1)
	line	65
;main.c: 65: mp_10 = 0;
	clrf	(_mp_10)
	line	66
;main.c: 66: mp_1 = 0;
	clrf	(_mp_1)
	line	69
	
i1l805:	
;main.c: 67: }
;main.c: 68: }
;main.c: 69: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	70
	
i1l353:	
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
psect	text45,local,class=CODE,delta=2
global __ptext45
__ptext45:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
