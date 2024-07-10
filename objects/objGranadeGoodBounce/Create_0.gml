/// @description 
//moveY_to_position(,,room_height-96,false,animCurve_Bounce,0,30);

xspd = 0;
yspd = 0;
grav = 0.1;
bounceDecay = 0.75;
rot_angle = irandom(360);


audio_falloff_set_model(audio_falloff_exponent_distance_clamped);