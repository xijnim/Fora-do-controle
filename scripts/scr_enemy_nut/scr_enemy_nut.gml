function __get_enemy_nut() {
    return new Enemy({
        sprite: spr_enemy_nut,
        ai_type: EnemyAI_Type.Idle,
        level: 2,
        xp_reward: 50,
    });
}
