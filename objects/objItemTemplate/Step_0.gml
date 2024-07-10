/// @description 
if !collected exit;



switch timer
{
	case 0:
		move_to_position(,,0,-160,true,animCurve_Cubic,2,80);
	break;
	
	case 100:
		play_sfx(explodeSFX,1);
		var _color = color_gem(120);

		part_particles_create_color(global.pGemExplode_System,x,y,global.pGemExplodeLine_Type,_color,50);
		part_particles_create_color(global.pGemExplode_System,x,y,global.pGemExplodeCircle_Type,_color,50);
		screenFlash(0,"out",20,_color,.6);
		
		instance_destroy();
	break;
}
timer++
var shakeMagnitude = timer / 25;
shakeX = random_range(-shakeMagnitude,shakeMagnitude);
shakeY = random_range(-shakeMagnitude,shakeMagnitude);

alphaLayer = map(timer,0,100,0,1);