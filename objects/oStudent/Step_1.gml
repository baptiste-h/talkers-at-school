/// @description Handle state

if (move) {
	state = "move";	
}
else if (!move) {
	state = "stop";
}

if (target != false) {
		
	if ( place_meeting(x,y,target) && target.conversation ) {
		state = "target_unavailable";
	}
	else if ( place_meeting(x,y,target) && !conversation ) {
		state = "conversation_start";
	}
	else if (conversation != false) {
		state = "stop";	
	}
	else {
		state = "follow_target";	
	}
}
