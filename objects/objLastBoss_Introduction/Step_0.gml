/// @description 
/*var _tar_y1 = ystart + distance;
appearEff_Top.y = lerp(appearEff_Top.y,_tar_y1,t/duration);

var _tar_y2 = ystart - distance;
appearEff_Bottom.y = lerp(appearEff_Bottom.y,_tar_y2,t/duration);
*/
//image_blend = merge_color(image_blend,c_white,t/(duration*2));
image_alpha = lerp(image_alpha,1,t/(duration));

t++;

if t == 50
{
	color_to_destination(,c_white,,,50)
}