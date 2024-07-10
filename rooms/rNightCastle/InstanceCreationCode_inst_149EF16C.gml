visible = false;

contraption = function()
{
	var i = 0;
	repeat 4
	{
		var _block = Create(6224+32*i,1040,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,,0);
		_block . visible = true;
		_block . groundSFX = "Concrete";
		with _block alpha_to_destination(0,1,,,,20);
		i++
	}
	//_block . image_xscale = 4;
	
	instance_destroy();
}