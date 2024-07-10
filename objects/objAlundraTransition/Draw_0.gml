/// @description 
var cam = camera_properties(0);

if sprite_exists(localsprite)
{
	rect(cam.view_x,cam.view_y,1024,576,0,c_black,1);
	for (var rX = 0; rX < 32; rX += 1) {
        for (var rY = 0; rY < 18; rY += 1) {
			if scale[rX,rY] > 0
			{
			xx[rX,rY] += lengthdir_x(spd[rX,rY], dire[rX,rY]+direMove[rX,rY]);
			yy[rX,rY] += lengthdir_y(spd[rX,rY], dire[rX,rY]+direMove[rX,rY]);
			//angle[rX,rY] += angle_speed[rX,rY];
			angle[rX,rY] = (1 - scale[rX,rY])*(50 * angle_choose[rX,rY]);
			scale[rX,rY] += -scale_speed[rX,rY]*3;
			scale[rX,rY] = clamp(scale[rX,rY],0,1);
			draw_sprite_general(localsprite,0,32*rX,32*rY,32,32,xx[rX,rY],yy[rX,rY],scale[rX,rY],scale[rX,rY],angle[rX,rY],c_white,c_white,c_white,c_white,1);
			}
		}
	}
}
/*
if(!surface_exists(surf))
{
	surf = surface_create(1024,576);
	surface_copy(surf,cam.view_x,cam.view_y,application_surface);
	
	for (var rX = 0; rX < 25; rX += 1) {
        for (var rY = 0; rY < 19; rY += 1) {
			xx[rX,rY] = 32*rX;
			yy[rX,rY] = 32*rY;
			dire[rX,rY] = point_direction(cam.view_w/2,cam.view_h/2,xx[rX,rY],yy[rX,rY]) + random_range(-5,5);
			scale[rX,rY] = point_distance(cam.view_w/2,cam.view_h/2,xx[rX,rY],yy[rX,rY])/30;
			angle = irandom(360);
		}
		
	}
}

if surface_exists(surf)
{
	for (var rX = 0; rX < 25; rX += 1) {
        for (var rY = 0; rY < 19; rY += 1) {
			xx[rX,rY] += lengthdir_x(dire[rX,rY],scale[rX,rY]);
			yy[rX,rY] += lengthdir_y(dire[rX,rY],scale[rX,rY]);
			angle++;
			
			//draw_surface_part_ext(surf,cam.view_x,cam.view_y,32,32,xx[rX,rY],yy[rX,rY],1,1,c_white,1);
			draw_surface_general(surf,32*rX,32*rY,32,32,xx[rX,rY],yy[rX,rY],1,1,angle/50,c_white,c_white,c_white,c_white,1);
		}	
	}
}

/*
if(!surface_exists(srf)){
    srf = surface_create(1024,576);
    surface_copy(srf,0,0,application_surface);
    for(i = 0; i < 25; i += 1){
        for(ii = 0; ii < 19; ii += 1){
            xx[i,ii] = 0;
            yy[i,ii] = 0;
            spd[i,ii] = random_range(spd_inc_min/4,spd_inc_max/4);
            rotate[i,ii] = 0;
            rotate_spr[i,ii] = 0;
            scale_dec[i,ii] = 0;
            scale[i,ii] = 1;
            spd_inc[i,ii] = 0;
            flag[i,ii] = 0;
            dir[i,ii] = irandom(360);
        }
    }
}

if(surface_exists(srf)){  

    for(i = 0; i < 25; i ++){
        for(ii = 0; ii < 19; ii ++){
			//gpu_set_alphatestenable()
			
            //draw_enable_alphablend(false);
			rect(cam.view_x,cam.view_y,1024,576,0,c_black,1);
            draw_surface_general(srf,i * 32,ii * 32,32,32,(i * 32) + cam.view_x+xx[i,ii] + x_offset,(ii * 32) + cam.view_y+yy[i,ii] + y_offset,scale[i,ii],scale[i,ii],rotate[i,ii],c_white,c_white,c_white,c_white,1);
            
			//draw_enable_alphablend(true);
            xx[i,ii] += lengthdir_x(spd[i,ii],dir[i,ii]);
            yy[i,ii] += lengthdir_y(spd[i,ii],dir[i,ii]);
            rotate[i,ii] += rotate_spr[i,ii];
            spd[i,ii] += spd_inc[i,ii];
            //scale[i,ii] = max(scale[i,ii] - scale_dec[i,ii],0);
            
            if(flag[i,ii] = 0 and point_distance((i * 32) + xx[i,ii],(ii * 32) + yy[i,ii],x_target,y_target) < t){
                spd[i,ii] = random_range(-5,5);
                spd_inc[i,ii] = random_range(spd_inc_min,spd_inc_max);
                //scale_dec[i,ii] = random_range(scale_dec_min,scale_dec_max);
                dir[i,ii] = point_direction((i * 32) + xx[i,ii],(ii * 32) + yy[i,ii],x_target,y_target) - 180 + irandom_range(dir_spread_min,dir_spread_max);
                rotate_spr[i,ii] = random_range(rotate_spread_min,rotate_spread_max); 
                flag[i,ii] = 1;
            }
        }
    }
}
/*
if !surface_exists(surf)
{
	surf = surface_create(cam.view_w,cam.view_h);
	surface_copy(surf,cam.view_x,cam.view_y,application_surface);
}
	
surface_set_target(surf);

draw_clear_alpha(c_black,1);
direction = point_direction(x,y,cam.view_x+cam.view_w/2,cam.view_y+cam.view_h/2);
speed = point_distance(x,y,cam.view_x+cam.view_w/2,cam.view_y+cam.view_h/2) / 10;

surface_reset_target();

var _w = surface_get_width(surf);
var _h = surface_get_height(surf);
rect(cam.view_x,cam.view_y,1024,576,0,c_black,.2);
for (var i = 0; i < _w; i += 32)
{
	for (var j = 0; j < _h; j += 32)
	{
		draw_surface_part(surf,i,j,32,32,cam.view_x+i,cam.view_y+j);
	}
}

