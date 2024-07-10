if trigger_in_action and global.basicTrigger[trigger]
{
	run_trigger();	
}

if spin
{
	image_angle += abs(vspeed); //5	
}

if is_pressed(ord("S"))
{
	print(string_interp("trigger_in_action: {0}",trigger_in_action));
	//print(string_interp("triggered: {0}",triggered));
	print(string_interp("trigger: {0}",trigger));
}

Record(ord("F"),t);
