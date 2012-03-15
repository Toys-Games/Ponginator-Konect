				cp		camera_scale two
				cp		camera_x	zero
				cp		camera_y	zero	//initalize values

loop			call	camera		camlocation
				add		camera_x	dx				camera_x
				add		camera_y	dy				camera_y
				add		checkx		xsiz			camera_x
				add		checky		ysiz			camera_y
				blt		flipx		xmax			checkx	//too far right
				blt		flipy		ymax			checky	//too far up
				blt		flipx		camera_x		zero	//too far left
				blt		flipy		camera_y		zero	//too far down
				be		loop		0				0		//keep on trucking
				halt

//Functions
flipx			mult	dx			dx			negone
				be		loop		0			0
flipy			mult	dy			dy			negone
				be		loop		0			0

//Variables
two				.data	2
zero			.data	0
negone			.data	-1
checkx			.data	0
checky			.data	0
xsiz			.data	320	//for scale 2
ysiz			.data	240
xmax			.data	640	//vga memory
ymax			.data	480
dx				.data	1
dy				.data	1

//Drivers
#include ../camera.e
