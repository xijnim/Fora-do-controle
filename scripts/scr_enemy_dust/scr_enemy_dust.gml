function __get_enemy_dust() {
    return new Enemy({
        sprite: spr_enemy_dust,
        make_strategy: function(inst) {
            return new EnemyIdleStrategy(inst);
        },
        can_spawn: function() {
            return State.get_level() == 1;
        },
        level: 1,
        xp_reward: 1,
    });
}
