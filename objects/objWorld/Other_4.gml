get_music();


if room == rTitle and !introShowed
{
    introShowed = true; 
    
    //// Create Controllers
    if !instance_exists(objParticleManager) 
    instance_create_layer(0,0,"Controllers",objParticleManager);


    //if !instance_exists(objBGColorPreBoss)
    //instance_create(0,0,objBGColorPreBoss);
    
    show_debug_message("Intro for the 1st time"); 
}