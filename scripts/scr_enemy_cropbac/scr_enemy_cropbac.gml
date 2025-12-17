function __get_enemy_cropbac() {
    return new Enemy({
        sprite: spr_enemy_cropbac,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 1,
        xp_reward: 5,
    });
}
