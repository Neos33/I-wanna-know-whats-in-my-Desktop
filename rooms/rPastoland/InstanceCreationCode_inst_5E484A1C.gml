index = 0;
setBlocks = function(xx,yy,xxscale)
{
	instBlock[index] = instance_create_layer(xx,yy,"Collisions",objBlock);
	instBlock[index] . image_xscale = xxscale;
	//instBlock[index] . visible = true; //Debug
	index++;
}
var _theX = x - sprite_xoffset;
var _theY = y - sprite_yoffset;
setBlocks(_theX + 64, _theY, 2     ); setBlocks(_theX + 64 + 128, _theY, 2);
setBlocks(_theX + 32, _theY + 32, 6);
setBlocks(_theX, _theY + 64, 7     );
setBlocks(_theX + 32, _theY + 96, 4);



blockFall = new trigger_dynamic();

blockFall.action_begin = function()
{
	t = 0;
	sBinalla = true;
}
blockFall.action_step = function()
{
	t++;
	if sBinalla
	{
		image_angle += speed;	
	}
	switch t
	{
		case 30:
			play_sfx(sndBreak);
			var _totalBlocks = array_length(instBlock);
			for (var i = 0; i < _totalBlocks; ++i) {
			    instance_destroy(instBlock[i]);
			}
			gravity = .2;
			
		break;
	}
}
blockFall.action_end = function()
{
	
}

init_trigger(blockFall,1);