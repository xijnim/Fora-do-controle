function Enemy(config) constructor {
    sprite = config.sprite;
    make_strategy = config.make_strategy;
    xp_reward = config.xp_reward;
    can_spawn = config.can_spawn;
    is_aggressive = config[$ "is_aggressive"] ?? false;
    repel = config[$ "repel"] ?? true;
    victims = config[$ "victims"] ?? [];
    clamp_in_room = config[$ "clamp_in_room"] ?? true;
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
	Mini_Spider,
    Gamer,
    Tank,
    Mini_Human,
    Earth,
    Moon,
    Asteroid,

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
global.enemies[EnemyIdx.Gamer] = __get_enemy_gamer();
global.enemies[EnemyIdx.Tank] = __get_enemy_tank();
global.enemies[EnemyIdx.Mini_Human] = __get_enemy_mini_human();
global.enemies[EnemyIdx.Mini_Spider] = __get_enemy_mini_spider();
global.enemies[EnemyIdx.Earth] = __get_enemy_earth();
global.enemies[EnemyIdx.Moon] = __get_enemy_moon();
global.enemies[EnemyIdx.Asteroid] = __get_enemy_asteroid();

function notify_kill(add_reward, xp_reward) {
    if add_reward {
        State.xp += xp_reward;
        if !State.berserk {
            State.berserk_progress += 1;
        }
    }
    with obj_doritos {
        vfx_manager.add_angle(40);
        vfx_manager.add_scale_force(.5, -.5);
    }
	audio_play_sound(sfx_player_eat, 2, 0, .7, 0, random_range(.9, 1.1));
}

array_foreach(global.enemies, function(enemy) {
    assert_exists(enemy);
});
