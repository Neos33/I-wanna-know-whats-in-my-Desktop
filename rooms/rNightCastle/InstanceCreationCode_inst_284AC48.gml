visible = false;


contraption = function()
{
	var _x = 2208;
	var _y = 256;
	Create(_x,_y,"Miscellaneous",objSave,sprNeosSave,0,0,,,,,);
	
	Create(_x-64,_y,"Miscellaneous",objBlockBullet,sprBlockBullet,0,0,,,,,);
	Create(_x+96,_y,"Miscellaneous",objBlockBullet,sprBlockBullet,0,0,,,,,);
	
	instance_destroy();
}