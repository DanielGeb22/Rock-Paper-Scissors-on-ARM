/* This files provides address values that exist in the system */

/* Memory */
        .equ  DDR_BASE,             0x00000000
        .equ  DDR_END,              0x3FFFFFFF
        .equ  A9_ONCHIP_BASE,       0xFFFF0000
        .equ  A9_ONCHIP_END,        0xFFFFFFFF
        .equ  SDRAM_BASE,           0xC0000000
        .equ  SDRAM_END,            0xC3FFFFFF
        .equ  FPGA_ONCHIP_BASE,     0xC8000000
        .equ  FPGA_ONCHIP_END,      0xC803FFFF
        .equ  FPGA_CHAR_BASE,       0xC9000000
        .equ  FPGA_CHAR_END,        0xC9001FFF

/* Cyclone V FPGA devices */
        .equ  LEDR_BASE,             0xFF200000
        .equ  HEX3_HEX0_BASE,        0xFF200020
        .equ  HEX5_HEX4_BASE,        0xFF200030
        .equ  SW_BASE,               0xFF200040
        .equ  KEY_BASE,              0xFF200050
        .equ  JP1_BASE,              0xFF200060
        .equ  JP2_BASE,              0xFF200070
        .equ  PS2_BASE,              0xFF200100
        .equ  PS2_DUAL_BASE,         0xFF200108
        .equ  JTAG_UART_BASE,        0xFF201000
        .equ  JTAG_UART_2_BASE,      0xFF201008
        .equ  IrDA_BASE,             0xFF201020
        .equ  TIMER_BASE,            0xFF202000
        .equ  TIMER_2_BASE,          0xFF202020
        .equ  AV_CONFIG_BASE,        0xFF203000
        .equ  PIXEL_BUF_CTRL_BASE,   0xFF203020
        .equ  CHAR_BUF_CTRL_BASE,    0xFF203030
        .equ  AUDIO_BASE,            0xFF203040
        .equ  VIDEO_IN_BASE,         0xFF203060
        .equ  ADC_BASE,              0xFF204000

/* Cyclone V HPS devices */
        .equ   HPS_GPIO1_BASE,       0xFF709000
        .equ   I2C0_BASE,            0xFFC04000
        .equ   I2C1_BASE,            0xFFC05000
        .equ   I2C2_BASE,            0xFFC06000
        .equ   I2C3_BASE,            0xFFC07000
        .equ   HPS_TIMER0_BASE,      0xFFC08000
        .equ   HPS_TIMER1_BASE,      0xFFC09000
        .equ   HPS_TIMER2_BASE,      0xFFD00000
        .equ   HPS_TIMER3_BASE,      0xFFD01000
        .equ   FPGA_BRIDGE,          0xFFD0501C

/* ARM A9 MPCORE devices */
        .equ   PERIPH_BASE,          0xFFFEC000   /* base address of peripheral devices */
        .equ   MPCORE_PRIV_TIMER,    0xFFFEC600   /* PERIPH_BASE + 0x0600 */

        /* Interrupt controller (GIC) CPU interface(s) */
        .equ   MPCORE_GIC_CPUIF,     0xFFFEC100   /* PERIPH_BASE + 0x100 */
        .equ   ICCICR,               0x00         /* CPU interface control register */
        .equ   ICCPMR,               0x04         /* interrupt priority mask register */
        .equ   ICCIAR,               0x0C         /* interrupt acknowledge register */
        .equ   ICCEOIR,              0x10         /* end of interrupt register */
        /* Interrupt controller (GIC) distributor interface(s) */
        .equ   MPCORE_GIC_DIST,      0xFFFED000   /* PERIPH_BASE + 0x1000 */
        .equ   ICDDCR,               0x00         /* distributor control register */
        .equ   ICDISER,              0x100        /* interrupt set-enable registers */
        .equ   ICDICER,              0x180        /* interrupt clear-enable registers */
        .equ   ICDIPTR,              0x800        /* interrupt processor targets registers */
        .equ   ICDICFR,              0xC00        /* interrupt configuration registers */

/* 7-Segment values */
		.equ 	ZERO,		0x0000003F
		.equ 	ONE,		0x00000006		/* =0b00000110, segments B and C */
		.equ 	TWO,		0x0000005B		/* =0b01011011, segments A, B, D, E, and G */
		.equ 	THREE, 		0x0000004F		/* =0b01001111, segments A, B, C, D, and G */
		.equ 	FOUR,		0x00000066		/* =0b01100110, segments B, C, F, and G */
		.equ 	FIVE,		0x0000006D		/* =0b01101101, segments A, C, D, F, and G */
		.equ 	SIX,		0x0000007D		/* =0b01111101, segments A, C, D, E, F, and G */
		.equ 	SEVEN, 		0x00000007		/* =0b00000111, segments A, B, and C */
		.equ 	EIGHT, 		0x0000007F		/* =0b01111111, segments A, B, C, D, E, and F */
		.equ 	NINE,		0x0000006F		/* =0b01101111, segments A, B, C, D, F, and G */
		.equ 	TEN,		0x0000005F		/* =0b01011111, segments A, B, C, D, E, and G */
		.equ 	ELEVEN,		0x0000007C		/* =0b01111100, segments C, D, E, F, and G */
		.equ 	TWELVE,		0x00000039		/* =0b00111001, segments A, D, E, F, and G */
		.equ 	THIRTEEN,	0x0000005E		/* =0b01011110, segments B, C, D, E, and G */	
		.equ 	FOURTEEN,	0x00000079
		.equ 	FIFTEEN,	0x00000071
		.equ	P,			0x00000073
		.equ	W,			0x0000001D
		.equ	I,			0x00000030
		.equ	N,			0x00000037