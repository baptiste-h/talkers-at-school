/// @description Target attribution

target = false;

// Select a random sane student from sane students list

for (i = 0; i < ds_list_size(global.students_infected); i += 1) {

	var target_var = ds_list_find_value(global.students_infected, i);
	
	// If target is selectable
	if (target_var.selectable) {
		target = target_var;
		target.is_targeted = true;
		break;
	}
}

// If no target, retry to find one
if (target == false) {
	
	alarm[1] = 128;
}
