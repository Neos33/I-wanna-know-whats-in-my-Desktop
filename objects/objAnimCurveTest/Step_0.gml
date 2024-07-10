/// @description 

curvePosition += curveSpeed;

var _struct = animcurve_get(curveAsset);

var _channel = animcurve_get_channel(_struct,"In");

var _value = animcurve_channel_evaluate(_channel,curvePosition);

x = xstart + _value*200;
