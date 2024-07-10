/// @description boss hit
if HP > 0
{
	HP--;
	
	play_sfx(sndBossHit, .75);
}
else
{
	instance_destroy();
	instance_destroy(objBlockTrgMove);
	play_sfx(sndDeath);
}

instance_destroy(other);