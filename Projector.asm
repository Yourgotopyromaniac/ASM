//OUTPUT PORT 01H
//INPUT PORT 04H
//LIMIT INPUT SWITCH 07H

MVI A, 00H
OUT 01H


LOOP:	IN 04H //SET INPUT

	CPI 00H // CHECK IF NO BUTTON IS PRESSED
	JZ LOOP //RESTART LOOP

	CPI 01H //CHECK IF STOP BUTTON IS PRESSED
	CZ STOP // START "STOP"

	CPI 02H  //CHECK IF DOWN BUTTON IS PRESSED
	CZ DOWN // START "DOWN"

	CPI 04H //CHECK IF UP BUTTON IS PRESSED
	CZ UP //START "UP"

	JMP LOOP //RESTART LOOP
	HLT

STOP:	IN 07H //CHECK LIMIT SWITCH

	CPI 01H //CHECK DOWN LIMIT
	JZ LOOP // START AT "LOOP"
	CPI 02H //CHECK UP LIMIT
	JZ LOOP // START AT "LOOP"

	MVI A, 01H //ELSE, ACTIVATE STOP SIGNAL
	OUT 01H
	JMP LOOP

DOWN: 	IN 07H //CHECK LIMIT SWITCH

	CPI 01H //CHECK DOWN LIMIT
	JZ LOOP //START AT "LOOP"

	MVI A, 02H //ELSE ACTIVATE DOWN SIGNAL
	OUT 01H 
	JMP LOOP

UP:	IN 07H //CHECK LIMIT SWITCH

	CPI 02H // CHECK UP LIMIT
	JZ LOOP // START AT LOOP

	MVI A, 04H // ACTIVATE UP SIGNAL
	OUT 01H
	JMP LOOP
