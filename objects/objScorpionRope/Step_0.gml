/// @description 

if !canGrab_player
{
	if x <= xstart and !done 
	{
		speed = 0;
		x = xstart;
		if !block_grabbed
		{
			if instance_exists(objPlayer)
			{
				with objPlayer
				{
					x = objPlayerGrabbed.x;
					y = objPlayerGrabbed.y;
					visible = true;
				}
				instance_destroy(objPlayerGrabbed);
				done = true;
			}
		}
	}
}

