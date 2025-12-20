function draw_shadow(pos_x, pos_y) {
    with obj_shadow_render {
        surface_set_target(shadow_surf);
            
            draw_set_color(c_black);
            draw_circle(pos_x, pos_y, 32, false);
            draw_set_color(c_white);

        surface_reset_target();
    }
}
