		cp		key_total		key_zero
		cp		checkCount	key_zero

loop	call	keyboard	location
		out		2			key_one				// flash green LED indicator
		cpta 	key_ascii	key_table	key_total
		add	key_total	key_total	key_one
		call	keyboard	location
		out		2			key_zero				// turn off green LED indicator
		blt 		loop		key_total	pass_total
		be		check		key_total	pass_total
		halt
		

check	cpfa	checkPass	pass_table	checkCount
		cpfa	checkKey	key_table	checkCount
		add	checkCount	checkCount	key_one	
		bne	fail 		checkPass	checkKey
		blt		check		checkCount	pass_total		
		out		2	LED_GREEN
		halt
fail 	out		1	LED_RED
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
key_total		.data	0
key_zero		.data 	0
key_one		.data	1
checkPass	.data	0
checkKey	.data	0
checkCount .data	0




#include ../keyboard.e
