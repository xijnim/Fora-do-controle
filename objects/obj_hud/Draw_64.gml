berserk_bar.render();
level_bar.render();

GET_GUI_SIZE;
var limit = 20000;
draw_set_alpha(global.flash);
draw_rectangle(-limit, -limit, gui_w+limit, gui_h+limit, false);
draw_set_alpha(1);

