/// @description 
var _text = instance_create_depth(xstart,ystart-192,0,objText);
_text . use_outline = true;
_text . halign = fa_center;
_text . font = ftOptionsNew;
_text . text = "You can restart if you want";

alarm[1] = 150;