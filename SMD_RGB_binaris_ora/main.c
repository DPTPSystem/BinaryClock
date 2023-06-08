/************************************************************
+ DPTP System, SMD RGB Bináris Óra							+
+ 2015.04.11, Szombat. PIC16F628							+
+ don_peter@freemail.hu										+
************************************************************/
#include <htc.h>				// 10,12,16-os PIC definiciók
#include <stdio.h>				// Alap függvények
#include <stdlib.h>				// Alap függvények
#include "header.h"				// Configurációs beállítások

// Definíciók
#define OSZLOP		PORTB		// Tranzisztorok (pnp)
#define SR_ADAT		RA0			// Shift adat
#define SR_CLK		RA3			// Shift CLK
#define SR_CS		RA1			// Shift 1-es enabled
#define SR_CS2		RB7			// Shift 2-es enabled

/************************************************************
+ 1-es shiftregiszter (74HC595) 0-2-ig szín,				+
+ 1-es shiftregiszter 3-5-ig szín,							+
+ 2-es shiftregiszter 0-2-ig szín							+
************************************************************/

unsigned char ora_10  = 0;
unsigned char ora_1   = 0;
unsigned char perc_10 = 0;
unsigned char perc_1  = 0;
unsigned char mp_10	  = 0;
unsigned char mp_1    = 0;

//unsigned char ido_buffer[9] = "00:00:00";
unsigned short timer_count = 0;

//Prototípusok
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
			if(mp_1<9){							// *1 Másodperc 0-9 közt
				mp_1++;							// *1 Másodpercet emeljük 1-el
			}else{ 
				mp_1 = 0;						// *1 Másodpercet lenullázzuk
				
				if(mp_10<5){					// *10 Másodperc 1-5 közt
					mp_10++;					// *10 Másodpercet emeljük 1-el
				}else{
					mp_10 = 0;					// *10 Másodpercet lenullázzuk
					
					if(perc_1<9){				// *1 Perc 1-9 közt
						perc_1++;				// *1 Percet emeljük 1-el
					}else{
						perc_1 = 0;				// *1 Percet lenullázzuk
						
						if(perc_10<5){			// *10 Perc 1-5 közt
							perc_10++;			// *10 Percet emeljük 1-el
						}else{
							perc_10 = 0;		// *10 Percet lenullázzuk
							
							if(ora_1<9){		// *1 Óra 1-9 közt
								ora_1++;		// *1 Órát emeljük 1-el
							}else{
								ora_1 = 0;		// *1 Órát lenullázzuk
								ora_10++;		// *10 Órát emeljük 1-el
							}
						}
					}
				}
			}
			if(ora_10==2 & ora_1==4){			// 24:00:00-kor a teljes órát nullázzuk 
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

	init_setup();							// Alapbeállítások

	while(1){
		
		if(RA2==0){							// Perc emelése
			while(!RA2);					// Várakozás felengedésre
			perc_1++;
			if(perc_1==10){
				perc_1 = 0;
				perc_10++;
				if(perc_10==6){
					perc_10 = 0;
				}
			}
		}else if(RA5==0){					// Óra emelése
			while(!RA5);					// Várakozás felengedésre
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
			randszam = random_szam(1,3);	// Véletlen számot kérünk be
		}
		OSZLOP = 0xFE;
		for(i=0; i<6; i++){
		
			OSZLOP = i==0 ? OSZLOP : (OSZLOP<<1)|1; 	// Léptetjük az oszlopok szintjét
			if(i==0){// 0,8,4,C,2,A,6,E,1,9
				SR74HC595((mp_1>>3)|((mp_1>>1)&2)|((mp_1<<1)&4)|((mp_1 << 3)&8), randszam);		// Sor bekapcsolása
				__delay_ms(1);			// Késleltetünk
				SR74HC595(0,randszam);			// Alaphelyzetre állítjuk a sorok szintjét
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
		
			//__delay_ms(1);				// Késleltetés
			//OSZLOP = 0xFF;				// Alaphelyzetre állítjuk az oszlopok szintjét
			__delay_ms(1);				// Késleltetés
		
		}
		
		__delay_ms(1);
	}//while
	
}//main

//Beállítások
void init_setup(void){
	CMCON = 7;				// Comparator kikapcsolva
	CCP1CON = 0;			// Capt/Comp/PWM kikapcsolva	
	INTCON = 0;				// Összes interrupt láb kikapcsolva
	PEIE   = 1;				// Peripheral interrupt engedélyezése
	GIE    = 1;				// Globális interrupt engedélyezése
	
	//Timer2 beállítása
	PR2 = 249;
    T2CON = 5;
    TMR2IE = 1;
    PEIE = 1;
    GIE = 1;
    
	TRISA = 0x24;			// A2 és A5 bemenet
	TRISB = 0;
	
	SR_CS = 1;				// 1-es Shifregiszter tíltása
	SR_CS2 = 1;				// 2-es Shifregiszter tíltása
}

// Shift regiszter adatkiküldés
void SR74HC595(unsigned char ADAT, unsigned szin){
	unsigned char i, shift;
	if(szin==1){			// Piros
		SR_CS=0;			// Engedélyezés
		shift = ADAT<<4;	// Vissza 4 bitet
	}else if(szin==2){		// Zöld
		SR_CS2=0;			// Engedélyezés
		shift = ADAT<<4;	// Vissza 4 bitet
	}else if(szin==3){		// Kék
		SR_CS=0;			// Engedélyezés
		shift = ADAT;
	}

	for(i=0; i<8; i++){	// Léptetünk
		if((shift>>i)&1==1){
			SR_ADAT=1;	// Adat
			SR_CLK=1;	// Órajel
			SR_CLK=0;	
		}else{
			SR_ADAT=0;	// Nincs adat
			SR_CLK=1;	// Órajel
			SR_CLK=0;
		}
	}
	if(szin==1||szin==3){
		SR_CS=1;			//Tíltás
	}else if(szin==2){
		SR_CS2=1;			//Tíltás
	}	
	SR_ADAT=0;
	SR_CLK=0;
}

// Random szám generálása meghatározott számok közt
unsigned int random_szam(unsigned int mettol, unsigned int meddig){
    return rand() % (meddig-mettol+1) + mettol;
}
