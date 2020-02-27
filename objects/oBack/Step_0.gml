//Hover and pressed state
if(point_in_rectangle(mouse_x, mouse_y, x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2)) {

	//hover
	image_xscale = 1.10;
	image_yscale = 1.10;
	image_index = 1;
	if(mouse_check_button_pressed(mb_left)){
		pressed = true;
	}

	//focused
	if(mouse_check_button(mb_left) and pressed==true) {
		image_alpha = 0.8;
	}
	//press
	if(mouse_check_button_released(mb_left)) {
		image_alpha = 2;
		room_goto_previous();
		pressed=false;
	}
}
 
//Default state
else {
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = 1;
	image_index = 0;
}    