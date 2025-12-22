function __get_enemy_tank() {
    return new Enemy({
        sprite: spr_enemy_tank,
        make_strategy: function(inst) {
            return new EnemyTankStrategy(inst);
        },
        can_spawn: spawn_never_cond,
        is_aggressive: true,
        xp_reward: 25,
        repel: false,
    });
}

function EnemyTankStrategy(inst) constructor {
    update = function() {
        __shoot_timer.tick();

        var doritos = obj_doritos;
        var dir = point_direction(__inst.x, __inst.y, doritos.x, doritos.y);

        __dir = lerp_angle(__dir, dir, .2);
        __vfx_manager.update();
		__inst.image_angle = lerp_angle(__inst.image_angle, __dir, .025);
    }

    render = function() {
        var xscale = __vfx_manager.get_xscale();
        var yscale = __vfx_manager.get_yscale();

        draw_sprite_ext(
            spr_enemy_tank_gun, 0,
            __inst.x, __inst.y,
            xscale, yscale,
            __dir, c_white, 1
        );
    }

    __inst = inst;
    __dir = 0;
    __vfx_manager = new VfxManager();
    __vfx_manager.set_scale_add(-1, -1);
    __shoot_timer = new Timer(1.5, function() {
        __vfx_manager.add_scale_force(.3, -.3);
        __inst.vfx_manager.add_scale_force(.3, -.3);
        var gun_w = sprite_get_width(spr_enemy_tank_gun);
        var bullet_x = __inst.x + lengthdir_x(gun_w/2, __dir);
        var bullet_y = __inst.y + lengthdir_y(gun_w/2, __dir);
        
		sfx_play(sfx_wpn_tank);
        var bullet = instance_create_depth(bullet_x, bullet_y, 0, obj_tank_bullet, {dir: __dir});
		bullet.image_angle = point_direction(__inst.x, __inst.y, obj_doritos.x, obj_doritos.y);
    });
}
