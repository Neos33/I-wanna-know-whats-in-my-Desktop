if !global.S3_fanON
{
	instance_destroy();
	exit;
}

part_type_speed(pt,4,7,.13,0);
part_type_life(pt,60,90);

//emit_posX = x+x_offset;
//emit_posY = y-64+y_offset;