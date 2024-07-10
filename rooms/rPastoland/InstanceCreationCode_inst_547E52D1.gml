visible = false;

contraption = function()
{
	instance_create_depth(x,y,depth,objAmongUs_SpikeTrap);
	audio_sound_gain(global.current_music,0,600);
	image_blend = c_red;
	
	
	play_sfx(sndBreak);
	with objBlockTrgBrick touched = true;
}