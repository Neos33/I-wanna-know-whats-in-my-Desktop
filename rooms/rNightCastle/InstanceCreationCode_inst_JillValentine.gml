visible = false;
depth = copyDepth("Tiles") + 1;
Jill_Valentine = new trigger_dynamic();
ts = -1;
		
total_frozen = function()
{
	with objPlayer image_speed = 0;
}

Jill_Valentine.action_begin = function()
{
	t = 0;
}

Jill_Valentine.action_step = function()
{
	//if !instance_exists(objPlayer)
	//{
	//	action.action_end();	
	//}
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
		
	if t < 160 total_frozen();
	if t > 160 image_angle += -speed*2.75;

	
	switch t
	{
		case 5:
			y = ystart - 64;
			visible = true;
			instance_destroy(instS3SpinSpike);
			
			play_sfx(sndSpecialMove);
			instance_create_depth(x,y,depth+2,objVGExiles_Effect);
			var _thunder = instance_create_depth(x,y,depth+1,objAnimationEntity);
			_thunder . sprite_index = sprVG_Thunder;
			_thunder . image_speed = 1/2;
			_thunder . image_xscale = 5;
			_thunder . image_yscale = 1.5;
			
			
			with objPlayer 
			{
				frozen = true;
			}
			instance_destroy(objBetterCamera);
			var cam = camera_properties(0);
			var _ratioX = x - cam.view_w / 4;
			var _ratioY = y - cam.view_h / 4;
			view_position_destination(cam.view_x,cam.view_y,_ratioX,_ratioY,false,animCurve_Back,0,40);
			view_size_destination(cam.view_w,cam.view_h,cam.view_w/2,cam.view_h/2,false,animCurve_Back,0,40);
			color_to_destination(,c_red,,,50);
		break;
		
		case 70:
			var _lefthand = instance_create_depth(x,y,depth+1,objJillHand);
			_lefthand . image_xscale = -1;
			_lefthand . owner = id;
			
			var _righthand = instance_create_depth(x,y,depth+1,objJillHand);
			_righthand . owner = id;
			
			with objJillHand angle_to_destination(,90+45,false,animCurve_Cubic,2,50);
		break;
		case 120:
			repeat 2
				play_sfx(sndJil_OutOfLuck);
				
			play_sfx(sndJil_Gun_Prepare);
			with objJillHand 
			{
				spin_guns = true;
				depth = other.depth - 1;
			}
		break;
		
		case 140:
			with objJillHand angle_to_destination(,0,false,animCurve_Cubic,2,40);
		break;
		
		case 180:
			instance_destroy(objVGExiles_Effect);
			instance_destroy(objAnimationEntity);
			instance_destroy(objVGShadow);
		
			repeat 2
				play_sfx(sndJil_TargetSighted);
			with objPlayer frozen = false;
			with objJillHand 
			{
				followAngle = true;
				image_speed = 1;
			}
			
			direction = 70;
			speed = 10;
			gravity = .3;
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,3072,576*2,false,animCurve_Normal,0,40);
			view_size_destination(cam.view_w,cam.view_h,1024,576,false,animCurve_Normal,0,40);
			
			
			ts = time_source_create(time_source_game,3,time_source_units_frames,function()
			{
				var _x1 = x + lengthdir_x(31,image_angle);
				var _y1 = y + lengthdir_y(31,image_angle);
				
				var _x2 = x + lengthdir_x(31,image_angle+180);
				var _y2 = y + lengthdir_y(31,image_angle+180);
				
				var _inst = instance_create_depth(_x1,_y1,depth+2,objJil_Bullet);
				_inst . direction = image_angle;
				_inst . speed = 10;
			
				_inst = instance_create_depth(_x2,_y2,depth+2,objJil_Bullet);
				_inst . direction = image_angle + 180;
				_inst . speed = 10;
			
				play_sfx(sndJil_Gun_Shot,.4);	
			}, [], -1);
			
			time_source_start(ts);
		break;
		
		case 290:
			time_source_stop(ts);
			action.action_end();
		break;
	}
}

Jill_Valentine.action_end = function()
{
	if time_source_exists(ts)
		time_source_destroy(ts);
		
	instance_create_layer(0, 0, "Controllers", objBetterCamera);
	showReference(150,576-200,"Character","2","Jill Valentine",sprRef_JillValentine);
		
	instance_destroy(objJillHand);
	instance_destroy();
}

init_trigger(Jill_Valentine,1);