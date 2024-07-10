/// @description 

// Inherit the parent event


if instance_exists(objPlayer)
{
	//var	_on_block = place_meeting(x, y + global.grav, objPlayer);
	//if _on_block
	if collision_rectangle(x+1,y-1,x+32*image_xscale - 1,y,objPlayer,false,false)
	{
		var _spd = conveyor_spd;
		objPlayer.x += _spd;	
		/*with objPlayer {
			hspd += _spd;	
		}*/
	}
}
event_inherited();

conveyor_animation_current += conveyor_animation_speed;
//conveyor_animation_current = floor(conveyor_animation_current);
conveyor_animation_current = wrap(conveyor_animation_current,0,conveyor_animation_total);

