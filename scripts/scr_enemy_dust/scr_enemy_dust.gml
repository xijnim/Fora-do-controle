function __get_enemy_dust() {
    return new Enemy({
        sprite: spr_enemy_dust,
        make_strategy: function(inst) {
            return new EnemyIdleStrategy(inst);
        },
		can_spawn: spawn_cap_cond(EnemyIdx.Dust, 3, 12),
        xp_reward: 1,
    });
}
