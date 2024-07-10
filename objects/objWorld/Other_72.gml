/// @description Loading Audio

var typeAsync, groupAsync;
typeAsync = ds_map_find_value(async_load, "type");
groupAsync = ds_map_find_value(async_load, "group_id");

//show_debug_message("typeAsync:" +string(type));
//show_debug_message("groupAsync:" +string(group));

if typeAsync = "audiogroup_load" and groupAsync = ag_BGM
{
    //room_goto(rCheckVolume);
	room_goto_next();
    show_debug_message("Music and SFX loaded succesfully");
    sfx_loaded = true;
    music_loaded = true;
}