/// @description 

timer++;
if is_pressed(ord("X"))
	print(string_interp("case {0}: Play() break;",timer));
	
var _flick = 0.134;
switch timer
{
	case 3: Play(0,1); break;
	case 40: Play(_flick,1.2); break;
	case 57: Play(random(_flick),1); break;
	case 76: Play(random(_flick),1.2); break; /////
	case 96: Play(random(_flick),1.4); break;
	case 114: Play(random(_flick),1.5); break;
	case 131: Play(random(_flick),1.1); break;
	case 152: Play(random(_flick),1); break; /////
	case 206: Play(random(_flick),0.8); break; //////
	case 216: Play(random(_flick),.7); break; //grave
	case 225: Play(random(_flick),.6); break; //////
	case 276: Play(random(_flick),.4); break; // very grave
	case 297: 
		audio_stop_sound(sndSpikeTrap); 
		audio_sound_set_track_position(sndSpikeTrap,0);
		audio_play_sound(sndSpikeTrap, 0, false); 
		
	break;
}

