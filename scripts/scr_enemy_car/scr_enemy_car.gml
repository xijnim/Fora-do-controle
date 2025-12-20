function __get_enemy_car() {
    return new Enemy({
        sprite: spr_enemy_car,
        make_strategy: function(inst) {
            return new EnemyCarStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Car, 5, 8),
        is_aggressive: false,
        xp_reward: 250,
        clamp_in_room: false,
        victims: [EnemyIdx.Mini_Human],
    });
}

function EnemyCarStrategy(inst) constructor {
    update = function() {
        with __inst {
            if collision_circle(x, y, 96, obj_doritos, true, true) {
                other.__panic = true;
            }
        }

        if __panic {
            __inst.path_speed = 5;
			
        }
		
		var dir = __inst.direction + 180;
		__inst.image_angle = lerp_angle(__inst.image_angle, dir, 0.2);

        var meeting = false;
        with obj_enemy {
            if type == EnemyIdx.Tank && place_meeting(x, y, other.__inst) {
                meeting = true;
            }
        }
        with __inst {
            if place_meeting(x, y, obj_tank_bullet) {
                meeting = true;
            }
        }
        if meeting {
            __die = true;
        }

        var dispawn_margin = 48;
        var outside_room = !point_in_rectangle(
            __inst.x, __inst.y,
            -dispawn_margin, -dispawn_margin,
            room_width+dispawn_margin, room_height+dispawn_margin
        );
        if outside_room && __panic {
            __die = true;
        }
    }

    on_path_end = function() {
        __die = true;
    }

    should_die = function() {
        return __die;
    }

	__is_bottom = false;
    with inst {
		var path_choose = choose(pth_car, pth_car_bottom)
        path_start(path_choose, 1.5, path_action_stop, true);
		
		if path_choose = pth_car_bottom {
			other.__is_bottom = true;
		}
    }
    inst.image_speed = 0;
    inst.sprite_index = spr_enemy_car;
    inst.image_index = irandom(inst.image_number-1);

    __hsp = 0;
    __vsp = 0;
    __inst = inst;
    __die = false;
    __panic = false;
}
