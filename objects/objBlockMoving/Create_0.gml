/// @description 
event_inherited();
sprite = sprTexture_BrownBlock;

texture = sprite_get_texture(sprite,0);

width = sprite_get_width(sprite);
height = sprite_get_height(sprite);

xscale = floor(image_xscale);
yscale = floor(image_yscale);

color = c_white;
alpha = 1;

// Vertex format
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

format = vertex_format_end();

// Vertex buffer
vBuff = vertex_create_buffer();

vertex_begin(vBuff,format);

var yy = 0;
repeat (yscale)
{
	var xx = 0;
	repeat (xscale)
	{
		var _x1 = x+xx; //irandom_range(bbox_left, bbox_right);
		var _y1 = y+yy; //irandom_range(bbox_top, bbox_bottom);
		var _x2 = _x1 + width;
		var _y2 = _y1 + height;
	
		var _depth = -_y2;
	
		var _uvs = sprite_get_uvs(sprite,image_index);
	
		//Triangle 1
		set_vertex_point(vBuff,_x1,_y1,_depth,_uvs[0],_uvs[1],color,alpha);
		set_vertex_point(vBuff,_x2,_y1,_depth,_uvs[2],_uvs[1],color,alpha);
		set_vertex_point(vBuff,_x1,_y2,_depth,_uvs[0],_uvs[3],color,alpha);
	
		//Triangle 2
		set_vertex_point(vBuff,_x2,_y1,_depth,_uvs[2],_uvs[1],color,alpha);
		set_vertex_point(vBuff,_x1,_y2,_depth,_uvs[0],_uvs[3],color,alpha);
		set_vertex_point(vBuff,_x2,_y2,_depth,_uvs[2],_uvs[3],color,alpha);
	
		xx += 32;
	}
	yy += 32;
}

vertex_end(vBuff);
vertex_freeze(vBuff);