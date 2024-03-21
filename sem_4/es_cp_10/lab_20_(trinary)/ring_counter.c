#include <LPC17xx.h>
int i, j;
unsigned long LED = (1 << 4);
#define DELAY_LAMA 10000
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
			for (i = 7; i >= 0; i--) {
				LPC_GPIO0->FIOPIN = LED<<i;
				for (j = 0; j < DELAY_LAMA; j++) ; //do nothing, delay
			}
		}
		else {
			for (i = 0; i < 8; i++) {
				LPC_GPIO0->FIOPIN = (LED<<7)>>i;
				for (j = 0; j < DELAY_LAMA; j++);
			}
		}
	}
}

