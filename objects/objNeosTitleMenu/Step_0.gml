/// @description Menu and movement

var moveUp = is_pressed(global.controls_menu.up);
var moveDown = is_pressed(global.controls_menu.down);
var keySelect = is_pressed(global.controls_menu.accept);

var moving = moveDown - moveUp;
var menuLength = array_length(optionSelect) - 1;

// Audio
var sfxEnter = sndGT4SelectConfirmed;
var sfxMove = sndGT4MoveSelect;

// Alpha Control
if !focus_other_menu
{
	for (var i = 0; i < menuLength + 1; ++i) {
		if i != optionIndex // Check if its not the selected one, to avoid jank in the alpha
			optionAlpha[i] = lerp(optionAlpha[i],0.3,0.1);
	}
	optionAlpha[optionIndex] = lerp(optionAlpha[optionIndex],1,0.1);
}
else // Make it invisible to show the next menu
{
	for (var i = 0; i < menuLength + 1; ++i) {
		optionAlpha[i] = lerp(optionAlpha[i],0,0.1);
		
	alphaTitleMenu = lerp(alphaTitleMenu,0,0.1);
}
}
if !locked //Menu
{
    if moving != 0
	{
		optionIndex += moving;
		optionIndex = wrap(optionIndex,0,menuLength);	
		audio_play_sound(sfxMove,0,false);
	}
    if keySelect
    {
        switch (optionIndex)
        {
            case 0: // Start Game
				next_menu(224, 64, objNeosFiles, sfxEnter, c_green);
            break;
                
            case 1: // Options
				next_menu(224, 56, objOptionsType2, sfxEnter, c_purple);
            break;
			
			//case 2: // References
			//	next_menu(224, 56, objReferencesMenu, sfxEnter, c_orange);
			//break; 
			
            case 2: // Credits
				next_menu(224, 64, objCreditsMenu, sfxEnter, c_blue);
            break;
			
			case 3: // Exit
				game_end();
			break;
        }
    }
}
