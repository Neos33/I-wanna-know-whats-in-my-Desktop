/// @description 
triggered = false;
sprite_index = sprNeosSave;
contraption = function() {}

function trigger_activate() {
	if (!triggered && global.basicTrigger[trigger]) {
		contraption();
		triggered = true;
	}
}
