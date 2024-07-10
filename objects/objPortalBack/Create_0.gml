/// @description 
alarm[0] = 1;

// -------- Particle System --------
// Run this code at the beginning of your game
psys = part_system_create();
part_system_depth(psys, -10);


// -------- Particle Type --------
// Run this code at the beginning of your game
ptyp = part_type_create();
part_type_sprite(ptyp, sprPortalTexture,false,false,false);
part_type_color3(ptyp, 14935011, 15451781, 13161907);
part_type_alpha3(ptyp, 0, 1, 0);
part_type_life(ptyp, 50, 100);
part_type_size(ptyp, 0.5, .75, -.005, 0);
part_type_orientation(ptyp, 0, 360, -1, 0, false);
part_type_blend(ptyp, true);

