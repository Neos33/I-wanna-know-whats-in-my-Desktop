/// @description Destroy bullet


play_sfx(snd_LB_drd_se_eleccharge,.8);

part_particles_create(sys,other.x,other.y,typ,10);

instance_destroy(other);