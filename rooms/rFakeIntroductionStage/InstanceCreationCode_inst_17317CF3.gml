visible = false;

contraption = function()
{
	var _block = Create(1088+16,704+16,"Killers",objBlock,sprBlock_Texture_Center,0,0,1,1,0,c_white,1);
	_block . visible = true;
	play_sfx(sndBlockChange);
	instance_destroy();	
}