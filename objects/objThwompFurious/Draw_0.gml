/// @description 
draw_self();

var _shiftX = (image_index == 1) ? 2 : 3;
var _shiftY = (image_index == 1) ? 1 : 2;
draw_sprite_ext(sprLightCheap,0,x-_shiftX*image_xscale,y-_shiftY*image_yscale,image_xscale*.10,image_yscale*.10,0,c_red,1);
draw_sprite_ext(sprLightCheap,0,x+_shiftX*image_xscale,y-_shiftY*image_yscale,image_xscale*.10,image_yscale*.10,0,c_red,1);