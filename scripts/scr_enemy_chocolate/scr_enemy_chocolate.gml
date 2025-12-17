function __get_enemy_chocolate() {
    return new Enemy({
        sprite: spr_enemy_chocolate,
        ai_type: EnemyAI_Type.SuperIdle,
        level: 2,
        xp_reward: 25,
    });
}
