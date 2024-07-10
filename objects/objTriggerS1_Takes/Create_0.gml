/// @description 

switch global.S1_Trap_Take
{
	case 0:
		image_blend = c_red;
	break;
	
	case 1:
		image_blend = c_green;
	break;
	
	case 2:
		image_blend = c_blue;
	break;
}

function execute_trap(situation)
{
	switch situation
	{
		case 0:
			play_sfx(sndSpikeTrap);
			var _slide = instance_create_layer(x,y+32,"Collisions",objBlocksConveyors);
			_slide . image_xscale = 6;
			_slide . conveyor_spd = 6;
			_slide . conveyor_animation_speed = _slide . conveyor_spd / 3;
			global.S1_Trap_Take = 1;
		break;
		
		case 1:
			var _spd = 8;
			var _rope = instance_create_layer(4416,352+16,"Killers",objScorpionRope);
			_rope . speedStart = _spd;
			_rope . speedBack = 4;
			_rope . speed = _spd;
			//play_sfx(sndGunShot);
			var _block = instance_create_layer(4416-32,352,"Collisions",objBlock);
			_block . sprite_index = sprMK_Scorpion_Trilogy;
			_block . visible = true;
			global.S1_Trap_Take = 2;
			
		break;
		
		case 2:
			play_sfx(sndSpikeTrap);
			var _slide = instance_create_layer(x,y+32,"Collisions",objBlocksConveyors);
			_slide . image_xscale = 6;
			_slide . conveyor_spd = -6;
			_slide . conveyor_animation_speed = _slide . conveyor_spd / 3;
			global.S1_Trap_Take = 0;
		break;
		
	}
}
