function __get_enemy_sugar() {
    return new Enemy({
        sprite: spr_enemy_sugar,
        ai_type: EnemyAI_Type.Alive,
        level: 2,
        xp_reward: 10,
    });
}
