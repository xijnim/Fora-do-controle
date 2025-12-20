if invincible {
    flash_timer.tick();
    invincible_timer.tick();
}

character_controller.update();
vfx_manager.update();

if State.berserk_progress == 8 {
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
    [spr_doritos_2, rm_gamepad_bigger],
    [spr_doritos_3, rm_table],
    [spr_doritos_4_house, rm_house],
    [spr_doritos_4, rm_city],
];

if room == rm_house {
    depth = -bbox_bottom;
}

var progress = progress_table[State.get_level()-1];
sprite_index = progress[0];
if room != progress[1] {
    room_goto(progress[1]);
}
