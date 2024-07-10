/// @description 
if canGrab_player and instance_exists(objPlayer)
{
	canGrab_player = false;
	with (objPlayer) { frozen = true; visible = false; }
	stopMoving = true;
	speed = 0;
	play_sfx(sndMK_ScorpionRope_Grab);
	alarm[0] = 50;
	
	var changePlayer = instance_create_layer(other.x,other.y,"Player",objPlayerGrabbed);
	changePlayer . owner = id;
	changePlayer . image_index = other.image_index;
	changePlayer . image_xscale = other.xscale;
	
	var xx = other.x - x;
	var yy = other.y - y;
	
	changePlayer.offsetX = xx;
	changePlayer.offsetY = yy;
	
	// Burst particles
	part_particles_create(global.pScorpionRopeSplitBlood_System,other.x,other.y,global.pScorpionRopeSplitBlood_Type,50);
}