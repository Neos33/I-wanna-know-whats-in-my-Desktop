/// @description 
var rng = irandom(2)+2;
repeat rng
{
	var value_x = irandom(15);
	var value_y = irandom_range(-1,18);
	//var value_y = 5;
	var temp = instance_create_layer(32+value_x*64, value_y*32, "Spikes_BG", objSpikeBGTitle);


	if value_x mod 2 == 0 
	{
		if value_y mod 2 == 0
			temp . image_xscale = -1;
		else
			temp . image_xscale = 1;
	}
	else
	{
		if value_y mod 2 == 0
			temp . image_xscale = 1;
		else
			temp . image_xscale = -1;
	}
}

/*if value_y mod 2 == 0
	temp . image_xscale = -1;
}*/

alarm[0] = irandom_range(60,200);