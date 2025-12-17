function __get_enemy_corona() {
    return new Enemy({
        sprite: spr_enemy_corona,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        can_spawn: bacteria_spawn_cond,
        level: 1,
        xp_reward: 5,
    });
}
