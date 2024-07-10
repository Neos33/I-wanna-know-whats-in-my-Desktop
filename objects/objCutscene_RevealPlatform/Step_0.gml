/// @description Cutscene setup

// Inherit the parent event
event_inherited();


switch (timer)
{
	case 1:
		with objPlayer
			frozen = true;
	break;
		
	case 100:
		with objBetterCamera
		{
			mode = CAMERA.SET_POSITION;
			pointX = 1568;
			pointY = 608;
		}
	break;
		
	case 200:
		with objBetterCamera
		{
			mode = CAMERA.ZOOM_OUT;
			pointX = 1568;
			pointY = 608+152;
			pointW = 1024 / 4;
			pointH = 608 / 4;
			smoothLerp = 0.05;
		}
			
		audio_play_sound(sndAmongUs_Reveal,0,false);
	break;
		
	case 290:
	case 310:
	case 330:
	case 350:
		with instPlatformReveal
			depth = 199;
		//audio_play_sound(sndBlockChange,0,false);
	break;
	case 300:
	case 320:
	case 340:
	case 360:
		//audio_play_sound(sndSpikeTrap,0,false);
		with instPlatformReveal
			depth = 800;
	break;
		
	case 308:
		with objTextIndicate_Platform
		{
			alarm[0] = 1;
		}
	break;
		
	case 420:
		with objBetterCamera
		{
			pointW = 1024;
			pointH = 608;
			pointY = 608;
			smoothLerp = 0.2;
		}
	break;
		
	case 460:
		with objBetterCamera
			mode = CAMERA.NORMAL_TRANSITION;	
				
		with objPlayer
			frozen = false;
				
		global.triggersPersistent[indexPersistent] = true;
	break;
}
