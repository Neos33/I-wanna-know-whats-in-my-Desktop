/// @description 

var diagonal = 256;
var x_pos = 400;
var thickness = 64;
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x+x_pos,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x+x_pos+diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_vertex_color(x+x_pos+thickness,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x+x_pos+diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_vertex_color(x+x_pos+thickness,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x+x_pos+thickness+diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_primitive_end();

draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x-x_pos,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x-x_pos-diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_vertex_color(x-x_pos-thickness,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x-x_pos-diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_vertex_color(x-x_pos-thickness,bbox_bottom,$333333,image_alpha);
draw_vertex_color(x-x_pos-thickness-diagonal,bbox_bottom+diagonal,$333333,image_alpha);
draw_primitive_end();
draw_self();
