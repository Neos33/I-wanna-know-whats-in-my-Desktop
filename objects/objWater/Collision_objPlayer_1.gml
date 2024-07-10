if (other.vspd * global.grav > 2) {
    other.vspd = 2 * global.grav;
}

/*if !inWater
{
    inWater = true;
    play_sfx(sndWaterEnter);

}