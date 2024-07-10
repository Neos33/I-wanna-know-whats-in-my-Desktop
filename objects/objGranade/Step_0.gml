/// @description 
if place_meeting(x+hspeed,y,objBlock)
{
	hspeed = -hspeed;	
}
if place_meeting(x,y+vspeed,objBlock)
{
	if abs(vspeed) > 1
	{
		vspeed = -vspeed + sign(vspeed);
		//if !audio_is_playing(sndHe_bounce)
		audio_play_sound(sndHe_bounce,0,false);
		image_blend = c_fuchsia;
	}
	else
	{
		gravity = 0;
		vspeed = 0;
		y = min(y,room_height-96-1);
		image_blend = c_aqua;
		var tempHspeed = abs(hspeed - floor(hspeed));
		if abs(hspeed) > 0
		{
			if abs(hspeed) < 1
			{
				hspeed -= tempHspeed * sign(hspeed);
			}
			else
			{
			hspeed -= (1 * sign(hspeed));
			image_blend = c_yellow;
			}
		}
		//vspeed = max(vspeed - .1, 0);
		//hspeed = max(hspeed - .1, 0);
	}
}

if is_pressed(ord("E"))
{
	print("hspeed: "+string(hspeed));	
	print("vspeed: "+string(vspeed));	
	print("gravity: "+string(gravity));	
}
y = min(y,room_height-96-1);