#include <LPC17xx.h>
#define DELAY_LAMA 100
unsigned char tohex[10] = {0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X6F};
long int arr[4] = {9,9,9,9};
unsigned int i = 0, j = 0;
int main() 
{
		SystemInit();
		SystemCoreClockUpdate();
	  LPC_PINCON->PINSEL0 &= 0xFF0000FF; //set P0.4 - P0.11 as GPIO
	  LPC_GPIO0->FIODIR |= 0xFF0; //set P0.4 - P0.11 as output pins
		LPC_PINCON->PINSEL4 &= 0xFFFFFFFC; // set P2.0 as gpio
	  LPC_GPIO2->FIODIR &= 0xFFFFFFFE; // set P2.0 as input
    LPC_GPIO0 -> FIODIR |= 0XFF0;
    LPC_GPIO1 -> FIODIR |= 0XF << 23;
while(1) {
	if (LPC_GPIO2->FIOPIN & 1) {
		          LPC_GPIO1 -> FIOPIN = 2 << 23;
		          LPC_GPIO0 -> FIOPIN = tohex[4] << 4;
							for (i = 0; i < DELAY_LAMA; i++);
		          LPC_GPIO1 -> FIOPIN = 1 << 23;
		          LPC_GPIO0 -> FIOPIN = tohex[2] << 4;\
							for (i = 0; i < DELAY_LAMA; i++);
							LPC_GPIO0 -> FIOCLR |= 0X00000FF0;

	}
	else {
				      LPC_GPIO1 -> FIOPIN = 2 << 23;
		          LPC_GPIO0 -> FIOPIN = tohex[8] << 4;
								for (i = 0; i < DELAY_LAMA; i++);
		          LPC_GPIO1 -> FIOPIN = 1 << 23;
		          LPC_GPIO0 -> FIOPIN = tohex[2] << 4;
							for (i = 0; i < DELAY_LAMA; i++);
							LPC_GPIO0 -> FIOCLR |= 0X00000FF0;
}
}
}
