visible = false;

contraption = function()
{
	with objPlayer
	{
		playerAudio = {
		sfxJump : sndJumpEcho,
		sfxDjump : sndDoubleJumpEcho,
		sfxShoot : sndShootEcho,
		sfxVine : sndVine,
		sfxBonk : sndBonk,

		playerVol : 1
		}
	}	
	
	instance_destroy();
}