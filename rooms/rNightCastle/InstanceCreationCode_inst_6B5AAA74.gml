tag = "First round";
visible = false;

contraption = function()
{
	with objS3_BrickKiller
	{
		depth = copyDepth("Instance_Under_Tiles");
		speed = random_range(1,4);
		direction = 90 + random_range(-20,20);
		gravity = .15;
	}
	
	//audio
	play_sfx(sndFartReverb);
	
	instance_destroy(instBlockFart);
	instance_destroy();
	
}