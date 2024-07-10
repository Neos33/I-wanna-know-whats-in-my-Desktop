/// @description 
image_alpha = lerp(image_alpha, 1, 0.20);

if instance_exists(objPlayer)
audio_emitter_position(emit,x,objPlayer.y,0);
