/// @description 
if other.frozen == false and !global.basicTrigger[3]
{
	instance_destroy();
	play_sfx(sndGemCollectEcho);
	instance_destroy(objTriggerTouch);
	instance_destroy(objFist);
	
	
	// Create item copy with the transition
	
	var _name_gem = asset_get_index(string_interp("objItemBoss{0}",image_index + 1));
	//instance_create_layer(x,y,"Collisions",_name_gem,{
	//	collected : true,
	//	image_angle : image_angle
	//});
	
	
	//var _name_gem = asset_get_index(string_interp("objItemBoss{0}",image_index + 1));
	var _gem = instance_create_layer(x,y,"Collisions",_name_gem);
	_gem . collected = true;
	_gem . image_angle = image_angle;
	_gem . image_alpha = image_alpha;
	_gem . explodeSFX = sndGemExplodeEcho;
	
	global.items[$ "bosses"][image_index] = true;
	
}
