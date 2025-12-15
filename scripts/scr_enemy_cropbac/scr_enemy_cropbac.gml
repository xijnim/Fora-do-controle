function __get_enemy_cropbac() {
    return new Enemy({
        sprite: spr_enemy_cropbac,
        ai_type: EnemyAI_Type.Alive,
        level: 1,
    });
}
