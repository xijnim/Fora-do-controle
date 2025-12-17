function __get_enemy_cheetos() {
    return new Enemy({
        sprite: spr_enemy_cheetos,
        make_strategy: function(inst) {
            return new EnemyIdleStrategy(inst);
        },
        level: 3,
        xp_reward: 10,
        is_aggressive: false,
    });
}

function EnemyIdleStrategy(inst, spd=1.3) constructor {
    update = function() {
        __random_floating_movement.update();
        var spd = __random_floating_movement.get_spd();
        __inst.x += spd[0];
        __inst.y += spd[0];

        __inst.x = clamp(__inst.x, 0, room_width);
        __inst.y = clamp(__inst.y, 0, room_height);
    }

    __inst = inst;
    __random_floating_movement = new RandomFloatingMovement({inst, spd});
}
