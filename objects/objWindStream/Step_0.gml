/// @description 
if instance_exists(objPlayer)
{
	x = objPlayer.x-x_offset;
	if update_position
	{
		//emit_posX = objPlayer.x+x_offset;
		emit_posY = objPlayer.y+y_offset;
		
		//emit_posX = clamp(emit_posX,x,x + sprite_width)
	}
	x = clamp(x,xstart-x_offset,xstart+x_offset);
	audio_emitter_position(emit,x+64,emit_posY,0);

}
