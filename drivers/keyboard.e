keyboard					out		20					keyon	
keywait2receive			in		21					keyresponse
							bne	keywait2receive	keyresponse	keyon
							in		22					key_press	
							in		23					key_ascii
							out 	20					keyoff
keywait2end				in		21					keyresponse
							bne	keywait2end		keyresponse	keyoff
							ret location
										


keyon		.data	1
keyoff		.data	0
keyresponse	.data	0
