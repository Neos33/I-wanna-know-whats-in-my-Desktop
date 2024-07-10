/// @description 
image_speed = 0;
radius = 80;
dire = 270;

radiusScale = .25;

depth = copyDepth("Tiles_1");
_depth = depth;

hue = color_get_hue(image_blend);

land_on_block = false;
xx = 0;
player_xscale = 1;

//sprite_shadow = sprBeybladeBlock2;
duration = 20;
//currentWidth = sprite_get_width(sprite_index);
/*
function create_shadow(_x,_y,_sprite,_index,_color = image_blend,_alpha,_scale,_depth_,_duration,_fadeOut = -1,opt_alpha_decrease = true,opt_scale_decrease = true)
{
	var _inst = instance_create_depth(_x,_y,_depth_,objShadow);
	_inst . sprite_index = _sprite;
	_inst . image_speed = image_speed;
	_inst . image_index = _index;
	_inst . image_xscale = _scale;
	_inst . image_yscale = _scale;
	_inst . image_alpha = _alpha;
	_inst . image_angle = image_angle;
	_inst . image_blend = _color;
	
	_inst . decrease_alpha = opt_alpha_decrease;
	_inst . decrease_scale = opt_scale_decrease;
	
	_inst . alpha_speed = 1/_duration * _fadeOut;
	_inst . scale_speed = 1/_duration * _fadeOut;
}