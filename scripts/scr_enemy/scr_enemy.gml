function Enemy(config) constructor {
    sprite = config.sprite;
    ai_type = config.ai_type;
    level = config.level;
    xp_reward = config.xp_reward;
}

enum EnemyIdx {
    Dust,
    CropBac,
    Corona,
    Nut,
    Cheetos,
	Cheese,
	Sugar,
	Chocolate,

    ENUM_LENGTH,
}

global.enemies = array_create(EnemyIdx.ENUM_LENGTH, undefined);

global.enemies[EnemyIdx.Dust] = __get_enemy_dust();
global.enemies[EnemyIdx.CropBac] = __get_enemy_cropbac();
global.enemies[EnemyIdx.Corona] = __get_enemy_corona();
global.enemies[EnemyIdx.Cheetos] = __get_enemy_cheetos();
global.enemies[EnemyIdx.Nut] = __get_enemy_nut();
global.enemies[EnemyIdx.Cheese] = __get_enemy_cheese();
global.enemies[EnemyIdx.Sugar] = __get_enemy_sugar();
global.enemies[EnemyIdx.Chocolate] = __get_enemy_chocolate();

array_foreach(global.enemies, function(enemy) {
    assert_exists(enemy);
});
