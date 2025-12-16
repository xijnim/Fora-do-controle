function __get_enemy_cheese() {
    return new Enemy({
        sprite: spr_enemy_cheese,
        ai_type: EnemyAI_Type.Alive,
        level: 2,
        xp_reward: 10,
    });
}
