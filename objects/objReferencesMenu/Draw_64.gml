/// @description 
var centerX = display_get_gui_width()/2;
var a = image_alpha;
var info = menu_pages[page];
var dataHolder = [
	global.referenceGet_new.genreFangames.number,
	global.referenceGet_new.genreGames.number,
	global.referenceGet_new.genreMemes.number,
	global.referenceGet_new.genrePeople.number,
];
var total_dataHolder = [
	global.referenceGet_new.genreFangames.total,
	global.referenceGet_new.genreGames.total,
	global.referenceGet_new.genreMemes.total,
	global.referenceGet_new.genrePeople.total,
];
setDrawSettings(fntOptions,fa_center,fa_top,c_red,a);
switch page
{
	case REFERENCE_PAGES.HUB: 
		#region Draw cards
		var space = 128;
		draw_sprite_ext(sprPlate_Guy,0,space,288-16*(1-a)-16*card_hoverY[0],1,1,0,c_white,a);
		draw_sprite_ext(sprPlateMenu_References,0,centerX-space,288-16*(1-a)-16*card_hoverY[1],1.5,1,0,c_black,a);
		draw_sprite_ext(sprPlateMenu_References,0,centerX+space,288-16*(1-a)-16*card_hoverY[2],1.5,1,0,c_red,a);
		draw_sprite_ext(sprPlateMenu_References,0,1024-space,288-16*(1-a)-16*card_hoverY[3],1.5,1,0,c_green,a);
		
		// Draw cards names
		setDrawSettings(fntOptions,fa_center,fa_bottom,c_yellow,a);
		var text_y = 272-16*(1-a) - (128 - 16);
		draw_text(space,text_y-16*card_hoverY[0],menu_pages[1][0].genre);
		draw_text(centerX-space,text_y-16*card_hoverY[1],menu_pages[2][0].genre);
		draw_text(centerX+space,text_y-16*card_hoverY[2],menu_pages[3][0].genre);
		draw_text(1024-space,text_y-16*card_hoverY[3],menu_pages[4][0].genre);
		// Desription Box
		draw_sprite_stretched_ext(sprTextBox,0,64,608-180+16*(1-a),1024-160,96,c_white,a);
		// DEBUG
		//draw_text(32,32,string(index));
		#endregion 
	break;
	case REFERENCE_PAGES.FANGAMES: 
	case REFERENCE_PAGES.GAMES:
	case REFERENCE_PAGES.MEMES:
	case REFERENCE_PAGES.PEOPLE:
		#region Draw every information from the cards menu

			// Draw UI
			//draw_sprite(UI_reference_concept_art_edit,0,64,64);
			draw_sprite_ext(sprUI_References,0,128,64,1,1,0,c_purple,image_alpha);
			
			var xShift = 730;
			var current_genre_entities = dataHolder[page - 1];
			var _List = total_dataHolder[page - 1];
			var array_values_pages = array_length(info);
			
			setDrawSettings(ftReferenceSelection,fa_center,fa_center,c_white,a);
			var i = 0;
			repeat _List
			{
				if total_dataHolder[page - 1] != 0
				{
					draw_sprite_ext(sprPoint2x2,0,xShift,100+32*i,203,10,0,c_black,0.4);
					
					var c = c_white;
					if i == menu_selection[page] c = c_yellow;
					var complete_text;
					
					if info[i] != undefined
					complete_text = string_interp("#{0} {1}",current_genre_entities[i],info[i].title);
					else
					complete_text = string_interp("#{0} {1}",current_genre_entities[i],"NO DATA");
					draw_text_colour(xShift,100+32*i,complete_text,c,c,c,c,1);
					

					//draw_text_colour(xShift,100+32*i,"???",c,c,c,c,1);
					
					i++;
				}
			}
			
			draw_text(centerX,8,info[0].genre);
			setDrawSettings(ftReferenceSelection,fa_center,fa_center,c_white,a);
			/*for (var i = 0; i < total_info; i++)
			{
				
				var text = string_interp("#{0} {1}",info[i].number,info[i].title);
				//var xShift = 730;
				
				
				/*var c = c_white;
				if i == menu_selection[page] c = c_yellow;
				draw_text_colour(xShift,100+32*i,text,c,c,c,c,a);
				
				
			}*/
		#endregion
	break;
}

setDrawSettings();