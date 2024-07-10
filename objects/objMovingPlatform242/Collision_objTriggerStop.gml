/// @description 
x = xprevious;
y = yprevious;

	//Detect horizontal collision
	if (place_meeting(x + hspd, y, other)) {
		while (!place_meeting(x + sign(hspd), y, other)) {
			x += sign(hspd);
		}
	
	    hspd = 0;
	}
