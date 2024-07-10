/// @description 
var image_size = 128;
//draw_sprite_stretched_ext(sprProfile_Neos,0,1024-160,576-160-32,image_size,image_size,c_white,image_alpha);
//draw_set_halign(fa_center);
//draw_text_color(1024-160+image_size/2,576-160+image_size+16-32,"Made by Neos",c_white,c_white,c_white,c_white,image_alpha);
rect(0,0,1024,32,,c_black,1);


draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_color(16+48,576-48*2+16,"https://iwcup.com/",c_white,c_white,c_white,c_white,image_alpha);
draw_sprite_stretched_ext(sprLogoHeyanWeb,0,16,576-48*2,32,32,c_white,image_alpha);

draw_text_color(16+48,576-48+16,"https://discord.gg/tBzP634duM",c_white,c_white,c_white,c_white,image_alpha);
//draw_sprite_stretched_ext(sprLogoHeyanDiscord,0,16,576-48,32,32,c_white,image_alpha);
draw_sprite_stretched_ext(sprIcon_Discord,0,16,576-48,32,32,c_white,image_alpha);