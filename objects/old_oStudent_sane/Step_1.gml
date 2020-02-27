
//Change movement if outside the limits of room

if (place_meeting(x + xspeed, y, oWall)) {
	xspeed = -xspeed;
}
if (place_meeting(x, y + yspeed, oWall)) {
	yspeed = -yspeed;
}