function __get_enemy_earth() {
    return new Enemy({
        sprite: spr_enemy_earth,
        make_strategy: function(inst) {
            return new EnemyOrbitStrategy({
                inst,
                get_owner: function() {
                    return obj_sun;
                },
                dist: 560,
                angle_spd: 2,
            });
        },
        can_spawn: spawn_never_cond,
        xp_reward: 5,
    });
}

function EnemyOrbitStrategy(config) constructor {
    update = function() {
        var owner = __get_owner();
        __inst.image_angle -= .5;

        if !instance_exists(owner) {
            return;
        }

        var target_x = owner.x + lengthdir_x(__dist, __angle);
        var target_y = owner.y + lengthdir_y(__dist, __angle);

        __inst.x = target_x;
        __inst.y = target_y;// + sin(current_time*.007 + __anim_offset)*16;
        __angle += __angle_spd;
        // var dir = point_direction(__inst.x, __inst.y, target_x, target_y);
        //
        // var target_hsp = lengthdir_x(1, dir);
        // var target_vsp = lengthdir_y(1, dir);
        // __hsp = lerp(__hsp, target_hsp, .2);
        // __vsp = lerp(__vsp, target_vsp, .2);
        //
        // __angle += 10;
        //
        // __inst.x += __hsp;
        // __inst.y += __vsp;
    }

    __inst = config.inst;
    __get_owner = config.get_owner;
    __dist = config.dist;
    __angle_spd = config.angle_spd;
    __angle = irandom(359);
    __hsp = 0;
    __vsp = 0;

    __anim_offset = irandom(13000);

    __inst.image_angle = irandom(359);
}
