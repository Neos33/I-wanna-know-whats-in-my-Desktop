sprite_index = sprS3_SpikeLeft;

ts = -1;
myTrap = new trigger_dynamic();
finishTimeSource = function(_message)
{
	if time_source_exists(ts)
	{
		time_source_stop(ts);
		time_source_destroy(ts);
		print(_message);
	}
}


myTrap.action_begin = function()
{
	t = 0;
	_save = -1;
	light = -1;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
	{
		t = -1;
		finishTimeSource("Kid is dead, stop time sources");
	}
	
	switch t
	{
		case 1:
			play_sfx(sndMvC3_Gal_Tetsui_Fx);
		break;
		case 5:
			light = Create(x,y+16,depth-1,objDummy,sprLightCheap,0,0,0,0,0,c_white,.9);
			
			ts = time_source_create(time_source_game,2,time_source_units_frames,function()
			{
				var p = global.pRecharging_Type;
				var _rng = irandom(360);
				var _x = x + lengthdir_x(128,_rng);
				var _y = y + 16 + lengthdir_y(128,_rng);
				var _dire = point_direction(_x,_y,x,y+16);
					
				part_type_direction(p,_dire,_dire,0,0);
				part_type_scale(p,.25,.25);
				part_type_life(p,20,35);
				part_type_alpha2(p,.75,0);
				part_particles_create(global.pRecharging_System,_x,_y,p,20);
				
				
				p = global.pMSDLight_Type;
				//var _rngSpin = irandom_range(-3,3);
				part_type_orientation(p,0,360,.5,.05,0);
				part_type_alpha3(p,0,.5,0);
				part_particles_create(global.pMSDLight_System,x,y+16,p,1);
				//part_type_orientation(p,0,360,0,0,0);
				
				with light
				{
					image_xscale += .02;
					image_yscale = image_xscale;
				}
			}, [], -1);
			
			time_source_start(ts);
			
			
		break;

		case 100:
			finishTimeSource("Time source ended");
			with light
			{
				scale_to_destination(,,2,2,true,animCurve_Elastic,0,20);
				alpha_to_destination(,0,false,,,25);
			}
		break;
		
		case 150:
			if inside_view(0)
			{
				play_sfx(sndQuick_Fart);
				_save = Create(x,y+16,depth+1,objDummy,sprNeosSave_Center,0,0,0,0,-90,c_white,1);
				with _save
				{
					//alpha_to_destination(0,1,,,,20);
					angle_to_destination(,0,false,,,20);
					moveX_to_position(,,-16,true,animCurve_Cubic,0,20);
					moveY_to_position(,,32,true,,,20);
					scale_to_destination(0,0,1,1,,animCurve_Cubic,,40);
				}
				
				
				// Racic moment
				var _trg = instance_create_layer(1824,176,"Triggers",objTriggerTimer);
				//_trg . visible = true //DEBUG
				_trg . image_xscale = 7;
				_trg . image_yscale = 3;
				_trg . trigger = 144;
				_trg . time = 5;
			}
		break;
		
		case 200:
			var _x = -32;
			var _y = -32;
			if exists(_save) and _save != -1
			{
				_x = _save.x;
				_y = _save.y;
				
				Create(_x-16,_y-16,"Miscellaneous",objSave,sprNeosSave,0,0,1,1,0,c_white,1);
				instance_destroy(_save);
			}
			
			
		break;
	}
}

init_trigger(myTrap);