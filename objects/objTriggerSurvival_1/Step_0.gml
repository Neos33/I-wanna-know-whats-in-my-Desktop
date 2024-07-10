/// @description 

// Inherit the parent event
event_inherited();
var offX = 8;
var spawnX = 3424 + offX;
var spawnY = 576 + 32;

#region Normal
if mode == 0
{
	switch (timer)
	{
		case 1:
			play_sfx(sndBlockChange);
		
			//with instBlock_GateLeft { y += 96; visible = true; jank = false; }
			//with instBlock_GateRight { y += 96; visible = true; jank = false; }
			
			//Create blocks
			_block[0] = Create(3408,624,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[0] . visible = true;
			
			_block[1] = Create(3408,624+32,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[1] . visible = true;
			
			_block[2] = Create(3760,624,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[2] . visible = true;
			
			_block[3] = Create(3760,624+32,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[3] . visible = true;
			
			var i = 0;
			repeat 4
			{
				with _block[i]
				{
					alpha_to_destination(0,1,,,,15);	
				}
				i++;
			}
		
			//instance_destroy();
		break;

		//x from 3424 to 3744 (9 blocks [32x32]) starting from 0

		case 50:
			for (var i = 0; i < 20; i++) {
				if i < 18	
					create_laser(spawnX+16*i,spawnY,100,50);
			}
		break;
		
		case 280:
			for (var i = 0; i < 20; i++) {
				if i < 8 or i > 11	
					create_laser(spawnX+16*i,spawnY,100,50);
			}
		break;
		
		case 480:
			for (var i = 0; i < 20; i++) {
				if i > 2	
					create_laser(spawnX+16*i,spawnY,100,10);
			}
		break;
		
		case 680:
		case 920:
			for (var i = 0; i < 20; i++) {
				if i mod 2 = 0	
					create_laser(spawnX+16*i,spawnY,60,20);
			}
		break;
		
		case 800:
		case 1040:
			for (var i = 0; i < 20; i++) {
				if i mod 2 = 1	
					create_laser(spawnX+16*i,spawnY,60,20);
			}
		break;
		
		case 1120: create_laser(spawnX,spawnY,160,60); break;
		case 1130: create_laser(spawnX+16,spawnY,150,60); break;
		case 1140: create_laser(spawnX+16*2,spawnY,140,60); break;
		case 1150: create_laser(spawnX+16*3,spawnY,130,60); break;
		case 1160: create_laser(spawnX+16*4,spawnY,120,60); break;
		case 1170: create_laser(spawnX+16*5,spawnY,110,60); break;
		case 1180: create_laser(spawnX+16*6,spawnY,100,60); break;
		case 1190: create_laser(spawnX+16*7,spawnY,90,60); break;
		case 1200: create_laser(spawnX+16*8,spawnY,80,60); break;
		case 1210: create_laser(spawnX+16*9,spawnY,70,60); break;
		case 1220: create_laser(spawnX+16*10,spawnY,60,60); break;
		
		// Right side
		case 1300: create_laser(spawnX+16*19,spawnY,160,60); break;
		case 1310: create_laser(spawnX+16*18,spawnY,150,60); break;
		case 1320: create_laser(spawnX+16*17,spawnY,140,60); break;
		case 1330: create_laser(spawnX+16*16,spawnY,130,60); break;
		case 1340: create_laser(spawnX+16*15,spawnY,120,60); break;
		case 1350: create_laser(spawnX+16*14,spawnY,110,60); break;
		case 1360: create_laser(spawnX+16*13,spawnY,100,60); break;
		case 1370: create_laser(spawnX+16*12,spawnY,90,60); break;
		case 1380: create_laser(spawnX+16*11,spawnY,80,60); break;
		case 1390: create_laser(spawnX+16*10,spawnY,70,60); break;
		case 1400: create_laser(spawnX+16*9,spawnY,60,60); break;

		case 1650:
			play_sfx(sndBreak);

			var i = 0;
			repeat 4
			{
				with _block[i]
				{
					var _fadeout = Create(x,y,layer,objDummy,,,0,,,,,1);
					with _fadeout 
						alpha_to_destination(1,0,,,,15);
						
					instance_destroy();
				}
				i++;
			}
			
			instance_destroy();
			with objBlockTrgMove
			{
				if trigger == 14
					path_start(pathID, pspd, pAction, false);
			}
		break;
	}
}
#endregion
#region TwiceTwice
else if mode == 1
{
	switch (timer)
	{
		case 1:
			play_sfx(sndBlockChange);
		
			_block[0] = Create(3408,624,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[0] . visible = true;
			
			_block[1] = Create(3408,624+32,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[1] . visible = true;
			
			_block[2] = Create(3760,624,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[2] . visible = true;
			
			_block[3] = Create(3760,624+32,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
			_block[3] . visible = true;
			
			var i = 0;
			repeat 4
			{
				with _block[i]
				{
					alpha_to_destination(0,1,,,,15);	
				}
				i++;
			}
			//instance_destroy();
		break;

		//x from 3424 to 3744 (9 blocks) starting from 0

		case 50:
			create_laser(spawnX,spawnY,90000,50);
			create_laser(spawnX+16*19,spawnY,90000,50);
		break;
		case 52:
			create_laser(spawnX+16,spawnY,90000,50);
			create_laser(spawnX+16*18,spawnY,90000,50);
		break;
		case 54:
			create_laser(spawnX+16*2,spawnY,90000,50);
			create_laser(spawnX+16*17,spawnY,90000,50);
		break;
		case 56:
			create_laser(spawnX+16*3,spawnY,90000,50);
			create_laser(spawnX+16*16,spawnY,90000,50);
		break;
		case 58:
			create_laser(spawnX+16*4,spawnY,90000,50);
			create_laser(spawnX+16*15,spawnY,90000,50);
		break;
		case 60:
			create_laser(spawnX+16*5,spawnY,90000,50);
			create_laser(spawnX+16*14,spawnY,90000,50);
		break;
		case 62:
			create_laser(spawnX+16*6,spawnY,90000,50);
			create_laser(spawnX+16*13,spawnY,90000,50);
		break;
		case 64:
			create_laser(spawnX+16*7,spawnY,90000,50);
			create_laser(spawnX+16*12,spawnY,90000,50);
		break;
		case 66:
			create_laser(spawnX+16*8,spawnY,90000,50);
			create_laser(spawnX+16*11,spawnY,90000,50);
		break;

		case 200:
			play_sfx(sndBreak);

			//instance_destroy(objTH_Laser);
			with objTH_Laser { vspeed = -15; }
			
			// Open the gate
			var i = 0;
			repeat 4
			{
				with _block[i]
				{
					var _fadeout = Create(x,y,layer,objDummy,,,0,,,,,1);
					with _fadeout 
						alpha_to_destination(1,0,,,,15);
						
					instance_destroy();
				}
				i++;
			}
		break;
		case 240:
			instance_destroy(objTH_Laser);
			// give some audio
			var number = irandom(4) + 1;
			var sound = asset_get_index("sndPoppoAppear_"+string(number));
			audio_play_sound(sound, 0, false);
			audio_play_sound(sound, 0, false);
			with objMariePoppo
			{
				vspeed = -8;
				gravity = .14;
				mask_index = sprite_index;
			}
		break;
		
		case 260:
			showReference(150,576-200,"Character","1","Marie Poppo",sprRef_Juguito);
		break;
		case 300:	

			instance_destroy();
		break;
	}
}
#endregion
