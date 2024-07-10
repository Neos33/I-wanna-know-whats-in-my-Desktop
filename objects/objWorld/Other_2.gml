load_config();
time_micro = 0;


sfx_loaded = false;
music_loaded = false;

if !audio_group_is_loaded(ag_BGM)
    audio_group_load(ag_BGM);
    
if !audio_group_is_loaded(ag_SFX)
    audio_group_load(ag_SFX);


//room_goto_next();

//audio_group_load(audiogroup_default);