/// @description Target attribution

target = false;

// Select a random sane student from sane students list

for (i = 0; i < ds_list_size(global.students_infected); i += 1) {

	target = ds_list_find_value(global.students_infected, i);
	
	// If target is selectable
	if (target.move) {
		target.move = false;
		target.is_targeted = true;
		target.target = false;
		target.target.is_targeted = false;
		break;
	}
	else {
		target = false;
	}
}

// If no target, retry to find one
if (target == false) {
	
	alarm[1] = 128;
}
