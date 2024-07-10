/// @description 

if global.basicTrigger[trigger_previous]
{
	// Inherit the parent event
	event_inherited();
	instance_destroy();
}