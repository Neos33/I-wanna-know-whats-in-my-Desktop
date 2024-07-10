/// @description 

// Inherit the parent event
event_inherited();

segment = 0;
count[segment] = -1;
blockIndex = 0;

counter_check = function(){}

createBlock = function(xx,yy,sprite,index,imgSpeed = 0)
{
	obj[blockIndex] = Create(xx+16,yy+16,"Collisions",objBlock,sprite,index,imgSpeed,1,1,0,c_white,0);
	obj[blockIndex] . visible = true;
	with obj[blockIndex] { alpha_to_destination(0,1,false,animCurve_Cubic,0,30); }
	blockIndex++;
}
segment = 0;
count[0] = 5;
count[1] = 5;
count[2] = 1;
t = 0;

pattern[0] = new state();
pattern[1] = new state();
pattern[2] = new state();

#region Pattern 0
pattern[0].start = function(){t = 0; keepGoing = true;}
pattern[0].run = function()
{
	if keepGoing
		t++;

	switch t
	{
		case 20:
			//Create blocks in the entry room
			for (var i = 0; i < 3; ++i) {
			    createBlock(2240,2048+32*i,sprBlock_Texture_Center,6);
				createBlock(2848,2048+32*i,sprBlock_Texture_Center,6);
			}
			
			play_sfx(sndBlockChange);
			
			var _txt = instance_create_layer(2464,2240,"Collisions",objText);
			_txt . font = ftReferenceSelection;
			_txt . halign = fa_left;
			_txt . valign = fa_center;
			_txt . color = c_white;

			_txt . text = "Destroy";

			_txt . use_outline = true;
			with _txt 
			{
				value_to_destination(0,1,"alpha",,animCurve_Normal,,60);
			}
			
			var _cherryIndication = instance_create_layer(2624,2240,"Collisions",objCherry);
			_cherryIndication . image_speed = 1/3;
			_cherryIndication . image_blend = c_red;
			_cherryIndication . sprite_index = sprSpikeBall_Sat;
			with _cherryIndication
			{
				alpha_to_destination(0,1,,,,60);	
			}
		break;
		
		/*case 99: // Fade out the indication
			var _cherryIndication = instance_place(1632,512,objCherry);
			var _txt = instance_place(1408,512,objText);
			
			with _cherryIndication
				alpha_to_destination(image_alpha,0,,,,60);	
				
			with _txt
				value_to_destination(alpha,0,"alpha",,,,60);
		break;*/
		
		
		case 100:
		var cam = camera_properties(0);
		var rng = irandom_range(5,30);
			for (var i = 0; i < 360; i+=360/count[0]) {
			    var _s = instance_create_layer(cam.view_x+1024/2,cam.view_y+576/2-32,layer,objS2_CherryBounce);
				_s . segmentPattern = 0;
				_s . direction = i-rng;
				_s . speed = 3;
				_s . image_blend = c_red;
			}
			play_sfx(sndShoot);
		break;
		
		case 101:
			keepGoing = false; t++;
		break;
		
		case 102: // Timer is already stopped here
			if count[0] == 0 //Fruits has been destroyed, then run the timer once again
			{
				keepGoing = true;
			}
		break;
		
		case 160:
			instance_destroy(objSolidTemp);
			//var _txt = instance_place(1408,512,objText);
			//instance_destroy(_txt);
			change_state(pattern[1]);
			play_sfx(sndMinigame_Win);
		break;
	}
	
	
}
#endregion

#region pattern 1
pattern[1].start = function(){t = 0; keepGoing = true;}
pattern[1].run = function()
{
	if keepGoing
		t++;

	switch t
	{
		case 60:
			play_sfx(sndBlockChange);
			var _cherryIndication = instance_place(2624,2240,objCherry);			
			with _cherryIndication 
				color_to_destination(,c_green,,,40)
		break;
		
		case 100:
			var cam = camera_properties(0);
			for (var i = 0; i < count[1]; ++i) {
				var _rng = irandom_range(2272+16,2272+16+32*17);
			    var _s2 = instance_create_layer(_rng,cam.view_y+96+16,"Instance_Under_Tiles",objS2_CherryCount);
				_s2.vspeed = random_range(1,3);
				_s2.segmentPattern = 1;
				_s2.image_blend = c_green;
			}
			play_sfx(sndShoot);
			//var ss = instance_create_depth(2272+48,96+16,0,objCherry)
			//ss . vspeed = 1;
		break;
		
		//case 501:
		//	keepGoing = false; t++;
		//break;
		
		case 452: // Timer is already stopped here
			if !count[1] == 0 //Fruits has been destroyed, then run the timer once again
			{
				//keepGoing = true;
				play_sfx(sndMinigame_Lose);
				count[1] = 5; // Reset
				with objS2_CherryCount{
					if image_blend == c_green
						instance_destroy();}
						
				t = 10;
			}
		break;
		
		case 470:
			change_state(pattern[2]);
			play_sfx(sndMinigame_Win);
		break;
	}
}
#endregion

#region pattern 2
pattern[2].start = function(){t=0}
pattern[2].run = function()
{
	if keepGoing
		t++;
	switch t
	{
		case 50:
			play_sfx(sndBlockChange);
			var _cherryIndication = instance_place(2624,2240,objCherry);			
			with _cherryIndication 
				color_to_destination(,c_aqua,,,40);
		break;
		
		case 70:
			if count[2] == 0
				t = 1180;
		break;
		
		case 200:
			audio_sound_gain(global.current_music,0.25,1000);
		break;
		
		case 250:
			var cam = camera_properties(0);
			instance_create_depth(2368,cam.view_y,depth-1,objMemeForgot)
			play_sfx(sndForgotDialogue1);
		break;
				
	
		case 400:
			play_sfx(sndForgotDialogue2);
			with objMemeForgot frame[0] = true;
		break;
	
		case 600:
			play_sfx(sndForgotDialogue3);
			with objMemeForgot frame[1] = true;
		break;
		case 700:
			with objMemeForgot frame[2] = true;
		break;
		
		case 800:
			//stopTimer = true;
			instance_destroy(objBetterCamera);
			play_sfx(sndBlockChange);
			
			view_position_destination(1024*2,576*3,256+64,0,true,animCurve_Cubic,2,40);
			
			//You forgot about this one
			with instHiddenOneReal
			{
				text = "You forgot this one\nmi amigo";	
			}
		break;
		
		case 1000:
			view_position_destination(1024*2+256+64,576*3,-256-64,0,true,animCurve_Cubic,2,40);
			audio_sound_gain(global.current_music,1,1000);
		break;
		case 1001: keepGoing = false; break;
		
		case 1300:
			play_sfx(sndMinigame_Win);
			//instance_create_layer(0,0,"Controllers",objBetterCamera);
			
			//Destroy blocks entry
		break;
		
		case 1400:
			var _cherryIndication = instance_place(2624,2240,objCherry);
			var _txt = instance_place(2464,2240,objText);
			
			with _cherryIndication
				alpha_to_destination(image_alpha,0,,,,60);	
				
			with _txt
				value_to_destination(alpha,0,"alpha",,,,60);
				
			play_sfx(sndBlockChange);
			
			//var _array = array_length(obj);
			for (var i = 0; i < blockIndex; ++i) {
				with obj[i] { 
					alpha_to_destination(1,0,false,animCurve_Cubic,0,30);
				}
			}
		break;
	}
}
pattern[2].stop = function(){}
#endregion


init_state(pattern[0]);