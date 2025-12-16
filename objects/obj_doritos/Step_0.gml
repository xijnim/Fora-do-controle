if invincible {
    invincible_timer.tick();
}

character_controller.update();

if State.eaten_enemies%5 == 0 && State.xp > 0 {
    if !had_berserk {
        State.berserk = true;
        had_berserk = true;
        character_controller.reset_berserk();
        obj_camera.screenshake(2);
    }
} else {
    had_berserk = false;
}

if State.berserk {
    berserk_timer.tick();
    path_timer.tick();
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if State.get_level() > 1 {
    sprite_index = spr_doritos2;
} else {
    sprite_index = spr_doritos;
}
