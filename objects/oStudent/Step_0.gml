	
//Reset directionnal movement
move_towards_point(x,y,0);
	
	
// Sprite attribution
	
if (infected) {
	sprite_index = sStudent_infected_right;
}
else {
	sprite_index = sStudent_sane_right;
}


// Actions depending on state
	
if (state = "move") {
	
	//Change movement if outside the limits of room

	if (place_meeting(x + xspeed, y, oWall)) {
		xspeed = -xspeed;
	}
	if (place_meeting(x, y + yspeed, oWall)) {
		yspeed = -yspeed;
	}
	
	x = x + xspeed;
	y = y + yspeed;
}

else if (state = "stop") {
	
	x = x;
	y = y;
}

else if (state = "follow_target") {
	move_towards_point( target.x, target.y, sprint_speed );
}

else if (state = "conversation_start") {
	
	//Reset directionnal movement
	move_towards_point(x,y,0);
	
	x = target.x + sprite_width;
	y = target.y;
		
	// Stop this and target
	target.move = false;
	move = false;
	
	// Create conversation
	var conversationX = x;
	var conversationY = y - sprite_height/3;
	
	conversation = instance_create_layer(conversationX, conversationY, "Conversations", oConversation);
	conversation.student_giver = id;
	conversation.student_receiver = target;
}

else if (state = "target_unavailable") {
	
	alarm[1] = 1;
}
