/// @description 

x += hspd;
image_angle += -hspd * angle_factor;
var scaleLimit = map(radius,0,radiusLimit,0,1); 
image_xscale = scaleLimit;
image_yscale = scaleLimit;

if collision_circle(x,y,radius,objPlayer,false,true) and exists() and (radius > 2 or image_alpha == 1)
{
	kill_player();
}