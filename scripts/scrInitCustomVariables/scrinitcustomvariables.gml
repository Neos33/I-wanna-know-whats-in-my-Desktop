// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.audioLoopSystem =
{
	dynamicLoop : true,
	loopStart : 0,
	loopFinish : 0,
}

//global.optionPreviousSelected = -1;
global.triggersPersistent = array_create(10,false);
global.twicetwice = false;
global.S3_fanON = false;

global.resetAllowed = true;
global.makingTrigger = false;
global.basicTrigger = array_create(200,false);

global.testVal = undefined;
global.current_volume_music = 1;
global.S1_Trap_Take = 0;
global.lastCutsceneComplete = false;

// Last boss checkpoint 
global.lastBossPhase = 1;

function load_gif(filePath)
{
	var _gif = noone;
	
	if file_exists(filePath)
		_gif = sprite_add(filePath, 0, false, false, 0, 0);
	else
		show_message(string_interp("ERROR: file named *{0}*\nnot found or couldn't load correctly", filePath));

	return _gif;
}

global.gif_araoz = load_gif("Assets/Stage1_Spoiler/Araoz_Boom.png");
global.gif_arzztt = load_gif("Assets/Stage1_Spoiler/Arzztt_Boom.png");
global.gif_baelz = load_gif("Assets/Stage1_Spoiler/Bae_Boom.png");
global.gif_cosmo = load_gif("Assets/Stage1_Spoiler/Cosmo_Boom.png");
