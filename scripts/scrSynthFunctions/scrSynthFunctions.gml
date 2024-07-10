// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fps_adjust(val)
{
	return val * global.fps_adjust;
}

function wrap(val, mn, mx) 
{
	if (val mod 1 == 0)
	{
	    while (val > mx || val < mn)
	    {
	        if (val > mx)
	            val += mn - mx - 1
	        else if (val < mn)
	            val += mx - mn + 1
	    }
	    return(val)
	}
	else
	{
	    var vOld = val + 1
	    while (val != vOld)
	    {
	        vOld = val
	        if (val < mn)
	            val = mx - (mn - val)
	        else if (val > mx)
	            val = mn + (val - mx)
	    }
	    return(val)
	}
}