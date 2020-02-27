/// @description Healing conversation

switch (conversation.state) {
	
	// PREPARATION
	//Set action preparation
	case 0:
		conversation.state = 1;
		alarm[2] = conversation.healing_cooldown;
		break;
		
	// HEALING
	//Remove conversation, heal target, set new target
	case 4:
		instance_destroy(conversation);
		conversation = false;
		
		move = true;
		selectable = true;
		
		target.move = true;
		target.selectable = true;
		
		//TODO add points
		//More points if target not infected before

		
		//Find target in sane students list
		var target_index = ds_list_find_index(global.students_infected, target);
		
		//Create infected student
		var target_infected = instance_create_layer(target.x, target.y, "Students", oStudent_Sane);
		ds_list_add(global.students_sane, target_infected);

		// Delete sane student that has been infected
		ds_list_delete(global.students_infected, target_index)
		instance_destroy(target);
		target = false;
		
		// New target
		alarm[1] = 1;
		break;
}
