/// @description Infecting conversation

switch (conversation.state) {
	
	// PREPARATION
	//Set action preparation
	case 0:
		conversation.state = 1;
		alarm[2] = conversation.action_cooldown;
		break;
		
	// ACTION
	//Action is available
	case 1:
		conversation.state = 2;
		alarm[2] = conversation.disable_cooldown;
		break;
	
	// DISABLE
	//Remove conversation and set new target
	//Enable movement and selection
	case 3:
		instance_destroy(conversation);
		conversation = false;
		
		move = true;
		target.move = true;
		target.is_targeted = false;
		
		alarm[1] = 1; // New target
		break;
	
	// VALID
	//Remove conversation, infect target, set new target and add points
	//Enable movement and selection
	case 2:
		instance_destroy(conversation);
		conversation = false;
		
		move = true;
		target.move = true;
		target.is_targeted = false;
		
		//TODO add points
		//More points if target not infected before

		
		//Find target in sane students list
		var target_index = ds_list_find_index(global.students_sane, target);
		
		//Create infected student
		var target_infected = instance_create_layer(target.x, target.y, "Students", oStudent_infected);
		ds_list_add(global.students_infected, target_infected);

		// Delete sane student that has been infected
		ds_list_delete(global.students_sane, target_index)
		instance_destroy(target);
		target = false;
		
		// New target
		alarm[1] = 1;
		break;
}