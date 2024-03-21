#include <LPC17xx.h>
unsigned long int i, j;
unsigned long LED = (1 << 4);
#define DELAY_LAMA 10000
void delay(void);
int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 &= 0xFF0000FF; //set P0.4 - P0.11 as GPIO
	LPC_GPIO0->FIODIR |= 0xFF0; //set P0.4 - P0.11 as output pins
	while(1) {
		LED = (1 << 4);
		for (i = 0; i < 256; i++) {
			LPC_GPIO0->FIOPIN = LED + i*(1<<4);
            delay();
		}
        i = 0;
	}
}
void delay(void)
{
    for (j = 0; j < DELAY_LAMA; j++);
}
