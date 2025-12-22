function __get_enemy_mini_sugar() {
    return new Enemy({
        sprite: spr_enemy_mini_sugar,
        make_strategy: function(inst) {
            return new EnemySugarStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Mini_Sugar, 3, 16),
        xp_reward: 25,
		
    });
}

