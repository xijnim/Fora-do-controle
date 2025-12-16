function __get_enemy_corona() {
    return new Enemy({
        sprite: spr_enemy_corona,
        ai_type: EnemyAI_Type.Alive,
        level: 1,
        xp_reward: 5,
    });
}
