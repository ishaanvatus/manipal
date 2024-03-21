#include <LPC17xx.h>
unsigned long int i, j;
unsigned long LED = (1 << 4);
#define DELAY_LAMA 5000
void downcounter(void);
int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL4 &= 0xFFFFFFFC; // set P2.0 as gpio
	LPC_GPIO2->FIODIR &= 0xFFFFFFFE; // set P2.0 as input
	LPC_PINCON->PINSEL0 &= 0xFF0000FF; //set P0.4 - P0.11 as GPIO
	LPC_GPIO0->FIODIR |= 0xFF0; //set P0.4 - P0.11 as output pins
	while(1) {
		LED = (1 << 4);
			for (i = 255; i > 0; i--) {
		        if (LPC_GPIO2->FIOPIN & 1)
                    goto downcount;
				LPC_GPIO0->FIOPIN = LED + i*(1<<4);
				for (j = 0; j < DELAY_LAMA; j++) ; //do nothing, delay
			}
            goto upcount;
		}
			for (i = 0; i < 256; i++) {
				LPC_GPIO0->FIOPIN = LED + i*(1<<4);
				for (j = 0; j < DELAY_LAMA; j++) ; //do nothing, delay
			}
		}
	}
}

/*
#include <LPC17xx.h>
unsigned long int i, j;
unsigned long LED = (1 << 4);
#define DELAY_LAMA 5000
int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL4 &= 0xFFFFFFFC; // set P2.0 as gpio
	LPC_GPIO2->FIODIR &= 0xFFFFFFFE; // set P2.0 as input
	LPC_PINCON->PINSEL0 &= 0xFF0000FF; //set P0.4 - P0.11 as GPIO
	LPC_GPIO0->FIODIR |= 0xFF0; //set P0.4 - P0.11 as output pins
	while(1) {
		LED = (1 << 4);
		if (LPC_GPIO2->FIOPIN & 1) {
			LPC_GPIO0->FIOPIN = 0xAAAAAAAA;
		}
		else {
			LPC_GPIO0->FIOPIN = 0x55555555;
		}
	}
}
*/
