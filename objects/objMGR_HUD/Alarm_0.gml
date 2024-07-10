/// @description 
im_index++;
im_index %= 2;

var _centerX = 1024 * .5;
var _edgeY = 608 - 96;
part_particles_create(pSystem,_centerX,_edgeY+32-16*image_alpha,pType,8);

alarm[0] = 5;