#include <htc.h>			// 10,12,16-os PIC definici�k
#include <stdio.h>			// Alap f�ggv�nyek
#include <stdlib.h>			// Alap f�ggv�nyek
#include "header.h"			// Configur�ci�s be�ll�t�sok

// Defin�ci�k
#define OSZLOP	PORTB		// Tranzisztorok
#define SOROK	PORTA		// LED meghajt�s

unsigned char ora_10  = 0;
unsigned char ora_1   = 0;
unsigned char perc_10 = 0;
unsigned char perc_1  = 0;
unsigned char mp_10	  = 0;
unsigned char mp_1    = 0;

unsigned short timer_count = 0;

//Protot�pusok
void init_setup(void);
void main(void);

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
	unsigned char i;
	
	init_setup();			// Alapbe�ll�t�sok

	while(1){
		
		if(RB6==1){			// Perc emel�se
			while(RB6);		// V�rakoz�s felenged�sre
			perc_1++;
			if(perc_1==10){
				perc_1 = 0;
				perc_10++;
				if(perc_10==6){
					perc_10 = 0;
				}
			}
		}else if(RB7==1){	// �ra emel�se
			while(RB7);		// V�rakoz�s felenged�sre
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
			OSZLOP = (0x01<<i); 	// L�ptetj�k az oszlopok szintj�t
			if(i==0){
				SOROK = ora_10;		// Sor bekapcsol�sa
				__delay_ms(1);		// K�sleltet�nk
				SOROK = 0;			// Alaphelyzetre �ll�tjuk a sorok szintj�t
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
		
			__delay_ms(1);		// K�sleltet�s
			OSZLOP = 0;			// Alaphelyzetre �ll�tjuk az oszlopok szintj�t
			__delay_ms(1);		// K�sleltet�s
		
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
    
	TRISA = 0;
	TRISB = 0b11000000;
	
	// �ll�t� gombok
	RB6 = 0;				// Perc
	RB7 = 0;				// �ra
}
