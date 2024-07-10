/// @description 
// You can write your code in this editor
#region Check if save exists
saveFile = "Data1";
optionIndex = 0;

optionSelect = [
	"Start Game",
	"Options",
	//"References",
	"Credits",
	"Exit"
];

var length = array_length(optionSelect);
optionAlpha = array_create(length,0.3);
focus_other_menu = false;
#endregion

alarm[1] = 1; //Particles background
#region Movement menu after choose option menu
	locked = false; //Dont forget to set this on TRUE after release
	//event_execute = 0;
	alphaTitleMenu = 1;
#endregion

function next_menu(xx,yy,object,sound,BG_Color)
{
	instance_create_depth(xx,yy,-100,object);
	audio_play_sound(sound, 0, false);
	
    locked = true;
	focus_other_menu = true;
	
	var col_get_hue = color_get_hue(BG_Color);
	var setColor1 = make_colour_hsv(col_get_hue,150,140);
	var setColor2 = make_colour_hsv(col_get_hue,50,60);
	with objPaintGradientTitle { 
		colorTarget1 = setColor1; 
		colorTarget2 = setColor2; 
	}
	
	with objTitleName
	{
		value_to_destination(alpha,0,"alpha",false,,,25);	
	}
}