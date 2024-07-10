/// @description
var cam = camera_properties(0);
var _y = 160;
// Draw shadow
gpu_set_tex_filter(true);

draw_sprite_ext(sprShadow_Message_Final,0,cam.view_x,cam.view_y+_y,cam.view_w,.75,0,c_black,image_alpha*.8);
draw_sprite_ext(sprCheckpoint_Message,0,cam.view_x+cam.view_w/2,cam.view_y+_y,.75,.75,0,c_white,image_alpha*.8);

gpu_set_tex_filter(false);