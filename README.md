# Rock-Paper-Scissors-on-ARM
ARM-based Sensor Implementation of the Rock Paper Scissors game

## Theoretical Background
The final project in our Microcontroller Laboratory college course challenged us to develop a digital system that interacts with the DE1-SoC Development Board, built around the Altera System-on-Chip (SoC) FPGA and co-developed by Intel and Terasic. As we decided to work on an original idea, we implemented the Rock Paper Scissors game by integrating both hardware and software into our system.

On the one hand, we used flex sensors to simulate the finger folds in the Rock Paper Scissors game, representing voltage inputs to determine the player's choice (rock, paper, or scissors). The sensors are configured as shown in the circuit diagram below:

![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/57221fc6-b6df-4249-8462-3a92a769e282)

On the other hand, the game logic was written in ARM Assembly code, involving multiple subroutines, delays, and especially Analog-to-Digital Converter (ADC) readings.

## Equipment Used
- Breadboard
- DE1-SoC Development Board
- 4 Flex Sensors (2 for each player) ([Link](https://a.co/d/ceoM3K0))
- Wires
- Four 68-kΩ Resistors

## Circuit Implementation
The circuit implementation was very straightforward and not so complicated. First, we needed to figure out how exactly a flex sensor operates. We had to do some research and realized that the Flex sensor worked as a voltage divider. After figuring out that the flex sensor worked as a voltage divider, we were able to implement a similar circuit to Lab 10. Using the voltage divider formula to find the resistor needed, we were required to use a 68-kΩ resistor to get 5 volts. The 68-kΩ resistor is connected to the ground terminal of the flex sensor which is the left side (shown in Figure 1 below). The right terminal of the flex sensor is connected to power. The output that connects to the ADC converter goes after the resistor that's connected to the sensor. This circuit was implemented four times to set up a two-player mode. The left side of the
breadboard was used for the first player while the right side was used for the second player. The outputs for player one were connected to channels three and five while player two channels were
four and six on the ADC port. Channels three and four were used for the index finger for both players and channels five and six for the middle finger.

## Game Program
The program starts with initializing the two players with their choice and score. Next, we initialize the counter to check the number of rounds the players will face. Now we start off the program with a key base that has two settings that determine if the game will start or reset. If the program compares to one, then the game starts but if it compares to eight the game will reset. The program starts and adds 1 to the counter to display on the 7-segment display to show the players that round one has begun. After round one starts, the program branches to a subroutine that displays the players’ score and gives about a three-second delay that lets the player choose either rock, paper, or scissors. Next, the program goes to the player's choice subroutine where it reads the ADC conversion from analog to digital. The program is meant to read player one's choice first then player two’s choice. The private timer is also implemented during this step so that way there is a delay long enough to catch the choices of each player.
To detect what choice the player made all depended on the flex sensor being bent. If both flex sensors were bent, the player would choose rock. If the second flex sensor, which was the middle finger, was bent then the player’s choice would be scissors. Lastly, if neither were bent, then paper would be the player’s choice. Each choice will be compared to one, two, or three, corresponding to rock, paper, and scissors in that specific order. Therefore, it will branch into the determination of the player's choice to check the actual choice. Secondly, the program will display if either player won or tied the round and then moves on to the next. The program will branch back to the delay and repeat itself until one player wins. The max rounds are five in case there is a possibility of a couple of ties and need a tiebreaker for a clear winner. Our group was able to find a way to display “WINS” in the 7-segment display to show who won. If the players want a rematch, they have to push the far-left button that works as a reset and then push the first (far-right) button that activates the game.

## Experimental Data
 
| ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/0190a6c7-27cd-4dbd-a279-b300b0e7001e)  | ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/1303c6c0-6e82-49f7-a1af-f94e940a232c) |
| ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/cf9b9010-8cca-400f-800a-3338f4b7a19a)  | ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/1867ccd7-97d8-4d08-a83c-b408d7fca85d) |
| ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/256f4707-b3b0-4f39-a71c-9e11a7bfa44d)  | ![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/f5a8bf44-54ed-443d-a6d6-45e0269ccb00) |
