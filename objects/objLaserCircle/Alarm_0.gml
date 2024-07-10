/// @description Aim to player
// You can write your code in this editor

if instance_exists(objPlayer)
	targetDire = point_direction(x,y,objPlayer.x,objPlayer.y);
else if instance_exists(objPlayerSoul)
	targetDire = point_direction(x,y,objPlayerSoul.x,objPlayerSoul.y);
	
direction = targetDire;
speed = irandom_range(30,35) - 7; //-7 is the nerf
image_angle = direction;