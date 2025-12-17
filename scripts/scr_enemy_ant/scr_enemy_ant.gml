function __get_enemy_ant() {
    return new Enemy({
        sprite: spr_enemy_ant,
        make_strategy: function(inst) {
            return new EnemyAntStrategy(inst);
        },
		can_spawn: spawn_cap_cond(EnemyIdx.Chocolate, 2, 1),
        level: 3,
        xp_reward: 10,
    });
}

function EnemyAntStrategy(inst) constructor {
    update = function() {
        __forget_timer.tick();

        var sugar = noone;
        with obj_enemy {
            if type == EnemyIdx.Sugar && point_distance(x, y, other.__inst.x, other.__inst.y) < 96 {
                sugar = id;
            }
        }

        if instance_exists(sugar) && !instance_exists(__target_inst) {
            __target_inst = sugar;
            __forget_timer.reset();
        }

        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);
        if instance_exists(doritos) 
            && State.get_level() < 3
            && point_distance(__inst.x, __inst.y, doritos.x, doritos.y) < 48 {
            __target_inst = doritos;
            __forget_timer.reset();
        }

        if !instance_exists(__target_inst) {
            var spd = __random_walking_movement.update();
            __hsp = lerp(__hsp, spd[0], .6);
            __vsp = lerp(__vsp, spd[1], .6);
        } else {
            var dir = point_direction(__inst.x, __inst.y, __target_inst.x, __target_inst.y);
            __inst.image_angle = lerp_angle(__inst.image_angle, dir+90, .2);
            __hsp = lerp(__hsp, lengthdir_x(1.5, dir), .3);
            __vsp = lerp(__vsp, lengthdir_y(1.5, dir), .3);
        }

        __inst.x += __hsp;
        __inst.y += __vsp;
    }

    __random_walking_movement = new RandomWalkingMovement({inst});
    __inst = inst;
    __target_inst = noone;
    __hsp = 0;
    __vsp = 0;
    __forget_timer = new Timer(4, function() {
        __target_inst = noone;
    });
}

function RandomWalkingMovement(config) constructor {
    update = function() {
        if __is_idle {
            __restart_timer.tick();
            return [0, 0];
        } else {
            var dir = point_direction(__inst.x, __inst.y, __target_x, __target_y);
            var dist = point_distance(__inst.x, __inst.y, __target_x, __target_y);
            __hsp = lerp(__hsp, lengthdir_x(__spd, dir), .2);
            __vsp = lerp(__vsp, lengthdir_y(__spd, dir), .2);
            __inst.image_angle = lerp_angle(__inst.image_angle, dir+90, .5);

            if dist < __spd {
                __inst.x = __target_x;
                __inst.y = __target_y;
                __is_idle = true;
                return [__target_x - __inst.x, __target_y - __inst.y];
            } else {
                return [__hsp, __vsp];
            }
        }
    }
    
    __hsp = 0;
    __vsp = 0;

    __restart_timer = new Timer(1.5, function() {
        __target_x = irandom(room_width);
        __target_y = irandom(room_height);
        __is_idle = false;
    });
    __target_x = irandom(room_width);
    __target_y = irandom(room_height);
    __inst = config.inst;
    __is_idle = true;
    __spd = config[$ "spd"] ?? 1.3;
}
