function __get_enemy_cheese() {
    return new Enemy({
        sprite: spr_enemy_cheese,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 2,
        xp_reward: 10,
    });
}
