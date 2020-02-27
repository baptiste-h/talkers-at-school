
if (target != false) {

	//If collision with selectable target
	//Engage discussion and stop student and target
	if ( place_meeting(x,y,target) && !target.conversation ) {
	
		//Reset directionnal movement
		move_towards_point(x,y,0);
	
		x = target.x + sprite_width;
		y = target.y;
		
		// Stop this and target
		target.move = false;
		move = false;
	
		// Create conversation
		var conversationX = x;
		var conversationY = y - sprite_height/2;
	
		conversation = instance_create_layer(conversationX, conversationY, "Conversations", oConversation)
	
		// Set conversation state alarm
		alarm[2] = conversation.preparation_cooldown;
	}


	//If target is not selectable on collision and conversation has not started
	//Set new target
	else if ( place_meeting(x,y,target) && target.conversation && !conversation ) {
	
		//Reset directionnal movement
		move_towards_point(x,y,0);
	
		x = x + xspeed;
		y = y + yspeed;
		
		alarm[1] = 1;
	}


	// Move towards target
	else if (move) {
		move_towards_point( target.x, target.y, sprint_speed );
	}


	// If action available and mouse click on conversation 
	// Set conversation state to success
	if (conversation != false ) {
	
		if ( mouse_check_button(mb_left) && place_meeting(mouse_x, mouse_y, conversation) ) {
		
			if (conversation.state = 2) {
			
				conversation.state = 3;
			
				// Verify success
				alarm[2] = conversation.valid_cooldown;
			}
		
		}
	}
}


// Move normally if no target
else if (move) {
	
	//Reset directionnal movement
	move_towards_point(x,y,0);
	
	x = x + xspeed;
	y = y + yspeed;
	
	image_alpha = 1;
}

if (!move) {
	image_alpha = .5;
}