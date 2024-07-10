/// @description 
alarm[0] = 1;

psys = part_system_create();
part_system_depth(psys,depth);

var p = part_type_create();
part_type_alpha2(p,0,1)//,.4);
part_type_color1(p,c_black);

part_type_life(p,100,100);
part_type_shape(p,pt_shape_sphere);

part_type_speed(p,3,3,.045,0);
part_type_size(p,.25,.25,.0015,0);
ptyp = p;


var p = part_type_create();
part_type_alpha2(p,0,1)//,.4);
part_type_color1(p,make_color_hsv(0,255,160));

part_type_life(p,100,100);
part_type_shape(p,pt_shape_circle);

part_type_speed(p,3,3,.045,0);
part_type_size(p,.25,.25,.0015,0);
ptyp2 = p;



// Trail
/*

p = part_type_create();
part_type_alpha2(p,.4,0);
part_type_color1(p,make_color_hsv(0,255,150));

part_type_life(p,50,70);
part_type_shape(p,pt_shape_circle);

part_type_speed(p,3,7,.045,0);
part_type_size(p,.75,1.25,.0015,0);

pstep = p;

part_type_step(ptyp,1,pstep);