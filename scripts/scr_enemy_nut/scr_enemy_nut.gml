function __get_enemy_nut() {
    return new Enemy({
        sprite: spr_enemy_nut,
        make_strategy: function(inst) {
            return new EnemyAggressiveStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Nut, 1, 1),
        is_aggressive: true,
        xp_reward: 25,
    });
}

function spawn_cap_cond(idx, level, cap) {
    var func = function() {
        var amt = get_enemy_amt_by_type(self.idx);
        return amt < self.cap && self.level == State.get_level();
    };
    return method({idx, cap, level}, func);
}

function get_enemy_amt_by_type(search_type) {
    var amt = 0;
    with obj_enemy {
        if type == search_type {
            amt += 1;
        }
    }

    return amt;
}

function EnemyAggressiveStrategy(inst) constructor {
    update = function() {
        var target_spd = __get_target_spd();
        var hsp = target_spd[0];
        var vsp = target_spd[1];
        
        __hsp = lerp(__hsp, hsp, .2);
        __vsp = lerp(__vsp, vsp, .2);

        __inst.x += __hsp;
        __inst.y += __vsp;

        __inst.x = clamp(__inst.x, 0, room_width);
        __inst.y = clamp(__inst.y, 0, room_height);
    }

    __get_target_spd = function() {
        var spd = __aggressive_thought.update();
        if spd != -1 {
            return spd;
        }

        __random_floating_movement.update();
        return __random_floating_movement.get_spd();
    }

    __inst = inst;
    __hsp = 0;
    __vsp = 0;

    __random_floating_movement = new RandomFloatingMovement({inst});
    __aggressive_thought = new AggressiveThought(inst);
}

function AggressiveThought(inst) constructor {
    update = function() {
        if __state != EnemyAI_State.Idle {
            __forget_timer.tick();
        }
        var spd = 1.3;

        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);
        var in_area = instance_exists(doritos) && point_distance(__inst.x, __inst.y, doritos.x, doritos.y) < 48;
        if in_area && !State.berserk {
            __state = EnemyAI_State.Hunt;
            __forget_timer.reset();
        }
        if __state == EnemyAI_State.Panic {
            var dir = point_direction(doritos.x, doritos.y, __inst.x, __inst.y);
            var hsp = lengthdir_x(spd, dir);
            var vsp = lengthdir_y(spd, dir);

            return [hsp, vsp];
        }
        if __state == EnemyAI_State.Hunt {
            var dir = point_direction(__inst.x, __inst.y, doritos.x, doritos.y);
            var hsp = lengthdir_x(spd, dir);
            var vsp = lengthdir_y(spd, dir);

            return [hsp, vsp];
        }

        return -1;
    }

    __inst = inst;
    __state = false;
    __forget_timer = new Timer(3, function() {
        __state = EnemyAI_State.Idle;
    });
}
