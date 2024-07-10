/// @description Stop the music and particles
audio_stop_sound(BGM);

part_particles_clear(pSystem);
part_type_destroy(pType);
part_system_destroy(pSystem);
