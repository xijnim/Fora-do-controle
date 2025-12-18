timer = new Timer(1, function() {
	if instance_number(obj_enemy) >= 64 {
		return;
	}
    if State.get_level() == 4 {
        return;
    }

    var pos = __get_spawn_pos();
    var spawn_x = pos[0];
    var spawn_y = pos[1];

    var possibilities = array_create_ext(EnemyIdx.ENUM_LENGTH, function(i){return i})
    possibilities = array_filter(possibilities, function(enemy_idx) {
        return global.enemies[enemy_idx].can_spawn();
    });

    if array_length(possibilities) == 0 {
        return;
    }

    var type = array_rand(possibilities);

	audio_play_sound(sfx_micro_enemy_spawn, 3, 0, .5, 0, random_range(.9, 1.1));
    instance_create_depth(spawn_x, spawn_y, 0, obj_enemy, {type});
});


__get_spawn_pos = function() {
    var spawn_x = -1;
    var spawn_y = -1;
    var attempts = 0;

    do {
        spawn_x = irandom(room_width);
        spawn_y = irandom(room_height);

        attempts += 1;
        if attempts > 64 {
            break;
        }
    } until
        !collision_circle(spawn_x, spawn_y, 24, obj_doritos, true, true);

    return [spawn_x, spawn_y];
}
