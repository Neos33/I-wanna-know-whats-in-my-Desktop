/// @description Control
var leftKey = is_pressed(global.controls_menu.left);
var rightKey = is_pressed(global.controls_menu.right);

var upKey = is_pressed(global.controls_menu.up);
var downKey = is_pressed(global.controls_menu.down);

var h_input = rightKey - leftKey;
var v_input = downKey - upKey;

var sfxBack = sndGT4MenuBack;
var sfxMove = sndGT4MoveSelect;
var sfxAccept = sndGT4Selected;

var current_page = menu_pages[page];
//var totalEntities = array_length(current_page);

var dataHolder = [
	global.referenceGet_new.genreFangames.number,
	global.referenceGet_new.genreGames.number,
	global.referenceGet_new.genreMemes.number,
	global.referenceGet_new.genrePeople.number,
];
var total_data_entities = [
	global.referenceGet_new.genreFangames.total,
	global.referenceGet_new.genreGames.total,
	global.referenceGet_new.genreMemes.total,
	global.referenceGet_new.genrePeople.total,
];

if !locked
{
	switch page
	{
		case REFERENCE_PAGES.HUB: //Hub
			if h_input != 0
			{
				audio_play_sound(sfxMove, 0, false);	
				index += h_input;
				index = wrap(index,0,3);

			}
			
			if is_pressed(global.controls_menu.accept)
			{
				audio_play_sound(sfxAccept, 0, false);
				page = index + 1;
			}
		break;
		
		case REFERENCE_PAGES.FANGAMES:
		case REFERENCE_PAGES.GAMES:
		case REFERENCE_PAGES.MEMES:
		case REFERENCE_PAGES.PEOPLE:
			if v_input != 0
			{
				audio_play_sound(sfxMove, 0, false);
				menu_selection[page] += v_input;
				menu_selection[page] = wrap(menu_selection[page],0,total_data_entities[page - 1] - 1);
			}
		break;
	}
	
	if is_pressed(global.controls_menu.back)
	{
		if page >= 1 // not in the hub
			page = 0;
		else
		{
			alarm[1] = 1; // going back to main menu
			locked = true;
		}
			
		audio_play_sound(sfxBack, 0, false);
	}
}


//DEBUG
if is_pressed(ord("W"))
{
	getReference(500,300,"Fangames",irandom(10),"Just a test","TEST",sprBlockKiller);	
}
if is_pressed(ord("E"))
{
	getReference(500,300,"Games",irandom(10),"Just a test","TEST",sprBlockKiller);	
}
if is_pressed(ord("T"))
{
	getReference(500,300,"Memes",irandom(10),"Just a test","TEST",sprBlockKiller);	
}
if is_pressed(ord("Y"))
{
	getReference(500,300,"People",irandom(10),"Just a test","TEST",sprBlockKiller);	
}

var totalCards = array_length(card_hoverY);
for (var i = 0; i < totalCards; i++)
{
	if i != index
		card_hoverY[i] = lerp(card_hoverY[i],0,0.10); 
	else
		card_hoverY[index] = lerp(card_hoverY[index],1,0.10);
}


