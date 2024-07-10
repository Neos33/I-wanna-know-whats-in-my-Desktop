/// @description 

if spin_guns
{
	if t < 200
	{
		t++;
		angle = lerp(angle,360*2,t/200);
	}
}

