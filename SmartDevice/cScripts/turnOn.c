
#include <stdio.h>
#include <wiringPi.h>

// LED Pin - wiringPi pin 0 is BCM_GPIO 17.

#define LED     16

int main (void)
{
  wiringPiSetup () ;
  pinMode (LED, OUTPUT) ;
  digitalWrite (LED, HIGH) ;  // On
  return 0 ;
}



 
