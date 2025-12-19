function __get_enemy_car() {
    return new Enemy({
        sprite: spr_enemy_nut,
        make_strategy: function(inst) {
            return new EnemyCarStrategy(inst);
        },
        // can_spawn: spawn_cap_cond(EnemyIdx.Car, 3, 4),
        can_spawn: spawn_never_cond,
        is_aggressive: false,
        xp_reward: 25,
    });
}

function EnemyCarStrategy(inst) constructor {
    update = function() {
        var panic = false;
        with __inst {
            if collision_circle(x, y, 96, obj_doritos, true, true) {
                panic = true;
            }
        }

        if panic {
            __panic = true;
            __forget_timer.reset();
        }

        if __panic {
            __inst.path_speed = 3;
            __forget_timer.tick();
        } else {
            __inst.path_speed = 1.5;
        }
    }

    with inst {
        path_start(pth_car, 1.2, path_action_continue, true);
    }
    __inst = inst;
    __panic = false;
    __forget_timer = new Timer(3, function() {
            __panic = false;
    });
}
