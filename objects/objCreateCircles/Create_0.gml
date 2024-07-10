/// @description 
image_speed = 0;
number = 10;
for (var i = 0; i < 360; i += 360 / number)
{
	var entity = instance_create_layer(x,y,layer,objEntityCircles);
	entity . owner = id;
	entity . pointX = x;
	entity . pointY = y;
	entity . radius = 96;
	entity . angle = i;
	
	entity . percentageY = 1;
	entity . percentageX = .5;

	entity . angle_speed = 1;
	entity . radius_speed = 0;
}

