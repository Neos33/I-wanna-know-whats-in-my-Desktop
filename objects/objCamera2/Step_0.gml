/// @description 
if !instance_exists(obj) exit;


x += (obj.x - x) * scrollSpeed;
y += (obj.y - y) * scrollSpeed;

zoom += (zoomTarget - zoom) * zoomSpeed;
camera_set_view_size(view_camera[0],orig_x_size*zoom,orig_y_size*zoom);

var camWidth = camera_get_view_width(view_camera[0]);
var camHeight = camera_get_view_height(view_camera[0]);

x = clamp(x,camWidth/2,room_width-camWidth/2);
y = clamp(y,camHeight/2,room_height-camHeight/2);

camera_set_view_pos(view_camera[0],x-camWidth/2,y-camHeight/2);

/*
var scroll = mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right);
if scroll != 0
{
	zoomTarget += scroll * 3;
	zoomTarget = clamp(zoomTarget,1,3);
}