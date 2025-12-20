function __get_enemy_mini_ant() {
    return new Enemy({
        sprite: spr_enemy_mini_ant,
        make_strategy: function(inst) {
            return new EnemyMiniAntStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Ant, 3, 12),
        xp_reward: 50,
        is_aggressive: false,
		repel: true,
        clamp_in_room: false,
        victims: [EnemyIdx.Mini_Sugar],
    });
}


function EnemyMiniAntStrategy(inst, extra_conf={}) constructor {
    update = function() {
        __forget_timer.tick();

        var spider = noone;
        var sugar = noone;
        with obj_enemy {
            if type == EnemyIdx.Spider && point_distance(x, y, other.__inst.x, other.__inst.y) < 96 {
                spider = id;
            }
            if array_contains(other.__inst.data.victims, type) && point_distance(x, y, other.__inst.x, other.__inst.y) < 96 {
                sugar = id;
            }
        }

        if instance_exists(spider) {
            __predator = spider;
            __forget_timer.reset();
        }
        if instance_exists(sugar) {
            __prey = sugar;
            __forget1_timer.reset();
        }

        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);
        if instance_exists(doritos) 
            && point_distance(__inst.x, __inst.y, doritos.x, doritos.y) < 48 {
            __predator = doritos;
            __forget_timer.reset();
        }

        if instance_exists(__prey) {
            var dir = point_direction(__inst.x, __inst.y, __prey.x, __prey.y);
            if __change_angle {
                __inst.image_angle = lerp_angle(__inst.image_angle, dir+90, .2);
            }
            __hsp = lerp(__hsp, lengthdir_x(1.5, dir), .3);
            __vsp = lerp(__vsp, lengthdir_y(1.5, dir), .3);
            __forget1_timer.tick();
        } else if !instance_exists(__predator) {
            var spd = __random_walking_movement.update();
            __hsp = lerp(__hsp, spd[0], .6);
            __vsp = lerp(__vsp, spd[1], .6);
        } else {
            var dir = point_direction(__inst.x, __inst.y, __predator.x, __predator.y)+180;
            if __change_angle {
                __inst.image_angle = lerp_angle(__inst.image_angle, dir+90, .2);
            }
            __hsp = lerp(__hsp, lengthdir_x(1.5, dir), .3);
            __vsp = lerp(__vsp, lengthdir_y(1.5, dir), .3);
            __forget_timer.tick();
        }

        if !__change_angle {
            __inst.image_angle = 0;
        }

        __inst.x += __hsp;
        __inst.y += __vsp;
    }

    __random_walking_movement = new RandomWalkingMovement({inst});
    __inst = inst;
    __predator = noone;
    __prey = noone;
    __hsp = 0;
    __vsp = 0;
    __change_angle = extra_conf[$ "change_angle"] ?? true;
    __forget_timer = new Timer(3, function() {
        __predator = noone;
    });
    __forget1_timer = new Timer(3, function() {
        __prey = noone;
    });
}
