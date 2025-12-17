function __get_enemy_nut() {
    return new Enemy({
        sprite: spr_enemy_nut,
        make_strategy: function(inst) {
            return new EnemyAliveStrategy(inst);
        },
        level: 2,
        can_spawn: spawn_cap_cond(EnemyIdx.Nut, 1, 8),
        xp_reward: 25,
    });
}

function spawn_cap_cond(idx, level, cap) {
    var func = function() {
        var amt = get_enemy_amt_by_type(self.idx);
        return amt < self.cap && self.level == State.get_level();
    };
    return method({idx, cap, level}, func);
}

function get_enemy_amt_by_type(search_type) {
    var amt = 0;
    with obj_enemy {
        if type == search_type {
            amt += 1;
        }
    }

    return amt;
}
