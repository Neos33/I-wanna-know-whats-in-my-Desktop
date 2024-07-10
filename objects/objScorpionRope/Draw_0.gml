/// @description 

//Old kunai sprite
//draw_sprite_part_ext(sprite_index,0,0,0,1,16,xstart,ystart-8,x-xstart,1,c_white,1);


// Draw Chains
if x != xstart
{
	for (var i = xstart; i < x; i+=5) {
		draw_sprite_part_ext(sprScorpionKunai_Chain,0,0,0,5,16,i,ystart-2,1,1,c_white,1);
	}
}

// Draw kunai spike
draw_self();

//draw_hitbox(c_purple);