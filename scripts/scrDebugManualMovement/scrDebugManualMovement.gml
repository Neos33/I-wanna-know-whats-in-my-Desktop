// Debug scripts commands
function debug_init_position_command(offset_x = 0, offset_y = 0, offset_scale = 0, scale_percentage = .1)
{
	debug_x_pos = xstart + offset_x;
	debug_y_pos = ystart + offset_y;
	debug_size = image_xscale + offset_scale;
	scale_start = debug_size;
	size_percentage = scale_percentage;
}

function debug_position_command()
{
	// Get relative value if you want to know the 2d coordinates
	var relative_x = debug_x_pos - xstart;
	var relative_y = debug_y_pos - ystart;
	var relative_size = debug_size - scale_start;
	if keyboard_check_pressed(ord("F"))
	{
		show_debug_message("|====================|");
		show_debug_message(string_interp("Object: {0}",object_get_name(id)));
		show_debug_message(string_interp("Relative pos: x = {0} ; y = {1}", relative_x, relative_y));
		show_debug_message(string_interp("Real pos: x = {0} ; y = {1}", debug_x_pos, debug_y_pos));
		show_debug_message(string_interp("Relative scale size: {0}",relative_size));
		show_debug_message(string_interp("Real scale size: {0}",debug_size));
		show_debug_message("|====================|");
	}
	
	// WASD inputs
	var v_input = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	var h_input = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));

	var v_input_f = keyboard_check(ord("H")) - keyboard_check(ord("Y"));
	var h_input_f = keyboard_check(ord("J")) - keyboard_check(ord("G"));
	
	var size_input = (keyboard_check_pressed(ord("I")) - keyboard_check_pressed(ord("O"))) * size_percentage;
	var size_input_f = (keyboard_check(ord("9")) - keyboard_check(ord("8"))) * size_percentage;
	
	if size_input != 0
		debug_size += size_input;
		
	if size_input_f != 0
		debug_size += size_input_f;

	if v_input != 0
		debug_y_pos += v_input;
	
	if h_input != 0
		debug_x_pos += h_input;
	
	if v_input_f != 0
		debug_y_pos += v_input_f;
	
	if h_input_f != 0
		debug_x_pos += h_input_f;
}