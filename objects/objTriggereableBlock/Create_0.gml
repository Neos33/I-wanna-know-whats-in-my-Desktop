/// @description 

// Inherit the parent event
event_inherited();

triggered = false;
contraption = function() {}

function trigger_activate() {
	if (!triggered && global.basicTrigger[trigger]) {
		hspeed = h;
		vspeed = v;
			
		if pspd != 0
		{
			path_start(pathID, pspd, pAction, false);
			path_scale = pScale;
		}
		contraption();
		triggered = true;
	}
}
