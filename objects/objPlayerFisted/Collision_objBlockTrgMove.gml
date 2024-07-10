/// @description 
if collide == 0
{

play_sfx(sndSFRCarHit);

x = other.bbox_right;;
speed = 0;
hspeed = 2;
gravity_direction = 270;
gravity = .2;
//alarm[0] = 5;

collide++;
}
