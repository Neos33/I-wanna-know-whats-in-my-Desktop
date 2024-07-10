/// @description 

Music = audio_play_sound(musCSI_Miami, 0, false);
audio_sound_gain(Music, .9, 0);

//repeat(10)
// if audio jungle option is ON
if global.display.DMCA
	audio_play_sound(musAudioJungle, 1, true);

t = 0;
realTime = 0;
pitchBlack = 0;
text_y = 576;

showGAMEOVER = false;
text_y_gameover = 576;

textCredits = "";

textTitle = "";
textName = "";


function new_line(_text = "", _title = "", _name = "")
{
	textCredits += "\n";
	textCredits += _text;
	
	textTitle += "\n";
	textTitle += _title;
	
	textName += "\n";
	textName += _name;
}
