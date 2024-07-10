/// @description 
t++;
Record(ord("W"),t);
if is_pressed(ord("S")) and t < 619 {t = 619;} //DEBUG
switch t
{
	case 2:
		alarm[0] = 1;
		var _s = instance_create_depth(1024/2,576/2,-1,objText);
		_s . text = "Neos presents";
		_s . halign = fa_center;
		_s . valign = fa_middle;
		_s . font = ftReferenceSelection;
		with _s value_to_destination(0,1,"alpha",,,,20);
	break;
	
	case 104:
		with objText moveY_to_position(,,-32,true,,,20);
		
		var _s = instance_create_depth(1024/2,576/2+32,-1,objText);
		_s . text = "A game made for";
		_s . halign = fa_center;
		_s . valign = fa_middle;
		_s . font = ftReferenceSelection;
		with _s value_to_destination(0,1,"alpha",,,,20)
	break;
	
	case 60:

	break;
	case 287:
		
	break;
	case 288: // Show event
		instance_destroy(objText);
		alarm[0] = 0;
		part_particles_clear(psys);
		alpha_to_destination(1,0.0001,false,,,10);
		with objHeyan_Intro
		{
			value_to_destination(textX,-256-128,"textX",true,animCurve_Back,0,50);
			value_to_destination(spriteX,256-16,"spriteX",true,animCurve_Back,0,50);
		}
			//curvePosition = 0;
			
		view_position_destination(1024/2-1024/4,576/2-576/4,0,0,false,animCurve_Cubic,0,30);
		view_size_destination(1024/2,576/2,1024,576,false,animCurve_Cubic,0,30);
		

	break;
	case 450: // Circle and Fade in 
		repeat(2)
			Create(1024/2,576/2,-1,objDummy,sprLightCheap,0,0,0,0,0,c_white,1);
			
		with objDummy
		{
			scale_to_destination(,,50,50,false,animCurve_Cubic,2,150);	
		}
		
		var _s = Create(0,0,"Controllers",objDummy,sprPoint1x1,0,0,room_width,room_height,0,c_white,0);
		with _s
		{
			alpha_to_destination(0,1,,,,619-450);
		}
	break;
	case 619:
		instance_create_depth(0,0,-1,objIntroTransition);
		
		
	break;
	case 620:
		room_goto_next();
	break;	
}