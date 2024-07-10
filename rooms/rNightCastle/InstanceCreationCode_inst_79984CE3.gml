visible = false;

fake = new trigger_dynamic();

fake.action_begin = function()
{
	t = 0;
}
fake.action_step = function()
{
	t++;
	switch t
	{
		case 1:
			play_sfx(sndSpikeTrap);
			with inst_SUS_Spike
			{
				moveY_to_position(,,48,true,,,5);
			}
		break;
		case 6:
			with inst_SUS_Spike
			{
				moveY_to_position(,,-48,true,,,5);
			}
			instance_destroy();
		break;
	}
}

init_trigger(fake);