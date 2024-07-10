/// @description draw zone

// Zone
draw_sprite_ext(sprPoint1x1,0,x,y,sprite_width,sprite_height,0,image_blend,image_alpha*0.15);

// Borders
draw_sprite_ext(sprDangerZone,0,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);


// Exclamation
draw_sprite_ext(sprDangerExclamation,0,x+sprite_width*.5,y+sprite_height*.5,1,1,0,image_blend,image_alpha);