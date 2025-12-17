if invincible {
    flash_timer.tick();
    invincible_timer.tick();
}

character_controller.update();
vfx_manager.update();

if State.berserk_progress == 10 {
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

var progress_table = [
    [spr_doritos, rm_gamepad],
    [spr_doritos2, rm_gamepad_bigger],
    [spr_doritos2, rm_table],
];

var progress = progress_table[State.get_level()-1];
sprite_index = progress[0];
if room != progress[1] {
    room_goto(progress[1]);
}
