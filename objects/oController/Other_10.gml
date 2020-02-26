/// @description Start Game

// randomize();

// Set room limits
global.room_border = 64;


// Student types
global.students_sane = ds_list_create();
global.students_infected = ds_list_create();


// Spawn students
var students_to_spawn = 50;

for (i = 0; i < students_to_spawn; i+= 1) {
	randomX = irandom_range(global.room_border, room_width - global.room_border);
	randomY = irandom_range(global.room_border, room_height - global.room_border);
	
	student = instance_create_layer(randomX, randomY, "Students", oStudent_sane);
	ds_list_add(global.students_sane, student);
}


// Select random student to infect
var first_infected_index = irandom_range(0, ds_list_size(global.students_sane) - 1);
var first_infected_sane = global.students_sane[|first_infected_index];

// Create first infected student
var first_infected = instance_create_layer(first_infected_sane.x, first_infected_sane.y, "Students", oStudent_infected);
ds_list_add(global.students_infected, first_infected);

// Delete sane student that has been infected
ds_list_delete(global.students_sane, first_infected_index)
instance_destroy(first_infected_sane);
