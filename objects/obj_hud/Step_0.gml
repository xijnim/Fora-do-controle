var alpha = 1;
with obj_doritos {
    if bbox_bottom < other.bottom {
        alpha = .5;
    }
}

level_bar.update(alpha);
berserk_bar.update(alpha);
