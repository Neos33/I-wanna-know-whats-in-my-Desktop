/// @description 

#region Define values
	image_speed = 1/5;
	image_blend = c_white;
	//setScale(2);
	HP = (global.lastBossPhase = 1) ? 130 : 100; //10;
	
	if !exists(objHPIndicator)
	{
		var HP_Sign = instance_create_layer(0,0,"Controllers",objHPIndicator);
		HP_Sign . owner = id;
		HP_Sign . HPCurrent = HP;
		HP_Sign . HPMax = HP;
	}
	
	phase = global.lastBossPhase;
	allow_to_hit = true;
	_ts = -1; // Time source canvas
	_method = -1;
	infinite_jump = false;
	shootIndicatorSignOnce = true;
	
	sprite_index = (global.lastBossPhase = 1) ? sprSuzumiNormalIdle : sprSuzumiIdle;
	canFlip = true;

	var _clock_visible = (global.lastBossPhase = 1) ? false : true;
	with objZaphkiel_Clock visible = _clock_visible;
	
	// Destroy some stuff
	instance_destroy(objWindows_Icon); // Hub
	instance_destroy(objGemRockPlace); // Rock 
	instance_destroy(objGemGotShowcase); // Cutscene controller
	instance_destroy(objItemsShows);



	// Create camera
	if !exists(objDistanceBetween)
	{
		var cameraBetween = instance_create_layer(x, y, "Controllers", objDistanceBetween);
		cameraBetween . is_targeted = _clock_visible;  //False if is in phase 1
		
	}
	if !exists(objCamera2) 
	{
		instance_create_layer(x, y, "Controllers", objCamera2); 
	}
	with objCamera2 obj = (global.lastBossPhase = 2) ? objDistanceBetween : objPlayer;
	
	#region Define particles
		#region Trail
			pSys = part_system_create();
			part_system_depth(pSys,depth + 1);
		
			pTyp = part_type_create();
		
			part_type_alpha2(pTyp,1,0);
			part_type_blend(pTyp,true);
			part_type_sprite(pTyp,sprSuzumiNormalGlow,true,false,false);
			part_type_life(pTyp,10,10);
		#endregion
		
		#region Burst Stars
			pSysStar = part_system_create();
			part_system_depth(pSysStar,depth + 1);
		
			pTypStar = part_type_create();
		
			part_type_alpha2(pTypStar,1,0);
			part_type_blend(pTypStar,true);
			part_type_sprite(pTypStar,sprStarParticle,false,false,false);
			part_type_life(pTypStar,40,60);
			part_type_size(pTypStar,.15,.25,-.001,0);
			
			part_type_direction(pTypStar,0,360,0,1);
			part_type_speed(pTypStar,1,5,0,0);
			part_type_orientation(pTypStar,0,360,3,1,0);
		#endregion
		
		#region Circle
			pSysCircle = part_system_create();
			part_system_depth(pSysCircle,depth + 1);
		
			pTypCircle = part_type_create();
		
			part_type_alpha2(pTypCircle,1,0);
			part_type_blend(pTypCircle,true);
			part_type_sprite(pTypCircle,sprConcentrationCircle,false,false,false);
			part_type_life(pTypCircle,10,20);
			part_type_size(pTypCircle,0,0,.2,0);
			
		#endregion
		
		#region Get hit
			pSysHit = part_system_create();
			part_system_depth(pSysHit,depth + 1);
		
			pTypHit = part_type_create();
		
			part_type_alpha2(pTypHit,1,0);
			part_type_blend(pTypHit,true);
			part_type_color_mix(pTypHit,make_color_hsv(0,100,255),make_color_hsv(0,150,255));
			//part_type_sprite(pTypHit,sprConcentrationCircle,false,false,false);
			part_type_shape(pTypHit,pt_shape_flare);
			part_type_life(pTypHit,30,40);
			part_type_size(pTypHit,0.1,0.15,-0.002,0);
			part_type_gravity(pTypHit,.1,270);
			part_type_direction(pTypHit,0,360,0,0);
			part_type_speed(pTypHit,1,3,0,0);
		#endregion
	#endregion
	

#endregion

#region Define states
	// Allow to shoot
	boss_on_ground = new state();
	able_to_shoot = new state();

	// Phase 1
	vergil_spade = new state();
	shotgun_att = new state();
	circle_retrieve = new state();
	fire_in_the_hole = new state();
	brontosaurus_attack = new state();
	frieza_disc_attack = new state();

	// Cutscenes
	cutsene_clock_arrive = new state();
	resumeFightIn2ndPhase = new state();
	boss_is_dead = new state();

	// Phase 2
	laser_shot = new state();
	V6_physics = new state();
	expand_circles = new state();
	laser_SuzumiEX = new state();
	laserSimple = new state();
	bulletsAim = new state();
	laser_Fiesta = new state();

	// Put attacks in a list
	attacks = ds_list_create();
	
	// Check if we are in Phase 1
	if (global.lastBossPhase = 1)
		//ds_list_add(attacks, vergil_spade,fire_in_the_hole); // DEBUG TEST
		//ds_list_add(attacks, vergil_spade, shotgun_att, circle_retrieve, fire_in_the_hole, brontosaurus_attack,frieza_disc_attack);
		ds_list_add(attacks, vergil_spade, circle_retrieve, fire_in_the_hole, brontosaurus_attack,frieza_disc_attack);
	else
	{
		//ds_list_add(attacks, laser_shot, V6_physics, expand_circles, laser_SuzumiEX, laserSimple, );
		
		//Debug 
		//ds_list_add(attacks, laser_SuzumiEX, expand_circles, laserSimple, bulletsAim,laser_Fiesta);
		ds_list_add(attacks, expand_circles, laserSimple, bulletsAim,laser_Fiesta);
		infinite_jump = true; // Phase 2 = Infinite jump
	}

	// Sort list
	attacks_index = ds_list_size(attacks) - 1;
	ds_list_shuffle(attacks);
	
#endregion;

#region Boss unoffensive, time to deal damage
	#region For Phase 1
		boss_on_ground.start = function()
		{
			t = 0;
			if attacks_index > 0
				attacks_index--
			else
			{
				attacks_index = ds_list_size(attacks) - 1;
				ds_list_shuffle(attacks);
			}
		}
		boss_on_ground.run = function()
		{
			t++;
			switch t
			{
				case 1:
					move_to_position(,,room_width/2,room_height-32*4,false,animCurve_Expo,"In",50);
					play_sfx(sndBlockChange);
				break;
				
				case 50:
					if shootIndicatorSignOnce
					{
						var ori = 1;
						
						if exists()
						{
							var spawnX = x - 64;
							if objPlayer.x > x
							{
								spawnX = x + 64;
								ori = -1;
							}
							var _indicator = instance_create_depth(spawnX,y,depth,objShootIndicator);
							_indicator . image_xscale = 1 * ori;
							_indicator . image_yscale = 1;
						}
						
						// Make sure to not show the sign again
						shootIndicatorSignOnce = false;
					}
				break;
		
				case 200:
					if instance_exists(objPlayer)
					{
						change_state(attacks[|attacks_index]);
					}
				break;
			}
		}
	#endregion
	
	#region For Phase 2
		able_to_shoot.start = function()
		{
			t = 0;
			// Reset the camera focus distance 
			with objDistanceBetween { distance_factor = 545; }
			
			if attacks_index > 0
				attacks_index--
			else
			{
				attacks_index = ds_list_size(attacks) - 1;
				ds_list_shuffle(attacks);
			}
		}
		able_to_shoot.run = function()
		{
			t++;
			switch t
			{
				case 1:
					play_sfx(snd_LB_tk_throw_fx);
					allow_to_hit = true;
					with objLB_Shield { alpha_to_destination(1,0,,,,20); }
				break;
				
				case 220:
					allow_to_hit = false;
					if instance_exists(objPlayer)
					{
						change_state(attacks[|attacks_index]);
					}
				break;
			}
		}
		able_to_shoot.stop = function()
		{
			var _shield = instance_create_depth(x,y,depth-1,objLB_Shield);
			_shield . owner = id;
			_shield . image_blend = c_red;
			with _shield alpha_to_destination(0,1,,,,20);
			
			with objDistanceBetween { distance_factor = 304; }
		}
	#endregion
#endregion

#region Attacks (Phase 1)
	#region Vergil spade
		vergil_spade.start = function()
		{
			t = 0;	
			startBladeSpawner = choose(1,-1);
		}
		vergil_spade.run = function()
		{
			t++
			var cam = camera_properties(0);
			switch t
			{
				case 1:
					play_sfx(sndMvc3_VergilMove);
					play_sfx(sndTH_Warning);
					safe_spot(50,c_aqua,160);
				break;
		
				// Spawn the blade spawner and reconfig the camera
				case 50:
					alarm[0] = 0; // Trail
					play_sfx(sndMvc3_VergilMove);
					var _xChoice = startBladeSpawner;
					var _x = (room_width / 2) + (room_width / 2) * _xChoice;
					
					var inst = instance_create_layer(_x, cam.view_y + 128, "Killers", objSpadeCreater);
					inst . hspd = 20 * -_xChoice;
					inst . time_frame = 10;
			
					with objCamera2
					{
						obj = inst;
						scrollSpeed = 0.05;
					}
					with objDistanceBetween { is_targeted = false; }
				break;
		
				case 250:
					with objSpadeVergil 
					{
						direction = image_angle;
						speed = irandom_range(10,15);
					}
					play_sfx(sndMvc3_VergilIai);
				break;
		
		
				// Again but now from the other side
				case 300:
					play_sfx(sndMvc3_VergilMove);
					var _xChoice = -startBladeSpawner;
					var _x = (room_width / 2) + (room_width / 2) * _xChoice;
					
					var inst = instance_create_layer(_x, cam.view_y + 128, "Killers", objSpadeCreater);
					inst . hspd = 20 * -_xChoice;
					inst . time_frame = 10;
			
					with objCamera2
					{
						obj = inst;
						scrollSpeed = 0.05;
					}
					with objDistanceBetween { is_targeted = false; }
				break;
				
				case 500:
					with objSpadeVergil 
					{
						direction = image_angle;
						speed = irandom_range(10,15);
					}
					play_sfx(sndMvc3_VergilIai);
				break;

				case 550:
					var orientation = choose(-1,1);
					for (var i = 0; i < 8; ++i) {
					    var _s = Create(x,y,depth,objSpadeVergilSpinner,sprVergil_Sword,0,0,1,1,0,c_white,1);
						_s . direction = 360 / 8 * i;
						_s . speed = 5;
						_s . friction = .1;
						_s . image_angle = _s . direction;
						//_s . angle_speed = irandom_range(5,10)*orientation;
						with _s
						{
							value_to_destination(0,15*orientation,"angle_speed",false,animCurve_Expo,1,50);
						}
					}
					play_sfx(sndCC_Necrozap);
				break;
				
				case 650:
					with objSpadeVergilSpinner
					{
						value_to_destination(angle_speed,0,"angle_speed",false,animCurve_Expo,1,100);
					}
				break;
				
				case 750:
					
					with objSpadeVergilSpinner
					{
						angle_speed = 0;
						image_angle %= 360;
						friction = 0;
						var toPlayer = 0;
						if exists()
							toPlayer = point_direction(x,y,objPlayer.x,objPlayer.y) + irandom_range(-3,3);
						angle_to_destination(image_angle,toPlayer,false,animCurve_Expo,2,100);
					}
				break;
				case 850:
					with objSpadeVergilSpinner
					{
						speed = 10;
						gravity = .5;
						gravity_direction = image_angle;
						direction = image_angle;
						depth = copyDepth("Tiles") + 1;
					}
					play_sfx(sndMvc3_VergilSwish);
				break;
				
				
				case 1000:
					change_state(boss_on_ground);
				break;
			}
		}
		vergil_spade.stop = function()
		{
	
		}
	#endregion

	#region Shotgun attack
		shotgun_att.start = function()
		{
			t = 0;
		}
		shotgun_att.run = function()
		{
			t++;
	
			switch t
			{
				case 1:
					play_sfx(sndTH_Warning);
					safe_spot(50);
				break;
				
				case 50: alarm[0] = 0; break;
		
				case 100:
					var _dire = targetPlayer();
					for (var i = -4; i < 4; i++)
					{
						var _o = instance_create_layer(x, y, "Killers", objCherry);
						_o . direction = _dire + 3 * i;	
						_o . speed = 5;
					}
					repeat (3) play_sfx(sndGunShot);
				break;
		
				case 300:
					change_state(boss_on_ground);
				break;
			}
		}
		shotgun_att.stop = function()
		{
	
		}
	#endregion
	
	#region Circle Retrieve
		circle_retrieve.start = function()
		{
			t = 0;	
		}
		circle_retrieve.run = function()
		{
			t++; 
			
			switch t
			{
				//case 1:
				case 1:
					play_sfx(sndTH_Warning);
					instance_deactivate_object(objDistanceBetween);
					if ie()
					with objCamera2 obj = objPlayer;
					
					safe_spot(50,c_red,170);
				break;
				
				case 50: alarm[0] = 0; break;
				case 60:
				//case 240:
				//case 260:
					_ts = time_source_create(time_source_game,60,time_source_units_frames,function()
					{
						var cam = camera_properties(0);
						var _left = instance_create_depth(cam.view_x,room_height - 96 - irandom(192),depth,objSoulessExpandCircle);
						_left . hspd = random_range(3,7);
						_left . speed_start = _left . hspd;
						
						var _right = instance_create_depth(cam.view_x+cam.view_w,room_height - 96 - irandom(192),depth,objSoulessExpandCircle);
						_right . hspd = -random_range(3,7); 
						_right . speed_start = _right . hspd;
					},[],-1);
					
					time_source_start(_ts);
					
				break;
				case 500:
					time_source_stop(_ts);
				break;
				
				case 800:
					instance_activate_object(objDistanceBetween);
					with objCamera2 obj = objDistanceBetween;
				break;
				
				case 1000:
					change_state(boss_on_ground);
				break;
			}
		}
		circle_retrieve.stop = function()
		{
			t = 0;	
			time_source_stop(_ts);
		}
		
	#endregion
	
	#region Fire in the hole
		fire_in_the_hole.start = function()
		{
			t = 0;	
		}
		fire_in_the_hole.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					play_sfx(sndTH_Warning);
					safe_spot(50,c_green,170);
				break;
				
				case 50:
					alarm[0] = 0;
				break;
				
				case 100:
					_ts = time_source_create(time_source_game,20,time_source_units_frames,function()
					{
						var _grenade = instance_create_depth(x,y,depth,objGranadeGoodBounce);
						_grenade . xspd = random_range(-4,4);
						_grenade . yspd = random_range(-4,4);
						
					},[],-1);
					
					time_source_start(_ts);
				break;
				
				case 400:
					time_source_stop(_ts);
				break;
				
				case 450:
					_method = function()
					{
						with objGranadeGoodBounce 
						{
							if image_blend == c_white
								image_blend = make_color_rgb(242,73,70);
							else
								image_blend = c_white;
						}
					}
					
					_ts = time_source_create(time_source_game,20,time_source_units_frames,_method,[],-1);
					time_source_start(_ts);
						
				break;
				
				case 500:
					time_source_reconfigure(_ts,15,time_source_units_frames,_method,[],-1,)
					time_source_start(_ts);
				break;
				case 550:
					time_source_reconfigure(_ts,10,time_source_units_frames,_method,[],-1,)
					time_source_start(_ts);
				break;
				case 600:
					time_source_reconfigure(_ts,5,time_source_units_frames,_method,[],-1,)
					time_source_start(_ts);
				break;
				case 650:
					time_source_reconfigure(_ts,2,time_source_units_frames,_method,[],-1,)
					time_source_start(_ts);
				break;
				case 700:
					with objGranadeGoodBounce
					{
						part_particles_create(global.pQuickExplosion_System, x, y, global.pQuickExplosion_Type, 40);
						part_particles_create(global.pExplosionLine_System, x, y, global.pExplosionLine_Type, 10);

						Create(x,y,0,objSpikeDown,sprLightCheap,0,0,1.5,1.5,0,c_white,0);
						instance_destroy();	
					}
					play_sfx(sndLaserminigun_exp1);
					time_source_stop(_ts);
				break;
				
				case 701:
					instance_destroy(objSpikeDown);
				break;
				
				case 800:
					change_state(boss_on_ground);
				break;
			}
		}
		fire_in_the_hole.stop = function()
		{
			t = 0;	
			time_source_stop(_ts);
			instance_destroy(objGranadeGoodBounce);
		}
	#endregion
	
	#region Brontosaurus fire attack
		brontosaurus_attack.start = function()
		{
			t = 0;	
		}
		brontosaurus_attack.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					play_sfx(sndTH_Warning);
					camera_focus();
					safe_spot(50,c_fuchsia,170);
				break;
				
				case 50: alarm[0] = 0; break;
				
				case 100:
					_ts = time_source_create(time_source_game,80,time_source_units_frames,function()
					{
						
						var _totalCherrys = 35; 
						var _centerPlayerAim =  32 * floor(_totalCherrys / 2);
						//var _numberCensored = irandom(_totalCherrys);
						var _numberCensored = floor(_totalCherrys / 2) + irandom_range(-3,3);
						var _color = make_color_hsv(200,160,255);
						if exists()
						{
							play_sfx(snd_LB_tk_Shot);
							var _playerX = clamp(objPlayer.x,_centerPlayerAim+8,room_width - _centerPlayerAim-8);
							var _spawnY = room_height - 576 - 16;
							for (var i = 0; i < _totalCherrys; ++i) {
							    if i < _numberCensored - 1 or i > _numberCensored + 1
								{
									var _att = Create((_playerX-_centerPlayerAim)+32*i,_spawnY,depth,objBulletSpin,sprBulletSpin,0,0,,,,_color,);
									_att . vspeed = 5;
								}
							}
						}
					},[],-1);
					time_source_start(_ts);
				break;
				
				// Show warnings
				case 250:
				case 550:
					sideChosen = choose(-1,1);
					play_sfx(sndWarningShow_SE,.8);
					var cam = camera_properties(0);
					var _color = make_color_hsv(250,140,255);
					var _x = cam.view_x + 512 + ((512-48) * sideChosen);
					
					var _sign = Create(_x,room_height - 80,depth,objBoshyWarning,sprBoshyWarning,0,0,,,,_color,);
					_sign . followCamera = true;
					_sign . camX = 512 + ((512-48) * sideChosen);;
					_sign . camY = 576 - 96;

					
				break;
				case 300:
				case 600:
					var _color = make_color_hsv(250,140,255);
					
					var cam = camera_properties(0);
					var _x = cam.view_x + 576 + (576 * sideChosen);
					
					var _att = Create(_x,room_height - 96-16,depth,objBulletSpin,sprBulletSpin,0,0,,,,_color,);
					_att . hspeed = 3 * (-sideChosen);
					play_sfx(sndCC_Area_Dark,2);
				break;
				
				case 800:
					time_source_stop(_ts);
				break;
				
				case 1000:
					change_state(boss_on_ground);
				break;
			}
		}
		brontosaurus_attack.stop = function()
		{
			t = 0;	
			time_source_stop(_ts);
			camera_reset_config();
		}
	#endregion
	
	#region Frieza disc saw
		frieza_disc_attack.start = function()
		{
			t = 0;	
		}
		frieza_disc_attack.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					play_sfx(sndTH_Warning);
					camera_focus(objPlayer);
					safe_spot(,c_blue,170);
				break;
				
				case 40:
					alarm[0] = 0;
				break;
				
				case 50:
				//case 100:
				//case 150:
				//case 700:
				//if exists()
				//{
				//	var _disc = instance_create_depth(x,y,depth,objFriezaDisc);
				//	_disc . direction = point_direction(x,y,objPlayer.x,objPlayer.y)+180+irandom_range(-20,20);
				//	_disc . speed = random(5);
				//	play_sfx(sndFrieza_destructodisc);
				//}
				if exists()
				{
					var _disc = instance_create_depth(x,y,depth,objFriezaDisc);
					_disc . direction = 90;
					_disc . speed = 10-3;
					
					_disc = instance_create_depth(x,y,depth,objFriezaDisc);
					_disc . direction = 150;
					_disc . speed = 7-3;
					
					_disc = instance_create_depth(x,y,depth,objFriezaDisc);
					_disc . direction = 30;
					_disc . speed = 7-3;
					play_sfx(sndFrieza_destructodisc,1.5);
				}
				break;
				
				case 1000:
					with objFriezaDisc 
					{
						gravity = 0;
						friction = 0.1;
						alarm[0] = 0;
					}
				break;
				case 1100:
					with objFriezaDisc
					{
						friction = 0;
						speed = 0;
						//moveY_to_position(,,-96,true,animCurve_Cubic,2,200);
						
						//scale_to_destination(,,1,1,true,,,20);
						//alpha_to_destination(1,0,,,,20);
						sonicMode = false;
						alarm[1] = 1;
						
						//instance_destroy();
					}
				break;
				case 1200:
					change_state(boss_on_ground);
				break;
			}
		}
		frieza_disc_attack.stop = function()
		{
			t = 0;	
			instance_destroy(objFriezaDisc);
			camera_reset_config();
		}
	#endregion
#endregion

#region Cutscenes
	#region Clock arrives
		cutsene_clock_arrive.start = function(){
			instance_destroy(objPlayerKiller);
			canFlip = false;
			t = 0
		}
		cutsene_clock_arrive.run = function(){
			t++;
			switch t 
			{
				case 1: // Volume down
					audio_sound_gain(global.current_music, .25, 2000);
					play_sfx(sndZaphkiel_Gun_Shot);
					with objZaphkiel_Clock visible = false;
				break;
			
				case 60:
					instance_destroy(objDistanceBetween);
					with objCamera2
					{
						obj = other; //Boss itself
						scrollSpeed = .05;
					}
					// Move to the center of the room
					move_to_position(,,room_width/2,room_height/2,false,animCurve_Cubic,2,100);
					
					//Trail
					alarm[0] = 1;
				break;
				
				case 160: alarm[0] = 0; break;
			
				// Charging...
				case 200:
					//play_sfx(snd100OJ_Appear);
					play_sfx(sndClock_Recharge,.8);
					color_to_destination(image_blend,c_black,,,60);
				break;
			
				case 201:
					_ts = time_source_create(time_source_game, 2, time_source_units_frames, function()
					{
						var _rng = irandom(360);
						var _x = x + lengthdir_x(256,_rng);
						var _y = y + lengthdir_y(256,_rng);
						var _dire = point_direction(_x,_y,x,y);
					
						part_type_life(global.pRecharging_Type,60,80);
						part_type_scale(global.pRecharging_Type,3,.5);
						part_type_size(global.pRecharging_Type,1,1,-0.025,0);
						part_type_direction(global.pRecharging_Type,_dire,_dire,0,0);
						part_particles_create(global.pRecharging_System,_x,_y,global.pRecharging_Type,10);
	
					},[],-1);
				
					time_source_start(_ts);
					//alarm[0] = 1;
				break;
				case 310:
					time_source_stop(_ts);
					//alarm[0] = 0;
				break;
				
				// Scuff transformation (changing sprites like an evolution from pokemon) 
				case 350:
					alternateSprites = 1;
					play_sfx(sndTransformation_power_up);
					_ts = time_source_create(time_source_game,5,time_source_units_frames,function()
					{
						sprite_index = (alternateSprites = 1) ? sprSuzumiIdle : sprSuzumiNormalIdle;
						alternateSprites *= -1;	
					},[],-1);
				break;
				case 360:
					time_source_start(_ts);
				break;

				// End transformation
				case 445:
					time_source_stop(_ts);
					sprite_index = sprSuzumiIdle;
				break;
				
				case 450:
					play_sfx(sndMR_Evolve_Animation,2);
					color_to_destination(,c_white,,,30);
				break;
				
				
			
				// Clock appear
				case 500:
					with objZaphkiel_Clock 
					{
						visible = true;
						alpha_to_destination(0,1,false,animCurve_Cubic,2,100);
						//scale_to_destination(1.75,1.75,2,2,false,animCurve_Cubic,0,10);
					}
					instance_destroy(objCamera2);
					repeat(2)
						play_sfx(sndZaphkiel_Clock_Appear);
					
					var cam = camera_properties(0);
					view_position_destination(cam.view_x,cam.view_y,0,0,false,animCurve_Cubic,2,80);
					view_size_destination(cam.view_w,cam.view_h,room_width,room_height,false,animCurve_Cubic,2,80);
				break;
			
				case 650: // Recreate cameras
					instance_create_layer(x, y, "Controllers", objDistanceBetween);
				
					var _camera = instance_create_layer(x,y,"Controllers",objCamera2);
					_camera . obj = objPlayer;
					_camera . zoom = 3;
					_camera . zoomTarget = 1;
					_camera . zoomSpeed = .025;
					_camera . obj = objDistanceBetween;
				
					audio_sound_gain(global.current_music,1,1500);
				
				
				
				break;
			
				case 750:
					// Show player he can "infinite jump"
					play_sfx(sndBlockChange);
				
				
					// Infinite jump sign
					if ie()
					{
						infinite_jump = true;
						var _attach = instance_create_layer(objPlayer.x,objPlayer.y,"Player",objAttachEntity);
						_attach . owner = objPlayer;
						_attach . yOff = -64;
						_attach . sprite_index = sprInfinite_Jump;
						with (_attach)
						{
							scale_to_destination(1,0,.5,.5,false,animCurve_Cubic,0,20);
							alpha_to_destination(0,1,false,animCurve_Cubic,0,20);
						}
					}
				break;
				
				// Show Checkpoint and save the progress
				case 775:
					var _Save = instance_create_layer(0,0,"Controllers",objCheckpointMessage_Battle);
					with _Save 
					{
						alpha_to_destination(0,1,false,animCurve_Cubic,0,60);
					}
				
					global.lastBossPhase = 2; 
					phase = global.lastBossPhase;
					// Reconfig the HP
					HP = 100;
					var _bossID = id;
					var _hp = HP;
					with (objHPIndicator){
						owner = _bossID;
						HPCurrent = _hp;
						HPMax = _hp;
					}
					
					allow_to_hit = true;
					save_game(false);
				break;
				
				// Fade out the messages
				case 875:
					with objAttachEntity
					{
						scale_to_destination(.5,.5,3,0,false,animCurve_Cubic,0,30);
						alpha_to_destination(1,0,false,animCurve_Cubic,0,30);	
					}
				
					with objCheckpointMessage_Battle 
					{
						alpha_to_destination(1,0,false,animCurve_Cubic,0,60);
					}
				break;
			
				// Prepare new attacks in phase 2
				case 900:
					ds_list_clear(attacks);
					ds_list_add(attacks, expand_circles, laserSimple, bulletsAim,laser_Fiesta);

					attacks_index = ds_list_size(attacks) - 1;
					ds_list_shuffle(attacks);
					
					allow_to_hit = false;
				break;
			
				// Start the fight
				case 910:
					change_state(attacks[|attacks_index]);
				break;

			}
		}
		cutsene_clock_arrive.stop = function(){
			var _shield = instance_create_depth(x,y,depth-1,objLB_Shield);
			_shield . owner = id;
			_shield . image_blend = c_red;
			with _shield alpha_to_destination(0,1,,,,20);
			
			// Set the distance camera focus
			with objDistanceBetween { distance_factor = 304; }
		}
	#endregion
	
	#region Resume fight in 2nd phase
	resumeFightIn2ndPhase.start = function()
	{
		t = 0;
		canFlip = false;
		
		// Set the distance camera focus
		with objDistanceBetween { distance_factor = 304; }
	}
	resumeFightIn2ndPhase.run = function()
	{
		if exists()
			t++
		else 
			t = -1;
			
		switch t 
		{
		case 1:
			// Infinite jump sign
			if ie()
			{
				infinite_jump = true;
				allow_to_hit = false;
				var _shield = instance_create_depth(x,y,depth-1,objLB_Shield);
				_shield . owner = id;
				_shield . image_blend = c_red;
				with _shield alpha_to_destination(0,1,,,,20);
				
				var _attach = instance_create_layer(objPlayer.x,objPlayer.y,"Player",objAttachEntity);
				_attach . owner = objPlayer;
				_attach . yOff = -64;
				_attach . sprite_index = sprInfinite_Jump;
				with (_attach)
				{
					scale_to_destination(1,0,.5,.5,false,animCurve_Cubic,0,20);
					alpha_to_destination(0,1,false,animCurve_Cubic,0,20);
				}
			}
		break;
		
		case 126:
			with objAttachEntity
			{
				scale_to_destination(.5,.5,3,0,false,animCurve_Cubic,0,30);
				alpha_to_destination(1,0,false,animCurve_Cubic,0,30);	
			}
			
			change_state(attacks[|attacks_index]);
		break;
		}
	}
	
	resumeFightIn2ndPhase.stop = function()
	{
		
	}
	
	#endregion
	
	#region She died
		boss_is_dead.start = function()
		{
			t = 0;	
		}
		boss_is_dead.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					with objPlayer frozen = true;
					instance_destroy(objCamera2);
					instance_destroy(objLB_Shield);
					var cam = camera_properties(0);
					view_position_destination(cam.view_x,cam.view_y,x-1024/2,y-576/2,false,animCurve_Expo,0,100);
					//with objCamera2 { obj = other.id; is_targeted = false; }
					play_sfx(snd_LB_BossLastHit);
					audio_sound_gain(global.current_music,0,2000);
					
					with objHPIndicator
					{
						value_to_destination(shiftY,-64,"shiftY",false,animCurve_Cubic,2,60);	
					}
					
					with objZaphkiel_Clock
					{
						alpha_to_destination(,0.001,false,,,150);	
					}
				break;
				

				case 150:
					instance_destroy(objZaphkiel_Clock);
					play_sfx(snd_LB_BossLastHit);
				break;
				case 50:
				case 100:
				case 200:
				case 250:
				case 300:
					play_sfx(snd_LB_BossLastHit);
				break
				
				case 350:
					var _s = instance_create_depth(x,y,depth-1,objStarFinaleScene);
					with _s {
						angle_to_destination(360*3,0,false,animCurve_Cubic,0,200);	
						alpha_to_destination(0,1,false,animCurve_Cubic,0,200);	
					}
					play_sfx(sndStarFinale)
				break;
				
				case 550:
					play_sfx(sndStarFinaleExplode);
					visible = false;
					with objStarFinaleScene
					{
						alarm[0] = 1;
						//scale_to_destination(,,1,1,true,,,30);
						
						part_particles_create(sys,x,y,typ,100);
					}
					//screenFlash(-20,"Out",30,c_white,.6);
					var cam = camera_properties(0);
					var _flash = Create(cam.view_x,cam.view_y,-100,objDummy,sprPoint1x1,0,0,1024,576,0,c_white,.6);
					with _flash alpha_to_destination(.6,0,,,,30);
				break;
				
				case 1000:
					var cam = camera_properties(0)
					var _transition = Create(cam.view_x,cam.view_y,-1000,objDummy,sprPoint1x1,0,0,1024,576,,c_black,0);
					with _transition alpha_to_destination(0,1,,,,300);
				break;
				case 1400:
					room_goto(rClearScreen);
					instance_destroy(objPlayer);
					
					instance_create_layer(x,y,"Controllers",objStageTransition,
					{
						roomTo : rClearScreen,
						autoSave : true,
					});
				break;
			}
		}
		boss_is_dead.stop = function()
		{
			t = 0;	
		}
	#endregion
#endregion

#region Attacks (Phase 2)
	#region Laser shot
		laser_shot.start = function()
		{
			t = 0;
		}
		laser_shot.run = function()
		{
			t++;
	
			switch t
			{
				case 1:
					play_sfx(sndCC_Area_Dark);
				break;
				
				case 50:
					
				break;
	
				case 100:
					change_state(able_to_shoot);
				break;
			}
		}
		laser_shot.stop = function()
		{
		
		}
	#endregion
	
	#region V6_physics (Not implemented)
		V6_physics.start = function()
		{
			t = 0;
		}
		V6_physics.run = function()
		{
			t++;
	
			switch t
			{
				case 1:
					play_sfx(sndGlass);
				break;
	
				case 100:
					change_state(able_to_shoot);
				break;
			}
		}
		V6_physics.stop = function()
		{
			
		}
	#endregion
	
	#region Expand circles
		expand_circles.start = function()
		{
			t = 0;
		}
		expand_circles.run = function()
		{
			t++;
			switch t
			{
				case 20:			
					play_sfx(sndCC_Area_Dark);
					var _prepare = instance_create_layer(x,y,"Killers",objAtt_CirclePrepare);
					with _prepare
					{
						value_to_destination(0,32,"radius",true,animCurve_Back,2,100);
						moveY_to_position(,,-64,true,animCurve_Back,2,100);
					}
				break;
				case 150:
					with objAtt_CirclePrepare
					{
						value_to_destination(radius,128,"radius",true,animCurve_Normal,0,200);
						gravity_direction = 90;
						gravity = .15;
					}
					play_sfx(sndCC_Magic_Dark);
				break;
				
				case 360:
					instance_destroy(objAtt_CirclePrepare);
				break;
				
				case 349:
					_ts = time_source_create(time_source_game,50,time_source_units_frames,function()
					{
						var _angleRNG = irandom(360);
						var _col = make_color_hsv(color_get_hue(c_red),210,255);
						play_sfx(sndTH_Shot4,1.3);
					
						for (var i = 0; i < 360; i+=360/8) {
						    var _explo = Create(x,y,-2,objAtt_FollowOrientation,sprBulletSpin,0,0,1,1,i+_angleRNG,_col,1);
							_explo . speed = 5;
							_explo . direction = i + _angleRNG;
						}
					},[],-1);
					time_source_start(_ts);
				break;
				
				
				case 350:
				case 500:
				case 650:
				case 800:
				case 950:
					if exists()
					{
						var _range = 128;
						var _getRatioX = objPlayer.x + irandom_range(-_range,_range);
						var _getRatioY = objPlayer.y + irandom_range(-_range,_range);
						
						_getRatioX = clamp(_getRatioX,_range,room_width - _range);
						_getRatioY = clamp(_getRatioY,_range,(room_height - 96) - _range);
						
						instance_create_depth(_getRatioX,_getRatioY,-1,objAtt_CircleExpanding2);
						
						
					}
					

				break;
				
				case 1000:
					time_source_stop(_ts);
				break;
		
				case 1200:
					change_state(able_to_shoot);
				break;
			}
		}
		expand_circles.stop = function()
		{
			instance_destroy(objAtt_CircleExpanding2);
		}
	#endregion
	
	#region Laser suzumi EX (Not implemented)
		laser_SuzumiEX.start = function()
		{
			t = 0;
			laserRotation = 90;
		}
		laser_SuzumiEX.run = function()
		{
			t++;
	
			switch t
			{
				case 1:
					play_sfx(sndCC_Necrozap);
				break;
				
				case 50:
					_ts = time_source_create(time_source_game,2,time_source_units_frames,function()
					{
						var _laser = Create(x,y,depth-1,objSuzumiLaser,sprLaserBurst_Jinx,0,0,5,.5,laserRotation,,);
						_laser . speed = .75;
						_laser . direction = laserRotation-90;
						_laser . alarm[0] = 5;
						_laser . duration = 160;
						//_laser . destroy = 170;
						
						
						laserRotation -= 2;
					}, [], -1);
					time_source_start(_ts);
				break;
				
				case 700:
					time_source_stop(_ts);
				break;
				case 1000:
					change_state(able_to_shoot);
				break;
			}
		}
		laser_SuzumiEX.stop = function()
		{
		
		}
	#endregion
	
	#region Laser simples
		laserSimple.start = function()
		{
			t = 0;	
		}
		laserSimple.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					attack_begin_effect(c_purple,150);
				break;
				
				case 60:
					var _col = make_color_hsv(color_get_hue(c_purple),170,255);
					repeat(30)
					{
						var _knife = Create(x,y,depth-1,objAtt_wrapmode,sprBulletSpin,0,0,1,1,0,_col,1);
						_knife . speed = random_range(4,8);
						_knife . direction = irandom(360);
						
					}
					play_sfx(sndTH_Shot4);
				break;
				case 300:
				case 400:
				case 500:
				case 600:
				case 700:
					spawnLaser()
				break;
				
				case 900:
					with objAtt_wrapmode
					{
						canKill = false;
						alpha_to_destination(1,0,,,,40);
					}
				break;
				
				case 1000:
					change_state(able_to_shoot);
				break;
			}
		}
		laserSimple.stop = function()
		{
			t = 0;	
		}
	#endregion
	
	#region Bullet Aim (A.K.A the bruh attack)
		bulletsAim.start = function()
		{
			t = 0;	
		}
		bulletsAim.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					play_sfx(sndSpecialMove);
				break;
				case 100:
				case 400:
					instance_create_depth(x,y,depth-1,objLaserCircle_Controller);
					
					// Create aim
					var _aim = instance_create_layer(x,y,"Player",objAimToPlayer);
					with _aim {
						angle_speed = irandom(4) + 1;
						image_angle = irandom(360);
						alpha_to_destination(0,1,,,,50);
						scale_to_destination(4,4,1.5,1.5,false,animCurve_Circle,,50);
					}
				break;
				
				case 350:
				case 650:
					with objAimToPlayer
					{
						alpha_to_destination(1,0,,,,10);
						scale_to_destination(,,4,4,true,,,10);
					}
				break;
				case 700:
					change_state(able_to_shoot);
				break;
			}
		}
		bulletsAim.stop = function()
		{
			t = 0;	
		}
	#endregion
	
	#region Laser Fiesta
		laser_Fiesta.start = function()
		{
			t = 0;	
		}
		laser_Fiesta.run = function()
		{
			t++; 
			
			switch t
			{
				case 1:
					attack_begin_effect(c_red,150);
					
				break;
				
				case 60:
					_ts = time_source_create(time_source_game,10,time_source_units_frames,function()
					{
						var cam = camera_properties(0);
						var _rngX = cam.view_x + irandom(cam.view_w);
						var _rngY = cam.view_y + irandom(cam.view_h);
						
						var _laser = Create(_rngX,_rngY,-1,objSuzumiLaserFiesta,sprLaserBurst_Jinx,0,0,6,.5,irandom(360),,);
						_laser . alarm[0] = 100;
						_laser . duration = 50;
					},[],-1);
					
					time_source_start(_ts);
				break;
				
				case 600:
					time_source_stop(_ts);
				break;
				
				case 800:
					change_state(able_to_shoot);
				break;
			}
		}
		laser_Fiesta.stop = function()
		{
			t = 0;	
		}
	#endregion
#endregion

#region 

#endregion


var state_start = (global.lastBossPhase = 1) ? attacks[|attacks_index] : resumeFightIn2ndPhase;
init_state(state_start);






// Custom functions
function targetPlayer()
{
	var direPoint = irandom(360);
	if ie(objPlayer)
		direPoint = point_direction(x,y,objPlayer.x,objPlayer.y);
	
	return direPoint;
}
function ie(_obj = objPlayer)
{
	return instance_exists(_obj);
}

function camera_focus(object_instance = objPlayer)
{
	instance_deactivate_object(objDistanceBetween);
	if ie(object_instance)
	{
		with objCamera2 obj = object_instance;	
	}
}

function camera_reset_config()
{
	instance_activate_object(objDistanceBetween);
	with objCamera2 obj = objDistanceBetween;	
}

function safe_spot(_time_duration = 40, _color = c_white, _sat = 200)
{
	move_to_position(,,room_width/2,room_height-96-224,false,animCurve_Cubic,0,_time_duration);
	alarm[0] = 1;	
	
	
	attack_begin_effect(_color,_sat);
	

}

function spawnLaser()
{
	var _rngAngle = irandom(360);
	var _targetX = 0;
	var _targetY = 0;
	
	if exists()
	{
		_targetX = objPlayer.x;
		_targetY = objPlayer.y;
	}
	
	var _laserPlayer = Create(_targetX,_targetY,depth-1,objSuzumiLaser,sprLaserBurst_Jinx,0,0,6,.5,_rngAngle,c_red,1);
	_laserPlayer . duration = 50;
	_laserPlayer . alarm[0] = 100;
	
	// Small lasers
	_laserPlayer = Create(_targetX,_targetY,depth-1,objSuzumiLaser,sprLaserBurst_Jinx,0,0,1,.5,_rngAngle+45,c_red,1);
	_laserPlayer . duration = 50;
	_laserPlayer . alarm[0] = 100;
	
	_laserPlayer = Create(_targetX,_targetY,depth-1,objSuzumiLaser,sprLaserBurst_Jinx,0,0,1,.5,_rngAngle-45,c_red,1);
	_laserPlayer . duration = 50;
	_laserPlayer . alarm[0] = 100;
	
	
}

function attack_begin_effect(_color,_sat)
{
	_color = make_color_hsv(color_get_hue(_color),_sat,255);
	part_type_color1(pTypStar,_color);
	part_particles_create(pSysStar,x,y,pTypStar,25);
	
	part_type_color1(pTypCircle,_color);
	part_particles_create(pSysCircle,x,y,pTypCircle,1);	
}
// Canvas
/*
t++;
	
switch t
{
	case 1:
		play_sfx();
	break;
	
	case 100:
		change_state(boss_on_ground);
	break;
}

