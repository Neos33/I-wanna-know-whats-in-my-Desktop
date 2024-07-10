depth = copyDepth("Tiles") + 1;
y+=32;
sprite_index = sprS1_SpikeRight;

giro = new trigger_dynamic();
baiteo = new trigger_dynamic();
racicAngry = new trigger_dynamic();


giro.action_begin = function()
{
	t = 0;	
}
giro.action_step = function()
{
	t++;
	if t == 1
	{
		angle_to_destination(,90,true,animCurve_Normal,0,30);
		scale_to_destination(,,-3,-3,false,animCurve_Normal,0,30);
		set_next_trigger(baiteo);
	}
}
giro.action_end = function(){}

baiteo.action_begin = function()
{
	t = 0;	
	reset_trigger();
}
baiteo.action_step = function()
{
	t++;
	if t == 1
	{
		angle_to_destination(,90,true,animCurve_Elastic,0,60);
		play_sfx(sndBlockChange);
		set_next_trigger(racicAngry);
	}	
}

racicAngry.action_begin = function()
{
	t = 0;	
	reset_trigger();
}

racicAngry.action_step = function()
{
	t++;
	if t == 1
	{
		color_to_destination(,c_red,,0,300);
	}	
}

init_trigger(giro,3)