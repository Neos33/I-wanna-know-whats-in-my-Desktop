/// @description
// You can write your code in this editor
if canTouch
{
    camera_change_mode(mode, targetObject, pointX, pointY, pointW, pointH, limit_X1, limit_Y1, limit_X2, limit_Y2, shiftX, shiftY);
    canTouch = false;
    
    x -= 32;
    y -= 32;
    image_xscale += 2;
    image_yscale += 2;
}