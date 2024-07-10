/// @description 
var currentSegment = segmentPattern;
with objS2_CherryShoot_Control
{
	count[currentSegment]--;
}

play_sfx(sndDeath);
instance_destroy(other);

var _deathEffect = Create(x,y,layer,objDummy,sprite_index,,0,,,,image_blend,);
with _deathEffect
{
	alpha_to_destination(1,0,,,,15);
	scale_to_destination(,,2,2,false,,,15);
}
instance_destroy();