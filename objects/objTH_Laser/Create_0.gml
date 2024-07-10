/// @description 
image_xscale = 6*32;
image_yscale = 0;
//mask_index = sprNull;

makeSound = true;
maskAlert = true;
image_alpha = 0;
duration = 50;

emit = 0;
max_dist_falloff = 4;
max_dist = 28;
//if soundID != noone
{
	emit = audio_emitter_create();
	audio_emitter_position(emit,x,y,0);
	audio_falloff_set_model(audio_falloff_exponent_distance);
	audio_emitter_falloff(emit,max_dist_falloff,max_dist,1);
}
