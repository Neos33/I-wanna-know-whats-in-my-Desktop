/// @description 
if exists()
{
	if place_meeting(x,y,objPlayer) and !activated
	{
		//showSign
		if is_pressed(global.controls.up)
		{
			activated = true;
			//image_blend = c_red;
			angle_to_destination(,30,false,animCurve_Bounce,0,30);
			play_sfx(sndBlockChange);
			
			global.S3_fanON = true;
			save_game(false);
			
			Create(1072,1472,"Miscellaneous",objDummy,sprSignIndicator,1,0,1,1,0,c_white,1);
			
			var windLeft = instance_create_layer(160,2272,"Instance_Under_Tiles",objWindStream);
			windLeft . image_xscale = 4;
			windLeft . x_offset = 4 * 32 / 2;
			windLeft . y_offset = 32;
			windLeft . update_position = true;
			with windLeft
			{
				part_type_speed(pt,5,7,.13,0);
				part_type_life(pt,120,160);
				part_emitter_region(ps,pemi,x,x+4*32,y+48,y+48,ps_shape_rectangle,ps_distr_linear);
				//emit_posX = x+x_offset;
				
			}
			var windRight = instance_create_layer(1472,2272,"Instance_Under_Tiles",objWindStream);
			windRight . image_xscale = 4;
			windRight . soundID = sndWindStreamLoop;
			windRight . x_offset = 4 * 32 / 2;
			windRight . y_offset = -64;
			with windRight
			{				
				part_type_speed(pt,4,7,.13,0);
				part_type_life(pt,60,90);
				part_emitter_region(ps,pemi,x,x+4*32,y+48,y+48,ps_shape_rectangle,ps_distr_linear);

				//update_position = true;
			}
			instance_activate_object(objWindPush);
			with objWindPush
			{
				y -= 576*3;	
			}
		}
	}
}