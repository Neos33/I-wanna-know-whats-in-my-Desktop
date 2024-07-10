/// @description 
//if (bbox_bottom <= objPlayer.bbox_top)  image_blend = c_red else image_blend = c_white;

if instance_exists(objPlayer) and sprite == sprKaizoBlock_Editor
{
	if objPlayer.vspd < 0 //and y+30*image_yscale<objPlayer.bbox_top //and bbox_bottom < objPlayer.bbox_top //and y+30*image_yscale<objPlayer.bbox_top
    {
	    //if collision_line(x,y+33*image_yscale,x+32*image_xscale,y+33*image_yscale,objPlayer,false,true)// and objPlayer.sprite_index == sprPlayerJump
	    if bbox_bottom <= objPlayer.bbox_top - objPlayer.vspd
		{
		if collision_rectangle(x,y+32*image_yscale,x+31*image_xscale,y+33*image_yscale,objPlayer,false,false)
		//if place_meeting(x,y+objPlayer.vspd,objPlayer)
		//if place_meeting(x,y+objPlayer.vspd,objPlayer)
		{
	        sprite = sprKaizoBlock;
	        index = 0;
	        image_speed = 0;

	        moveX = 16*image_xscale;
	        moveY = 32*image_yscale;
	        alarm[0] = 1;
			
			//var _bottom = bbox_bottom;
			with objPlayer
			{
		        vspd = 0;
				//y += 1;
				y = yprevious;
				//y = _bottom + 11;
				y = floor(y);
			}
            
	        visible = true;
	        //solid = true;
	        depth -= 1;
			
			play_sfx(sndCoinPickup);
			
			// Create a block
	        var _block = instance_create_depth(x,y,depth,objBlock);
			_block . image_xscale = image_xscale;
			_block . image_yscale = image_yscale;
			
	        //audio_play_sound(sndMarioCoin,0,false);
	    }}
    }
}
    
    /*if objPlayer.bbox_top < self.bbox_bottom
    {
        mask_index = sprite_index;
    }
    else
    {
        mask_index = sprNull;
    }*/


