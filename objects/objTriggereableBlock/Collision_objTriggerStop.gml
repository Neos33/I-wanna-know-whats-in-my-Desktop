/// @description 
//if (global.basicTrigger[trigger] == global.basicTrigger[trigger]) {
//if global.basicTrigger[trigger] {
if trigger == other.trgStop and global.basicTrigger[trigger] {
	x = xprevious;
	y = yprevious;

	//Detect horizontal collision
	if (place_meeting(x + hspd, y, other)) {
		while (!place_meeting(x + sign(hspd), y, other)) {
			x += sign(hspd);
		}
	
	    hspd = 0;
	}

	//Detect vertical collision
	if (place_meeting(x, y + vspd, other)) {
		while (!place_meeting(x, y + sign(vspd), other)) {
			y += sign(vspd);
		}

	    vspd = 0;
	}

	//Detect diagonal collision
	if (place_meeting(x + hspd, y + vspd, other)) {
		hspd = 0;
	}

	x += hspd;
	y += vspd;
}