function __get_enemy_mini_spider() {
    return new Enemy({
        sprite: spr_enemy_mini_spider,
        make_strategy: function(inst) {
            return new EnemyMiniAntStrategy(inst);
        },
        can_spawn: spawn_cap_cond(EnemyIdx.Spider, 4, 0),
        xp_reward: 0,
        is_aggressive: false,
		repel: true,
        clamp_in_room: false,
    });
}