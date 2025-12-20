function draw_shadow(pos_x, pos_y, radius_x, radius_y) {
    with obj_shadow_render {
        surface_set_target(shadow_surf);
            
            draw_set_color(c_black);
            draw_set_alpha(.5);

            var x1 = pos_x - radius_x;
            var y1 = pos_y - radius_y;
            var x2 = pos_x + radius_x;
            var y2 = pos_y + radius_y;
            draw_ellipse(x1, y1, x2, y2, false);

            draw_set_color(c_white);
            draw_set_alpha(1);

        surface_reset_target();
    }
}
