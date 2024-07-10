/// @description 
number_map = "0123456789";
letter_map = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

number_font = font_add_sprite_ext(sprFt_MGR_Numbers,number_map,false,2);
letter_font = font_add_sprite_ext(sprFt_MGR_Letters,letter_map,true,4);

BGM = audio_play_sound(musMGR, 0, false);
audio_sound_gain(BGM, 0.9, 0);

loopStart = 150.471;
loopEnd = 276.867;

canLoop = false;
canPunch = false;

t = 0;
realTime = 0;

depth = -100;
image_alpha = 0;

punchCount = 0;
im_index = 0;
//alarm[0] = 1;
function draw_mgr_button(_x,_y,_sprite,_scale,_angle,_color,_alpha)
{
	draw_sprite_ext(sprMGR_Button,0,_x,_y,1,1,0,_color,_alpha)
	draw_sprite_ext(_sprite,0,_x,_y,_scale,_scale,_angle,_color,_alpha);
}

#region Particle
pSystem = part_system_create();
part_system_automatic_draw(pSystem,false);

pType = part_type_create();
part_type_sprite(pType,sprBulletThick,false,false,false);
part_type_alpha2(pType,.5,0);
part_type_life(pType,5,20);
part_type_blend(pType,true);
part_type_color_mix(pType,c_yellow,c_orange);

part_type_scale(pType,.5,.5);
part_type_size(pType,.5,.5,.05,0);
part_type_direction(pType,0,180,0,0);
part_type_speed(pType,2,6,-0.05,0);
part_type_orientation(pType,0,0,0,0,true);



#endregion