x+=16;
y+=16;
image_speed = 0;
image_index = 6;
sprite_index = sprBlock_Texture_Center;

for (var i = 0; i < 5; ++i) {
    for (var j = 0; j < 5; ++j) {
	    var _inst = instance_create_layer(x+32*i,y+32*j,layer,object_index);
		_inst . groundSFX = (j == 0) ? "Concrete" : "";
		_inst . sprite_index = sprite_index;
		_inst . image_speed = 0;
		_inst . image_index = 6;
	}
}

instance_destroy();