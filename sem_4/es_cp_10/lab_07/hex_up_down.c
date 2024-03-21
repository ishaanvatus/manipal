#include <LPC17xx.h>
#define DELAY_LAMA 100
unsigned char tohex[16] = {0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X6F, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71};
long int arr[4] = {15,15,15,15};
unsigned int i = 0, j = 0;
int main() 
{
		SystemInit();
		SystemCoreClockUpdate();
		LPC_PINCON->PINSEL4 &= 0xFFFFFFFC; // set P2.0 as gpio
	  LPC_GPIO2->FIODIR &= 0xFFFFFFFE; // set P2.0 as input
    LPC_GPIO0 -> FIODIR |= 0XFF0;
    LPC_GPIO1 -> FIODIR |= 0XF << 23;
while(1) {
	if (LPC_GPIO2->FIOPIN & 1) {
down:
		for (arr[3] = 0;; arr[3]--) {
      for (arr[2] = 15; arr[2] >= 0; arr[2]--) {
        for (arr[1] = 15; arr[1] >= 0; arr[1]--) {
          for (arr[0] = 15; arr[0] >= 0; arr[0]--) {
						if (LPC_GPIO2->FIOPIN & 0) 
							goto up;
            for (i = 0; i < 4; i++){
              LPC_GPIO1 -> FIOPIN = i << 23;
              LPC_GPIO0 -> FIOPIN = tohex[arr[i]] << 4;
              for (j = 0; j < DELAY_LAMA; j++);
            }
            for (j = 0; j < DELAY_LAMA; j++);
            LPC_GPIO0 -> FIOCLR |= 0X00000FF0;
          }
				}
			}
			if (arr[3] == 0) 
				arr[3] = 16;
	}
}
	else {
up:
    for (arr[3] = 0;; arr[3]--) {
      for (arr[2] = 15; arr[2] >= 0; arr[2]--) {
        for (arr[1] = 15; arr[1] >= 0; arr[1]--) {
          for (arr[0] = 15; arr[0] >= 0; arr[0]--) {
						if (LPC_GPIO2->FIOPIN & 1) 
							goto down;						
            for (i = 0; i < 4; i++){
              LPC_GPIO1 -> FIOPIN = i << 23;
              LPC_GPIO0 -> FIOPIN = tohex[15 - arr[i]] << 4;
              for (j = 0; j < DELAY_LAMA; j++);
            }
            for (j = 0; j < DELAY_LAMA; j++);
            LPC_GPIO0 -> FIOCLR |= 0X00000FF0;
          }
				}
			}
			if (arr[3] == 0) 
				arr[3] = 16;	
		}
}
	
}
}
