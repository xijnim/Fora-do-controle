function __get_enemy_chocolate() {
    return new Enemy({
        sprite: spr_enemy_chocolate,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 2,
        xp_reward: 25,
    });
}
