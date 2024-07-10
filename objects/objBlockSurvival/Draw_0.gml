/// @description 
var s = sprTlsDefault_Unused;
switch terrain
{
	case "brown_grass":
		draw_sprite_part_ext(s,0,0,0,32,32,x,y,image_xscale,image_yscale,color,image_alpha);
	break;
	case "brown_rest":	
		draw_sprite_part_ext(s,0,32,0,32,32,x,y,image_xscale,image_yscale,color,image_alpha);
	break;
	
	case "guy_top":
		draw_sprite_part_ext(s,0,0,32,32,32,x,y,image_xscale,image_yscale,color,image_alpha);
	break;
	case "guy_rest":	
		draw_sprite_part_ext(s,0,32,32,32,32,x,y,image_xscale,image_yscale,color,image_alpha);
	break;
}