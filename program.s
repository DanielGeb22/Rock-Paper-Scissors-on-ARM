		.include "address_map_arm.s"
		.text
		.global _start
		.data

_start:
			/* Setup */
			MOV R0, #0      /* Player 1 Score */
			MOV R1, #0      /* Player 2 Score */
			MOV R2, #0      /* Round Counter */
			MOV R3, #0      /* Player 1 Choice */
			MOV R4, #0      /* Player 2 Choice */
			LDR R5, =HEX3_HEX0_BASE
			LDR R8, =HEX5_HEX4_BASE

start_game:	
			LDR R11, =KEY_BASE
			LDR R12, [R11]

			CMP R12, #8
			BEQ _start

			CMP R12, #1
			BNE start_game

Loop:		
			ADD	R2, #1
			
			/* Print round number and players' scores */
			BL	round_info
			
			/* Give 3-second delay to await player inputs */
			BL	delay
			
			/* Read Player 1 and 2's inputs */
			BL	players_choice
score_check:			
			/* Check Players' scores */
			CMP R0, #3
			BEQ player1_wins

			CMP R1, #3
			BEQ player2_wins
			
			B	Loop
		
round_info:
			/* Round number checker */
			CMP	R2, #0
			BEQ DISP0_0
			
			CMP R2, #1
			BEQ DISP1_0
			
			CMP R2, #2
			BEQ DISP2_0
			
			CMP R2, #3
			BEQ DISP3_0
			
			CMP R2, #4
			BEQ DISP4_0
			
			CMP R2, #5
			BEQ DISP5_0
			
player1_score:			/* Player 1 score checker */
			CMP R0, #0
			BEQ DISP0_4
			
			CMP R0, #1
			BEQ DISP1_4
			
			CMP R0, #2
			BEQ DISP2_4
			
			CMP R0, #3
			BEQ DISP3_4
			
player2_score:			/* Player 2 score checker */
			CMP R1, #0
			BEQ DISP0_2
			
			CMP R1, #1
			BEQ DISP1_2
			
			CMP R1, #2
			BEQ DISP2_2
		
			CMP R1, #3
			BEQ DISP3_2
end_checking:			
			BX	LR

delay:
			LDR	R5, =0x60000000
		
delay_loop:	
			SUB R5, #1
			CMP R5, #0
			BNE delay_loop
			BX LR
			/*CMP	R5, #0				/* Check if delay value = 0 */
			/*SUBGT R5, #1			/* If greater, subtract 1 from it */
			/*BGT	delay_loop			/* If still greater, branch to Loop1 */
			/*BX	LR					/* Branches back to return address */

Timer:		LDR R8, =MPCORE_PRIV_TIMER
			LDR R6, =1
			LDR R7, =0xFFFFFF
			
			STR R6, [R5]
			STR R7, [R8]
			STR R6, [R8, #0x08]

Timer1:		LDR R7, [R8, #0x0C]
			CMP R7, #0
			BEQ Timer1
			STR R6, [R8, #0x0C]
			BX	LR
			
jump:		MOVEQ R3, #1
			BX	LR

jump2:		MOVEQ R4, #1
			BX	LR	

players_choice:
			LDR R5, =ADC_BASE
			LDR R11, =LEDR_BASE
			BL	Timer
			
			LDR R6, [R5, #0x0C]		/* Read Ch3 */
			LDR R7, [R5, #0x14]		/* Read Ch5 */
			STR R6, [R11]
			BL determine_choice_1
			
			LDR R5, =ADC_BASE
			BL	Timer		
			LDR R6, [R5, #0x10]
			LDR R7, [R5, #0x18]
			BL determine_choice_2
			
Rock:		CMP R3, #1
			BNE Paper
			
			CMPEQ R4, #1
			
			CMP R4, #0
			ADDEQ R1, #1
			
			CMP R4, #3
			ADDEQ R0, #1
			
			B score_check
			
Paper:		CMP R3, #2
			BNE Scissors
			
			CMPEQ R4, #1
			ADDEQ R0, #1
			
			CMP R4, #0
			
			CMP R4, #3
			ADDEQ R1, #1

			B score_check
			
Scissors:	CMP R3, #3
			
			CMPEQ R4, #1
			ADDEQ R1, #1
			
			CMP R4, #0
			ADDEQ R0, #1
			
			CMP R4, #3
			
			B score_check
			
determine_choice_1:
			/* Check for Rock */
			LDR R11, =0xFFF
			CMP R6, R11
			CMPEQ R7, R11
			BEQ jump

			/* Check for Paper */
			LDR R5, =0x12C
			LDR R12, =0xFA
			CMP R6, R5
			CMPLT R6, R12
			CMPGT R7, R5
			CMPLT R7, R12
			MOVGT R3, #2

			/* Check for Scissors */
			CMP R6, R5
			CMPLT R6, R12
			CMPGT R7, R11
			MOVEQ R3, #3
			
			BX	LR
			
determine_choice_2:
			/* Check for Rock */
			LDR R11, =0xFFF
			CMP R6, R11
			CMPEQ R7, R11
			BEQ jump2

			/* Check for Paper */
			LDR R5, =0x12C
			LDR R12, =0xFA
			CMP R6, R5
			CMPLT R6, R12
			CMPGT R7, R5
			CMPLT R7, R12
			MOVEQ R4, #0

			/* Check for Scissors */
			CMP R6, R5
			CMPLT R6, R12
			CMPGT R7, R11
			MOVEQ R4, #3
			
			BX	LR

/* Round number display */

DISP0_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =ZERO
			STR R6, [R5]
			B	player1_score
			
DISP1_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =ONE
			STR R6, [R5]
			B	player1_score
			
DISP2_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =TWO
			STR R6, [R5]
			B	player1_score

DISP3_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =THREE
			STR R6, [R5]
			B	player1_score

DISP4_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =FOUR
			STR R6, [R5]
			B	player1_score

DISP5_0:
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =FIVE
			STR R6, [R5]
			B	player1_score
			
/* Player 1 score display */

DISP0_4:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =ZERO
			STR R6, [R8]
			B	player2_score

DISP1_4:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =ONE
			STR R6, [R8]
			B	player2_score

DISP2_4:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =TWO
			STR R6, [R8]
			B	player2_score
			
DISP3_4:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =THREE
			STR R6, [R8]
			B	player2_score
			
/* Player 2 score display */

DISP0_2:
			LDR R6, =ZERO
			LDR R7, [R5]
			ADD R7, R7, R6, LSL #16
			STR R7, [R5]
			B	end_checking

DISP1_2:
			LDR R6, =ONE
			LDR R7, [R5]
			ADD R7, R7, R6, LSL #16
			STR R7, [R5]
			B	end_checking

DISP2_2:
			LDR R6, =TWO
			LDR R7, [R5]
			ADD R7, R7, R6, LSL #16
			STR R7, [R5]
			B	end_checking
			
DISP3_2:
			LDR R6, =THREE
			LDR R7, [R5]
			ADD R7, R7, R6, LSL #16
			STR R7, [R5]
			B	end_checking
			
player1_wins:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =P
			LDR R9, =ONE
			MOV R7, R6
			ADD R9, R9, R7, LSL #8
			STR R9, [R8]
			
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =W
			LDR R7, =I
			LDR R9, =N
			LDR R10, =FIVE
			
			ADD R10, R10, R9, LSL #8
			ADD R10, R10, R7, LSL #16
			ADD R10, R10, R6, LSL #24
			STR R10, [R5]

			B	start_game

player2_wins:
			LDR R8, =HEX5_HEX4_BASE
			LDR R6, =P
			LDR R9, =TWO
			MOV R7, R6
			ADD R9, R9, R7, LSL #8
			STR R9, [R8]
			
			LDR R5, =HEX3_HEX0_BASE
			LDR R6, =W
			LDR R7, =I
			LDR R9, =N
			LDR R10, =FIVE
			
			ADD R10, R10, R9, LSL #8
			ADD R10, R10, R7, LSL #16
			ADD R10, R10, R6, LSL #24
			STR R10, [R5]

			B	start_game

.end
		
		
		
		
