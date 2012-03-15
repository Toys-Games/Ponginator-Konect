loop		cpfa		lcd_ascii	ascii_table		lcd_x
			call		lcd			lcdlocation
			add			lcd_x		lcd_x			one
			blt			loop		lcd_x			linetotal
			halt

ascii_table	.data		89		// "You win!"
			.data		111
			.data		117
			.data		32
			.data		119
			.data		105
			.data		110
			.data		33
linetotal	.data		8
one			.data		1

#include	../lcd.e
