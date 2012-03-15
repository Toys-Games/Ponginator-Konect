// Ponginator Konect
// 3-14-12

// ** Draw paddle function
//	disp_draw_paddle(int disp_paddle_y_loc, bool disp_draw_paddle_L)
//	** draws player paddle given color, vertical position (0-19), and player side (L/R)

disp_draw_paddle		be		disp_draw_paddle_set_L	disp_draw_paddle_L	one				// set x-coord and color of pixels
					cp		vga_x1				disp_paddle_R_x						// set x location for R-paddle
					cp		vga_color_write			disp_R_color						// set color for R-paddle
					be		disp_draw_paddle_2
disp_draw_paddle_set_L	cp		vga_x1				disp_paddle_L_x						// set x location for L-paddle
					cp		vga_color_write			disp_L_color						// set color for L-paddle
disp_draw_paddle_2		add		vga_x2				vga_x1			disp_paddle_width
					mult		vga_y1				disp_paddle_y_loc	disp_paddle_delta_y	// set y location of pixels
					add		vga_y2				vga_y1			disp_paddle_height	// add paddle height to paddle y-coord
					call		vga_draw_rect											// call VGA draw rectangle		
					ret		disp_ret												// return from function


disp_draw_paddle_L	.data		0	// 0 = right, 1 = left
disp_draw_paddle_R_x	.data		570	// x-coord of left side of right player paddle (= right_edge - paddle_width)
disp_draw_paddle_L_x	.data		40	// x-coord of left side of left player paddle

disp_paddle_y_loc	.data		0	// int 0 (top) through 19 (bottom)
disp_paddle_delta_y	.data		16	// amount paddle moves per location
disp_paddle_height	.data		160	// height of paddle in pixels
disp_paddle_width	.data		30	// width of paddle in pixels

// ** End disp_draw_paddle


// ** Draw ball function
//	given disp_ball_ctr_x,y and disp_ball_color draw a ball on the display.

disp_draw_ball		cp				vga_color_write		disp_ball_color
				sub				vga_x1			disp_ball_ctr_x			disp_ball_rad
				add				vga_y1			disp_ball_ctr_y			disp_ball_rad
				add				vga_x2			disp_ball_ctr_x			disp_ball_rad
				sub				vga_y2			disp_ball_ctr_y			disp_ball_rad
call				vga_draw_rect		vga_return
ret				disp_ret
halt																//kill program if broken

disp_ball_rad		.data		4	// width of one-half side of the ball
disp_ball_ctr_x		.data		50	// x coordinate of center
disp_ball_ctr_y		.data		50	// y coordinate of center
disp_ball_color		.data		255	// color of ball

//** end disp_draw_ball

// FONT LIBRARIES
//	take in disp_char_x,y and disp_char_sig and disp_char_color

//** large font
//	draws large char at top left location disp_char_x,y of signature disp_char_sig
//	REQ: NUMBERS ONLY (0-9) or colon, or blank

disp_large_char
				cpfa		disp_char_cur		disp_char_arr		disp_char_sig

disp_large_char_draw0
				cp		vga_x1			disp_char_x
				cp		vga_y1			disp_char_y
				add		vga_x2			disp_char_x		disp_large_char_xmax
				add		vga_y2			disp_char_y		disp_large_char_width	

disp_large_char_draw1
disp_large_char_draw2
disp_large_char_draw3
disp_large_char_draw4
disp_large_char_draw5
disp_large_char_draw6
disp_large_char_draw7
disp_large_char_draw8
disp_large_char_draw9
disp_large_char_drawcol
disp_large_char_drawsp

disp_large_char_xmax	.data		30
disp_large_char_ymax	.data		60
disp_large_char_width	.data		10

//** end large font

disp_char_x		.data		0	//top left pixel
disp_char_y		.data		0
disp_char_sig		.data		0	//number between 0-9, space, or colon. see array below for value in ()
disp_char_color		.data		255

//chars
disp_char_cur		.data		0
disp_char_arr		.data		48	//zero (0)
				.data		49	//one (1)
				.data		50	//two (2)
.data		51	//three (3)
				.data		52	//four (4)
.data		53	//five (5)
				.data		54	//six (6)
.data		55	//seven (7)
				.data		56	//eight (8)
.data		57	//nine (9)
				.data		58	//colon (10)
				.data		32	//space (11)


//** END FONT LIBRARIES

Reference:
	VGA commands:
vga_draw_pixel (vga_x, vga_y, vga_color_write)
vga_draw_rect (vga_x1, vga_y1, vga_x2, vga_y2, vga_color_write)
	VGA variables
vga_return

Global Variables:
one		.data		1
zero		.data		0

Not necessarily Global:
disp_ret			.data		0
disp_L_color		.data		3	// left player = blue
disp_R_color		.data		255	// right player = white