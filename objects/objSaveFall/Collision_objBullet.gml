/// @description Activate the trigger 
if !global.basicTrigger[trigger] 
{
	global.basicTrigger[trigger] = true;
	image_index = 1;
	
}

instance_destroy(other)