void blink_led(){
     PORTC=0b10000001;
     Delay_ms(10);
     PORTC=0b10000010;
     Delay_ms(10);
     PORTC=0b10000100;
     Delay_ms(10);
     PORTC=0b10001000;
     Delay_ms(10);
     PORTC=0b10010000;
     Delay_ms(10);
     PORTC=0b10100000;
     Delay_ms(10);
     PORTC=0b11000000;
     Delay_ms(10);
}

void read_pir(){
  PORTB=0b00000000;             //set the sensor to LOW
  while(PORTB==0b00000001){
       PORTC=0b10000000;
       blink_led();             //turn on all the lights
  }
}

void main()
{
  TRISC=0b00000000;             //C Port as output
  PORTC=0b00000000;             //turn off all the lights
  TRISB=0b00000001;             //B0 Port as input
  while (1)
  {
    read_pir();
  }
}