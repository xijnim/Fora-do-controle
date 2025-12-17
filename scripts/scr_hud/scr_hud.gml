function HudBar(config) constructor {
    update = function(alpha) {
        __value = __get();
        __lazy_value = lerp(__lazy_value, __value, .2);
        __alpha = lerp(__alpha, alpha, .2);
    }

    render = function() {
        GET_GUI_SIZE;

        var pos_x = gui_w*.5;
        var pos_y = __pos_y;
        var alpha = __alpha;

        draw_sprite_ext(__bar_sprite, 0, pos_x, pos_y, 1, 1, 0, c_white, alpha);
        
        var inner_x = pos_x - ceil(sprite_get_width(__bar_sprite)/2) + 1;
        draw_sprite_ext(__inner_sprite, 0, inner_x, pos_y, __lazy_value, 1, 0, c_white, alpha);

        var text_y = pos_y - sprite_get_height(__bar_sprite)/2 + 3;
        draw_sprite_ext(__text_sprite, 0, pos_x, text_y, 1, 1, 0, c_white, alpha);
    }
    
    __bar_sprite = config.bar_sprite;
    __inner_sprite = config.inner_sprite;
    __text_sprite = config.text_sprite;
    __pos_y = config.pos_y;
    __get = config.get;
    
    __value = __get();
    __lazy_value = __value;
    __alpha = 1;
}
display_set_gui_size(640, 360);

