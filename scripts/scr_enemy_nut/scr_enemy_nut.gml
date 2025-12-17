function __get_enemy_nut() {
    return new Enemy({
        sprite: spr_enemy_nut,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 2,
        xp_reward: 20,
    });
}
