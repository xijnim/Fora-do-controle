timer = new Timer(1, function() {
	if instance_number(obj_enemy) >= 64 {
		return;
	}

    var pos = __get_spawn_pos();
    var spawn_x = pos[0];
    var spawn_y = pos[1];

    var possibilities = array_create_ext(EnemyIdx.ENUM_LENGTH, function(i){return i})
    possibilities = array_filter(possibilities, function(enemy_idx) {
        if enemy_idx == EnemyIdx.CropBac || enemy_idx == EnemyIdx.Corona {
            var bacteria_amt = __get_enemy_amt_by_type(EnemyIdx.CropBac) + __get_enemy_amt_by_type(EnemyIdx.Corona);
            var cap = State.get_level() > 1 ? 0 : 26;
            if bacteria_amt >= cap {
                return false;
            }
        }
        if enemy_idx == EnemyIdx.Nut {
            var nut_amt = __get_enemy_amt_by_type(EnemyIdx.Nut);

            var nut_cap = State.get_level() > 1 ? 10 : 8;

            if nut_amt >= nut_cap {
                return false;
            }
        }
        if enemy_idx == EnemyIdx.Dust {
            if State.get_level() > 1 {
                return false;
            }
        }
        if enemy_idx == EnemyIdx.Cheetos {
            return false;
        }
        if enemy_idx == EnemyIdx.Ant {
            if State.get_level() < 2 {
                return false;
            }
            var amt = __get_enemy_amt_by_type(EnemyIdx.Ant);
            if amt >= 2 {
                return false;
            }
        }
        if enemy_idx == EnemyIdx.Cheese || enemy_idx == EnemyIdx.Sugar {
            if State.get_level() < 2 {
                return false;
            }
            var amt = __get_enemy_amt_by_type(EnemyIdx.Cheese) + __get_enemy_amt_by_type(EnemyIdx.Sugar);
            if amt >= 26 {
                return false;
            }
        }
        if enemy_idx == EnemyIdx.Chocolate {
            if State.get_level() < 2 {
                return false;
            }
            var amt = __get_enemy_amt_by_type(EnemyIdx.Chocolate);
            if amt >= 10 {
                return false;
            }
        }

        return true;
    });

    if array_length(possibilities) == 0 {
        return;
    }

    var type = array_rand(possibilities);

	audio_play_sound(sfx_micro_enemy_spawn, 3, 0, .5, 0, random_range(.9, 1.1));
    instance_create_depth(spawn_x, spawn_y, 0, obj_enemy, {type});
});

__get_enemy_amt_by_type = function(search_type) {
    var amt = 0;
    with obj_enemy {
        if type == search_type {
            amt += 1;
        }
    }

    return amt;
}

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
