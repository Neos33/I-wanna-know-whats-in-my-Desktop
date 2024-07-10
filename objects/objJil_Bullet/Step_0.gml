/// @description 
if place_meeting(x,y,objBlock)
{
	play_sfx(sndJil_Gun_Ammo_Hit,.75);
	var p = global.pJillBulletDestroyed_Type;
	var _dire_range = 30;
	var _dire = direction + 180;
	part_type_direction(p,_dire - _dire_range,_dire + _dire_range,0,0);
	part_particles_create(global.pJillBulletDestroyed_System,x,y,p,10);
	
	instance_destroy();	
}

if !inside_view(0)
	instance_destroy();