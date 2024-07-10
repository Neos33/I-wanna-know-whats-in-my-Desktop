/// @description 
x = mouse_x;
y = mouse_y;

if mouse_check_button_pressed(mb_right)
{
	var _inst = instance_create_depth(x,y,depth,objSoulessExpandCircle);
	//_inst . xspd = random_range(-5,5);
	//_inst . yspd = random_range(-3,3);;
}