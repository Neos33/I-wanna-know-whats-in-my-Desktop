/// @description 
if touchedWater exit;

if place_meeting(x,y,objWaterRefresh)
{
	play_sfx(sndThowmp_WaterSplash);
	path_speed = 2;
	touchedWater = true;
	

	for (var i = bbox_left; i < bbox_right; i+=5) {
	    part_particles_create(psys,i,bbox_bottom,ptyp,5);
	}
	
}