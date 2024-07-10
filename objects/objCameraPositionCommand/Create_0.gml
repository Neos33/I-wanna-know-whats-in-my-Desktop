/// @description Init

// Internal
curvePosition = 0;
owner = noone;
node = "";
endPosition = 1;


// Instance workaround
relative_view_mode = false;

viewX_start = camera_get_view_x(view_camera[0]);
viewY_start = camera_get_view_y(view_camera[0]);

destination_viewX = 0;
destination_viewY = 0;

viewX_current = viewX_start;
viewY_current = viewY_start;
