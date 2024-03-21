#include <LPC17xx.h>
void lcd_init(void);
int main(void)
{
}

void lcd_init(void)
{
    LPC_PINCON->PINSEL1 &= ~(0x3F<<23); //P0.23-28 as GPIO
    LPC_GPIO0->FIODIR |= 0x3F << 23; //P0.23-28 as outputs
