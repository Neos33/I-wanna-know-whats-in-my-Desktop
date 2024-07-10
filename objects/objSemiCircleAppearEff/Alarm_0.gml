/// @description 
if isClone == noone
{
	var inst = instance_create_depth(x,y,depth+1,object_index);
	inst . isClone = id;
	inst . image_angle = 180;
	inst . image_alpha = image_alpha;
}