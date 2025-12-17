function __get_enemy_corona() {
    return new Enemy({
        sprite: spr_enemy_corona,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 1,
        xp_reward: 5,
    });
}
