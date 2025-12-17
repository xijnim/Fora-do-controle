function __get_enemy_dust() {
    return new Enemy({
        sprite: spr_enemy_dust,
        make_strategy: function(inst) {
            return new EnemyIdleStrategy(inst);
        },
        level: 1,
        xp_reward: 1,
    });
}


