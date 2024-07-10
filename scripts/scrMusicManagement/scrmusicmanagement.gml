function play_music(music, loop) {
	if (!audio_is_playing(music)) {
	    audio_stop_sound(global.current_music);
    
	    if (music != -1) {
	        global.current_music = audio_play_sound(music, 0, loop);
			//audio_sound_gain(global.current_music,global.display.volBGM,0);
	    } else {
	        global.current_music = music;
	    }
	}
}

function stop_music() {
	if (global.current_music != -1) {
	    audio_stop_sound(global.current_music);
	    global.current_music = -1;
	}
}

function get_music() {
	var music;
	var loop = true;

	switch (room) {
		case rIntro:
	    case rTitle:
			music = musTitle;
			audio_set_loop(true,11.152,126.352);
		break;
		
		//case rTitle: // DELETE THIS
	    case rTest:
		case rFakeIntroductionStage:
	        music = bgmGuyRock;
			audio_set_loop(false);
	        break;
			
        case rStage0114:
		//case rTemplate24:
		//case rStageInternetTransition:
			music = musKarakuriSpirits;
			audio_set_loop(true, 21.936, 183.472);
		break;
		
		case rTemplate24:
			music = musStage2;
			audio_set_loop(false);
		break;
		
		case rStage04:
			music = musCaveStage;
			audio_set_loop(true,31.055,144.388);
		break;
		
		case rStageInternetPreviewEmpty:
		case rStageInternetZoomIn:
		case rStageInternetTransition:
		case rChillRoom1:
			music = musChill1;
			audio_set_loop(true, 12.004, 214.006);
		break;
		
		case rLastBoss:
			music = (global.lastCutsceneComplete or global.lastBossPhase = 2) ? musLastBoss : -1; 
			audio_set_loop(false);
		break;
		
		case rClearScreen:
			music = musRabiRibi;
			audio_set_loop(true, 15.260, 83.832);
		break;
		
		
	    default: music = (!instance_exists(objPlayMusic)) ? -1 : -2; break;
	}

	if (music != -2) {
	    play_music(music, loop);
	}
}


function audio_set_loop(manualLoop = false, startLoop = 0, endLoop = 0)
{
	global.audioLoopSystem.dynamicLoop = manualLoop;
	global.audioLoopSystem.loopStart = startLoop;
	global.audioLoopSystem.loopFinish = endLoop - startLoop;
}