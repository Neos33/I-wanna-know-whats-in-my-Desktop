/// @description 
if !instance_exists(objPlayer) exit;
avoidance_Sync(Music);

if is_pressed(ord("S"))
	print(string_interp("case {0}:",t));
	
	
	
switch (t)
{
	// Show credits
	case 10:
		// Add death 
		global.deaths++;
	break;
	
	case 60:
		showReference(choose(150,1024-150),100,"Meme","2","CSI: Miami",sprRef_CSIMiami);
	break;
	
	case 437: //old with 60FPS
		pitchBlack = 1;
		apply_camera_settings(view_camera[0], 0, 0, 1024, 576);
		with objPlayer
			frozen = true;
		
		new_line("Directed by");
		new_line("A monkey");
		new_line();
		new_line();
		new_line("--- CAST ---");
		new_line();
		new_line(,"Maker","Neos");
		new_line(,"Event","HeYan");
		new_line(,"Organizers","2018haha");
		new_line(,"Organizers","Loco");

		new_line(,"''With some unfortunate news''","Cosmoing");
		new_line(,"Fan Games","Anuj071");
		new_line(,"Fangame celebrity","FlaviaEstCalida");
		new_line(,"Honk Honk","TTBB");
		new_line(,"Discord staff","Cthaere");
		new_line(,"Joker","KingSlendy");
		new_line(,"Shooting walls, jump, bruh","Gaborro");
		new_line(,"Another day, Another Boshy run","BBF");
		new_line(,"La manzana feliz","Mauricio_Juega_IWBT");
		new_line(,"Blonde Hatsune Miku","ZEA Cornelia");
		new_line(,"twitch.tv/wolsk","Wolsk");
		new_line(,"Appreciate banger music","Racic");
		new_line(,"Troller Picasso","Tralexium");
		new_line(,"Cosowl master","Mir_iw");
		new_line(,"FTFA Deathless manager","JGB");
		new_line(,"Green circle","renex");
		new_line(,"Loves Anime?","Pieceofcheese87");
		//new_line(,"Who never summoned Koishi Komeiji","wymcaT");
		new_line(,"Umineko Encyclopedia","Skulldude");
		new_line(,"Wacky agent","arzztt");
		new_line(,"Kamilia 3 Gamer","Mastermaxify");
		new_line(,"Avoidance speedrun maker","Razzor");
		//new_line(,"Connection closed","Fanyone");
		new_line(,"Crimson artist","Kale");
		new_line(,"254","Bummer");
		new_line(,"El baile del troleo","PlayerDash2017");
		new_line(,"Iwanyaaaaa","Ghost");
		new_line(,"Good mechanics man","xQcOW");
		new_line(,"Favorite community testplayer/idol","Naloa");
		new_line(,"-._.-","Lemon");
		new_line(,"Never gonna give you up","Rick Astley");
		new_line(,"Coke zero professional drinker","Badlands Chugs");
		new_line(,"The brain puzzle IQ","LAWatson");
		new_line(,"Ai wana wana kiko","Skuldafn");
		new_line(,"Everyday is his birthday","KogamiTakara");
		new_line(,"Arre","Fragnaticc");
		new_line(,"SonGohanOMG","Lukz715");
		new_line(,"Fangame Arsenal","CanusAntonius");
		new_line(,"Buy ballons and let them go (15/05/2020)","PlasmaNapkin");
		new_line(,"''Christ in the bike''","Wolfiexe");
		new_line(,"Watermelon gamer","Lucien23s");
		new_line(,"Longest grind on Music","Marios");
		new_line(,"Sing every fangame song","Vardoc1");
		new_line(,"''Are these...''","BenDeen");
		new_line(,"Cleared Lap Around", "Markiplier");
		new_line(,"Ear destroyer","Liquid Rage");
		new_line(,"IWM content & voice actor","EchoMask");
		new_line(,"ASMR guy","Huse");
		new_line(,"Worst comedian","ElAnpepion")
		new_line(,"''This is impossible'' quote & hates anime","Stonk");
		new_line(,"Anime references","Marimario");
		new_line(,"Fangame ceasar","Thenewgeezer");
		new_line(,"Kamilia cosplayer","Welowas");
		new_line(,"Camera assistent","RandomChaos");
		//new_line(,"Destruction State Challenge","Countershooter");
		new_line(,"SourPls","Andres")
		new_line(,"Rejects humanity","Nogard");
		new_line(,"Fangame music playlist","IanBoy");
		new_line(,"KrakkaTimer ''Burp''","Krakka");
		new_line(,"Fangame Encyclopedia","Kiyoshi");
		//new_line(,"*Thanks for [current year]* every year","Summer");
		new_line(,"","");
		
		new_line(,"","");
		new_line(,"","");
		new_line("--- SPECIAL THANKS ---");
		new_line("My brain for thinking this dumb idea");
		new_line("CSI: Miami");
		new_line(,"","");
		new_line(,"","");
		new_line("I wrote the first thing it came in my mind, just to make solid credits");
		//new_line("Do not be offended by");
	break;
	
	case 850: //old with 60 FPS
		showGAMEOVER = true;
	break;
}

if pitchBlack == 1
	text_y -= 5;
	
if showGAMEOVER
{
	text_y_gameover = max(text_y_gameover-5,576*.5);
}
