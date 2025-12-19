function __get_enemy_spider() {
    return new Enemy({
        sprite: spr_enemy_spider,
        make_strategy: function(inst) {
            return new EnemyAntStrategy(inst);
        },
        // can_spawn: spawn_cap_cond(EnemyIdx.Ant, 2, 1),
        can_spawn: spawn_never_cond,
        xp_reward: 10,
        is_aggressive: true,
		repel: false,
        victims: [EnemyIdx.Mini_Ant],
    });
}
