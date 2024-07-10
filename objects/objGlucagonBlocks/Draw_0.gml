/// @description Draw the tile rectangle
// You can write your code in this editor
//var yy = 608 - 32;
draw_sprite_part_ext(sprTlsGlucagon,0,32,0,32,32,x,y,1,1,c_white,image_alpha);

draw_sprite_part_ext(sprTlsGlucagon,0,64,0,32,32,x+32,y,image_xscale-2,1,c_white,image_alpha);

draw_sprite_part_ext(sprTlsGlucagon,0,96,0,32,32,x+32*(image_xscale-1),y,1,1,c_white,image_alpha);

