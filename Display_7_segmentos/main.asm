;
; Display_7_segmentos.asm
;
; Created: 14/02/2022 21:09:06
; Author : Leonardo
;

.org 0x0000 jmp main
.org 0x001A jmp TIM1_OVF_ISR

    

main:
    ;ldi r21, LOW(RAMEND)
	;out SPL,r21
	;ldi r21,HIGH(RAMEND)
	;out SPH,r21

	ldi r16,0x00
	ldi r17,0x04
	ldi r18,0xc2
	ldi r19,0xf7
	ldi r20,0x01
	ldi r21,0x00
	
	sts TCCR1A,r16
	sts TCCR1B,r17
	sts TCNT1H,r18
    sts TCNT1L,r19
	sts TIMSK1,r20
	sei

	ldi r22,0xff
	out DDRD,r22

start: 
    cpi r21,0x00
	breq null

	cpi r21,0x01
	breq zero

	cpi r21,0x02
	breq um

	cpi r21,0x03
	breq dois

	cpi r21,0x04
	breq tres

	cpi r21,0x05
	breq quatro

	cpi r21,0x06
	breq cinco

	cpi r21,0x07
	breq seis

	cpi r21,0x08
	breq sete

	cpi r21,0x09
	breq oito

	cpi r21,0x0A
	breq nove

	cpi r21,0x0B
	breq zerar

	jmp start

null:
    ldi r22,0x00
	out PORTD,r22
	jmp start

zero:
    ldi r22,0B11111100
	out PORTD,r22
	jmp start

um:
    ldi r22,0B01100000
	out PORTD,r22
	jmp start

dois:
    ldi r22,0B11011010
	out PORTD,r22
	jmp start

tres:
    ldi r22,0B11110010
	out PORTD,r22
	jmp start

quatro:
    ldi r22,0B01100110
	out PORTD,r22
	jmp start

cinco:
    ldi r22,0B10110110
	out PORTD,r22
	jmp start

seis:
    ldi r22,0B10111110
	out PORTD,r22
	jmp start

sete:
    ldi r22,0B11100000
	out PORTD,r22
	jmp start

oito:
    ldi r22,0B11111110
	out PORTD,r22
	jmp start

nove:
    ldi r22,0B11110110
	out PORTD,r22
	jmp start

zerar:
    ldi r21,0x01
	jmp start


TIM1_OVF_ISR: 
    inc r21
	reti