with objPlayerKiller
{
	switch object_index
	{
		case objSpikeDown:
		case objTriggerSpikeDown:
			sprite_index = sprS1_SpikeDown;
		break;
		
		case objSpikeLeft:
		case objTriggerSpikeLeft:
			sprite_index = sprS1_SpikeLeft;
		break;
		
		case objSpikeRight:
		case objTriggerSpikeRight:
			sprite_index = sprS1_SpikeRight;
		break;
		
		case objSpikeUp:
		case objTriggerSpikeUp:
			sprite_index = sprS1_SpikeUp;
		break;
	}
}