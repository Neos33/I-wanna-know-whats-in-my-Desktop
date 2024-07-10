sprite_index = sprS3_DiamondSpike_Center;
//image_blend = c_black;
depth = copyDepth("Tiles") + 1;
//image_angle = 52;
myTrap = new trigger_dynamic();
ts = -1;

myTrap.action_begin = function()
{
	t = 0;
	alternado = 1;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
	{
		t = -1;
		if time_source_exists(ts)
		{
			time_source_stop(ts);
			time_source_destroy(ts);
		}
	}
	
	//image_angle += vspeed * 4;
	Record(ord("T"),t);
	
	switch t
	{
		case 1:
			play_sfx(sndJil_TargetSighted);
			moveY_to_position(,,-32*6,true,animCurve_Back,0,60);
			angle_to_destination(-360,360,false,animCurve_Back,0,60)
			//vspeed = -10;
			//gravity = .2;
		break;
		
		case 61:
			var _lefthand = instance_create_depth(x,y,depth+1,objJillHand);
			_lefthand . image_xscale = -1;
			_lefthand . owner = id;
			
			var _righthand = instance_create_depth(x,y,depth+1,objJillHand);
			_righthand . owner = id;
			//_righthand . image_blend = c_red;
			
			with _lefthand angle_to_destination(-90,0,false,animCurve_Cubic,2,40);
			with _righthand angle_to_destination(90,0,false,animCurve_Cubic,2,40);

			play_sfx(sndGunLoading);
		break;
		
		case 111:
			repeat 2 { play_sfx(sndGunShot); }
			with objJillHand image_index = 1;
			
			var _reverse = 1;
			repeat 2
			{
				var _bullet = instance_create_depth(x,y,depth+1,objS3Bullet_Grow);
				_bullet . hspeed = 10 * _reverse;
				_bullet . gravity = .25;
				_bullet . gravity_direction = 90 + 90 * _reverse;
			
			
				_reverse *= -1;
			}
		break;
		
		case 115:
			with objJillHand image_index = 0;
		break;
		
		case 282:
			instance_destroy(objS3Bullet_Grow);
		break;
		
		case 213:
			//play_sfx(sndJil_OutOfLuck);
			play_sfx(choose(sndMvC3_DP_Die,sndMvC3_DP_YouMayDie));
			play_sfx(sndJil_Gun_Spin);
			with objJillHand 
			{
				angle_to_destination(,90*image_xscale,false,animCurve_Cubic,2,40);
				color_to_destination(,c_red,animCurve_Cubic,2,40);
				spin_guns = true;
			}
			color_to_destination(,make_color_hsv(0,160,255),animCurve_Cubic,2,40);
		break;
		
		case 273:
			ts = time_source_create(time_source_game,5,time_source_units_frames,function()
			{
				play_sfx(sndGunShot);
				with objJillHand image_index += other.alternado;
			
				var _shot = Create(x,y,depth+1,objCherry,sprBullet,0,.25,4,4,0,c_white,1);
				_shot . vspeed = -10;
			
				y += 4 * alternado;
				alternado *= -1;	
				
			}, [], -1);
			
			time_source_start(ts);
		
		
		break;
		
		case 350:
			var _rain = instance_create_layer(x,y,"Controllers",objS3_DP_BulletFalling_Creater);
			_rain . alarm[0] = 1;
			
			//play_sfx(sndBlockChange);
		break;
		
		case 435:
			time_source_stop(ts);
			
		break;
	}
}

init_trigger(myTrap);