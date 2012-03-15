// draw boxes over camera


			cp		camera_scale 	screen_3
			cp		camera_x		screen_0
			cp		camera_y		screen_0			//initalize values

loop			call		camera		camlocation
			
			// Draw rectangles
			cp		vga_x1				screen_x1
			cp		vga_y1				screen_y1
			cp		vga_x2				screen_x2
			cp		vga_y2				screen_y2
			cp		vga_color_write		screen_color
			call		vga_draw_rect			vga_return
			
			cp		vga_x1				screen_1_x1
			cp		vga_y1				screen_1_y1
			cp		vga_x2				screen_1_x2
			cp		vga_y2				screen_1_y2
			cp		vga_color_write		screen_1_color
			call		vga_draw_rect			vga_return
			
			
			// return loop
			be		loop			screen_0		screen_0
			
				
				

// variables
screen_0		.data	0
screen_3		.data	3

screen_x1		.data	10
screen_y1		.data	230
screen_x2		.data	40
screen_y2		.data	430
screen_color	.data	224

screen_1_x1	.data	600
screen_1_y1	.data	230
screen_1_x2	.data	630
screen_1_y2	.data	430
screen_1_color	.data	3

#include ../camera.e
#include ../vga.e
