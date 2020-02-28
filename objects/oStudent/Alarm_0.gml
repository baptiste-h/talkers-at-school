/// @description Random movement

// Change current speed
xspeed = random_range(-normal_speed, normal_speed);
yspeed = random_range(-normal_speed, normal_speed);

// Start another movement
alarm[0] = irandom_range(24, 128);