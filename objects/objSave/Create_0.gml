image_speed = 0;
sprite_index = (room != rFakeIntroductionStage) ? sprNeosSave : sprSave;
grav = 1;
timeEffect = 20;

function active_save() {
	if (instance_exists(objPlayer) && global.grav == grav && image_index == 0) {
	    save_game(true);
		image_index = 1;
		alarm[0] = 40;
		
		if room != rFakeIntroductionStage
		{
		play_sfx(sndSave);
		/*
		color_to_destination(,merge_color(c_white,c_green,.25),,0,timeEffect);
		move_to_position(x,y,2,-4,true,animCurve_Cubic,0,timeEffect);
		scale_to_destination(1,1,-4/32,4/32,true,animCurve_Cubic,0,timeEffect);
		alarm[1] = timeEffect;*/
		}
	}
}