/// @description Target attribution

// Select a random sane student from sane students list

var list_size = ds_list_size(global.students_sane) - 1;
var target_index = irandom_range(0, list_size);

target = ds_list_find_value(global.students_sane, target_index);
