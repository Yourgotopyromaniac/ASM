BEGIN:            MVI A, 03H
	OUT 05H
	OUT 06H

HOME: 	IN 02H
	CPI 00H
	JZ BEGIN
	CPI 01H
	JZ TIMER
	CPI 02H
	JZ TIMER
	CPI 03H
	JZ TIMER

TIMER: 	MVI A, 00
	OUT 02H
	MVI C, 3H

	MVI A, 07H
	OUT 05H
	OUT 06H

	MVI A, 09H
	OUT 05H
	OUT 06H

	MVI A, 0BH
	OUT 05H
	OUT 06H

	MVI A, 0FH
	OUT 05H
	OUT 06H

	JMP BEGIN

	
