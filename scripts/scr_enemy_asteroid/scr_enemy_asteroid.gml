function __get_enemy_asteroid() {
    return new Enemy({
        sprite: spr_enemy_asteroid,
        make_strategy: function(inst) {
            return new EnemyAsteroidStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Asteroid, 6, 12),
        xp_reward: 5,
    });
}

function EnemyAsteroidStrategy(inst) constructor {
    update = function() {
        var target_x = obj_sun.x + lengthdir_x(__dist, __angle);
        var target_y = obj_sun.y + lengthdir_y(__dist, __angle);

        __inst.x = target_x;
        __inst.y = target_y;
        __angle += .05;
        __dist -= .5;
    }

    __inst = inst;
    __dist = point_distance(inst.x, inst.y, obj_sun.x, obj_sun.y);
    __angle = point_direction(obj_sun.x, obj_sun.y, inst.x, inst.y);
    inst.image_speed = 0;
    inst.image_index = irandom(inst.image_number-1);
}
