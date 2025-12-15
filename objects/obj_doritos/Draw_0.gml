draw_self();
draw_text(x, y, State.xp);

var __alpha = 1;
if State.berserk {
	repeat 100
    draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale, image_yscale, image_angle, c_white, __alpha);
	__alpha--
}