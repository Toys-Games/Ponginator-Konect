		cp		total		zero

loop	call	keyboard	location
		out		2			one						// flash green LED indicator
		cp		lcd_ascii	key_ascii
		cp		lcd_x		total
		call	lcd			lcdlocation
		add	total		total		one
		call	keyboard	location
		out		2			zero						// turn off green LED indicator
		be 		loop		zero		zero
		halt



LED_RED	.data	65535
LED_GREEN	.data 255
key_press	.data	0
key_ascii	.data	0
fillerOne	.data	0
			.data	0
pass_table	.data	112	//"password"
			.data	97
			.data	115
			.data	115
			.data	119
			.data	111
			.data	114
			.data	100
fillerTwo	.data 	0
			.data	0
key_table	.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
pass_total	.data	8
location	.data 	0
total		.data	0
zero		.data 	0
one		.data	1
checkPass	.data	0
checkKey	.data	0
checkCount .data	0




#include ../keyboard.e
#include ../lcd.e
