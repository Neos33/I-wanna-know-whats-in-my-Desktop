/// @description 

// Inherit the parent event
emit = 0;
soundID = sndWindStreamLoop;

emit = audio_emitter_create();
audio_emitter_position(emit,x+x_offset,y+y_offset,0);
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emit,fallStart,maxDist,1);
audio_play_sound_on(emit,soundID,true,1);


//emit_posX = x+x_offset;
emit_posY = y+y_offset;
update_position = false;


ps = part_system_create();
part_system_depth(ps,depth);

pt = part_type_create();
part_type_shape(pt,pt_shape_cloud);
part_type_direction(pt,90,90,0,0);
part_type_speed(pt,6,9,.13,0);
part_type_blend(pt,true);
part_type_orientation(pt,0,360,1,.1,0);
part_type_life(pt,100,200);
part_type_alpha2(pt,.6,0);
part_type_color1(pt,c_white);
part_type_gravity(pt,.001,90);
part_type_size(pt,1,1.5,0,.02);

pemi = part_emitter_create(ps);
part_emitter_region(ps,pemi,x,x+image_xscale*32,y+48,y+48,ps_shape_rectangle,ps_distr_linear);

part_emitter_stream(ps,pemi,pt,2);

