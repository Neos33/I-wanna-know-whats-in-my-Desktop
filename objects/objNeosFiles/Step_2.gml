/// @description 

var _total = array_length(size_data);
for (var i = 0; i < _total; i++)
{
	size_data[i] = lerp(size_data[i],0,.10);
	size_data[select[MENU_FILES.DATA]] = lerp(size_data[select[MENU_FILES.DATA]],1,.10);
}
