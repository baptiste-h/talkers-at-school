
// Inherit the parent event
event_inherited();

//If collision with selectable target
//Engage discussion and stop student and target
if ( place_meeting(x,y,target) && target.selectable ) {
	
	//Reset directionnal movement
	move_towards_point(x,y,0);
	
	x = target.x + sprite_width/2;
	y = target.y;
		
	// Stop this and target
	target.move = false;
	move = false;
	
	target.selectable = false;
	selectable = false;
	
	// TODO
	//conversation = instance_create_layer(x, y - sprite_height/2, "Conversations", oConversation)
	
	alarm[2] = 1;
}

//If target is not selectable on collision and conversation has not started
//Set new target
else if ( place_meeting(x,y,target) && !target.selectable && !conversation ) {
	
	event_user(0);
}
