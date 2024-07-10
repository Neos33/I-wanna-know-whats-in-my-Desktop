/// @description Init

// Internal
curvePosition = 0;
owner = noone;
node = "";
endPosition = 1;


// Instance workaround
relative_view_mode = false;

viewW_start = camera_get_view_width(view_camera[0]);
viewH_start = camera_get_view_height(view_camera[0]);

destination_viewW = 0;
destination_viewH = 0;

viewW_current = viewW_start;
viewH_current = viewH_start;
