if invincible {
    flash_timer.tick();
    invincible_timer.tick();
}

character_controller.update();
vfx_manager.update();

if State.berserk_progress ==  State.berserk_needed {
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
	image_angle += 5;
    berserk_timer.tick();
    path_timer.tick();
} else {
	image_angle = lerp_angle(image_angle, 0, .2);	
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

var progress_table = [
    [spr_doritos, rm_gamepad],
    [spr_doritos_2, rm_gamepad_bigger],
    [spr_doritos_3, rm_table],
    [spr_doritos_4, rm_house],
    [spr_doritos_5, rm_city],
    [spr_doritos_6, rm_ending],
];

if room == rm_house {
    depth = -bbox_bottom;
}

if place_meeting(x, y, obj_sun) {
    var dir = point_direction(obj_sun.x, obj_sun.y, x, y);
    take_damage(State.xp/2, 32, dir);
}

var progress = progress_table[State.get_level()-1];
sprite_index = progress[0];
if room != progress[1] {
    State.berserk = false;
    room_goto(progress[1]);
}
