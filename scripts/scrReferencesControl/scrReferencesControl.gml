global.referenceGet_new =
{
	genreFangames : { number : [], total : 0 },
	genreGames : { number : [], total : 0 },
	genreMemes : { number : [], total : 0 },
	genrePeople : { number : [], total : 0 }
}

function save_references() {
	var data = {
		referenceData : global.referenceGet_new
		//totalReferenceData : global.totalReferenceGet
	};
	
	var json = json_stringify(data);
	save_file("References.ini", json, false);
}

function load_references() {
	if (!file_exists("References.ini")) {
		save_references();
	}
	
	var json = load_file("References.ini", false);
	var data = json_parse(json);
	
	global.referenceGet_new = data.referenceData;
	//global.totalReferenceGet = data.totalReferenceData;

}

function getReference(xx, yy, type_element, number, title, name, image)
{
	// Example 
	// title = "Game Reference #1";
	// name = "Avoid being Trolled";
	// image = sprImage_AvoidBeingTrolled;
	var inst = instance_create_layer(xx,yy,"Controllers",objReferenceSetup);
	inst . spriteReference = image;
	inst . referenceTitle = title;
	inst . nameTitle = name;
	inst . number_index = number;
	
	//var write_data;
	switch type_element
	{
		case "Fangames": 
			var current_value = global.referenceGet_new.genreFangames.total;
			global.referenceGet_new.genreFangames.number[current_value] = number;
			global.referenceGet_new.genreFangames.total++;
		break;
		case "Games": 
			var current_value = global.referenceGet_new.genreGames.total;
			global.referenceGet_new.genreGames.number[current_value] = number;
			global.referenceGet_new.genreGames.total++;
		break;
		case "Memes": 
			var current_value = global.referenceGet_new.genreMemes.total;
			// Check first if there is an empty value
			//if global.referenceGet_new.genreMemes.number[current_value] == 0
			{
				// Override
				global.referenceGet_new.genreMemes.number[current_value] = number;
				// Move on to next entry
				global.referenceGet_new.genreMemes.total++;
			}
			//save_references();
		break;
		case "People": 
		var current_value = global.referenceGet_new.genrePeople.total;
			global.referenceGet_new.genrePeople.number[current_value] = number;
			global.referenceGet_new.genrePeople.total++;
		break;
	}

	save_references();
}
