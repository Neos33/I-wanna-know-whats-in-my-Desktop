/// @description 
// You can write your code in this editor
if !instance_exists(objPlayer) { exit; }

if !place_meeting(x,y,objPlayer)
{
    if !canTouch
    {
        canTouch = true;
        x += 32;
        y += 32;
        image_xscale -= 2;
        image_yscale -= 2;
    }
}