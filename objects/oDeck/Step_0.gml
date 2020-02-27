//timer conditions
if (global.hp >= 50 && !timer_active)  {
	timer_active = true;
	timer = 300;
}
else if (global.hp < 50 && timer_active)  {
	timer_active = false;
	timer = 0;
	image_alpha = 0.5
}

//add time
if (timer_active) {
	timer += 1;	
}


image_index = global.hp/10;

if (global.hp >= 50) {
	
	image_index = 4; 
	
	//Hover and pressed state
	
	if(timer >= 300 && point_in_rectangle(mouse_x, mouse_y, x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2)) {

		//hover
		image_xscale = 1.10;
		image_yscale = 1.10;
		
		if(mouse_check_button_pressed(mb_left)){
			pressed = true;
		}

		//focused
		if(mouse_check_button(mb_left) and pressed==true) {
			image_alpha = 0.8;
		}
	
		//press
		if(mouse_check_button_pressed(mb_left)) {
			
			image_alpha = 1;
			pressed = false;
			layer_set_visible("Deckbox", true);
			global.hp -= global.PS;
			timer = 0;
		}
	}

	//Default state
	else { 
		image_xscale = 1;
		image_yscale = 1;
		image_alpha = 1;
	}  
}
if (global.hp < 50 || timer < 300) {
	image_alpha = 0.5;
}


