/// @description 
var getTotalPages = array_length(pages);
var a = image_alpha;
var cemterY = camera_get_view_height(view_camera[0]) * .5;

setDrawSettings(ftOptionsNew,fa_center,fa_top,c_white,a);
for (var i = 0; i < getTotalPages; i++)
{
	draw_text(-moveX + 512+1024*i,64+8,pages[i]);
}
var level;

//level = 0;
//draw_info(sprHeyanTrapCup_Logo,"HeYan","- Main host event -",-moveX + 512-128+1024*level,cemterY-128,256,256);

level = 0;
//draw_info(sprSoftware_Aseprite,"Aseprite","- Pixel art program -",-moveX + 512-256-64+1024*level,cemterY-64);
//draw_info(sprSoftware_Gms2,"GameMaker (GMS2)","- Game engine -",-moveX + 512-64+1024*level,cemterY-64);
//draw_info(sprSoftware_Audacity,"Audacity","- Audio editor program -",-moveX + 512+128+64+1024*level,cemterY-64);

draw_info(sprSoftware_Gms2,"GameMaker (GMS2)","- Game engine -",-moveX + 512-128-64+1024*level,cemterY-64);
draw_info(sprSoftware_Aseprite,"Aseprite","- Pixel art program -",-moveX + 512+64+1024*level,cemterY-64);
//draw_info(sprSoftware_Audacity,"Audacity","- Audio editor program -",-moveX + 512+128+64+1024*level,cemterY-64);

level = 1;
//draw_info(sprSoftware_Krita,"Krita","- Art editor program -",-moveX + 512-64+1024*level,cemterY-64);
draw_info(sprSoftware_Krita,"Krita","- Art editor program -",-moveX + 512-128-64+1024*level,cemterY-64);
draw_info(sprSoftware_Audacity,"Audacity","- Audio editor program -",-moveX + 512+64+1024*level,cemterY-64);

level = 2;
draw_info(sprProfile_KingSlendy,"KingSlendy","- King engine -",-moveX + 512-256-64+1024*level,cemterY-64);
draw_info(sprProfile_Synthasmagoria,"Synthasmagoria","- Synth engine -",-moveX + 512-64+1024*level,cemterY-64);
draw_info(sprProfile_renex,"renex","- renex engine -",-moveX + 512+128+64+1024*level,cemterY-64);

level = 3;
draw_info(sprProfile_KingSlendy,"KingSlendy","- Help me on work with GMS2 -\n- Testplay -",-moveX + 512-128-64+1024*level,cemterY-64);
draw_info(sprProfile_EchoMask,"EchoMask","- Motivation -",-moveX + 512+64+1024*level,cemterY-64);
//Echo

level = 4;
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(-moveX + 512+1024*level,cemterY,"Heyan Cup Trap Organizers\nFor give us extra days to finish our games");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
// Draw arrows
var arrowColorsL = c_white;
var arrowColorsR = c_white;
if pagesIndex == 0
	arrowColorsL = c_dkgrey;
if pagesIndex == getTotalPages - 1
	arrowColorsR = c_dkgrey;

draw_sprite_ext(sprNANESpike,0,64-dsin(current_time/10)*8,cemterY-32,-1,2,0,arrowColorsL,a);
draw_sprite_ext(sprNANESpike,0,1024-64+dsin(current_time/10)*8,cemterY-32,1,2,0,arrowColorsR,a);


// Draw black borders
rect(0,0,1024,64*a,0,c_black,a);
rect(0,576-64*a,1024,64,0,c_black,a);
setDrawSettings();