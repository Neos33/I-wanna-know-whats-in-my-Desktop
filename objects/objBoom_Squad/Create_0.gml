/// @description 

// Total index number gif
//gif_araoz_total = 35;
//gif_arzztt_total = 49;
//gif_baelz_total = 35;
//gif_cosmo_total = 35;

gif_araoz_total = 35;
gif_arzztt_total = 27;
gif_baelz_total = 29;
gif_cosmo_total = 21;

// internal
xx = 0;
yy = 0
width_image = 100;
height_image = 100;
current_spr = noone;
width_size = 0;
clock = 1;
clock_spd = 1/2;

current_anim = 0;
total_images = 1;
frame_sound = -1;


st_araoz = new state();
st_arzztt = new state();
st_bae = new state();
st_cosmo = new state();

vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
vw = camera_get_view_width(view_camera[0]);
vh = camera_get_view_height(view_camera[0]);

#region Daniel Araoz

st_araoz.start = function()
{
	width_size = 346;
	width_image = width_size;
	height_image = 344;
	total_images = gif_araoz_total;
	current_spr = global.gif_araoz;
	
	current_anim = 0;
	
	frame_sound = 18;
	clock_spd = 1/3;
	x = vx + vw / 2 - width_image / 4;
	y = vy + vh / 2 - height_image / 4;
}
st_araoz.run = function()
{
	if clock > 0
		clock -= clock_spd;
	else
	{
		if current_anim < total_images
		{
			if current_anim == frame_sound { 
				repeat (2) { play_sfx(sndBOOM_Araoz); } 
				frame_sound = -1; 
				showReference(1024-150,576-200,"People","4","Araoz",sprRef_DanielAraoz);
			}
			if current_anim mod 2 == 0
			{
				xx += width_size;
				yy = 0;
			}
			else
			{
				yy = height_image;
			}
			current_anim++;
			clock = 1;
		}
		else
		{
			instance_destroy();
			//play_sfx(sndSpecialMove);
		}
	}
}
#endregion

#region Arzztt
st_arzztt.start = function()
{
	width_size = 245;
	width_image = width_size;
	height_image = 187;
	//current_anim = 0;
	total_images = gif_arzztt_total;
	current_spr = global.gif_arzztt;
	frame_sound = 13;
	clock_spd = 1/2; 
	
	x = vx + vw / 2 - width_image / 4;
	y = vy + vh / 2 - height_image / 4;
}
st_arzztt.run = function()
{
	if clock > 0
		clock -= clock_spd;
	else
	{
		if current_anim < total_images
		{
			if current_anim == frame_sound { 
				repeat(5) {play_sfx(sndBOOM_Arzztt);} 
				frame_sound = -1; 
				showReference(150,100,"People","1","arzztt",sprRef_Arzztt);
			}
			if current_anim mod 2 == 0
			{
				xx += width_size;
				yy = 0;
			}
			else
			{
				yy = height_image;
			}
			//width_image += width_size;
			current_anim++;
			clock = 1;
		}
		else
		{
			//width_size = 0;
			change_state(st_cosmo);
			//play_sfx(sndSpikeTrap);
		}
	}
}
st_arzztt.stop = function()
{
	xx = 0;	 
	//current_anim = 0;
	clock = 1;
}
#endregion

#region Cosmoing
st_cosmo.start = function()
{
	width_size = 336;
	width_image = width_size;
	height_image = 253;
	total_images = gif_cosmo_total;
	current_spr = global.gif_cosmo;
	
	current_anim = 0;
	
	frame_sound = 6;
	clock_spd = 1/3; 
	
	x = vx + vw / 2 - width_image / 4;
	y = vy + vh / 2 - height_image / 4;
}
st_cosmo.run = function()
{
	if clock > 0
		clock -= clock_spd;
	else
	{
		if current_anim < total_images
		{
			if current_anim == frame_sound { 
				repeat(2) {play_sfx(sndBOOM_Cosmoing);} 
				frame_sound = -1; 
				showReference(1024-150,100,"People","2","Cosmoing",sprRef_Cosmoing);
			}
			if current_anim mod 2 == 0
			{
				xx += width_size;
				yy = 0;
			}
			else
			{
				yy = height_image;
			}
			//width_image += width_size;
			current_anim++;
			clock = 1;
		}
		else
		{
			change_state(st_bae);
		}
	}
}
st_cosmo.stop = function()
{
	xx = 0;	 
	//current_anim = 0;
	clock = 1;
}
#endregion

#region Hakos Baelz
st_bae.start = function()
{
	width_size = 242;
	width_image = width_size;
	height_image = 258;
	total_images = gif_baelz_total;
	current_spr = global.gif_baelz;
	
	current_anim = 0;
	
	frame_sound = 13;
	clock_spd = 1/2; 
	
	x = vx + vw / 2 - width_image / 4;
	y = vy + vh / 2 - height_image / 4;
}
st_bae.run = function()
{
	if clock > 0
		clock -= clock_spd;
	else
	{
		if current_anim < total_images
		{
			if current_anim == frame_sound { 
				repeat(2) { play_sfx(sndBOOM_Baelz); } 
				frame_sound = -1; 
				showReference(150,576-200,"People","3","Hakos Baelz",sprRef_HakosBaelz);
			}
			if current_anim mod 2 == 0
			{
				xx += width_size;
				yy = 0;
			}
			else
			{
				yy = height_image;
			}
			//width_image += width_size;
			current_anim++;
			clock = 1;
		}
		else
		{
			change_state(st_araoz);
		}
	}
}
st_bae.stop = function()
{
	xx = 0;	 
	//current_anim = 0;
	clock = 1;
}
#endregion

init_state(st_arzztt);

/*
function load_image(file)
{
	var _gif = noone;
	if file_exists(file)
	{
		_gif = sprite_add(file, 0, false, false, 0, 0);
		return _gif;
	}
	else
		show_message(string_interp("ERROR: file named *{0}*\nnot found or couldn't load correctly",file));
}





