/// @description 
obj = objPlayer;
scrollSpeed = 0.05;

orig_x_size = 1024;
orig_y_size = 576;

zoomSpeed = 0.2;
zoom = 1;
zoomTarget = zoom;

if instance_exists(obj)
{
	x = obj.x;
	y = obj.y;
}