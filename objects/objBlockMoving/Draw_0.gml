/// @description 
vertex_submit(vBuff, pr_trianglelist, texture);
//draw_vertex(x,y);
//draw_self();
//vertex_position(vBuff,x,y)

/*
draw_set_colour(c_white);
var tex = sprite_get_texture(sprite, 0);
draw_primitive_begin_texture(pr_trianglestrip, tex);
draw_vertex_texture_color(x, y, 0, 0, c_yellow, 1);
draw_vertex_texture_color(x+sprite_width, y, 1, 0, c_fuchsia, 1);
draw_vertex_texture_color(x, y+sprite_height, 0, 1, c_green, 1);
draw_vertex_texture_color(x+sprite_width, y+sprite_height, 1, 1, c_red, 1);
draw_primitive_end();

draw_hitbox(c_fuchsia);
