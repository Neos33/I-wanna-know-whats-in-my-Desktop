/// @description 

total = 4;
radius = 64;

dir = 0;


itemX = array_create(total, x);
itemY = array_create(total, y);


for (var i = 0; i < total; ++i) {
	var _get_angle = 360 / total * i;
    var _x = x + lengthdir_x(radius,_get_angle);
	var _y = y + lengthdir_y(radius,_get_angle);
	
	if (global.items[$ "bosses"][i]) 
	{
		var _item = Create(_x,_y,"Collisions_ND",objGemGotShowcase,sprGem,i,0,,,,,);
		_item . pointX = x;
		_item . pointY = y;
		_item . radius = radius;
		_item . angle = _get_angle
	}
}
