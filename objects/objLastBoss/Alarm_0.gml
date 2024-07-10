/// @description Particles shadow
part_type_scale(pTyp,image_xscale,image_yscale); //We don't know if she's facing left or right when she's moving (just to prevent visual bug)
part_particles_create(pSys,x,y,pTyp,1);

alarm[0] = 1;