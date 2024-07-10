y-=32;
sprite_index = sprSpikeBall_Normal;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
	spin = false;
}
myTrap.action_step = function()
{
	t++;

		
	if spin{
		image_angle += -1;	
	}
	
	switch t
	{
		case 1:
			//play_sfx(sndBlockChange);
			var _snd = audio_play_sound(sndUndertale_Star, 0, false);
			audio_sound_pitch(_snd,.45);
			instance_destroy(objS3_DP_BulletFalling_Creater);
			with objJil_Bullet
			{
				var _s = Create(x,y,depth,objDummy,,,,,,,,);
				_s . direction = direction;
				_s . speed = speed;
				with _s
				{
					alpha_to_destination(1,0,,,,40);
					scale_to_destination(,,2,2,,,,40);
				}
				instance_destroy();
			}
		break;
		
		case 2:
			moveY_to_position(,-128,256,true,,,100);
			setScale(8);
			spin = true;
		break;
		
		case 102:
			//Explosion
			if exists()
			{
				var _dire_rng = irandom(360);
				var _total = 360/25;
				var _dif = _total / 2;
				for (var i = 0; i < 360; i+=_total) {
				    var _att = Create(x,y,depth+1,objCherry,sprSpikeBall_Sat,0,0,1,1,0,c_white,1);
					_att . direction = i + _dire_rng;
					_att . speed = 9;
					
					_att = Create(x,y,depth+1,objCherry,sprSpikeBall_Sat,0,0,1,1,0,c_white,1);
					_att . direction = _dif + i + _dire_rng;
					_att . speed = 6;
				}	
			}
			play_sfx(sndUndertale_Explosion);
			
			var _death = Create(x,y,layer,objDummy,,,0,image_xscale,image_yscale,image_angle,,);
			with _death{
				alpha_to_destination(1,0,false,,,15);
				scale_to_destination(,,1,1,true,,,15);
			}
			
			showReference(150,576-200,"Game","2","Undertale",sprRef_Undertale);
			instance_destroy();
		break;
	}
}

init_trigger(myTrap);