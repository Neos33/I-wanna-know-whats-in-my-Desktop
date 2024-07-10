/// @description 
event_inherited();
if exists()
{
	var _player = instance_place(x,y-1,objPlayer);
	
	if _player != noone
	{
	if collision_rectangle(x,y-1+_player.vspd,x+64,y,objPlayer,false,true)
	{
		play_sfx(sndSpring);
		_player.vspd = -12;
		_player.max_vspd = 13 * global.fps_adjust;
		value_to_destination(springMove,-8,"springMove",true,animCurve_Elastic,0,20);
		//springMove = -8;
		alarm[0] = 20;
	}
	}
}