/// @description 
alarm[0] = irandom_range(60,200);

BG = layer_background_get_id("BG_Spikes");

layer_background_alpha(BG, 0.1);
layer_background_visible(BG,true);
layer_background_blend(BG,c_white);
layer_background_change(BG,sprBGSpiky);
layer_background_htiled(BG,true);
layer_background_vtiled(BG,true);