function __get_enemy_mercury() {
    return new Enemy({
        sprite: spr_enemy_mercury,
        make_strategy: function(inst) {
            return new EnemyOrbitStrategy({
                inst,
                get_owner: function() {
                    return obj_sun;
                },
                dist: 340,
                angle_spd: 2,
            });
        },
        can_spawn: spawn_never_cond,
        xp_reward: 600,
    });
}
