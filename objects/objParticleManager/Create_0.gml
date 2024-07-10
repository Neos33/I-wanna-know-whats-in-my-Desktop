/// @description Init particles
#region Scorpion rope blood
	global.pScorpionRopeSplitBlood_System = part_system_create();
	part_system_depth(global.pScorpionRopeSplitBlood_System, 100);
	
	global.pScorpionRopeSplitBlood_Type = part_type_create();
	part_type_sprite(global.pScorpionRopeSplitBlood_Type, sprBlood, false,false,true);
	part_type_life(global.pScorpionRopeSplitBlood_Type,100,200);
	part_type_alpha2(global.pScorpionRopeSplitBlood_Type,1,0);
	part_type_direction(global.pScorpionRopeSplitBlood_Type,0,70,0,0);
	part_type_gravity(global.pScorpionRopeSplitBlood_Type,0.08,270);
	part_type_speed(global.pScorpionRopeSplitBlood_Type,1,4,0,0);
#endregion

#region Bullet kid explode
	global.pBulletExplode_System = part_system_create();
	part_system_depth(global.pBulletExplode_System, 100);
	
	global.pBulletExplode_Type = part_type_create();
	part_type_sprite(global.pBulletExplode_Type, sprBulletExplode, true,true,false);
	part_type_life(global.pBulletExplode_Type,10,10);
	part_type_scale(global.pBulletExplode_Type,.75,.75);
#endregion

#region
	global.pKidBlood_System = part_system_create();
	part_system_depth(global.pKidBlood_System,-10);
	
	global.pKidBlood_Type = part_type_create();
	part_type_sprite(global.pKidBlood_Type,sprPlayerBlood2,false,false,false);
	//part_type_blend(global.pKidBlood_Type,true);
	part_type_direction(global.pKidBlood_Type,0,360,0,0);
	part_type_speed(global.pKidBlood_Type,1,3,0,0);
	part_type_gravity(global.pKidBlood_Type,.13,270);
	
	part_type_life(global.pKidBlood_Type,160,260);
	part_type_size(global.pKidBlood_Type,.2,.5,.002,0);
	part_type_alpha2(global.pKidBlood_Type,.8,0);
	part_type_color1(global.pKidBlood_Type,#e32a20);
	part_type_orientation(global.pKidBlood_Type,0,360,1,0,0);
#endregion

#region
	global.pGemExplode_System = part_system_create();
	part_system_depth(global.pGemExplode_System,200);
	
	var p = part_type_create();
	part_type_shape(p,pt_shape_line);
	part_type_life(p,40,150);
	part_type_alpha2(p,.8,0);
	part_type_orientation(p,0,0,0,0,true);
	
	part_type_speed(p,4,15,.1,0);
	part_type_direction(p,0,360,0,0);
	part_type_blend(p,true);
	part_type_scale(p,1,.2);
	part_type_size(p,1,2,-.025,0);
	part_type_color1(p,c_white);
	
	global.pGemExplodeLine_Type = p;
	
	var p = part_type_create();
	part_type_shape(p,pt_shape_sphere);
	part_type_life(p,40,150);
	part_type_alpha2(p,.8,0);
	part_type_orientation(p,0,0,0,0,true);
	
	part_type_speed(p,1,7,-.001,0);
	part_type_direction(p,0,360,0,0);
	part_type_blend(p,true);
	//part_type_scale(p,1,.2);
	part_type_size(p,.5,1,-.02,0);
	part_type_color1(p,c_white);
	
	global.pGemExplodeCircle_Type = p;
#endregion
#region
	global.pRecharging_System = part_system_create();
	part_system_depth(global.pRecharging_System,600);
	
	p = part_type_create();
	part_type_life(p,60,80);
	//part_type_shape(p,pt_shape_line);
	part_type_sprite(p,sprParticleLineGlow,false,true,false);
	part_type_alpha3(p,0,.8,0);
	part_type_orientation(p,0,0,0,0,true);
	
	part_type_speed(p,0,1,.2,0);
	part_type_scale(p,3,.5);
	part_type_size(p,1,1,-0.025,0);
	
	part_type_blend(p,true);
	part_type_color1(p,c_white);
	//part_type_direction();
	global.pRecharging_Type = p;
#endregion
#region
	global.pJillBulletDestroyed_System = part_system_create();
	part_system_depth(global.pJillBulletDestroyed_System,600);

	p = part_type_create();
	part_type_shape(p,pt_shape_smoke);
	part_type_color_mix(p,c_white,c_yellow);
	part_type_size(p,.1,.25,-0.005,0);
	part_type_blend(p,true);
	part_type_alpha2(p,.6,0);
	part_type_life(p,20,50);
	part_type_direction(p,65,115,0,0);
	part_type_orientation(p,0,360,0,0,0);
	part_type_gravity(p,.075,270);
	part_type_speed(p,.5,2,0,0);
	global.pJillBulletDestroyed_Type = p;
#endregion

#region
	global.pMSDLight_System = part_system_create();
	
	p = part_type_create();
	
	part_type_sprite(p,sprMSDEffect1,0,0,0);
	part_type_color1(p,c_white);
	part_type_size(p,.25,.75,-0.005,0.02);
	part_type_blend(p,true);
	part_type_alpha3(p,.1,1,0);
	part_type_life(p,20,50);
	//part_type_direction(p,65,115,0,0);
	part_type_orientation(p,0,360,0,0,0);
	//part_type_gravity(p,.075,270);
	//part_type_speed(p,.5,2,0,0);
	global.pMSDLight_Type = p;
#endregion

#region Water Splash
	global.pWaterSplash_System = part_system_create();
	
	
	p = part_type_create();
	
	part_type_shape(p,pt_shape_sphere);
	part_type_color1(p,c_white);
	part_type_size(p,.15,.25,-0.005,0);
	part_type_scale(p,.5,.5)
	part_type_blend(p,true);
	part_type_alpha3(p,.1,.4,0);
	part_type_life(p,20,50);
	part_type_direction(p,65,115,0,0);
	//part_type_orientation(p,0,360,0,0,0);
	part_type_gravity(p,.075,270);
	part_type_speed(p,.5,2,0,0);
	global.pWaterSplash_Type = p;
#endregion

#region Kid double jump
global.pKidDoubleJump_System = part_system_create();
part_system_depth(global.pKidDoubleJump_System, 100);

p = part_type_create();
part_type_alpha2(p,1,0);
part_type_shape(p,pt_shape_smoke);
part_type_blend(p,true);
part_type_color1(p,c_white);
part_type_life(p,10,30);

part_type_direction(p,0,360,0,.5);
part_type_speed(p,.25,.5,0,0);

part_type_orientation(p,0,360,1,0,0);
//part_type_scale(p,1,.75);
part_type_size(p,0.15,.25,-.0025,0);



global.pKidDoubleJump_Type = p;
#endregion

#region Kid hit the ground
global.pKidGround_System = part_system_create();
part_system_depth(global.pKidGround_System, 100);

p = part_type_create();
part_type_alpha2(p,1,0);
part_type_shape(p,pt_shape_smoke);
part_type_blend(p,true);
part_type_color_mix(p,c_white,c_white);
part_type_life(p,10,30);

part_type_direction(p,0,180,0,.5);
part_type_speed(p,.25,.5,-0.002,0);

part_type_orientation(p,0,360,1,0,0);
part_type_scale(p,1,.75);
part_type_size(p,0.15,.25,-.0025,0);



global.pKidGround_Type = p;
#endregion

#region Rock Smash
global.pRockSmash_System = part_system_create();

p = part_type_create();
part_type_shape(p,pt_shape_smoke);
part_type_life(p,10,50);

part_type_speed(p,1,3,-.005,0);
part_type_alpha2(p,.7,0);
part_type_blend(p,true);
part_type_color1(p,c_white);

part_type_orientation(p,0,360,.5,0,0);
part_type_size(p,.75,1,-.0015,0);

global.pRockSmash_Type = p;
#endregion

#region Rock Escombros
global.pRockEscombros_System = part_system_create();

p = part_type_create();

part_type_sprite(p,sprRockEscombros,false,false,true);
part_type_life(p,10,50);

part_type_speed(p,1,3,-.005,0);
part_type_alpha2(p,1,0);
//part_type_blend(t2,true);
part_type_color1(p,c_white);
part_type_direction(p,0,360,0,0);
part_type_gravity(p,.1,270);

part_type_orientation(p,0,360,.5,0,0);
part_type_size(p,.75,1,-.0015,0);

global.pRockEscombros_Type = p;
#endregion

#region Gem broken
global.pGemBroken_System = part_system_create();
p = part_type_create();
part_type_sprite(p,sprGemEscombros,false,false,true);
part_type_life(p,200,300);

part_type_speed(p,5,8,-.005,0);
part_type_alpha2(p,1,0);
//part_type_blend(t2,true);
part_type_color1(p,c_white);
part_type_direction(p,0,360,0,0);
part_type_gravity(p,.2,270);

part_type_orientation(p,0,360,2,0,0);
part_type_size(p,.8,1,-.002,0);

global.pGemBroken_Type = p;
#endregion

#region Title Particles

global.pTitleBG_System = part_system_create();

p = part_type_create();
part_type_alpha2(p,.5,0);
part_type_life(p,100,200);
part_type_blend(p,true);

part_type_speed(p,1,5,0,0);
part_type_direction(p,88,92,0,2);
part_type_size(p,.25,.5,0,0);

part_type_shape(p,pt_shape_flare);

global.pTitleBG_Type = p;
#endregion



////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
// Particle code generated by CrystallineJS
// https://iwverve.github.io/crystalline/


// -------- Particle System --------
// Run this code at the beginning of your game
global.pQuickExplosion_System = part_system_create();
part_system_depth(global.pQuickExplosion_System, -5);


// -------- Particle Type --------
// Run this code at the beginning of your game
global.pQuickExplosion_Type = part_type_create();
part_type_shape(global.pQuickExplosion_Type, pt_shape_smoke);
part_type_color3(global.pQuickExplosion_Type, 5921511, 1086713, 10263712);
part_type_alpha3(global.pQuickExplosion_Type, 0, 0.95, 0);
part_type_life(global.pQuickExplosion_Type, 15, 20);
part_type_size(global.pQuickExplosion_Type, 0.3, 0.9, 0.04, 0);
part_type_speed(global.pQuickExplosion_Type, 1, 3, -0.01, 0);
part_type_direction(global.pQuickExplosion_Type, 0, 360, 0, 0);
part_type_orientation(global.pQuickExplosion_Type, 0, 376.25, -0.79, 0, false);
part_type_gravity(global.pQuickExplosion_Type, 0, 270);
part_type_blend(global.pQuickExplosion_Type, true);




// Particle code generated by CrystallineJS
// https://iwverve.github.io/crystalline/


// -------- Particle System --------
// Run this code at the beginning of your game
global.pExplosionLine_System = part_system_create();
part_system_depth(global.pExplosionLine_System, -4);


// -------- Particle Type --------
// Run this code at the beginning of your game
global.pExplosionLine_Type = part_type_create();
part_type_shape(global.pExplosionLine_Type, pt_shape_line);
//part_type_sprite(global.pExplosionLine_Type, sprPLine, true, true, true);
part_type_color2(global.pExplosionLine_Type, 1140462, 11184607);
part_type_alpha3(global.pExplosionLine_Type, 0.13, 0.47, 0);
part_type_life(global.pExplosionLine_Type, 20, 30);
part_type_size(global.pExplosionLine_Type, 0.08, 0.54, 0, 0);
part_type_speed(global.pExplosionLine_Type, 3, 4.5, 0, 0);
part_type_direction(global.pExplosionLine_Type, 0, 360, 0, 0);
part_type_orientation(global.pExplosionLine_Type, 0, 0, 0, 0, true);
part_type_gravity(global.pExplosionLine_Type, 0, 270);
part_type_blend(global.pExplosionLine_Type, true);






// -------- Particle Burst --------
// Creates particles once at a specific position, instead of constantly emitting them
// Run this whenever you want to burst the particles
//part_particles_create(global.pExplosionLine_System, x, y, global.pExplosionLine_Type, 5);



