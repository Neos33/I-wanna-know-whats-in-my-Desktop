/// @description 
if !surface_exists(surf)
{
	surf = surface_create(surf_width,surf_height);
}


var cam = camera_properties(0);
if inside_view(0)
{
	surface_copy_part(surf,0,0,application_surface,
					x - cam.view_x,y - cam.view_y,
					surf_width,surf_height);
				
	/*				
	surface_set_target(surf);
	draw_set_color(c_red);
	draw_set_alpha(.4);
	draw_rectangle(0,surf_height,surf_width,surf_height-8,false);
	surface_reset_target();

	draw_set_color(c_white);
	draw_set_alpha(1);*/

	for (var i = 1; i <= 32; ++i) {
	    draw_surface_part_ext(surf,0,i,surf_width,1,x,y+(surf_height+32)-i,1,1,image_blend,i/32)

	}
}
//draw_surface_ext(surf,x,y+(surf_height*2),1,-1,image_angle,image_blend,.3);



