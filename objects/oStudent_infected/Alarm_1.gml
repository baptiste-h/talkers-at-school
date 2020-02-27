/// @description Target attribution


// Spawn healer if 10 infected students or more
if (ds_list_size(global.students_sane) >= global.healer_spawn_start && !global.healer_spawned) {
	global.healer_spawned = true;
	//event_user(0);
}


target = false;


if (ds_list_size(global.students_sane) > 0) {

	// Select a random sane student from sane students list

	var random_index = irandom_range(0, ds_list_size(global.students_sane) - 1);
	var target_var = ds_list_find_value(global.students_sane, random_index);

	if (target_var.is_targeted == false) {
		target = target_var;
		target.is_targeted = true;
	}

	// If random sane student not targetable, try with other students
	
	else {

		for (i = 0; i < ds_list_size(global.students_sane); i += 1) {

			var target_var = ds_list_find_value(global.students_sane, i);
	
			// If target is not already targeted
			if (target_var.is_targeted == false) {
				target = target_var;
				target.is_targeted = true;
				break;
			}
		}
	}
}

// If no target, retry to find one later
if (target == false) {
	
	alarm[1] = 128;
}
