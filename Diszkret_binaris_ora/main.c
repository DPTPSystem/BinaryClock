#include <htc.h>			// 10,12,16-os PIC definiciók
#include <stdio.h>			// Alap függvények
#include <stdlib.h>			// Alap függvények
#include "header.h"			// Configurációs beállítások

// Definíciók
#define OSZLOP	PORTB		// Tranzisztorok
#define SOROK	PORTA		// LED meghajtás

unsigned char ora_10  = 0;
unsigned char ora_1   = 0;
unsigned char perc_10 = 0;
unsigned char perc_1  = 0;
unsigned char mp_10	  = 0;
unsigned char mp_1    = 0;

unsigned short timer_count = 0;

//Prototípusok
void init_setup(void);
void main(void);

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
	unsigned char i;
	
	init_setup();			// Alapbeállítások

	while(1){
		
		if(RB6==1){			// Perc emelése
			while(RB6);		// Várakozás felengedésre
			perc_1++;
			if(perc_1==10){
				perc_1 = 0;
				perc_10++;
				if(perc_10==6){
					perc_10 = 0;
				}
			}
		}else if(RB7==1){	// Óra emelése
			while(RB7);		// Várakozás felengedésre
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
		
		for(i=0; i<6; i++){
			OSZLOP = (0x01<<i); 	// Léptetjük az oszlopok szintjét
			if(i==0){
				SOROK = ora_10;		// Sor bekapcsolása
				__delay_ms(1);		// Késleltetünk
				SOROK = 0;			// Alaphelyzetre állítjuk a sorok szintjét
			}else if(i==1){
				SOROK = ora_1;
				__delay_ms(1);
				SOROK = 0;
			}else if(i==2){
				SOROK = perc_10;
				__delay_ms(1);
				SOROK = 0;
			}else if(i==3){
				SOROK = perc_1;
				__delay_ms(1);
				SOROK = 0;
			}else if(i==4){
				SOROK = mp_10;
				__delay_ms(1);
				SOROK = 0;
			}else if(i==5){
				SOROK = mp_1;
				__delay_ms(1);
				SOROK = 0;
			}
		
			__delay_ms(1);		// Késleltetés
			OSZLOP = 0;			// Alaphelyzetre állítjuk az oszlopok szintjét
			__delay_ms(1);		// Késleltetés
		
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
    
	TRISA = 0;
	TRISB = 0b11000000;
	
	// Állító gombok
	RB6 = 0;				// Perc
	RB7 = 0;				// Óra
}
