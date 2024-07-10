/// @description 
count++;

switch count
{
	case 1:
	case 2:
	case 3:
	case 4:
		path_start(path_first,spd,path_action_stop,false);
		orienta += 180;
		play_sfx(sndBreak);
		repeat 25
			part_particles_create(psys,x+irandom_range(-48,48),y-8,ptyp,1);
	break;
	
	case 5:
		path_start(path_second,spd,path_action_stop,false);
		orienta += 180;
		play_sfx(sndBreak);
		repeat 25
			part_particles_create(psys,x+irandom_range(-48,48),y-8,ptyp,1);
	break;
	
	case 6:
		play_sfx(sndBossHit);
		//var _facing = (path_first = pthS3_Normal1) ? 1 : -1;
		for (var i = -32; i <= 32; i+=32) {
			var _x = x + lengthdir_x(16,image_angle-90);
		    //var _spikes = instance_create_layer(_x,y+i-16,"Killers",objSpikeUp);
			var _spikes = instance_create_depth(_x,y+i-16,depth+1,objSpikeUp);
			_spikes . sprite_index = (path_first = pthS3_Normal1) ? sprS3_SpikeRight : sprS3_SpikeLeft;
			_spikes . x -= (path_first = pthS3_Normal1) ? 0 : 32;
		}
		image_index = 1;
		if exists()
		{
			alarm[0] = 160;
			alarm[1] = 1;
			alarm[2] = 20;
			alarm[3] = 20;
		}
		//instance_destroy();
	break;
}