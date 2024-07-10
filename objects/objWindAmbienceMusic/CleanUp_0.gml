/// @description Stop ambience song
//if variable_instance_exists(id,windAmbience)
if global.lastCutsceneComplete or global.lastBossPhase == 2 
	exit;


audio_stop_sound(windAmbience);
print("wind stopped")