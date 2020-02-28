
// randomize();
random_set_seed(2);

// Set room limits
room_border = 200;

// Healer variables
global.healer = false;
global.healer_spawn_start = 2; 

// Student types
global.students_sane = ds_list_create();
global.students_infected = ds_list_create();

students_to_spawn = 75;

for (i = 0; i < students_to_spawn; i+= 1) {
	randomX = irandom_range(room_border, room_width - room_border);
	randomY = irandom_range(room_border, room_height - room_border * 1.5);
	
	student = instance_create_layer(randomX, randomY, "Students", oStudent);
	ds_list_add(global.students_sane, student);
}


// Select random student to infect
var first_infected_index = irandom_range(0, ds_list_size(global.students_sane) - 1);
var first_infected = global.students_sane[|first_infected_index];

// Create first infected student
first_infected.infected = true;
first_infected.alarm[1] = 1;
ds_list_add(global.students_infected, first_infected);

// Delete sane student that has been infected
ds_list_delete(global.students_sane, first_infected_index)
