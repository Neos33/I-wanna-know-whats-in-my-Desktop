/// @description Insert description here
// You can write your code in this editor
image_alpha = 0;
//image_blend = c_purple;

hue = 192;
sat = irandom_range(180,240);
dark = 10;
image_blend = make_colour_hsv(hue,sat,dark);

sat_start = sat;
sat_goto_start = false;
color_randomize = true;
satu_randomize = false;
sat_iluminate = false;
satTarget = 170;

iluminate = false;
darkTarget = 100;

alarm[0] = 1;