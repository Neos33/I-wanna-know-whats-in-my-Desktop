/// @description 

// Inherit the parent event
if audio_emitter_exists(emit)
	audio_emitter_free(emit);

part_particles_clear(ps);
part_type_destroy(pt);
part_emitter_destroy(ps,pemi);
part_system_destroy(ps);
