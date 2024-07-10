/// @description Init
function Option(label, on_select, get_value, type_action, description) constructor {
	self.label = label;
	self.on_select = on_select;
	self.get_value = get_value;
	self.type_action = type_action;
	self.description = description;
}
volumeDelay = 15;
volumeTimer = volumeDelay;
options = [
	
	//////////////////
	// Audio
	[
		// MASTER
		new Option("Master Volume ", function() {
			//var dir = (is_held(global.controls_menu.right) - is_held(global.controls_menu.left));
			
			//if (dir != 0) {
				change_volume("Master");
			//}
				
		}, function() {
			return string_interp("{0}%", ceil(global.display.volMaster * 100));
		}, "volumeSlide", "Adjust the master volume"),
		
		// BGM
		new Option("BGM Volume ", function() {
			//var dir = (is_held(global.controls_menu.right) - is_held(global.controls_menu.left));
			
			//if (dir != 0) {
				change_volume("BGM");
			//}
			
		}, function() {
			return string_interp("{0}%", ceil(global.display.volBGM * 100));
		}, "volumeSlide", "Adjust the music/BGM volume"),

		// SFX
		new Option("SFX Volume ", function() {
			//var dir = (is_held(global.controls_menu.right) - is_held(global.controls_menu.left));
			
			//if (dir != 0) {
				change_volume("SFX");
			//}
			
		}, function() {
			return string_interp("{0}%", ceil(global.display.volSFX * 100));
		}, "volumeSlide", "Adjust the sound effects/SFX volume"),
		
		
		new Option("Audio jungle ", function() {
			global.display.DMCA ^= true;
			
		}, function() {
			return (global.display.DMCA) ? "ON" : "OFF";
		}, "toggleValue", "It plays ''Audio jungle.mp3'' over a DMCA song to avoid any possible strike\nI recommend to set this 'ON' if you're gonna play it while you are streaming"),
	],
	
	
	
	//////////////////
	// Graphics
	[ 	
		new Option("Display ", function() {
			global.display.fullscreen ^= true;
			set_display();
		}, function() {
			return (global.display.fullscreen) ? "Fullscreen" : "Windowed";
		}, "changeValue", "Play on window or fullscreen \nFullscreen users be like: ah so much better now"),
		
		
		new Option("VSync ", function() {
			global.display.vsync ^= true;
			set_display();
		}, function() {
			return (global.display.vsync) ? "ON" : "OFF";
		},"toggleValue", "V-sync mode"),
		
		new Option("Smooth Mode ", function() {
			global.display.smooth ^= true;
			set_display();
		}, function() {
			return (global.display.smooth) ? "ON" : "OFF";
		}, "toggleValue", "If you want to see streched sprites blurry"),
		
		new Option("Reset Defaults", function() {
			scrOptionsConfig();
			set_display();
		}, function() {
			return "";
		}, "enterAction", "Reset the settings to Default")
	],
	
	//////////////////
	// Gameplay
	[
		new Option("Gameover ", function() {
			var dir = (is_pressed(global.controls_menu.right) - is_pressed(global.controls_menu.left));
			
			if (dir != 0) {
				global.display.GameOverOption = change_valueOption(global.display.GameOverOption,3);
				audio_play_sound(sndGT4MoveSelect, 0, false);
			}
			
		}, function() {
			var current_val = global.display.GameOverOption;
			var string_val = ["Nothing", "Classic", "Original"];
			
			return string_val[current_val];
		}, "changeValueNormal", "Select your gameover style\nNothing: You won't get any gameover when you died\nClassic: The default gameover that everyone knows\nOriginal: Original gameover from this game"),
		
		new Option("References ", function() {
			global.display.useReferences ^= true;
		}, function() {
			return (global.display.useReferences) ? "ON" : "OFF";
		},"toggleValue", "This game had some references related to other games, fangames, memes, etc\nCould have some spoilers, so you have been warned"),
	],
	
	//////////////////
	// Controls
	[ 
		"Left",
		"Right",
		"Up",
		"Down",
		"Jump",
		"Shoot",
		"Restart",
		"Pause",
		//"Skip",
		
		new Option("Reset Defaults", function() {
			scrControlsConfig();
		}, function() {
			return "";
		}, "", "")
	],
	
	//////////////////
	// Online
	[ 
		new Option("Status ", function() {
			global.connected ^= true;
			
			if (global.connected) {
				objWorld.online_connect();
			} else {
				objWorld.online_disconnect();
			}
		}, function() {
			return (global.connected) ? "Online" : "Offline";
		}, "changeValue", "Activate the online, this engine use IWPO by DapperMink"),
		
		new Option("Name ", function() {
			var name = get_string("Input name", "");
			name = string_replace(name, "\n", "\\n");
			
			if (name == "") {
				name = "Anonymous";
			}
			
			global.online.name = string_copy(name, 0, 20);
		}, function() {
			return global.online.name;
		}, "enterAction", "Press Select and write your name"),
		
		new Option("Password ", function() {
			var password = get_string("Input password", global.online.password);
			password = string_replace(password, "\n", "\\n");
			global.online.password = string_copy(password, 0, 20);
		}, function() {
			return global.online.password;
		}, "enterAction", "Password"),
		
		new Option("Race: ", function() {
			global.online.race ^= true;
		}, function() {
			return (global.online.race) ? "ON" : "OFF";
		}, "toggleValue", "Would you want to play on Race Mode?\nOFF: Saves will be shared to others players"),
		
		new Option("Server ", function() {
			global.online.server = get_string("Enter new server", global.online.server);
		}, function() {
			return global.online.server;
		}, "enterAction", "Server is using dappermink.com, do not change this option"),
		
		new Option("TCP Port ", function() {
			global.online.tcp = get_integer("Enter TCP port", 3003);
		}, function() {
			return string(global.online.tcp);
		}, "enterAction", "TCP"),
		
		new Option("UDP Port ", function() {
			global.online.udp = get_integer("Enter UDP port", 3005);
		}, function() {
			return string(global.online.udp);
		}, "enterAction", "UDP"),
		
		new Option("Reset Defaults", function() {
			global.connected = false;
			scrOnlineConfig();
		}, function() {
			return "";
		}, "enterAction", "Reset the values to Default")
	]
];

enum MENU_OPTIONS_SELECTION {
	//CATEGORY,
	AUDIO,
	GRAPHICS,
	GAMEPLAY,
	CONTROLS,
	ONLINE
}

menu = MENU_OPTIONS_SELECTION.AUDIO;
select = array_create(array_length(options), 0);
menu_content = menu + 1;
category_option = 0;

spacing = 32;
changing_controls = false;


// [Extra stuff]
testSFX = false;
selecting_category = true;
locked = true;
image_alpha = 0;
alarm[1] = 1;
ia = 0;

category_description = [
	"Audio settings",  // Audio
	"Graphics settings", //Graphics
	"Gameplay settings", //Gameplay
	"Remap your controls as you want (Keyboard only)", //Controls
	"Extra settings related to online mode\nThis option is only accesible from main menu\nIs the same setup from what IWPO does", //Online
]

function back_to_category(audio)
{
	audio_play_sound(audio,0,false);
	selecting_category = true;
	select[menu] = 0;	
	//ia = 0;
}
