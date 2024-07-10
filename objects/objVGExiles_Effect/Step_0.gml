/// @description 
var cam = camera_properties(0);
var _x = cam.view_x+irandom(cam.view_w);
var _y = cam.view_y+irandom(cam.view_h);
var _dire = point_direction(_x,_y,cam.view_x+cam.view_w/2,cam.view_y)+180;

part_type_direction(ptyp,_dire,_dire,0,0);
part_type_direction(ptyp2,_dire,_dire,0,0);
part_particles_create(psys,_x,_y,ptyp,1);
part_particles_create(psys,_x,_y,ptyp2,1);