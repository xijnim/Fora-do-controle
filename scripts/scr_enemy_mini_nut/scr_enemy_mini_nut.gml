function __get_enemy_mini_nut() {
    return new Enemy({
        sprite: spr_enemy_mini_nut,
        make_strategy: function(inst) {
            return new EnemySugarStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Mini_Nut, 2, 4),
        xp_reward: 10,
    });
}
