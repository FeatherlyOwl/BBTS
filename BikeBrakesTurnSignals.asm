	ORG	0000H
	LJMP	MAIN
	ORG	0003H
	LJMP	I0
	ORG	0013H
	LJMP	I1
	ORG	0100H
MAIN:	MOV	SP,#60H
	SETB	EA
	SETB	EX0
	SETB	EX1
	SETB	IT0
	SETB	PX0
	MOV	P1,#11111111B
	MOV	P2,#0
	MOV	P3,#11111100B
	CLR	A
SL:	MOV	P2,#00000111B
	SETB	P3.0
BLLOOP:	CLR	A
	MOV	A,P1
	ANL	A,#02H
	RR	A
	CPL	A
	ANL	A,#01H
	MOV	R0,A
	CLR	A
	MOV	A,P1
	ANL	A,#04H
	RR	A
	RR	A
	CPL	A
	ANL	A,#01H
	ORL	A,R0
	JNZ	BL
	LJMP	SL
BL:	MOV	P2,#00111111B
	LJMP	BLLOOP
I0:	MOV	P2,#00000111B
	SETB	P3.0
I0LOOP:	MOV	P2,#0FFH
	LCALL	DELAY
	MOV	P2,#00000111B
	LCALL	DELAY
	CLR	A
	MOV	A,P1
	ANL	A,#01H
	JZ	I0LOOP
	RETI
I1:	CLR	A
	MOV	A,P1
	ANL	A,#00001000B
	JNZ	TRS
TLS:	CLR	A
	MOV	A,P1
	ANL	A,#02H
	RR	A
	CPL	A
	ANL	A,#01H
	MOV	R0,A
	CLR	A
	MOV	A,P1
	ANL	A,#04H
	RR	A
	RR	A
	CPL	A
	ANL	A,#01H
	ORL	A,R0
	JNZ	BL_L
	MOV	P2,#00000111B
	SETB	P2.6
	LCALL	DELAY
	CPL	P2.6
	LCALL	DELAY
	CLR	A
	MOV	A,P1
	ANL	A,#00001000B
	JZ	TLS
	CLR	A
	MOV	A,P1
	ANL	A,#00010000B
	JNZ	GB
TRS:	CLR	A
	MOV	A,P1
	ANL	A,#02H
	RR	A
	CPL	A
	ANL	A,#01H
	MOV	R0,A
	CLR	A
	MOV	A,P1
	ANL	A,#04H
	RR	A
	RR	A
	CPL	A
	ANL	A,#01H
	ORL	A,R0
	JNZ	BL_R
	MOV	P2,#00000111B
	SETB	P2.7
	LCALL	DELAY
	CPL	P2.7
	LCALL	DELAY
	CLR	A
	MOV	A,P1
	ANL	A,#00010000B
	JZ	TRS
	CLR	A
	MOV	A,P1
	ANL	A,#00001000B
	JNZ	GB
	LJMP	TLS
BL_L:	MOV	P2,#00111111B
	SETB	P2.6
	LCALL	DELAY
	CPL	P2.6
	LCALL	DELAY
	CLR	A
	MOV	A,P1
	ANL	A,#00001000B
	JZ	TLS
	CLR	A
	MOV	A,P1
	ANL	A,#00010000B
	JNZ	GB
	LJMP	TRS
BL_R:	MOV	P2,#00111111B
	SETB	P2.7
	LCALL	DELAY
	CPL	P2.7
	LCALL	DELAY
	CLR	A
	MOV	A,P1
	ANL	A,#00001000B
	JZ	TRS
	CLR	A
	MOV	A,P1
	ANL	A,#00010000B
	JNZ	GB
	LJMP	TLS
GB:	RETI
DELAY:  MOV     R7,#20
LOOP2:  MOV     R6,#125
LOOP1:  MOV	R5,#100
	DJNZ	R5,$
	DJNZ    R6,LOOP1
        DJNZ    R7,LOOP2
        RET
	END
	
