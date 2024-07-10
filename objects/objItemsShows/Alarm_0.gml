/// @description Items going to the middle
if t != duration
{
	t++;	
	itemX[index] = lerp(itemX[index], targetX, t/duration);
	itemY[index] = lerp(itemY[index], targetY, t/duration);
	alarm[0] = 1;

}
else
{
	if index < total
	{
		index++;
		alarm[1] = 10; //delay to reset
	}
	else
	{
		alarm[0] = 0;
		play_sfx(sndBlockChange);
	}
}