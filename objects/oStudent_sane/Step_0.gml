
//Movement

// Move towards target
if (move && target != false) {
	
	move_towards_point( target.x, target.y, sprint_speed );
}

// Move randomly
else if (move) {
	
	//Reset directionnal movement
	move_towards_point(x,y,0);
	
	x = x + xspeed;
	y = y + yspeed;

}


