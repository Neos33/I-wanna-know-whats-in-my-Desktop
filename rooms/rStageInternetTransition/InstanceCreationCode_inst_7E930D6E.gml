visible = false;

contraption = function()
{
	with objPlayer
	{
		playerAudio = {
		sfxJump : sndJump,
		sfxDjump : sndDoubleJump,
		sfxShoot : sndShoot,
		sfxVine : sndVine,
		sfxBonk : sndBonk,

		playerVol : .9
		}
	}	
	
	instance_destroy();
}