function __get_enemy_dust() {
    return new Enemy({
        sprite: spr_enemy_dust,
        ai_type: EnemyAI_Type.Idle,
        level: 1,
        xp_reward: 1,
    });
}
