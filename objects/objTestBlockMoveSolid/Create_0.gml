/// @description 
event_inherited();

function MOVE(startX = x, startY = y, targetX, targetY, Relative = false, curve = animCurve_Normal, curveSignal, Duration)
{
	var inst = instance_create_depth(startX, startY, depth, objMoveBlocksCommand);
		inst . owner = id;
		inst . destinationX = targetX;
		inst . destinationY = targetY;
		inst . relative_move = Relative;
		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

spider_jumpscare = new trigger_dynamic();

spider_jumpscare.action_begin = function()
{
	timer = 200;
}
spider_jumpscare.action_step = function()
{
	if instance_exists(objPlayer)
		timer--;
	else
		timer = -1;
		
	
	switch timer
	{
		case 199:
			//move_to_position(,,256,0,true,animCurve_Normal,"In",100);
			MOVE(,,256,0,true,animCurve_Normal,"In",100);
			play_sfx(sndBreak);
		break;
		
		case 1:
			play_sfx(sndBreak);
		break;
	}
}
/*
spider_waving.action_begin = function()
{

}
spider_waving.action_step = function()
{

}
*/
init_trigger(spider_jumpscare,1);
