// Ben Wang
// 2-17-12
// VGA Monitor E100 Driver

// Function parameters:
// 		vga_x					x-coordinate of pixel
// 		vga_y					y-coordinate of pixel
// 		vga_color_write			Color of pixel
// 		vga_return				PC to return to


// Interface:
// PORT	BIT	PURPOSE	VAR NAME
// 60	out 	bit 0:	vga_command
// 61	in 	bit 0:	vga_response
// 62	out 	bit 0:	vga_write
// 63	out 	bits 9-0:	vga_x1[9:0]
// 64	out 	bits 8-0:	vga_y1[8:0]
// 65	out 	bits 9-0:	vga_x2[9:0]
// 66	out 	bits 8-0:	vga_y2[8:0]
// 67	out 	bit 7-0:	vga_color_write[7:0]
// 68	in 	bit 7-0:	vga_color_read[7:0] 


// Set command parameters for drawing pixel
vga_draw_pixel		out		62			vga_1				// vga_write
				out		63			vga_x				// vga_x1
				out		64			vga_y				// vga_y1
				out		65			vga_x				// vga_x2
				out		66			vga_y				// vga_y2
				out		67			vga_color_write		// vga_color_write
				be		vga_command	vga_0			vga_0

// Set command parameters for drawing rectangle
vga_draw_rect		out		62			vga_1				// vga_write
				out		63			vga_x1				// vga_x1
				out		64			vga_y1				// vga_y1
				out		65			vga_x2				// vga_x2
				out		66			vga_y2				// vga_y2
				out		67			vga_color_write		// vga_color_write
				be		vga_command	vga_0			vga_0

// Set command = 1
vga_command		out		60			vga_1

// Wait for response = 1
vga_wait_1		in		61			vga_response
				be		vga_wait_1	vga_response		vga_0

// Set command = 0
				out		60			vga_0

// Wait for response = 0
vga_wait_2		in		61			vga_response
				be		vga_wait_2	vga_response		vga_1

// Return
				ret		vga_return

// Interface variables
vga_x			.data	0
vga_y			.data	0
vga_color_write	.data	0
vga_return		.data	0

vga_x1			.data	0
vga_y1			.data	0
vga_x2			.data	0
vga_y2			.data	0

vga_response		.data	0

vga_0			.data	0
vga_1			.data	1
