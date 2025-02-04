if (global.debug_enable && global.debug_coloring) {
    if (global.debug_god_mode) {
        image_blend = c_fuchsia;
    } else if (global.debug_inf_jump) {
        image_blend = c_blue;
    } else {
        image_blend = c_white;
    }
}

var draw_y = round(y);

if (global.grav == -1) {
    draw_y++;
}

draw_sprite_ext(sprite_index, image_index, round(x), draw_y, image_xscale * xscale, image_yscale * global.grav, image_angle, image_blend, image_alpha);