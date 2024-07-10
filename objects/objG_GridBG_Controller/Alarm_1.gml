/// @description normal BG and tiles fade out
// You can write your code in this editor
var bg = layer_background_get_id("BG_Glucagon");
if bgAlpha < 1
{
	bgAlpha += 0.05;
	layer_background_alpha(bg,bgAlpha);
	alarm[1] = 1;
}
else
{
	var otherBG = layer_background_get_id("Background");
	var otherTile = layer_get_id("Tiles");
	//var otherBlocks = layer_get_id("Collisions");
	
	layer_background_destroy(otherBG);
	layer_destroy(otherTile);
	//layer_destroy_instances(otherBlocks)
}

