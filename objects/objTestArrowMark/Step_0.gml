/// @description Insert description here
// You can write your code in this editor
if is_pressed(ord("T")) and !flag
{
	//var CAM = camera_properties(0);
	//var wLenght = CAM.view_x + CAM.view_w;
	//var hLenght = CAM.view_y + CAM.view_h;
	//camera_change_mode(CAMERA.FOLLOW_OBJECT,id,0,0,wLenght,608,CAM.view_x,CAM.view_y,wLenght,hLenght);
	//camera_change_mode(CAMERA.ZOOM_OUT,id,0,0,wLenght,608,CAM.view_x,CAM.view_y,wLenght,hLenght);
	
	if !instance_exists(objG_GridBG_Controller)
	{
		var inst = instance_create_layer(0,0,"Misc_Glucagon",objG_GridBG_Controller);
		inst . target_object = id;
	}
	flag = true;
}
