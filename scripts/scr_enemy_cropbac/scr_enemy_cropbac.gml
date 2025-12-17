function __get_enemy_cropbac() {
    return new Enemy({
        sprite: spr_enemy_cropbac,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        can_spawn: bacteria_spawn_cond,
        xp_reward: 5,
    });
}

function bacteria_spawn_cond() {
    var bacteria_amt = get_enemy_amt_by_type(EnemyIdx.CropBac) + get_enemy_amt_by_type(EnemyIdx.Corona);
    var cap = State.get_level() > 1 ? 0 : 26;
    return bacteria_amt < cap;
}
