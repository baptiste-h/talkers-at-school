/// @description Bubble state

// Activate action and set action timer
if (state = 1) {
	state = 2;
	alarm[0] = 128;
}

// If bubble not valid, destroy
else if (state = 2) {
	instance_destroy()	
}