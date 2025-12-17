function EnemyAliveStrategy(inst) constructor {
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
        var spd = __alive_thought.update();
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
    __alive_thought = new AliveThought(inst);
}

function RandomFloatingMovement(config) constructor {
    update = function() {
        __time += .06;

        var hsp = noise(__time*.3)*__spd;
        var vsp = noise(__time*.26+13)*__spd;

        var predicted_x = __inst.x + hsp*__mult_x;
        var predicted_y = __inst.y + vsp*__mult_y;
        if !point_in_rectangle(predicted_x, __inst.y, 0, 0, room_width, room_height) {
            __mult_x *= -1;
        }
        if !point_in_rectangle(__inst.x, predicted_y, 0, 0, room_width, room_height) {
            __mult_y *= -1;
        }
    }

    get_spd = function() {
        var hsp = noise(__time*.3)*__spd;
        var vsp = noise(__time*.26+13)*__spd;
        return [hsp*__mult_x, vsp*__mult_y];
    }

    __inst = config.inst;
    __spd = config[$ "spd"] ?? 1.3;
    __time = irandom(13000);
    __mult_x = 1;
    __mult_y = 1;

    delete config;
}

function AliveThought(inst) constructor {
    update = function() {
        if __state != EnemyAI_State.Idle {
            __forget_timer.tick();
        }
        var spd = 1.3;

        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);
        var in_area = instance_exists(doritos) && point_distance(__inst.x, __inst.y, doritos.x, doritos.y) < 48;
        if in_area {
            if __inst.data.level > State.get_level() {
                if !State.berserk {
                    __state = EnemyAI_State.Hunt;
                    __forget_timer.reset();
                }
            } else {
                __state = EnemyAI_State.Panic;
                __forget_timer.reset();
            }
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

enum EnemyAI_State {
    Idle,
    Panic,
    Hunt,
}
