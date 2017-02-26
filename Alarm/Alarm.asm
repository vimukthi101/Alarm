
_blink_led:

;Alarm.c,1 :: 		void blink_led(){
;Alarm.c,2 :: 		PORTC=0b10000001;
	MOVLW      129
	MOVWF      PORTC+0
;Alarm.c,3 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led0:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led0
	DECFSZ     R12+0, 1
	GOTO       L_blink_led0
	NOP
	NOP
;Alarm.c,4 :: 		PORTC=0b10000010;
	MOVLW      130
	MOVWF      PORTC+0
;Alarm.c,5 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led1:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led1
	DECFSZ     R12+0, 1
	GOTO       L_blink_led1
	NOP
	NOP
;Alarm.c,6 :: 		PORTC=0b10000100;
	MOVLW      132
	MOVWF      PORTC+0
;Alarm.c,7 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led2:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led2
	DECFSZ     R12+0, 1
	GOTO       L_blink_led2
	NOP
	NOP
;Alarm.c,8 :: 		PORTC=0b10001000;
	MOVLW      136
	MOVWF      PORTC+0
;Alarm.c,9 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led3:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led3
	DECFSZ     R12+0, 1
	GOTO       L_blink_led3
	NOP
	NOP
;Alarm.c,10 :: 		PORTC=0b10010000;
	MOVLW      144
	MOVWF      PORTC+0
;Alarm.c,11 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led4:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led4
	DECFSZ     R12+0, 1
	GOTO       L_blink_led4
	NOP
	NOP
;Alarm.c,12 :: 		PORTC=0b10100000;
	MOVLW      160
	MOVWF      PORTC+0
;Alarm.c,13 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led5:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led5
	DECFSZ     R12+0, 1
	GOTO       L_blink_led5
	NOP
	NOP
;Alarm.c,14 :: 		PORTC=0b11000000;
	MOVLW      192
	MOVWF      PORTC+0
;Alarm.c,15 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_blink_led6:
	DECFSZ     R13+0, 1
	GOTO       L_blink_led6
	DECFSZ     R12+0, 1
	GOTO       L_blink_led6
	NOP
	NOP
;Alarm.c,16 :: 		}
L_end_blink_led:
	RETURN
; end of _blink_led

_read_pir:

;Alarm.c,18 :: 		void read_pir(){
;Alarm.c,19 :: 		PORTB=0b00000000;             //set the sensor to LOW
	CLRF       PORTB+0
;Alarm.c,20 :: 		while(PORTB==0b00000001){
L_read_pir7:
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_read_pir8
;Alarm.c,21 :: 		PORTC=0b10000000;
	MOVLW      128
	MOVWF      PORTC+0
;Alarm.c,22 :: 		blink_led();             //turn on all the lights
	CALL       _blink_led+0
;Alarm.c,23 :: 		}
	GOTO       L_read_pir7
L_read_pir8:
;Alarm.c,24 :: 		}
L_end_read_pir:
	RETURN
; end of _read_pir

_main:

;Alarm.c,26 :: 		void main()
;Alarm.c,28 :: 		TRISC=0b00000000;             //C Port as output
	CLRF       TRISC+0
;Alarm.c,29 :: 		PORTC=0b00000000;             //turn off all the lights
	CLRF       PORTC+0
;Alarm.c,30 :: 		TRISB=0b00000001;             //B0 Port as input
	MOVLW      1
	MOVWF      TRISB+0
;Alarm.c,31 :: 		while (1)
L_main9:
;Alarm.c,33 :: 		read_pir();
	CALL       _read_pir+0
;Alarm.c,34 :: 		}
	GOTO       L_main9
;Alarm.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
