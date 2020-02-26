/// @description Random movement

// Change current speed
xspeed = random_range(-normal_speed, normal_speed);
yspeed = random_range(-normal_speed, normal_speed);


// If out of room, go the opposite way
if (x <= global.room_border) {
	xspeed = normal_speed;
}
else if (x >= room_width - global.room_border - xspeed) {
	xspeed = -normal_speed;
}
if (y <= global.room_border) {
	yspeed = normal_speed;
}
else if (y >= room_width - global.room_border - yspeed) {
	yspeed = -normal_speed;
}


// Start another movement
alarm[0] = irandom_range(24, 128);