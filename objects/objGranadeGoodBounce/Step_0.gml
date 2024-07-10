/// @description 
yspd += grav;

//x axis Collisions
if place_meeting(x+xspd,y,objBlock)
{
	while !place_meeting(x+sign(xspd),y,objBlock)
	{
		x += sign(xspd);
	}
	
	// Bounce
	xspd *= -bounceDecay;
	//play_sfx(sndHe_bounce);
}

//y axis Collisions
if place_meeting(x,y+yspd,objBlock)
{
	while !place_meeting(x,y+sign(yspd),objBlock)
	{
		y += sign(yspd);
	}
	
	// Bounce
	yspd *= -bounceDecay;
	if abs(yspd) > .5
		audio_play_sound_at(sndHe_bounce,x,y,0,32,160,1,false,1);
		//play_sfx(sndHe_bounce);
}

// Update position
x += xspd;
y += yspd;