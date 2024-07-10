/// @description Insert description here
// You can write your code in this editor
if is_pressed(vk_space)
{
	regroup = true;	
}

if regroup 
{
	y = max(ystart-16,y-spd);	
}
