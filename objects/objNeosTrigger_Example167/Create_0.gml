/// @description 
image_speed = 0;
image_index = 1;

#region surface
surf = -1;

reflect_index = 0;
reflect_speed = 1/4;
reflect_total = 16;

alarm[1] = 1;

function color_gem(_saturation)
{
	var _get_color;

	switch image_index
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
#endregion

easy_get = new trigger_dynamic();
spikesWalls = new trigger_dynamic();
get_fisted = new trigger_dynamic();
t = 0;
spin = false;

#region 1st Trigger
easy_get.action_begin = function()
{
	duration = 60;
	moveY = 0;
}
easy_get.action_step = function()
{
	if moveY < 30
	{
		y = lerp(y,ystart-64,moveY/30);
		moveY++;
	}
	if t == 40
	{
		var camo = instance_create_depth(x,y,depth+1,objS4_BigBounceCherry);
		camo . vspeed = 0;
		camo . gravity = 0.1;
		play_sfx(sndBlockChangeEcho);
		with objSave vspeed = 3;
	}
	if t == 150
	{
		set_next_trigger(spikesWalls);	
	}
	if exists()
		t++;
	else
		t=-1;	
}
#endregion

#region 2nd Trigger
spikesWalls.action_begin = function()
{
	duration = 200;
	t = 0;
	spin = false;
	var _prev_trigger = trigger;
	remove_prev_trigger(_prev_trigger);
	
	trigger++;
	global.basicTrigger[trigger] = false; //Reset trigger
	
	var _trg = instance_create_layer(0,400,"Triggers",objTriggerTouch);
	_trg . trigger = trigger;
	_trg . image_xscale = 32;

}

spikesWalls.action_step = function()
{
	if exists()
		t++;
	else
		t=-1;	
	
	switch t
	{
		case 10:
			warning_zone(0,224,"Above_Player",13,6);
			warning_zone(608,224,"Above_Player",13,6);
		break;
		
		case 90:
			with objDangerZoneRegion { FadeOut = true; }
			play_sfx(sndSpikeTrapEcho);
			
			for (var i = 0; i < 6; i++)
			{
				var lBarrier = instance_create_layer(-32,224+32*i,"Killers",objSpikeRight);
				with lBarrier 
					move_to_position(,,32*13,0,true,animCurve_Cubic,"In",60);
				
				var rBarrier = instance_create_layer(1024,224+32*i,"Killers",objSpikeLeft);
				with rBarrier 
					move_to_position(,,-32*13,0,true,animCurve_Cubic,"In",60);
			}
			
		break;
		
		case 150:
			alarm[0] = 1;
		break;
		
		
		case 380: alarm[0] = 0; break;
		
		// Spike wall goes away
		case 400:
			with objSpikeRight { gravity = .3; gravity_direction = 180; }
			with objSpikeLeft { gravity = .3; gravity_direction = 0; }
		break;
		
		// Move the item on the top right and prepare to say "CATCH ME"
		case 460:
			move_to_position(,,960, 128-32,false,animCurve_Cubic,"In",60);
			play_sfx(sndSolidusLine_OverHereEcho,.7);

			with objBlockMoving2
			{
				move_to_position(,,-64,0,true,animCurve_Cubic,"In",50);
			}
		break;
		
		case 570:
			
			speed = 6;
			direction = 95;
			gravity = 0.3;
			spin = true;
			repeat (3)
				play_sfx(sndGura_CatchMeEcho,.7);
		break;
		
		// Next trigger
		case 580:
			set_next_trigger(get_fisted);	
		break;
	}

}
#endregion

#region 3rd Trigger

get_fisted.action_begin = function()
{
	t = 0;
	duration = 60;
	activated = false;
	
	var _prev_trigger = trigger;
	remove_prev_trigger(_prev_trigger);
	
	trigger++;
	global.basicTrigger[trigger] = false;
	var _trg = instance_create_layer(896,320+11,"Triggers",objTriggerTouch);
	_trg . trigger = trigger;
	_trg . image_xscale = 2;
	_trg . image_yscale = 2;
	
	
	var _fist = instance_create_layer(960,288+5,"Killers",objFist);
	_fist . trigger = trigger;
	_fist . pathID = pthLeft;
	_fist . pspd = 6;
	_fist . pScale = 2.5;
	_fist . image_xscale = .75;
	_fist . image_yscale = .75;
	
	with _fist{
		contraption = function()
		{
				var _tip = instance_create_layer(832,496-64,"Triggers",objText);
					_tip . font = ftReferenceSelection;
					_tip . color = c_white;
					_tip . use_outline = true;
					_tip . color_outline = c_gray;
					_tip . halign = fa_center;
					_tip . text = "Don't jump\nJust be patient";	
					
					play_sfx(sndPunchAttackEcho);
		}
	}
	
	depth = layer_get_depth("Killers");
	
	

	
}

get_fisted.action_step = function()
{
	t++;
	if t < 150
	{
		if !activated
		{
			//play_sfx(sndZaphkiel_Gun_Shot)
			activated = true;
			
			//Spawn a punch
		}
	}
	
}

#endregion
init_trigger(easy_get,3);


#region Custom functions
function remove_prev_trigger(triggerID)
{
	with objTriggerTouch
	{
		if trigger == triggerID
			instance_destroy();
	}	
}

function warning_zone(xx, yy, _layer = "Above_Player", xsize, ysize)
{
	var warning = instance_create_layer(xx,yy,_layer,objDangerZoneRegion);
	warning . image_xscale = xsize;
	warning . image_yscale = ysize;
	warning . image_alpha = 0;	
}
#endregion

















































