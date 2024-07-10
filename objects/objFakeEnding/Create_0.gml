/// @description 
BG = layer_background_get_id("BG_TVStatic");
layer_background_visible(BG,false);
layer_background_xscale(BG,2);
layer_background_yscale(BG,2);
layer_background_blend(BG,c_grey);
image_alpha = 0;


st_prep = new state();
ESC_key_pressed = false;
move_background = true;


st_prep.start = function()
{
	t = -1;
	layer_background_alpha(BG,image_alpha);
	layer_background_visible(BG,true);
	ESC_key_pressed = false;
}

st_prep.run = function()
{
	if ESC_key_pressed
	{
		t++;
		switch t 
		{
			case 0: global.resetAllowed = false; break;
			case 10:
				play_sfx(sndBlockChange);
				with objPlayer frozen = true;
				audio_sound_gain(global.current_music,0,3000);
			break;
			
			case 50: // Fade in the TV background
				alarm[0] = 1;
				//play_sfx(sndSpikeTrap);
				with objGameOver
					alpha_to_destination(1,0,,,,20)
			break;
			
			case 100: // Create windows
				var cam = camera_properties(0);
				var win = instance_create_layer(0,0,"Controllers",objWindowsFakeBarIntro);
				win . x1 = cam.view_x - 1;
				win . y1 = cam.view_y - 30;
				win . x2 = cam.view_x + cam.view_w + 2;
				win . y2 = cam.view_y + cam.view_h + 31;
				win . windowsName = "I wanna Enjoy a Fake Introduction";
				
				
				with objBetterCamera
				{
					mode = CAMERA.ZOOM_OUT;
					pointX = cam.view_x - 1;
					pointY = cam.view_y - 30;
					pointW = 1026;
					pointH = 577+30;
				}
			break;
			case 200:
				//move_background = false;
				if exists()
				{
				var clone = instance_create_layer(objPlayer.x,objPlayer.y,"Player",objSave);
				clone . sprite_index = objPlayer.sprite_index;
				clone . image_index = objPlayer.image_index;
				clone . image_xscale = objPlayer.xscale;
				clone . image_speed = 0;
				}
				with objPlayer visible = false;
			break;
			
			case 250:
				screenFlash(0,"in",200,c_black);
			break;
			
			case 450: with objWindowsFakeBarIntro windowsName = "? ? ? ? ? ? ? ? ? ? ?"; break;
			case 500: with objWindowsFakeBarIntro windowsName = ""; break;
			
			case 550: 
				room_goto(rCutscene_FakeIntro);
				instance_destroy(objPlayer);
			break;
		}
		
		if move_background
		{
			layer_x("BG_TVStatic", irandom(128*2));
			layer_y("BG_TVStatic", irandom(128*2));
		}
	}
}

init_state(st_prep); 
