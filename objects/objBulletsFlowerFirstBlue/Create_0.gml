/// @description 
//image_blend = c_blue;
alarm[0] = 1;

angle = 0;
distance = 0;
angleSPD = 0;

distance_start = 0;
angle_start = 0;
distance_target = 0;
distance_going = true;

init = false;
visible = false;

sprite_index = sprTrollface;
image_blend = make_color_hsv(color_get_hue(c_blue),170,255);
setScale(.05);