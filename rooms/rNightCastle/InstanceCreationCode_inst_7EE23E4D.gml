if !global.S3_fanON
{
	instance_destroy();
	exit;
}

part_type_speed(pt,5,7,.13,0);
part_type_life(pt,120,160);

//emit_posX = x+x_offset;
update_position = true;