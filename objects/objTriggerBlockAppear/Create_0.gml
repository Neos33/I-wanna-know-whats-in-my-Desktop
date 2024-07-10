/// @description 
triggered = false;
image_alpha = 0;
//mask_index = sprNothing;

function trigger_activate() {
	if (!triggered && global.basicTrigger[trigger]) {
		//mask_index = sprite_index;
		visible = true;
		var inst = instance_create_layer(x,y,"Collisions",objBlock);
		inst . image_xscale = image_xscale;
		inst . image_yscale = image_yscale;
		triggered = true;
	}
}