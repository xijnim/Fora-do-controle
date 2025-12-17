function __get_enemy_cheese() {
    return new Enemy({
        sprite: spr_enemy_cheese,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 2,
        can_spawn: spawn_cap_cond(EnemyIdx.Cheese, 2, 10),
        xp_reward: 10,
    });
}

function spawn_never_cond() {
    return false;
}
