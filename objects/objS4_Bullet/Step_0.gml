/// @description 
image_alpha = min(image_alpha+.025,1);
image_xscale = image_alpha;
image_yscale = image_alpha;


if place_meeting(x,y,objBlock) and vspeed > 0
{
	#region Particles
	//part_system_depth(s,depth-1);
	part_system_depth(global.pRockEscombros_System,copyDepth("Tiles") + 1);
	repeat(15)
	{
		var range = 10;
		var _ori = choose(0,180);
		part_type_direction(global.pRockSmash_Type,_ori-range,_ori+range,0,-.5);
		part_type_size(global.pRockSmash_Type,.25,.5,-.0015,0);
		part_particles_create(global.pRockSmash_System,x,bbox_bottom,global.pRockSmash_Type,1);
		
		part_type_color_mix(global.pRockEscombros_Type,image_blend,c_white);
		part_particles_create(global.pRockEscombros_System,
					x+random_range(-16,16),y+random_range(-16,16),
					global.pRockEscombros_Type,1);
	}
	
	//Reset
	part_type_size(global.pRockSmash_Type,.75,1,-.0015,0);
	#endregion;
	
	//audio_play_sound_on(emit,sndID,false,2);
	audio_falloff_set_model(audio_falloff_exponent_distance_clamped);
	audio_play_sound_at(choose(sndRockSmash1,sndRockSmash2), x, y, 0, 32, 100, 1, false, 1);
	//play_sfx(choose(sndRockSmash1,sndRockSmash2));
	instance_destroy();
}