/// @description 

if global.lastCutsceneComplete or global.lastBossPhase == 2
{
	instance_destroy();
	exit;
}

windAmbience = audio_play_sound(musWindMusic,0,true);
audio_sound_pitch(windAmbience, .25);
print("Wind created");

