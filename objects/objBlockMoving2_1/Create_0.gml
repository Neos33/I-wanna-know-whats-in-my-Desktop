/// @description 
event_inherited();
getLayer = "Tiles_Trap2";
if !layer_exists(getLayer)
{
	print(string_interp("Layer named [{0}] not founded", getLayer))
	print(string_interp("The instance [{0}] will be destroyed", id));
	instance_destroy();
	exit;
}

tile = layer_get_id(getLayer);
tiles = layer_tilemap_get_id(tile);


destroy = false;
