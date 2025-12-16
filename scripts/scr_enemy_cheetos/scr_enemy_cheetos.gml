function __get_enemy_cheetos() {
    return new Enemy({
        sprite: spr_enemy_cheetos,
        ai_type: EnemyAI_Type.SuperIdle,
        level: 2,
        xp_reward: 10,
    });
}
