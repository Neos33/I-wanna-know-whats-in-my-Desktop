/// @description 

if (warp_x == -1 && warp_y == -1) {
	instance_destroy(objPlayer);
} else {
	if (warp_x != -1) {
		objPlayer.x = warp_x;
	}
	
	if (warp_y != -1) {
		objPlayer.y = warp_y;
	}
	objPlayer.visible = true;
	objPlayer.frozen = false;
}

room_goto(roomTo);
//audio_sound_gain(global.current_music,0,0);

//var transition = instance_create_layer(x,y,"Controllers",objStageTransition,
instance_create_layer(x,y,"Controllers",objStageTransition,
{
	roomTo : roomTo,
	autoSave : canAutosave,
	//alarm[0] : 1
//transition . roomTo = roomTo;
//transition . autoSave = canAutosave;
//transition . alarm[0] = 1;
});
