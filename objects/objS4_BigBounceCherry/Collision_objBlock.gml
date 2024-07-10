/// @description 
if growing
{
	growing = false;
	speed = 0;
	gravity = 0.2;
	vspeed = -8;
	depth = layer_get_depth("Killers");
	//Audio
	play_sfx(sndBreakEcho);
	
	part_system_depth(global.pRockSmash_System,depth-1);
	
	repeat(15)
	{
		var range = 10;
		var _ori = choose(0,180);
		part_type_direction(global.pRockSmash_Type,_ori-range,_ori+range,0,-.5);
		part_type_size(global.pRockSmash_Type,.75,1,-.0015,0);
		
		part_particles_create(global.pRockSmash_System,x,bbox_bottom,global.pRockSmash_Type,1);
	}

	alarm[0] = 1;
	part_type_size(global.pRockSmash_Type,.75,1,-.0015,0);
	shaking = true;
}
