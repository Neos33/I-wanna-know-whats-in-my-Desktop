/// @description ts, ds, BGM volume...etc
ds_list_destroy(attacks);

part_particles_clear(pSys);
part_type_destroy(pTyp);
part_system_destroy(pSys);


part_particles_clear(pSysStar);
part_type_destroy(pTypStar);
part_system_destroy(pSysStar);

part_particles_clear(pSysCircle);
part_type_destroy(pTypCircle);
part_system_destroy(pSysCircle);

part_particles_clear(pSysHit);
part_type_destroy(pTypHit);
part_system_destroy(pSysHit);




if time_source_exists(_ts)
{
	time_source_stop(_ts);
	time_source_destroy(_ts);	
}

audio_sound_gain(global.current_music,1,1500);