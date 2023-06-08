/************************************************************
+ DPTP System, SMD RGB Bin�ris �ra							+
+ 2015.04.11, Szombat. PIC16F628							+
+ don_peter@freemail.hu										+
************************************************************/
#include <htc.h>				// 10,12,16-os PIC definici�k
#include <stdio.h>				// Alap f�ggv�nyek
#include <stdlib.h>				// Alap f�ggv�nyek
#include "header.h"				// Configur�ci�s be�ll�t�sok

// Defin�ci�k
#define OSZLOP		PORTB		// Tranzisztorok (pnp)
#define SR_ADAT		RA0			// Shift adat
#define SR_CLK		RA3			// Shift CLK
#define SR_CS		RA1			// Shift 1-es enabled
#define SR_CS2		RB7			// Shift 2-es enabled

/************************************************************
+ 1-es shiftregiszter (74HC595) 0-2-ig sz�n,				+
+ 1-es shiftregiszter 3-5-ig sz�n,							+
+ 2-es shiftregiszter 0-2-ig sz�n							+
************************************************************/

unsigned char ora_10  = 0;
unsigned char ora_1   = 0;
unsigned char perc_10 = 0;
unsigned char perc_1  = 0;
unsigned char mp_10	  = 0;
unsigned char mp_1    = 0;

//unsigned char ido_buffer[9] = "00:00:00";
unsigned short timer_count = 0;

//Protot�pusok
void init_setup(void);
void main(void);
void SR74HC595(unsigned char ADAT, unsigned szin);
unsigned int random_szam(unsigned int mettol, unsigned int meddig);

// ---------------------------- //
//  Interrupt service routine   //
// ---------------------------- //
extern interrupt isr(void) {
        timer_count++;
        if(timer_count == 1000){
			timer_count = 0;
			if(mp_1<9){							// *1 M�sodperc 0-9 k�zt
				mp_1++;							// *1 M�sodpercet emelj�k 1-el
			}else{ 
				mp_1 = 0;						// *1 M�sodpercet lenull�zzuk
				
				if(mp_10<5){					// *10 M�sodperc 1-5 k�zt
					mp_10++;					// *10 M�sodpercet emelj�k 1-el
				}else{
					mp_10 = 0;					// *10 M�sodpercet lenull�zzuk
					
					if(perc_1<9){				// *1 Perc 1-9 k�zt
						perc_1++;				// *1 Percet emelj�k 1-el
					}else{
						perc_1 = 0;				// *1 Percet lenull�zzuk
						
						if(perc_10<5){			// *10 Perc 1-5 k�zt
							perc_10++;			// *10 Percet emelj�k 1-el
						}else{
							perc_10 = 0;		// *10 Percet lenull�zzuk
							
							if(ora_1<9){		// *1 �ra 1-9 k�zt
								ora_1++;		// *1 �r�t emelj�k 1-el
							}else{
								ora_1 = 0;		// *1 �r�t lenull�zzuk
								ora_10++;		// *10 �r�t emelj�k 1-el
							}
						}
					}
				}
			}
			if(ora_10==2 & ora_1==4){			// 24:00:00-kor a teljes �r�t null�zzuk 
				ora_10  = 0;
				ora_1   = 0;
				perc_10 = 0;
				perc_1  = 0;
				mp_10	= 0;
				mp_1    = 0;
			}
        }
        TMR2IF = 0;
}

void main(void){
	unsigned char i, randszam;

	init_setup();							// Alapbe�ll�t�sok

	while(1){
		
		if(RA2==0){							// Perc emel�se
			while(!RA2);					// V�rakoz�s felenged�sre
			perc_1++;
			if(perc_1==10){
				perc_1 = 0;
				perc_10++;
				if(perc_10==6){
					perc_10 = 0;
				}
			}
		}else if(RA5==0){					// �ra emel�se
			while(!RA5);					// V�rakoz�s felenged�sre
			ora_1++;
			if(ora_1==10){
				ora_1 = 0;
				ora_10++;
				if(ora_10==2 & ora_1==4){
					ora_1 = 0;
					ora_10 = 0;
				}
			}
		}
		
		if(mp_1==0){ 
			randszam = random_szam(1,3);	// V�letlen sz�mot k�r�nk be
		}
		OSZLOP = 0xFE;
		for(i=0; i<6; i++){
		
			OSZLOP = i==0 ? OSZLOP : (OSZLOP<<1)|1; 	// L�ptetj�k az oszlopok szintj�t
			if(i==0){// 0,8,4,C,2,A,6,E,1,9
				SR74HC595((mp_1>>3)|((mp_1>>1)&2)|((mp_1<<1)&4)|((mp_1 << 3)&8), randszam);		// Sor bekapcsol�sa
				__delay_ms(1);			// K�sleltet�nk
				SR74HC595(0,randszam);			// Alaphelyzetre �ll�tjuk a sorok szintj�t
			}else if(i==1){
				SR74HC595((mp_10>>3)|((mp_10>>1)&2)|((mp_10<<1)&4)|((mp_10<<3)&8),randszam);
				__delay_ms(1);
				SR74HC595(0,randszam);
			}else if(i==2){
				SR74HC595((perc_1>>3)|((perc_1>>1)&2)|((perc_1<<1)&4)|((perc_1<<3)&8),randszam);
				__delay_ms(1);
				SR74HC595(0,randszam);
			}else if(i==3){
				SR74HC595((perc_10>>3)|((perc_10>>1)&2)|((perc_10<<1)&4)|((perc_10<<3)&8),randszam);
				__delay_ms(1);
				SR74HC595(0,randszam);
			}else if(i==4){
				SR74HC595((ora_1>>3)|((ora_1>>1)&2)|((ora_1<<1)&4)|((ora_1<<3)&8),randszam);
				__delay_ms(1);
				SR74HC595(0,randszam);
			}else if(i==5){
				SR74HC595((ora_10>>3)|((ora_10>>1)&2)|((ora_10<<1)&4)|((ora_10<<3)&8),randszam);
				__delay_ms(1);
				SR74HC595(0,randszam);
			}
		
			//__delay_ms(1);				// K�sleltet�s
			//OSZLOP = 0xFF;				// Alaphelyzetre �ll�tjuk az oszlopok szintj�t
			__delay_ms(1);				// K�sleltet�s
		
		}
		
		__delay_ms(1);
	}//while
	
}//main

//Be�ll�t�sok
void init_setup(void){
	CMCON = 7;				// Comparator kikapcsolva
	CCP1CON = 0;			// Capt/Comp/PWM kikapcsolva	
	INTCON = 0;				// �sszes interrupt l�b kikapcsolva
	PEIE   = 1;				// Peripheral interrupt enged�lyez�se
	GIE    = 1;				// Glob�lis interrupt enged�lyez�se
	
	//Timer2 be�ll�t�sa
	PR2 = 249;
    T2CON = 5;
    TMR2IE = 1;
    PEIE = 1;
    GIE = 1;
    
	TRISA = 0x24;			// A2 �s A5 bemenet
	TRISB = 0;
	
	SR_CS = 1;				// 1-es Shifregiszter t�lt�sa
	SR_CS2 = 1;				// 2-es Shifregiszter t�lt�sa
}

// Shift regiszter adatkik�ld�s
void SR74HC595(unsigned char ADAT, unsigned szin){
	unsigned char i, shift;
	if(szin==1){			// Piros
		SR_CS=0;			// Enged�lyez�s
		shift = ADAT<<4;	// Vissza 4 bitet
	}else if(szin==2){		// Z�ld
		SR_CS2=0;			// Enged�lyez�s
		shift = ADAT<<4;	// Vissza 4 bitet
	}else if(szin==3){		// K�k
		SR_CS=0;			// Enged�lyez�s
		shift = ADAT;
	}

	for(i=0; i<8; i++){	// L�ptet�nk
		if((shift>>i)&1==1){
			SR_ADAT=1;	// Adat
			SR_CLK=1;	// �rajel
			SR_CLK=0;	
		}else{
			SR_ADAT=0;	// Nincs adat
			SR_CLK=1;	// �rajel
			SR_CLK=0;
		}
	}
	if(szin==1||szin==3){
		SR_CS=1;			//T�lt�s
	}else if(szin==2){
		SR_CS2=1;			//T�lt�s
	}	
	SR_ADAT=0;
	SR_CLK=0;
}

// Random sz�m gener�l�sa meghat�rozott sz�mok k�zt
unsigned int random_szam(unsigned int mettol, unsigned int meddig){
    return rand() % (meddig-mettol+1) + mettol;
}
