/// @description 
/*
if instance_exists(objPlayer)
{
    if sprite == sprKaizoBlock_Editor
    {
        if other.vspeed<0 and y+32<other.bbox_top
        {
	        //if collision_line(x,y+33,x+32,y+33,objPlayer,false,true)// and objPlayer.sprite_index == sprPlayerJump
	        {
	            sprite = sprKaizoBlock;
	            index = 0;
	            image_speed = 0;

	            moveX = 16;
	            moveY = 32;
	            alarm[0] = 1;
	            other.vspeed = 0;
            
	            visible = true;
	            //solid = true;
	            depth -= 1;
	            instance_create_depth(x,y,depth,objBlock);
				play_sfx(sndBlockChange);
	            //audio_play_sound(sndMarioCoin,0,false);
	        }
        }
    }
    
    /*if objPlayer.bbox_top < self.bbox_bottom
    {
        mask_index = sprite_index;
    }
    else
    {
        mask_index = sprNull;
    }
}

