function __get_enemy_mini_ant() {
    return new Enemy({
        sprite: spr_enemy_mini_ant,
        make_strategy: function(inst) {
            return new EnemyAntStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Ant, 3, 12),
        xp_reward: 50,
        is_aggressive: false,
		repel: true
    });
}