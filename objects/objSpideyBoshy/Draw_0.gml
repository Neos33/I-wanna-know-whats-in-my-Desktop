/// @description draw thread and spidey
var _distance = y-ystart + 8;
//draw_sprite_ext(sprPoint2x1,0,xstart,ystart,_distance,2*image_yscale,image_angle+270,image_blend,image_alpha);
draw_sprite_ext(sprPoint2x1,0,x,y,_distance,2*image_yscale,image_angle+90,image_blend,image_alpha);

draw_self();
