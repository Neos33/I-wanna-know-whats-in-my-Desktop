/// @description 

surf = -1;

var cam = camera_properties(0);
surf = surface_create(1024,576);
surface_copy(surf,0,0,application_surface);

localsprite = sprite_create_from_surface(surf,0,0,1024,576,false,false,16,16);

surface_free(surf);

var _centerX = cam.view_x + cam.view_w / 2;
var _centerY = cam.view_y + cam.view_h / 2;
for (var rX = 0; rX < 32; rX++) {
	for (var rY = 0; rY < 18; rY++) {
		xx[rX,rY] = cam.view_x + 32 * rX;
		yy[rX,rY] = cam.view_y + 32 * rY;
		
		dire[rX,rY] = point_direction(_centerX,_centerY,xx[rX,rY],yy[rX,rY]);
		direMove[rX,rY] = random_range(-4,4);
		spd[rX,rY] = random_range(2,5) / point_distance(xx[rX,rY],yy[rX,rY],_centerX,_centerY) * 3;
		angle[rX,rY] = 0;
		angle_speed[rX,rY] = random_range(-6,6);
		angle_choose[rX,rY] = choose(-1,1);
		scale[rX,rY] = 1;
		scale_speed[rX,rY] = 1 / point_distance(xx[rX,rY],yy[rX,rY],_centerX,_centerY);
	}
}