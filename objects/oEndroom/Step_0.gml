timer -= 1;

if(timer == 0) {
	room_goto(Menu);
	timer = room_speed*5;
}