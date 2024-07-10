//if x > xstart + 32 * 19 and speed != 0
if !block_grabbed
{
	speed = 0;
	play_sfx(sndBreak);
	canGrab_player = false;
	block_grabbed = true;
	alarm[1] = 50;
}