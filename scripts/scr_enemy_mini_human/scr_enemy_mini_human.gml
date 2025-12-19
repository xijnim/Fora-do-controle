function __get_enemy_mini_human() {
    return new Enemy({
        sprite: spr_enemy_mini_human,
        make_strategy: function(inst) {
            return new EnemyAntStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Mini_Human, 5, 10),
        xp_reward: 10,
        is_aggressive: false,
		repel: true,
    });
}
