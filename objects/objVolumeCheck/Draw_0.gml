/// @description 
var xx = 64;
var yy = 100;
setDrawSettings(ftOptionsNew,fa_right,fa_middle,c_white,1);
for (var i = 0; i < 3; ++i) {
    draw_text(1024/2-xx,576/2+yy + 32*i,options[i]);
}

draw_set_halign(fa_left)

//Percentage
draw_text(1024/2+xx,576/2+yy,string_interp("{0}%",floor(global.display.volMaster * 100)));
draw_text(1024/2+xx,576/2+yy + 32,string_interp("{0}%",floor(global.display.volBGM * 100)));
draw_text(1024/2+xx,576/2+yy + 32*2,string_interp("{0}%",floor(global.display.volSFX * 100)));

//Spike cursor
draw_sprite_ext(sprSpikeRight,0,1024/2-xx-80,576/2+yy - 8 + 32*index,.5,.5,0,make_color_hsv(0,0,255),.8);

//volume bar
draw_sprite_ext(sprPoint1x1,0,1024/2-50,576/2+yy-4 + 32*0,global.display.volMaster * 100,8,0,c_white,1);
draw_sprite_ext(sprPoint1x1,0,1024/2-50,576/2+yy-4 + 32*1,global.display.volBGM * 100,8,0,c_white,1);
draw_sprite_ext(sprPoint1x1,0,1024/2-50,576/2+yy-4 + 32*2,global.display.volSFX * 100,8,0,c_white,1);


setDrawSettings(ftOptionsNew,,fa_bottom,c_white,1);
draw_text(0,576,"Press 'Shift' to continue");

draw_set_halign(fa_right);
draw_text(1024,576,"Press 'Z' to test sound");


rect(0,0,1024,576,,c_black,alphaFade);

setDrawSettings();