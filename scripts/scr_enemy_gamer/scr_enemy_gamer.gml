function __get_enemy_gamer() {
    return new Enemy({
        sprite: spr_enemy_gamer,
        make_strategy: function(inst) {
            return new EnemyAggressiveStrategy(inst);
        },
        can_spawn: spawn_never_cond,
        is_aggressive: false,
        xp_reward: 25,
    });
}
