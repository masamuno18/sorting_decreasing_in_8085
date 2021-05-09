;<<BUBBLE SORTING/COMPARISON SORTING ALGORITHM>>
;STORING DATA IN MEMORY [05 32 16 48 64 80]>
;sorted data should look like [80 64 48 32 16 05]>
MVI A,	06H ; size of the array
STA 0000H
MVI A,	05H ; 05
STA 0001H
MVI A,	20H ; 32
STA 0002H
MVI A,	10H ; 16
STA 0003H
MVI A,	30H ; 48
STA 0004H
MVI A,	40H ; 64
STA 0005H
MVI A,	50H ; 80
STA 0006H
	
;CODE FOR SORTING IN DECREASING ORDER
START:	LXI H,0000H ; GIVES THE NUMBER OF DATA IN ARRAY 
	MVI D,00H ; D ACTS AS FLAG REGISTER
	MOV C,M ; move data size to register C
	DCR C ; decrement C by 1
	INX H ;POINTING TO NEXT LOCATION
CHECK:	MOV A,M ; move the value 05 to A
	INX H ; HL points to 0002H
	CMP M
	JNC NEXTBYTE ; JUMP IF C=0
	MOV B,M ;move the memory value to B
	MOV M,A ; move accumulator to M
	DCX H ; decrement HL 
	MOV M,B ; move accumulator to B
	INX H ; increment HL again
	MVI D,01H ;increment the flag value to show sorting is done
NEXTBYTE: DCR C ; decrement the value of C by 1
	JNZ CHECK; IF COMPARISON COUNT NOT 0 RERUN THE LOOP
	MOV A,D
	RRC ; ROTATE accumulator right 
	JC START; if c=1,there might be another swap
	HLT