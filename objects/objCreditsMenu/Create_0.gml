/// @description 
image_alpha = 0;
alarm[0] = 20;
canMove = false;
pages = [
	//"Organizers",
	"Software used",
	"Software used",
	"Engines used",
	"Special thanks",
	"Special thanks"
	//"A"
]
pagesIndex = 0;
moveX = pagesIndex;
goBack_allowed = false;

//var getLength = array_length(pages);
//spoilerTag = array_create(getLength,false);
locked = false;


function draw_info(sprite,text = "",info = "",xx = 512,yy = 304,xscale = 128,yscale = 128)
{
	if sprite != undefined
		draw_sprite_stretched_ext(sprite,0,xx,yy,xscale,yscale,c_white,image_alpha);
		
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	draw_text(xx + xscale / 2, yy - 16, text);
	
	draw_set_valign(fa_top);
	draw_text(xx + xscale / 2, yy + yscale + 16, info);
}
















