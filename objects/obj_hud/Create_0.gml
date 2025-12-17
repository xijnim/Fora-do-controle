var start_y = 16;
level_bar = new HudBar({
    bar_sprite: spr_level_bar,
    inner_sprite: spr_level_bar_inner,
    text_sprite: spr_level_text,
    pos_y: start_y,
    get: function(){return State.get_progression()},
});
berserk_bar = new HudBar({
    bar_sprite: spr_berserk_bar,
    inner_sprite: spr_berserk_bar_inner,
    text_sprite: spr_berserk_text,
    pos_y: start_y + sprite_get_height(spr_level_bar) + sprite_get_height(spr_berserk_text) - 9,
    get: function(){return State.berserk_progress/10},
});

var bar_h = sprite_get_height(spr_level_bar);
var txt_h = sprite_get_height(spr_level_text);
bottom = start_y + bar_h*2 + txt_h*2;
