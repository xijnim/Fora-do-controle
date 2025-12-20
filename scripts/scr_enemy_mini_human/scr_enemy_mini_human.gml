function __get_enemy_mini_human() {
    return new Enemy({
        sprite: spr_enemy_mini_human,
        make_strategy: function(inst) {
            return new EnemyMiniAntStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Mini_Human, 5, 32),
        xp_reward: 10,
        is_aggressive: false,
		repel: true,
    });
};