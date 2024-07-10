/// @description Init
spider_jumpscare = new trigger_dynamic();
//spider_waving = new trigger_dynamic();

waving = false;
time_oscillate = 0;
distance_fall = 216;//242;

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
			move_to_position(,,0,distance_fall,true,animCurve_Normal,0,10);
			play_sfx(sndGodzillaSpider,.5);
		break;
		
		case 150:
			showReference(1024-150,576-200+48,"Fangame","4","I wanna be the Boshy",sprRef_Boshy);
		break;
		
		case 1:
			waving = true;
			play_sfx(sndGodzillaSpider,.5);
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
