/// @description 
radius = 0;
angle = 0;

angleSpeed = 1;

pointX = x;
pointY = y;

function createCircle(_x,_y, _radius = 32, numCircle = 4, _angle, _angleSPD)
{
	angleSpeed = _angleSPD;
	
	for (var i = 0; i < numCircle; ++i) {
	    var _bullet = instance_create_layer(_x,_y,layer,objS3_CircleProjectile);
		_bullet . owner = id;
		_bullet . radius = _radius;
		_bullet . angle = (360 / numCircle * i) + _angle;
		_bullet . angle_speed = _angleSPD;
	}
	
}

image_speed = 0;