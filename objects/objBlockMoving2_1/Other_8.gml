/// @description 
jank = false;
hspd = 0;
vspd = 0;
#region specific instance shenanigans
if id == instBlockToPoppo
{
	//print("POPPO");
	
	var below = 0;
	repeat (2)
	{
		var b1 = instance_create_layer(3392+16,608+16+below,"Killers",objBlock);
			b1 . visible = true;
			b1 . sprite_index = sprBlock_Texture_Center;
			b1 . image_index = 5;
			b1 . image_speed = 0;
			//b1 . sprite_index = sprTexture_BrownBlock;
		var b2 = instance_create_layer(3744+16,608+16+below,"Killers",objBlock);
			b2 . visible = true;
			b2 . sprite_index = sprBlock_Texture_Center;
			b2 . image_index = 5;
			b2 . image_speed = 0;
			//b2 . sprite_index = sprTexture_BrownBlock;
			
		below += 32;
	}
	with objMariePoppo
	{
		y = ystart - 216;
		mask_index = sprite_index;
		gravity = 0;
		speed = 0;
	}
	instance_destroy(instTriggerSurvival_1);	
	
}
#endregion
if destroy
{
	instance_destroy();
	layer_destroy(tile);
}
