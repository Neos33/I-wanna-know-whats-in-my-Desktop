sprite_index = sprBlock_Texture_Center;
image_speed = 0;
image_index = 4;
x+=16;
y+=16;
contraption = function()
{
	move_to_position(,,16*-13,0,true,animCurve_Elastic,,150);	
	scale_to_destination(,,-12,1,false,animCurve_Elastic,,150);	
}
jank = false;