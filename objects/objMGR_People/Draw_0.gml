///
var cam = camera_properties(0);
//matrix_set(matrix_world,matrix_build(-cam.view_x,-cam.view_y,0,0,0,0,1,1,1));

/// @description 

var a = image_alpha;
var c = colorText;
var cr = colorRole;

setDrawSettings(ftDiscord,,,c_white,a);

// Draw bg
var bg_width = string_width(text) + 80;
bg_width = clamp(bg_width, 100, 1024);
draw_sprite_ext(sprPoint1x1,0,cam.view_x+x,cam.view_y+y,bg_width,70,image_angle,colors,a);
// Draw profile picture
draw_sprite_ext(pfp,pfp_index,cam.view_x+x + 10,cam.view_y+y + 10,1,1,image_angle,image_blend,a);
// Draw name
draw_text_transformed_color(cam.view_x+x + 63,cam.view_y+y + 10,name,image_xscale,image_yscale,image_angle,cr,cr,cr,cr,a);

// Draw date
var name_w = string_width(name);
var g = c_gray;
draw_text_transformed_color(cam.view_x+x + 73 + name_w,cam.view_y+y + 19,"20/03/2022",image_xscale*.5,image_yscale*.5,image_angle,g,g,g,g,a);


// Draw message
draw_text_transformed_color(cam.view_x+x + 63,cam.view_y+y + 31,text,image_xscale,image_yscale,image_angle,c,c,c,c,a);

	
// Reset values
setDrawSettings();



//matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,1,1));