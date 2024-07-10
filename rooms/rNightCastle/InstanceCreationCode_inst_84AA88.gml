visible = false;

contraption = function()
{
	var i = 0;
	repeat 6
	{
		Create(1456,1168+32*i,"Killers",objDummy,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);	
		Create(1616,1168+32*i,"Killers",objDummy,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);	
		
		i++;	
	}
	instance_destroy();
}