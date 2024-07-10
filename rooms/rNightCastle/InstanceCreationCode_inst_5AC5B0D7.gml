visible = false;

contraption = function()
{
	with objS3_CircleCreater
	{
		if depth == copyDepth("Killers_anti")
		{
			angleSpeed *= -1;
		}
	}	
	instance_destroy();
}