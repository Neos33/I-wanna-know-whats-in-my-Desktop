/// @description 
var record = is_pressed(ord("S"));
if record 
	print(string_interp("case {0}:",timer));
	
timer++;


switch (timer)
{
	case 1: play_sfx(sndCherry); break;
	
	// Start lyrics
	case 3050: with objMGR_HUD { alarm[1] = 1; }break;
	case 3127: with objMGR_HUD { alarm[0] = 1; } with objMGR_Raiden {canPunch = true;} break;
	case 3128:
	case 3370:
	case 3675:
	case 3926:
	case 4241:
	case 4515:
	case 6196:
	case 6482:
	case 6765:
	case 7034:
	case 7325:
	case 7560:
	case 7710:
	//case 7759:
	case 8346:
		nameIndex = irandom(1);
		var disc = instance_create_depth(irandom(700),irandom(400),-lyrics_index,objMGR_People);
		disc . text = lyrics[lyrics_index];
		disc . name = names[nameIndex];
		disc . pfp_index = nameIndex;
		disc . colorRole = make_color_hsv(irandom(255),255,255);
		lyrics_index++;
	break;
	case 18000:
		play_sfx(sndBlockChange);
	break;
}