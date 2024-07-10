jank = false;
image_speed = 0;
image_index = 4;
sprite_index = sprBlock_Texture_Center;
x+=sprite_xoffset;
y+=sprite_yoffset;
block_speed = -9;

contraption = function()
{
	//var _platform = instance_create_depth(x,y,depth,objBlock);
	//_platform . visible = true;
	//_platform . sprite_index = sprite_index;
	//_platform . image_speed = 0;
	//_platform . hspd = pspd * -1;
	
	hspd = block_speed;
	//instance_destroy();
}
