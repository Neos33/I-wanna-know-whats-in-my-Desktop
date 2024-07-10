/// @description 
if owner != noone and exists(owner)
{
	
	x = owner.x + lengthdir_x(radiusX,angleX);
	y = owner.y + lengthdir_y(radiusY,angleY);
	
	//radiusY = radiusPointY + lengthdir_x(64,angleY);
	
	angleX += 1/3;
	angleY += 1/3;
	
	angleX %= 360;
	angleY %= 360;
	
	
	depth = depthPoint + lengthdir_x(50,angleX-90);
	image_xscale = .7 + lengthdir_x(.3,angleX+90);
	image_yscale = image_xscale;
	image_alpha = image_xscale*1.25;
	//image_blend = make_color_hsv(0,0,255*image_xscale);
	//sprite_index = (angleX > 170 and angleX < 360 and angleX < 10) ? sprCherry : sprSpikeUp
	//sprite_index = (image_alpha > .75) ? sprCherry : sprSpikeUp
	
	if exists()
	{
		if place_meeting(x,y,objPlayer) and image_alpha > .75
		{
			kill_player()
		}
	}

	
}


/*
x = xstart + lengthdir_x(radius,dire + 180);
//y = ystart + lengthdir_y(radius/4,dire + 180);
image_xscale = .75 + lengthdir_x(radiusScale,dire + 90);
image_yscale = image_xscale;
depth = _depth + lengthdir_x(2,dire + 270);
image_blend = make_color_hsv(hue,0,255*image_xscale);