//BEGIN DRIVER
camera				out		134				camera_scale
					out		132				camera_x
					out		133				camera_y
					out		130				cameraon					//Set camera_command to on
camwait2receive		in		131				camresponse					//wait for camera response
					bne		camwait2receive	camresponse	cameraon
					out		130				cameraoff					//Set camera_command to off
					ret		camlocation
//DATA
cameraon			.data	1
cameraoff			.data	0
camresponse			.data	0

//USER MUST INPUT THESE
camera_scale	.data	2	//Size of input; 0:80x60, 1:160x120, 2:320x240, 3:640x480
camera_x		.data	0	//x location of top left most pixel
camera_y		.data	0	//y location
camlocation		.data	0	//return memory location

