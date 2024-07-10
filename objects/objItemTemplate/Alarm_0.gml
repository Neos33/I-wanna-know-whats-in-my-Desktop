/// @description Animation workaround
if reflect_index == 0 or reflect_index == 12
{
	reflect_index++;
	alarm[0] = irandom_range(15,40);
}
else
{
	reflect_index += reflect_speed;
	alarm[0] = 1;
}

// Loop
if reflect_index >= reflect_total
{
	reflect_index = 0;	
}

