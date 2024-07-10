/// @description 
var cam = camera_properties(0);
var _xx = x;
var _yy = y-30;

// Update position if they are following the camera
if followCamera 
{
	_xx = cam.view_x + camX;
	_yy = cam.view_y + camY-30;
}

//draw_sprite_ext(sprite_index,image_index,_xx,_yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

draw_set_color(image_blend);
draw_set_alpha(image_alpha);

var _growing = 30*image_xscale;
draw_triangle(_xx-_growing,_yy+_growing,_xx+_growing,_yy+_growing,_xx,_yy-_growing,false);

draw_set_color(c_white);
draw_set_alpha(1);

draw_sprite_ext(sprBoshyWarning,0,_xx+1,_yy+4,image_xscale*2,image_yscale*2,image_angle,c_black,image_alpha);