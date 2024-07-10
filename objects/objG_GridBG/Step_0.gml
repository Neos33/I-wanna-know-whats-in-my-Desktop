/// @description Insert description here
// You can write your code in this editor
if color_randomize
	dark = irandom_range(40,50);
	
if satu_randomize
	sat = irandom_range(180,240);
	
if sat_goto_start
	sat = lerp(sat,sat_start,0.10);

if sat_iluminate
	sat = lerp(sat,satTarget,0.10);

if iluminate
	dark = lerp(dark,darkTarget,0.10);	


//Update color values
image_blend = make_colour_hsv(hue,sat,dark);