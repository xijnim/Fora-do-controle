var xscale = vfx_manager.get_xscale();
var yscale = vfx_manager.get_yscale();
var alpha = vfx_manager.get_alpha();
var angle = vfx_manager.get_angle()+image_angle;

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, alpha);

if !is_undefined(strategy[$ "render"]) {
    strategy.render({angle});
}
