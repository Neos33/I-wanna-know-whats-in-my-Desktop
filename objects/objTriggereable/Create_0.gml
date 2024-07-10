triggered = false;
contraption = function() {}

function trigger_activate() {
	if (!triggered && global.basicTrigger[trigger]) {
		hspeed = hspd;
		vspeed = vspd;
			
		if pspd != 0
		{
			path_start(pathID, pspd, pAction, false);
			path_scale = pScale;
		}

		//script_execute(contraption);
		contraption();
		triggered = true;
	}
}
