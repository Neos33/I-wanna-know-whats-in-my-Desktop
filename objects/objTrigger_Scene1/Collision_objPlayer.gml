/// @description 
if (triggered != trigger) {
	objTrigger.triggered = trigger; //Sets every trigger to this number
	
	if soundID != noone {
		audio_play_sound(soundID, 0, false);
	}
	
	//Activates every triggereable object
	with (objTriggereable) {
		trigger_activate();
	}
	
	with (objTriggereableBlock) {
		trigger_activate();
	}
	
	with inst_TrgChange1
	{
		x += 128;
		trigger = 12;
		soundID = sndGT4Selected;
	}
	
	with instPoppoSurvival
	{
		mode = 1;	
	}
}