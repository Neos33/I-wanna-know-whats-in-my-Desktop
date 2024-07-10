/// @description 
instance_destroy(other);
if HP == -1 exit;

if allow_to_hit
{
	if HP > 1
	{
		HP--;
		play_sfx(sndBossHit, .7);
		var _side = (other.hspeed > 0 ) ? 180 : 0;
		
		var _range = 50;
		part_type_direction(pTypHit,_side-_range,_side+_range,0,0);
		part_particles_create(pSysHit,other.x,other.y,pTypHit,10);
	}
	else
	{
		switch phase
		{
			case 1:
				change_state(cutsene_clock_arrive);
				allow_to_hit = false; 
			break;
				
			case 2:
				//play_sfx(sndDeath);
				HP = 0;
				//instance_destroy();
				
				//Trigger some event here
				change_state(boss_is_dead);
			break;
		}
	}
}