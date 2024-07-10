/// @description 
var _spr = sprite_index;

draw_sprite(_spr,0,x,y);

if frame[0] draw_sprite(_spr,1,x+188,y);
if frame[1] draw_sprite(_spr,2,x,y+188);
if frame[2] draw_sprite(_spr,3,x+188,y+188);