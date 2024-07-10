visible = false;

contraption = function()
{
	with instFakeSaveS1
	{
		var _fall = Create(x+16,y+16,"Killers",objDummy,sprNeosSave_Center,0,0,,,,,);
		_fall . vspeed = -4;
		_fall . gravity = 0.2;
		with _fall 
		{
			angle_to_destination(,720,,,,150);	
		}
		instance_destroy();
	}
	instance_destroy();	
}