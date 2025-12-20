function __get_enemy_mars() {
    return new Enemy({
        sprite: spr_enemy_mars,
        make_strategy: function(inst) {
            return new EnemyOrbitStrategy({
                inst,
                get_owner: function() {
                    return obj_sun;
                },
                dist: 740,
                angle_spd: 1,
            });
        },
        can_spawn: spawn_never_cond,
        xp_reward: 5,
    });
}
