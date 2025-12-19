function Enemy(config) constructor {
    sprite = config.sprite;
    make_strategy = config.make_strategy;
    xp_reward = config.xp_reward;
    can_spawn = config.can_spawn;
    is_aggressive = config[$ "is_aggressive"] ?? false;
    repel = config[$ "repel"] ?? true;
    victims = config[$ "victims"] ?? [];
}

enum EnemyIdx {
    Dust,
    CropBac,
    Corona,
    Nut,
	Mini_Nut,
    Cheetos,
	Cheese,
	Sugar,
    Ant,
	Mini_Ant,
	Chocolate,
    Car,
    Spider,

    ENUM_LENGTH,
}

global.enemies = array_create(EnemyIdx.ENUM_LENGTH, undefined);

global.enemies[EnemyIdx.Dust] = __get_enemy_dust();
global.enemies[EnemyIdx.CropBac] = __get_enemy_cropbac();
global.enemies[EnemyIdx.Corona] = __get_enemy_corona();
global.enemies[EnemyIdx.Cheetos] = __get_enemy_cheetos();
global.enemies[EnemyIdx.Nut] = __get_enemy_nut();
global.enemies[EnemyIdx.Mini_Nut] = __get_enemy_mini_nut();
global.enemies[EnemyIdx.Cheese] = __get_enemy_cheese();
global.enemies[EnemyIdx.Sugar] = __get_enemy_sugar();
global.enemies[EnemyIdx.Chocolate] = __get_enemy_chocolate();
global.enemies[EnemyIdx.Ant] = __get_enemy_ant();
global.enemies[EnemyIdx.Mini_Ant] = __get_enemy_mini_ant();
global.enemies[EnemyIdx.Car] = __get_enemy_car();
global.enemies[EnemyIdx.Spider] = __get_enemy_spider();

array_foreach(global.enemies, function(enemy) {
    assert_exists(enemy);
});
