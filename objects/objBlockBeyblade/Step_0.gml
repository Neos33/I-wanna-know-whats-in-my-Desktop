/// @description 

if instance_exists(objPlayer)
{
	var _w = sprite_xoffset - 1;
	if !land_on_block
	{
		if objPlayer.vspd >= 0
	    {
		    //if bbox_top >= objPlayer.bbox_bottom + objPlayer.vspd
			{
				if collision_rectangle(x-_w-1,y-16,x+_w,y-17,objPlayer,false,false)
				{
					land_on_block = true;
					audio_sound_gain(global.current_music,0,500);
					play_sfx(musBeyblade, 1);
					xx = objPlayer.x - x;
					player_xscale = objPlayer.xscale;
					alarm[0] = 350;
				
					alarm[11] = 100; //Refernce
					global.deaths++;
					with objPlayer
					{
						visible = false;
						frozen = true;
						y -= 32;
						instance_create_depth(x,y+16,0,objBlock);
						
					}
				}
			}
		}
	}
}

x = xstart + lengthdir_x(radius,dire + 180);
//y = ystart + lengthdir_y(radius/4,dire + 180);
image_xscale = .75 + lengthdir_x(radiusScale,dire + 90);
image_yscale = image_xscale;
depth = _depth + lengthdir_x(2,dire + 270);
image_blend = make_color_hsv(hue,0,255*image_xscale);
if land_on_block
{
	dire += min(dire + 1,10);
	//create_shadow(x,y,sprite_shadow,1,,1,image_xscale,depth+1,5,,,);
	if dire > 360
	{
		dire -= 360;
		// Audio
		play_sfx(sndCherry);
		
		// Add a lap counter ??
		
	}
}