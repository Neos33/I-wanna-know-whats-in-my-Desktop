/// @description 
var _rng = random(360);
var _total = 13;
for (var i = 0; i < _total; ++i) {
    var _att = instance_create_layer(x,y,"Killers",objCherry);
	_att . direction = 360 / _total * i + _rng;
	_att . speed = 4;
	_att . image_speed = 1/15;
}


play_sfx(sndShoot);


alarm[0] = 70;