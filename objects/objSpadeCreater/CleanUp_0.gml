/// @description Camera focus on kid again
if instance_exists(objPlayer)
{
	with objCamera2
	{
		//obj = objPlayer;
		obj = objDistanceBetween;
		scrollSpeed = 0.05;
	}
	with objDistanceBetween { is_targeted = true; }
}
