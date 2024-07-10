visible = false;

contraption = function()
{
	var _boss = Create(2560,1440,layer,objCherryBoss_Fake,sprCherry,0,1/15,3,3,0,c_white,0);
	with _boss alpha_to_destination(0,1,,,,60);
	
	var i = 0;
	repeat 2
	{
		//Left
		Create(2288,1424+32*i,"Killers",objBlockTrgMove,sprBlock_Texture_Center,1,0,1,1,0,c_white,1);
		//Right
		Create(2832,1424+32*i,"Killers",objBlockTrgMove,sprBlock_Texture_Center,1,0,1,1,0,c_white,1);
		i++	
	}
	
	play_sfx(sndBlockChange);
	instance_destroy();
}	