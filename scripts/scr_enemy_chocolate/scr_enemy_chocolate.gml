function __get_enemy_chocolate() {
    return new Enemy({
        sprite: spr_enemy_chocolate,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Chocolate, 2, 4),
        level: 2,
        xp_reward: 25,
    });
}
