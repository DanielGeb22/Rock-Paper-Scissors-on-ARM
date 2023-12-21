# Rock-Paper-Scissors-on-ARM
ARM-based Sensor Implementation of the Rock Paper Scissors game

## Theoretical Background
The final project in our Microcontroller Laboratory college course challenged us to develop a digital system that interacts with the DE1-SoC Development Board, built around the Altera System-on-Chip (SoC) FPGA and co-developed by Intel and Terasic. As we decided to work on an original idea, we implemented the Rock Paper Scissors game by integrating both hardware and software into our system.

On the one hand, we used flex sensors to simulate the finger folds in the Rock Paper Scissors game, representing voltage inputs to determine the player's choice (rock, paper, or scissors). The sensors are configured as shown in the circuit diagram below:

![image](https://github.com/DanielGeb22/Rock-Paper-Scissors-on-ARM/assets/21247188/57221fc6-b6df-4249-8462-3a92a769e282)

On the other hand, the game logic was written in ARM Assembly code, involving multiple subroutines, delays, and especially Analog-to-Digital Converter (ADC) readings.
