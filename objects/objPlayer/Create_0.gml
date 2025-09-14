#region Init
set_mask();
image_speed = 0.2;

xscale = global.last_xscale;
hspd = 0;
vspd = 0;
grav = 0;
max_hspd = 3 * global.fps_adjust;
max_vspd = 9  * global.fps_adjust;
grav_amount = 0.4 * global.fps_adjust_squared;

jump_height = [8.5 * global.fps_adjust, 7 * global.fps_adjust];
jump_total = 2;

on_block = false;
frozen = false;

on_water = false;
enter_water = false;
landSound = true;
bonkSound = true;
//conveyor_speed = 0;

// Sprites assets
PLAYER_ACTIONS = {
	IDLE : sprPlayerIdle,
	RUN : sprPlayerRun,
	JUMP : sprPlayerJump,
	FALL : sprPlayerFall,
	SLIDE : sprPlayerSlide
}

// Audio assets
playerAudio = {
	sfxJump : sndJump,
	sfxDjump : sndDoubleJump,
	sfxShoot : sndShoot,
	sfxVine : sndVine,
	sfxBonk : sndBonk,

	playerVol : .9
}


reset_jumps();

if (global.auto_save) {
	save_game(true);
	global.auto_save = false;
}

if (global.difficulty == 0 && !instance_exists(objBow)) {
	instance_create_layer(x, y, "Player", objBow);
}
#endregion

// Create listener and set orientation
audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);


part_system_depth(global.pKidDoubleJump_System, depth + 1);
part_system_depth(global.pKidGround_System, copyDepth("Tiles") + 1);



function land_sound(_land_SE)
{
	if _land_SE != ""
	{
		var _sfx = noone;
		switch _land_SE
		{
			case "Concrete":
				_sfx = choose(sndLand_Heels_Conc_1,sndLand_Heels_Conc_2,sndLand_Heels_Conc_3);
			break;
					
			case "Dirt":
				_sfx = choose(sndLand_Heels_Dirt_1,sndLand_Heels_Dirt_2,sndLand_Heels_Dirt_3,sndLand_Heels_Dirt_4);
				//part_type_color_mix(global.pKidGround_Type,#563401,#544600);
				part_type_color_mix(global.pKidGround_Type,c_olive,c_gray);
				// Brown color
			break;
					
			case "Wood":
				_sfx = sndPlayerLand_PfWoodThick;
			break;
					
			case "Stone":
				_sfx = sndPlayerLand_StoneEcho;
				part_type_color_mix(global.pKidGround_Type,c_white,c_white);
			break;
					
			case "Glass":
				_sfx = sndLand_Glass;
			break;
					
		}
		//Volume depends on how high you land the ground
		var _speedHeightFall = map(vspd,0,max_vspd,0,.9);
		play_sfx(_sfx, playerAudio.playerVol * _speedHeightFall);
				
		part_system_depth(global.pKidGround_System, copyDepth("Tiles") + 1);
		part_type_size(global.pKidGround_Type,_speedHeightFall*.2,_speedHeightFall*.4,-.0025,0);
				
		part_particles_create(global.pKidGround_System,x,bbox_bottom,global.pKidGround_Type,vspd*2);
				
		//Reset values
		part_type_color_mix(global.pKidGround_Type,c_white,c_white);
		part_type_size(global.pKidGround_Type,0.15,.25,-.0025,0);
				
				
	}
	landSound = true;
				
}