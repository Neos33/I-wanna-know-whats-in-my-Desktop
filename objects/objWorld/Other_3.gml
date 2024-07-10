if (global.game_started) {
    restart_game();
    save_game(false);
	global.game_started = false;
}

save_config();


#region Online
online_disconnect();
buffer_delete(__ONLINE_buffer);
#endregion


sprite_delete(global.gif_baelz);
sprite_delete(global.gif_araoz);
sprite_delete(global.gif_arzztt);
sprite_delete(global.gif_cosmo);

//destroy_test_data();

//ds_grid_destroy(global.referenceGet);

// Unload Audio
if sfx_loaded and music_loaded
{
    audio_group_unload(ag_BGM);
    audio_group_unload(ag_SFX);
    
    show_debug_message("Music and SFX were unloaded");
}