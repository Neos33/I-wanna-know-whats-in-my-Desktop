/// @description 
if !instance_exists(objPlayer) exit;


if spin and objPlayer.frozen == false and other.y >= 416
{
	play_sfx(sndGlassBrokeEcho);
	//var _data = layer_get_id("Tiles");
	//depth = layer_get_depth(_data) + 1;
	
	instance_destroy(objTriggerTouch);
	instance_destroy(objFist);
	
	//Particles 
	part_particles_create(global.pGemBroken_System,
	x+random_range(-3,3),y+random_range(-3,3),global.pGemBroken_Type,40);
	
	instance_destroy();	
}
