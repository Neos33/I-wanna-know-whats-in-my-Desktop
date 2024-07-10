visible = false;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
	
	switch t
	{
		case 50:
			showReference(150,576-200,"People","6","EchoMask",sprRef_EchoMask);
			instance_destroy();
		break;
	}
}

init_trigger(myTrap);