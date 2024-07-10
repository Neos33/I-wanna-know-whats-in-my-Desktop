function player_jump() {
	if (jump_total > 0 && (on_block || place_meeting(x, y + global.grav, objPlatform))) {
		vspd = -(jump_height[0] * global.grav);
		sprite_index = PLAYER_ACTIONS.JUMP;
		reset_jumps();
		play_sfx(playerAudio.sfxJump, playerAudio.playerVol*.6);
		//landSound = false;
		bonkSound = false;
	} else if (jump_left > 0 || place_meeting(x, y + global.grav, objWater) || jump_total == -1) {
		vspd = -(jump_height[1] * global.grav);
		sprite_index = PLAYER_ACTIONS.JUMP;
			
		if (!place_meeting(x, y + global.grav, objWaterRefresh)) {
			if (jump_left > 0) {
				jump_left--;
			}
		} else {
			reset_jumps();
		}
			
		play_sfx(playerAudio.sfxDjump, playerAudio.playerVol*.6);
		if room != rFakeIntroductionStage
			part_particles_create(global.pKidDoubleJump_System,x,y,global.pKidDoubleJump_Type,8);
		//landSound = false;
		bonkSound = false;
	}
}

function player_fall() {
	if (vspd * global.grav < 0) {
		vspd *= 0.45;
		landSound = false;
	}
}

function player_shoot() {
	if (instance_number(objBullet) < 4) {
		instance_create_layer(x, y, "Player", objBullet);
		play_sfx(playerAudio.sfxShoot, playerAudio.playerVol*.5);
	}
}

function reset_jumps() {
	if (instance_exists(objPlayer)) {
		with (objPlayer) {
			jump_left = jump_total - 1;
		}
	}
}

function kill_player() {
    if (!global.debug_god_mode && instance_exists(objPlayer)) {
        with (objPlayer) {
			instance_create_layer(x, y, "Player", objBloodEmitter);
			instance_create_layer(x, y, "Player", objPlayerSoul);
			play_sfx(sndDeath, playerAudio.playerVol);
            instance_destroy();
        }
            
		if global.display.GameOverOption == 1 or room == rFakeIntroductionStage
			instance_create_layer(0, 0, "Controllers", objGameOver);
		else if global.display.GameOverOption == 2
			instance_create_layer(0, 0, "Controllers", objNeosGameOver);
				
		
        global.deaths++;
		//
			
		if (global.death_music) {
            audio_pause_sound(global.current_music);
            audio_play_sound(bgmGameOver, 0, false);
        }
    }
}

function outside_room() {
	if (!instance_exists(objPlayer)) {
	    return false;
	} else {
	    return (objPlayer.x < 0 || objPlayer.x > room_width || objPlayer.y < 0 || objPlayer.y > room_height);
	}
}

function set_mask() {
	mask_index = (global.grav == 1) ? sprPlayerMask : sprPlayerMaskFlipped;
}

function flip_grav() {
	if (instance_exists(objPlayer)) {
	    global.grav *= -1;

	    with (objPlayer) {
			set_mask();
	        vspd = 0;
	        y += 4 * global.grav;
	    }
    
	    reset_jumps();
	}
}