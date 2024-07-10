/// @description Create swords
var angle = 270 + irandom_range(-10,10); 
var angleSpawnRNG = angle + irandom_range(-40,40);
var sword = instance_create_depth(x, y, depth + 1, objSpadeVergil);
//sword . image_angle = 270 + irandom_range(-10,10);
with sword
{
	scale_to_destination(1,0,1,1,false,animCurve_Elastic,"In",40);	
	angle_to_destination(angleSpawnRNG,angle,false,animCurve_Elastic,"In",40);	
}


play_sfx(sndMvc3_VergilSword);

alarm[0] = time_frame;
