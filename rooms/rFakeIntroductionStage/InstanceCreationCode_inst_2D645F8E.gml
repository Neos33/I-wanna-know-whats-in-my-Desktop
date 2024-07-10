var _total = 4;

for (var i = 0; i < _total; ++i) {
	var _bullet = instance_create_layer(x,y,layer,objS3_CircleProjectile);
	_bullet . owner = id;
	_bullet . radius = 64;
	_bullet . angle = (360 / _total * i);
	_bullet . angle_speed = 1;
	_bullet . sprite_index = sprite_index;
	_bullet . image_speed = 1/15;
}