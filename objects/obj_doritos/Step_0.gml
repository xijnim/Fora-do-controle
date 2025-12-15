if invincible {
    invincible_timer.tick();
}

character_controller.update();

if State.xp%5 == 0 && State.xp > 0 {
    if !had_berserk {
        State.berserk = true;
        had_berserk = true;
    }
} else {
    had_berserk = false;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
