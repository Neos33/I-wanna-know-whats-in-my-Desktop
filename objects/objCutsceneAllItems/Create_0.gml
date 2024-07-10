/// @description 
timer = 0;
showShadows = false;
cinematicScale = 0;

itemIndex = 0;

//Instances IDs
luz_de_dios = noone;
she = noone;

#region Particles
	pSys = part_system_create();
	part_system_depth(pSys,depth + 1);
		
	pTyp = part_type_create();
		
	part_type_alpha2(pTyp,1,0);
	//part_type_blend(pTyp,true);
	part_type_sprite(pTyp,sprSuzumiNormalGlow,true,false,false);
	part_type_life(pTyp,10,10);
	part_type_color1(pTyp,c_black);
#endregion


if global.lastCutsceneComplete
{
	// Create the boss and start the fight inmeadietly
	instance_create_layer(1664,1536,"Controllers",objLastBoss);
	
	
	with objPlayer
		frozen = false;		
	
	timer = -1;
	instance_destroy(objItemsShows);
	instance_destroy(objGemGotShowcase);
	instance_destroy(objGemRockPlace);
	//instance_destroy(objWindAmbienceMusic);
	instance_destroy();
	
}


function place_gems(item_index, shiftX, shiftY, duration = 100)
{
	var _TargetX = 1536;
	var _TargetY = 1568;
	
	shiftY -= 1;
	with objGemGotShowcase
	{
		if image_index == item_index
		{
			angle_speed = 0;
			value_to_destination(pointX,_TargetX+shiftX,"pointX",false,animCurve_Cubic,2,duration);
			value_to_destination(pointY,_TargetY+shiftY,"pointY",false,animCurve_Cubic,2,duration);	
			value_to_destination(radius,0,"radius",false,animCurve_Cubic,2,duration);	
		}
	}	
}