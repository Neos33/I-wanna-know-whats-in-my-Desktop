/// @description 

/* DEBUG - uncomment this before release*/
var _itemsCheck = 0;
repeat (4) {
	if (!global.items[$ "bosses"][_itemsCheck]) 
	{
		// At least one item is missing, destroy the instance
		instance_destroy();
		exit;
	}
	
	
	_itemsCheck++;
}




if global.lastBossPhase = 2
{
	// Create the boss and start the fight inmeadietly
	var _boss = instance_create_layer(room_width/2,room_height/2,"Controllers",objLastBoss)
	//_boss . HP = 10;
	//_boss . image_blend = c_green; //DEBUG
	
	
	
	with objPlayer
		frozen = false;		
	
	//instance_destroy(objWindAmbienceMusic);
	instance_destroy();
}