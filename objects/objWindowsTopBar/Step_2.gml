/// @description 
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if point_in_rectangle(mx,my,x2-45,y1,x2,y1+30)
{
	alphaIcon[0] = lerp(alphaIcon[0],1,.20);
	if mouse_check_button_pressed(mb_left) print("Action #3");
}
else
	alphaIcon[0] = lerp(alphaIcon[0],0,.20);

if point_in_rectangle(mx,my,x2-45*2,y1,x2-45,y1+30)
{
	alphaIcon[1] = lerp(alphaIcon[1],1,.20);
	if mouse_check_button_pressed(mb_left) print("Action #2");
}
else
	alphaIcon[1] = lerp(alphaIcon[1],0,.20);

if point_in_rectangle(mx,my,x2-45*3,y1,x2-45*2,y1+30)
{
	alphaIcon[2] = lerp(alphaIcon[2],1,.20);
	if mouse_check_button_pressed(mb_left) print("Action #1");
}
else
	alphaIcon[2] = lerp(alphaIcon[2],0,.20);
