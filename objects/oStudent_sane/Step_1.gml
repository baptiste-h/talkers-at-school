
//Change movement if outside the limits of room

if (x <= global.room_border || x >= room_width - global.room_border - xspeed) {
	alarm[0] = 1;
}
else if (y <= global.room_border || y >= room_height - global.room_border - yspeed) {
	alarm[0] = 1;
}