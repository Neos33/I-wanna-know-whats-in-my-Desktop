jank = false;
image_speed = 0;
image_index = 4;

sprite_index = sprBlock_Texture_Center;

x+=sprite_xoffset;
y+=sprite_yoffset;

contraption = function()
{
	//move_to_position(,,0,(-16*3+20/2),true,,,10);
	//scale_to_destination(,,1,2+32/20,false,,,10);
	
	move_to_position(,,0,(-96+20)/2,true,,,10);
	scale_to_destination(,,1,(4-20/32),false,,,10);
	
	//move_to_position(,,0,-96+20,true,,,10);
	//scale_to_destination(,,1,4-20/32,false,,,10);
}