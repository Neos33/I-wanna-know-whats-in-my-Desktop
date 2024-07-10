/// @description
//gpu_set_blendmode(bm_add);
var gearX, gearY;
//var tempX, tempY;
//var a = image_alpha;
gpu_set_texfilter(true);
//draw_self();

// Gears
gearX = x + 45 * image_xscale; gearY = y - 156 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear1,0,gearX,gearY,image_xscale,image_yscale,current_time/30,image_blend,image_alpha);
draw_sprite_ext(sprZaphkiel_Gear1,1,gearX,gearY,image_xscale,image_yscale,-current_time/30,image_blend,image_alpha);

gearX = x - 188 * image_xscale; gearY = y - 3 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear1,0,gearX,gearY,image_xscale*.74,image_yscale*.74,current_time/30,image_blend,image_alpha);
draw_sprite_ext(sprZaphkiel_Gear1,1,gearX,gearY,image_xscale*.74,image_yscale*.74,-current_time/30,image_blend,image_alpha);

gearX = x + 175 * image_xscale; gearY = y + 4 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear2,0,gearX,gearY,image_xscale,image_yscale,current_time/20,image_blend,image_alpha);

gearX = x - 108 * image_xscale ; gearY = y - 117 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear2,0,gearX,gearY,image_xscale*.63,image_yscale*.63,current_time/20,image_blend,image_alpha);

gearX = x + 61 * image_xscale; gearY = y + 98 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear3,0,gearX,gearY,image_xscale,image_yscale,current_time/20,image_blend,image_alpha);
gearX = x - 29 * image_xscale; gearY = y + 59 * image_yscale;
draw_sprite_ext(sprZaphkiel_Gear3,0,gearX,gearY,image_xscale*.9,image_yscale*.9,current_time/20,image_blend,image_alpha);

// Metal
gearX = x + 13 * image_xscale; gearY = y - 14 * image_yscale;
draw_sprite_ext(sprZaphkiel_MetalForeground1,0,gearX,gearY,image_xscale,image_yscale,-current_time/20,image_blend,image_alpha);
draw_sprite_ext(sprZaphkiel_MetalForeground2,0,gearX,gearY,image_xscale,image_yscale,current_time/20,image_blend,image_alpha);

gearX = x + 61 * image_xscale; gearY = y - 84 * image_yscale;
draw_sprite_ext(sprZaphkiel_CirclelForeground,-1,gearX,gearY,image_xscale,image_yscale,0,image_blend,image_alpha);
//Final result (copy this)
//draw_sprite_ext(sprZaphkiel_Gear2,0,gearX,gearY,image_xscale,image_yscale,current_time/20,image_blend,a);

//Debug to take the position
//var relX = debug_x_pos - xstart;
//var relY = debug_y_pos - ystart;
//tempX = x + relX * image_xscale; tempY = y + relY * image_yscale;
//draw_sprite_ext(sprZaphkiel_Gear2,0,tempX,tempY,image_xscale*debug_size,image_yscale*debug_size,current_time/20,image_blend,a);
//draw_sprite_ext(sprZaphkiel_Gear1,1,tempX,tempY,image_xscale*debug_size,image_yscale*debug_size,current_time/20,image_blend,a);

draw_sprite_ext(sprZaphkiel_ClockNumbers,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
gpu_set_texfilter(false);
//gpu_set_blendmode(bm_normal);