function __get_enemy_mini_human() {
    return new Enemy({
        sprite: spr_enemy_mini_human,
        make_strategy: function(inst) {
            return new EnemyMiniAntStrategy(inst, {
                change_angle: false,
            });
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Mini_Human, 5, 32),
        clamp_in_room: false,
        xp_reward: 50,
        is_aggressive: false,
		repel: true,
    });
};
