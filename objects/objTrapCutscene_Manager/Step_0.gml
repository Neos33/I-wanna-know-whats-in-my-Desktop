/// @description Cutscene settings
if (!triggered && global.basicTrigger[trigger]) {
		
	if !global.triggersPersistent[indexPersistent]
		triggered = true;
}


if triggered and instance_exists(objPlayer)
{
	timer++;
}
else timer = -1;