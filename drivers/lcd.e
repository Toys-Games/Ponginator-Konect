lcd			out			12			lcd_x
			out			13			lcd_y
			out			14			lcd_ascii
			out			10			lcdon
lcdready2go	in			11			lcdresponse
			bne			lcdready2go	lcdon			lcdresponse
			out			10			lcdoff
			ret			lcdlocation
			
lcdon		.data		1
lcdoff		.data		0
lcdresponse	.data		0

//User must input these values
lcdlocation	.data		0
lcd_x		.data		0
lcd_y		.data		0
lcd_ascii	.data		0
