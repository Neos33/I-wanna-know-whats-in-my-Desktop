/// @description 

if place_meeting(x,y+1,objBlock)
{
	xspd *= .80;	
}

//Rotation
rot_angle -= xspd;


draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rot_angle,image_blend,image_alpha);