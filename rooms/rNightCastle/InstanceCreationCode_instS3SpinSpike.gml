Define(,32,sprS3_DiamondSpike,,,,,,,,);

strecth = new trigger_dynamic();
slash = new trigger_dynamic();

blocky = -1;

strecth.action_begin = function()
{
	t = 0;	
}

strecth.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
		
	switch t
	{
		case 1:
			blocky = instance_create_layer(3040,1152,"Collisions",objBlock);
			blocky . image_yscale = 7;
			//blocky = Create(3040,1152,0,objBlock,sprBlockMask,,,,7);
			
			scale_to_destination(,,1,3,false,,,10);
			play_sfx(sndSpikeTrap);
		break;
		
		case 70:
			angle_to_destination(,-360,false,animCurve_Back,0,60);
			play_sfx(sndSpikeTrap);
		break;
		
		case 130:
			scale_to_destination(,,1,1,false,,,20);
			set_next_trigger(slash);
		break;
	}
}

slash.action_begin = function()
{
	reset_trigger();
	t = 0;
}
slash.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
		
	switch t
	{
		case 1:
			play_sfx(sndSpikeTrap);
			moveY_to_position(,,-32*3,true,,,10);
			
			instance_destroy(blocky);
		break;
		
		case 20:
			play_sfx(sndMvC_Swordout);
			angle_to_destination(0,-360,false,animCurve_Back,0,70);
		break;
		
		case 90:
			move_to_position(,,0,32*2.5,true,,,10);
		break;
		case 100:
			with inst_JillValentine
			{
				y = ystart - 64;
				visible = true;	
			}
				
			instance_destroy();
			
		break;
	}
}

init_trigger(strecth,2);