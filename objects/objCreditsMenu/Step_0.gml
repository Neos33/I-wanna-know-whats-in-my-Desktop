/// @description 
var mLeft = is_pressed(global.controls_menu.left);
var mRight = is_pressed(global.controls_menu.right);
var goBack = is_pressed(global.controls_menu.back);

// Audio
var sfxMove = sndGT4MoveSelect;
var sfxBack = sndGT4MenuBack;
var sfxForbbiden = sndGT4NotAllowed;

//var moveInput = mRight - mLeft;
if !locked
{
	if goBack and goBack_allowed
	{
		event_user(0);
		audio_play_sound(sfxBack,0,false);
		alarm[1] = 1;
	}

	var total = array_length(pages);
	if mLeft
	{
		if pagesIndex > 0 
		{
			pagesIndex -= 1;	
			audio_play_sound(sfxMove, 0, false);
		} 
		else audio_play_sound(sfxForbbiden, 0, false);	
	}

	if mRight
	{
		if pagesIndex < total - 1
		{
			pagesIndex += 1;	
			audio_play_sound(sfxMove, 0, false);
		}
		else audio_play_sound(sfxForbbiden, 0, false);	
	}

	moveX = lerp(moveX,pagesIndex*1024,0.20);
}