/// @description 
var _distance = 64;
var appearEff_Top = instance_create_depth(x,y-_distance,depth-1,objSemiCircleAppearEff);
with appearEff_Top { move_to_position(,,0,_distance*2,true,animCurve_Cubic,"InOut",100); }
var appearEff_Bottom = instance_create_depth(x,y+_distance,depth-1,objSemiCircleAppearEff);
with appearEff_Bottom { move_to_position(,,0,-_distance*2,true,animCurve_Cubic,"InOut",100); }

image_alpha = 0;
image_blend = c_black;

image_speed = 1/5;

duration = 400;
t = 0;
