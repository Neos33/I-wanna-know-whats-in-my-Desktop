/// @description Particles bg
var _col1 = c_white;
var _col2 = c_white;

if exists(objPaintGradientTitle)
{
	_col1 = objPaintGradientTitle.colorTarget1;
	_col2 = objPaintGradientTitle.colorTarget2;
}
part_type_color_mix(global.pTitleBG_Type,_col1,_col2);
repeat(3)
{
	
	part_particles_create(global.pTitleBG_System,irandom_range(-4,1028),576+16,global.pTitleBG_Type,1);
}

alarm[1] = 5;