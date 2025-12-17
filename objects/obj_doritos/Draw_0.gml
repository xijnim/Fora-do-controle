var xscale = vfx_manager.get_xscale();
var yscale = vfx_manager.get_yscale();
var alpha = vfx_manager.get_alpha();
var angle = vfx_manager.get_angle();

if flash {
    shader_set(shd_color_overlay);
}

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, alpha);

shader_reset();

draw_text(x, y, $"XP: {State.xp}\nLevel: {State.get_level()}");
