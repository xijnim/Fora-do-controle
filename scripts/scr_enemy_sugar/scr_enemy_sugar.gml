function __get_enemy_sugar() {
    return new Enemy({
        sprite: spr_enemy_sugar,
        make_strategy: function(inst) {
            return new EnemySugarStrategy(inst);
        },
        level: 2,
        can_spawn: spawn_cap_cond(EnemyIdx.Sugar, 2, 16),
        xp_reward: 10,
    });
}

function EnemySugarStrategy(inst) constructor {
    update = function() {
        var target_spd = __get_target_spd();
        var hsp = target_spd[0];
        var vsp = target_spd[1];
        
        __hsp = lerp(__hsp, hsp, .2);
        __vsp = lerp(__vsp, vsp, .2);
        
        if instance_exists(__ant) {
            __forget_timer.tick();
        }

        __inst.x += __hsp;
        __inst.y += __vsp;
    }

    __get_target_spd = function() {
        var ant = noone;
        with obj_enemy {
            var dist = point_distance(x, y, other.__inst.x, other.__inst.y);
            if type == EnemyIdx.Ant && dist < 48 {
                ant = id;
            }
        }

        if instance_exists(ant) {
            __ant = ant;
            __forget_timer.reset();
        }

        if instance_exists(__ant) {
            var dir = point_direction(__inst.x, __inst.y, __ant.x, __ant.y)+180;
            var spd = 1.25;
            return [lengthdir_x(spd, dir), lengthdir_y(spd, dir)];
        }

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
    
    __ant = noone;
    __forget_timer = new Timer(3, function() {
        __ant = noone;
    });

    __panic = false;

    __random_floating_movement = new RandomFloatingMovement({inst});
    __alive_thought = new AliveThought(inst);
}
