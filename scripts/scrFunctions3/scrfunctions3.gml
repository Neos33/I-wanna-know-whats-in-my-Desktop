// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function showReference(_x,_y,_type,_number,_name,_image)
{
	if global.display.useReferences 
	{
		var captainAmerica = instance_create_layer(x,y,"Controllers",objReferenceSetup);
		captainAmerica . pX = _x;
		captainAmerica . pY = _y;
		captainAmerica . spriteReference = _image;
		captainAmerica . type_element = _type;
		captainAmerica . number_index = _number;
		captainAmerica . referenceTitle = _name
	}
	
	
}