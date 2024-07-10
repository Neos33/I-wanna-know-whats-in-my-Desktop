/// @description Move transition menu

if !global.game_started
{
	if !instance_exists(objNeosTitleMenu)
		instance_create_depth(320,256,depth,objNeosTitleMenu);
	else
	{
	    with objNeosTitleMenu
	    {
	        focus_other_menu = false;
	        alarm[0] = 10;
	    }
		
		with objTitleName
		{
			value_to_destination(alpha,1,"alpha",false,,,25);	
		}
	}
	instance_destroy();
}
else
{
	with (objPauseMenuSettings)
	{
		locked = false;	
		alarm[0] = 1;
	}
	instance_destroy();
}
