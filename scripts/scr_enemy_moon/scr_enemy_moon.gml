function __get_enemy_moon() {
    return new Enemy({
        sprite: spr_enemy_moon,
        make_strategy: function(inst) {
            return new EnemyOrbitStrategy({
                inst,
                get_owner: function() {
                    with obj_enemy {
                        if type == EnemyIdx.Earth {
                            return id;
                        }
                    }
                    return noone;
                },
                dist: 100,
                angle_spd: .75,
            });
        },
        can_spawn: spawn_never_cond,
        xp_reward: 50,
    });
}
