/// @description Decrease effect
if scale > 1
{
    scale -= scaleSPD;
    alarm[1] = 1;
}
else
{
    //if sprite_index == sprKaizoBlock_Transform and image_index == 0
    {
        image_speed = 0;
        index = 1;
        scale = 1;
        depth += 1;
    }
}
