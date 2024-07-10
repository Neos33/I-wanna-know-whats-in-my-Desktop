/// @description Init

/*enum REFERENCE_TEXT
{
	TEXT_LOCKED,
	TEXT_CLEAREDGAME,
	TEXT_UNLOCKED
}*/
load_references();
enum REFERENCE_PAGES
{
	HUB,
	FANGAMES,
	GAMES,
	MEMES,
	PEOPLE
}

image_alpha = 0;
alarm[0] = 20;
locked = true;


index = 0;

function Reference_Create(_genre,_number,_title,_image) constructor
{
	genre = _genre;
	number = _number;
	title = _title;
	image = _image;
	
}
control_hub = 0;
#region
fangame_references = [
	new Reference_Create("Fangames",1,"Avoid being Trolled",sprBlockDefaultEngine),
	new Reference_Create("Fangames",2,"Okurimono Sunday!",sprBlockDefaultEngine),
	new Reference_Create("Fangames",3,"Avoid being Trolled",sprBlockDefaultEngine),
	new Reference_Create("Fangames",4,"Okurimono Sunday!",sprBlockDefaultEngine),
	new Reference_Create("Fangames",5,"Avoid being Trolled",sprBlockDefaultEngine),
	new Reference_Create("Fangames",6,"Okurimono Sunday!",sprBlockDefaultEngine),
	new Reference_Create("Fangames",7,"Avoid being Trolled",sprBlockDefaultEngine),
	new Reference_Create("Fangames",8,"Okurimono Sunday!",sprBlockDefaultEngine),
	new Reference_Create("Fangames",9,"Avoid being Trolled",sprBlockDefaultEngine),
	new Reference_Create("Fangames",10,"Okurimono Sunday!",sprBlockDefaultEngine)
];
#endregion
#region
game_references = [
	new Reference_Create("Games",1,"100% Orange Juice",sprBlockDefaultEngine),
	new Reference_Create("Games",2,"Gran Turismo 4",sprBlockDefaultEngine),
	new Reference_Create("Games",3,"100% Orange Juice",sprBlockDefaultEngine),
	new Reference_Create("Games",4,"Gran Turismo 4",sprBlockDefaultEngine),
	new Reference_Create("Games",5,"100% Orange Juice",sprBlockDefaultEngine),
	new Reference_Create("Games",6,"Gran Turismo 4",sprBlockDefaultEngine),
	new Reference_Create("Games",7,"100% Orange Juice",sprBlockDefaultEngine),
	new Reference_Create("Games",8,"Gran Turismo 4",sprBlockDefaultEngine),
	new Reference_Create("Games",9,"100% Orange Juice",sprBlockDefaultEngine),
	new Reference_Create("Games",10,"Gran Turismo 4",sprBlockDefaultEngine)
];
#endregion
#region
memes_references = [
	new Reference_Create("Memes",1,"FeelsBadMan",sprBlockDefaultEngine),
	new Reference_Create("Memes",2,"specimenW",sprBlockDefaultEngine),
	new Reference_Create("Memes",3,"FeelsBadMan",sprBlockDefaultEngine),
	new Reference_Create("Memes",4,"specimenW",sprBlockDefaultEngine),
	new Reference_Create("Memes",5,"AAAAA",sprBlockDefaultEngine),
	new Reference_Create("Memes",6,"Sample Text",sprBlockDefaultEngine),
	new Reference_Create("Memes",7,"FeelsBadMan",sprBlockDefaultEngine),
	new Reference_Create("Memes",8,"specimenW",sprBlockDefaultEngine),
	new Reference_Create("Memes",9,"AAAAA",sprBlockDefaultEngine),
	new Reference_Create("Memes",10,"Sample Text",sprBlockDefaultEngine)
];
#endregion
#region
people_references = [
	new Reference_Create("People",1,"Arzztt",sprBlockDefaultEngine),
	new Reference_Create("People",2,"Cosmoing",sprBlockDefaultEngine),
	new Reference_Create("People",3,"Arzztt",sprBlockDefaultEngine),
	new Reference_Create("People",4,"Cosmoing",sprBlockDefaultEngine),
	new Reference_Create("People",5,"Arzztt",sprBlockDefaultEngine),
	new Reference_Create("People",6,"Cosmoing",sprBlockDefaultEngine),
	new Reference_Create("People",7,"Arzztt",sprBlockDefaultEngine),
	new Reference_Create("People",8,"Cosmoing",sprBlockDefaultEngine),
	new Reference_Create("People",9,"Arzztt",sprBlockDefaultEngine),
	new Reference_Create("People",10,"Cosmoing",sprBlockDefaultEngine)
];
#endregion

menu_pages = [control_hub,fangame_references,game_references,memes_references,people_references];
page = REFERENCE_PAGES.HUB;

var length = array_length(menu_pages);
for (var i = 0; i < length; i++) {
	menu_selection[i] = 0;
	if i < length - 1
	{
		card_hoverY[i] = 0;
	}
}
//access_denied = false;
//description = REFERENCE_TEXT.TEXT_LOCKED;
