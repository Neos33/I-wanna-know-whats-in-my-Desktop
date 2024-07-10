/// @description 
surf = -1;

reflect_index = 0;
reflect_speed = 1/4;
reflect_total = 16;

alarm[0] = 1;

sprite_index = sprGem;

collected = false;
explodeSFX = sndGemExplode;

timer = 0;

shakeX = 0;
shakeY = 0;

alphaLayer = 0;

#region 3D sound
//sndGemIdle
//soundID = sndGemIdle;
emit = 0;
if soundID != noone
{
emit = audio_emitter_create();
audio_emitter_position(emit,x+x_offset,y+y_offset,0);
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emit,fallStart_3D,maxDist_3D,1);
audio_play_sound_on(emit,soundID,true,1);
}


#endregion


function color_gem(_saturation)
{
	var _get_color;

	switch num
	{
		case 0: _get_color = 0; break;
		case 5: _get_color = 21; break;
		case 2: _get_color = 40; break;
		case 3: _get_color = 80; break;
		case 4: _get_color = 120; break;
		case 1: _get_color = 154; break;
		case 6: _get_color = 190; break;
		case 7: _get_color = 215; break;
	}
	_get_color = make_color_hsv(_get_color,_saturation,255);
	return _get_color;
}