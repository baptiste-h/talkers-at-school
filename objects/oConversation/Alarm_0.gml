/// @description Conversation state

if (state = "inactive") {
	
	state = "loading";
	alarm[0] = preparation_cooldown;
}
else if (state = "loading") {
	
	state = "action";
	alarm[0] = disable_cooldown;
}
else if (state = "valid") {	
	
	student_giver.conversation = false;
	student_giver.move = true;
	student_giver.alarm[1] = 1; // New target
	
	student_receiver.move = true;
	student_receiver.targeted = false;
		
	instance_destroy();
}
else if (state = "action") {
	
	global.hp += global.PC;
	
	student_giver.conversation = false;
	student_giver.move = true;
	student_giver.alarm[1] = 1; // New target
	
	student_receiver.move = true;
	student_receiver.targeted = false;
	student_receiver.infected = true;
	student_receiver.alarm[1] = 1; // New target
	
	var student_receiver_index = ds_list_find_index(global.students_sane, student_receiver);
		
	//Create infected student
	ds_list_add(global.students_infected, student_receiver);

	// Delete sane student that has been infected
	ds_list_delete(global.students_sane, student_receiver_index)
	
	instance_destroy();
}
else if (state = "healing") {
	
	instance_destroy();
}