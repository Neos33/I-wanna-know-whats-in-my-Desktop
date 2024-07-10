/// @description Create BG Grid from IWBT G
var cameraSetup = camera_properties(0);
var camX = cameraSetup.view_x;
var camY = cameraSetup.view_y;

for (var i = 0; i < elements_width; ++i) {
	for (var j = 0; j < elements_height; ++j) {
	    
		// Create BG
		var inst = instance_create_layer(camX+64*i, (camY+64*j), "Misc_Glucagon", objG_GridBG);
		ds_grid_add(elements, i, j, inst);
	}
}

