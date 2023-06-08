# Binary Clack
* DPTP SYSTEM - Bináris óra
* Diszkrét alkatrészes változat: 2014.06.26.
* SDM változat: 2015.04.11, Szombat.
* PIC: PIC16F628
* Fórdító:  HI-TECH C for PIC10/12/16
* IDE: MPLAB v8.91
* PCB: Sprint-Layout 6.0

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/diszkret_4.jpg "DPTP System")

# Miért
2014-ben elkezdtem az elektronikával foglalkozni és akkor éppen ez volt a divat, mármint hogy ilyent készítenek a hobbisták. Jó kihívás 
és tanulás volt, így én is önerőből nekiálltam és elkészítettem az első saját órámat, majd 1 évvel később a másodikat már RGB kivitelben.

# Nyákterv
Két változat készült, az első egy diszkrét alkatrészekkel szerelt változat és 1 évvel később egy SMD változat. Egymás alatt pár kép.

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/binaris_ora_1_pcb.JPG "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/binaris_ora_2_pcb.JPG "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/sdm_pcb.jpg "DPTP System")

# PCB
A nyák rajzolatot vasalós technikával vittem fel a rézfelületre. Lötstop az UV levilágítóm segítségével került fel az SMD panelre.

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/diszkret_1.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/diszkret_2.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/diszkret_3.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/sdm1.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/sdm2.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/sdm3.jpg "DPTP System")

![DPTP System](https://github.com/DPTPSystem/BinaryClock/blob/master/images/sdm4.jpg "DPTP System")

# Hardver
Diszkrét változatnál csak az egyik helyre kell a kristály.
Tranzisztor: BC 337

SMD változat esetében az átkötés és a forrpontok a nyákon már javítva vannak.
SDM mérete: 1206,
LED mérete: 1210 (3528)
A nagy 0-s SMD áthidaló: 5mm*2mm-es, nem tudom mi ennek a szabványmegfelelője,
Shiftergiszter: 74HC595
Darlington sor: ULN2003
PNP tranzisztor: BC 807-16

# Program
A program rém egyszerű, PIC16F628-as timer2-es 1mS megszakításra van állítva, így minden 1000-nél 1S-nél ( 1 másodpercnél ) emeli a 
szükséges változókat. Másodperc, majd a perc és óra. Ennek megoldására egy egyszerű if-es feltétel használók.

Mindkettő óra esetében a következőkép néz ki a megszakítási rutin.

```
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
```

Értelemszerűen mátrix módban a sorokat és az oszlopokat kapcsolgatva határozzuk meg, melyik LED vagy LED-eknek kell világítani.
Az SDM verziónál az RGB ledek miatt kicsit bonyolódik a helyzet, mert egy shiftregisztert is kell hajtani, de a bonyolultsága még ennek is messze
elmarad, szóval senki ne ijedjen meg..

SR74HC595 kezelése:

```
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
```

Szintén az SMD RGB verzió esetén még egy kis érdekesség, hogy minden 10.-ik másodpercben véletlenszerűen szint vált a kijelzés. Nem túl 
nagy dolog mert nem használok a programban PWM vezérlést, így csak 3 szín van, de összeségéebn még ez is érdekes lehet.

```
// Random szám generálása meghatározott számok közt
unsigned int random_szam(unsigned int mettol, unsigned int meddig)
{
    return rand() % (meddig-mettol+1) + mettol;
}
```

# Kapcsolodó videós tartalmak

Első diszkrté változat:

[![DPTP System](https://img.youtube.com/vi/uAMeKtax6qo/0.jpg)](https://www.youtube.com/watch?v=uAMeKtax6qo)

SMD változat:

[![DPTP System](https://img.youtube.com/vi/vYcR2qiYSmM/0.jpg)](https://www.youtube.com/watch?v=vYcR2qiYSmM)

[![DPTP System](https://img.youtube.com/vi/U9MUcflIGAI/0.jpg)](https://www.youtube.com/watch?v=U9MUcflIGAI)

