/// @description Create lasers

for (var i = 0; i < 4; ++i) {
    var kuro = instance_create_depth(x,y,depth,objLaserCircle);
	//kuro . image_index = i mod 2;
	kuro . image_angle = image_angle + 90 * i;
	kuro . timerAlarm = timerDelta;
	kuro . speed = 0.4;
	kuro . direction = image_angle + 90 * i;
	if i mod 2 == 0
		kuro . image_blend = c_black;
	else
		kuro . image_blend = c_white;
}

if timerDelta > 1
{
	alarm[0] = 2;
	timerDelta = max(1,timerDelta-1);
}
else
{
	timer = 1999;	
}