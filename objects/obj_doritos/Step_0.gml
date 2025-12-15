if invincible {
    invincible_timer.tick();
}

character_controller.update();

if State.xp%5 == 0 && State.xp > 0 {
    if !had_berserk {
        State.berserk = true;
        had_berserk = true;
        character_controller.reset_berserk();
    }
} else {
    had_berserk = false;
}

if State.berserk {
    berserk_timer.tick();
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
