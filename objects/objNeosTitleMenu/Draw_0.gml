/// @description Draw the menu
// You can write your code in this editor
var wText = string_width("AAAA AAAA");
var hText = string_height("A") - 8;
var vSep = 48;
var c = c_white;

var aLength = array_length(optionSelect);
setDrawSettings(,fa_center,fa_middle,c_white,image_alpha);
for (var i = 0; i < aLength; ++i) 
{
    draw_sprite_ext(sprPoint2x2,0, 512, 272+32 + vSep * i,wText-5,hText,0,c_black,optionAlpha[i]*0.5);
	if optionIndex == i c = c_orange; else c = c_white;
	draw_text_color(512, 272+32+vSep*i, optionSelect[i],c,c,c_white,c_white,optionAlpha[i])
}
draw_set_alpha(image_alpha);

// Draw pointer / arrows
//draw_sprite(sprCherry,0, shiftX + 512 - 256, shiftY + 304 + vSep * optionIndex);
//draw_sprite(sprCherry,0, shiftX + 512 + 256, shiftY + 304 + vSep * optionIndex);
//var image_size = 128;
//draw_sprite_stretched_ext(sprProfile_Neos,0,1024-160,576-160,image_size,image_size,c_white,image_alpha);
//draw_set_halign(fa_center);
//draw_text_color(1024-160+image_size/2,576-160+image_size+16,"Made by Neos",c_white,c_white,c_white,c_white,image_alpha);

//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);
//draw_text_color(16+48,576-48*2+16,"https://iwcup.com/",c_white,c_white,c_white,c_white,image_alpha);
//draw_sprite_stretched_ext(sprLogoHeyanWeb,0,16,576-48*2,32,32,c_white,image_alpha);

//draw_text_color(16+48,576-48+16,"https://discord.gg/tBzP634duM",c_white,c_white,c_white,c_white,image_alpha);
////draw_sprite_stretched_ext(sprLogoHeyanDiscord,0,16,576-48,32,32,c_white,image_alpha);
//draw_sprite_stretched_ext(sprIcon_Discord,0,16,576-48,32,32,c_white,image_alpha);


// Reset values
setDrawSettings();