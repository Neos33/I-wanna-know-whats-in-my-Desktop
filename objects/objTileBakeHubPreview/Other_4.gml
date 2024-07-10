/// @description 
/// @description 
var lay_id = layer_get_id("Tiles");
var map_id = layer_tilemap_get_id(lay_id);
var tileset = tilemap_get_tileset(map_id);
var tile_name = tileset_get_name(tileset);

// Width, height of a single cell in tileset in pixels
var tile_width = tilemap_get_tile_width(map_id);
var tile_height = tilemap_get_tile_height(map_id);

// Block width and height scale factors
var object_width = tile_width / 32;
var object_height =  tile_height / 32;


// Width, height in cells of the current tileset
var tilemap_width = tilemap_get_width(map_id);
var tilemap_height = tilemap_get_height(map_id);

for( var i = 0; i < tilemap_width; i++ ) {
	for( var j = 0; j < tilemap_height; j++ ) {
		 var data = tilemap_get(map_id, i, j);
		 var tile_index = tile_get_index(data);
		 var tile_obj = scr_get_tile_object(tile_name, tile_index);
		 if(tile_obj != noone)
		 {
			 var block = instance_create_layer(i * tile_width, j * tile_height, "Miscellaneous", objDummy);
			 block.image_xscale = object_width;
			 block.image_yscale = object_height;
			 block.visible = false;
			 block.image_blend = c_black;
			 block.sprite_index = sprWhiteSquare;
			 block.image_speed = 0;
		 }
	}
}



layer_tilemap_destroy(map_id);
instance_destroy();
