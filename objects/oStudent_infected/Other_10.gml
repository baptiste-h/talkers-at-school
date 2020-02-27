/// @description Spawn healer

for (i = 0; i < ds_list_size(global.students_sane); i += 1) {

	var student_var = ds_list_find_value(global.students_sane, i);
	
	// If student is not targeted
	if (student_var.is_targeted == false) {
		var student = student_var;
		var student_index = i;
		break;
	}
}

//Create healer student
global.healer = instance_create_layer(student.x, student.y, "Students", oStudent_healer);

// Delete initial sane student
ds_list_delete(global.students_sane, student_index)
instance_destroy(student);