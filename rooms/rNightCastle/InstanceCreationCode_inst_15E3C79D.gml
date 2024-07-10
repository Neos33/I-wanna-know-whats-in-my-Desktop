visible = false;
sprite_index = sprRacicFacts;
global.basicTrigger[trigger] = false;

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
		case 1:
			//visible = true;
		break;
		
		case 30:
			visible = true;
			alpha_to_destination(0,1,,,,40);
		break;
		
		case 120:
			showReference(150,576-200,"People","5","Racic",sprRef_Racic);
		break;
	}
}

init_trigger(myTrap);