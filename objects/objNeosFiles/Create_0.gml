datas = [];

for (var i = 0; i < global.total_saves; i++) {
	var _exists = file_exists(string_interp("Data{0}", i + 1));
	
    if (_exists) {
        global.save_num = i;
        load_game(false);
    }
	
	datas[i] = {
		//difficulty: (exists) ? global.difficulties[global.difficulty] : "No Data",
		difficulty: (_exists) ? "Gaming" : "No Data",
		deaths: global.deaths,
		time: global.time,
		clear: global.clear,
		items: global.items
	};
	
	// Effect
	size_data[i] = 0;
}
size_data[0] = 1;
cleanup_game();

locked = true;
image_alpha = 0;
alarm[0] = 1;
//transition_steps = 20;

menu = MENU_FILES.DATA;
select = array_create(2, 0);
spacing = 16 * 10;

#region Item Images
images_secrets = [];

for (var i = 0; i < array_length(global.items.secrets); i++) {
	images_secrets[i] = asset_get_index(string_interp("sprItemSecret{0}", i + 1));
}

images_bosses = [];

for (var i = 0; i < array_length(global.items.bosses); i++) {
	images_bosses[i] = asset_get_index(string_interp("sprItemBoss{0}", i + 1));
}
#endregion