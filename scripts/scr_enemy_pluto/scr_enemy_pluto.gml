function __get_enemy_pluto() {
    return new Enemy({
        sprite: spr_enemy_pluto,
        make_strategy: function(inst) {
            return new EnemyOrbitStrategy({
                inst,
                get_owner: function() {
                    return obj_sun;
                },
                dist: 980,
                angle_spd: .75,
            });
        },
        can_spawn: spawn_never_cond,
        xp_reward: 650,
    });
}
