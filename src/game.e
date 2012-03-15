// Ponginator Konect
// Main game engine
// 3-14-12

// ** Initialize camera

// ** Wait for Start button push

// ** Pre-level menu(s)

// ** Initialize variables
				cp		game_ball_x		game_ball_start_x	// Set initial coordinates of ball
				cp		game_ball_y		game_ball_start_y
				cp		game_ball_dx		game_ball_start_dx	// Set initial change in x and y (velocity)
				cp		game_ball_dy		game_ball_start_dy


// ** Main game loop
game_loop_start		COPY NEXT STEP HERE AFTER CODE COMPLETE
// *** Get input
				
// *** Process ball location
game_update_ball	add		game_ball_x		game_ball_x		game_ball_dx
			add		game_ball_y		game_ball_y		game_ball_dy
game_check		add		game_check_x		game_ball_x		game_ball_dx
blt		game_flip_x		game_xmax		game_check_x 	//checks if x is out of bounds on top
blt		game_flip_x		game_ball_x		zero			//checks if x is out of bounds on the bottom
	add		game_check_y		game_ball_y		game_ball_dy
blt		game_flip_y		game_ymax		game_check_y 	//checks if y is out of bounds on top
blt		game_flip_y		game_ball_y		zero			//checks if y is out of bounds on the bottom
game_flip_x		mult		game_ball_dx		game_ball_dx		game_negative	//flips the x velocity
			be		game_update_ball	zero			zero
game_flip_y		mult		game_ball_dy		game_ball_dy		game_negative	//flips the y velocity
			be		game_update_ball	zero			zero


// **** Reset ball/update score if necessary
				
// *** Process AI (follow ball)
				
// *** Call Display module
				// Draw left paddle
				cp		disp_draw_paddle_L	one
				cp		disp_paddle_y_loc	game_paddle_L_position
				call		disp_draw_paddle	disp_ret
				
				// Draw right paddle
				cp		disp_draw_paddle_L	zero
				cp		disp_paddle_y_loc	game_paddle_R_position
				call		disp_draw_paddle	disp_ret
				
				// Draw ball
				cp		disp_ball_center_x	game_ball_x
				cp		disp_ball_center_y	game_ball_y
				
				// Draw Score
				
				// Draw menus
				
				// Go to beginning of game loop
				be		game_loop_start		one		one		// loop to start of main game loop

// ** End program
				halt


Local Variables
game_paddle_R_position	.data		0		// vertical position of R-paddle
game_paddle_L_position	.data		0		// vertical position of L-paddle

game_ball_x			.data		0		// x-coord of ball
game_ball_y			.data		0		// x-coord of ball
game_ball_dx			.data		0		// x-velocity of ball
game_ball_dy			.data		0		// y-velocity of ball

game_xmax			.data		640		//maximum x value
game_ymax			.data		480		//maximum y value
game_check_x			.data		0		//used to check out of bounds
game_check_y			.data		0		//used to check out of bounds
game_negative		.data		-1		//used to flip the velocity


// Variable Constants
game_ball_start_x		.data		0		// default x-coord of ball
game_ball_start_y		.data		0		// default x-coord of ball
game_ball_start_dx		.data		0		// default x-velocity of ball
game_ball_start_dy		.data		0		// default y-velocity of ball

Global Variables:
one		.data		1
zero		.data		0

disp functions
disp_draw_paddle(int disp_paddle_y_loc, bool disp_draw_paddle_L)
disp variables
disp_ret