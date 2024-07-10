if global.resetAllowed
	global.resetAllowed = false;
	
execute_trap(global.S1_Trap_Take);

instance_destroy();
