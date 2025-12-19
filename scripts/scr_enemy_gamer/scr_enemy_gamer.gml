function __get_enemy_gamer() {
    return new Enemy({
        sprite: spr_enemy_gamer,
        make_strategy: function(inst) {
            return new EnemyGamerStrategy(inst);
        },
        can_spawn: spawn_never_cond,
        is_aggressive: false,
        xp_reward: 1,
    });
}

function EnemyGamerStrategy(inst) constructor {
    update = function() {
        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);

        if !instance_exists(doritos) {
            exit;
        }

        mp_grid_clear_all(__mp_grid);

        var margin = 4;
        __add_inst(obj_tv, margin);
        __add_inst(obj_sofa, margin);
        __add_inst(obj_gamer_table, margin);
        __add_inst(obj_gamer_col, margin);

        var area = 13;
        var x1 = obj_doritos.x - area;
        var y1 = obj_doritos.y - area - 12;
        var x2 = obj_doritos.x + area;
        var y2 = obj_doritos.y + area + 12;
        mp_grid_add_rectangle(__mp_grid, x1, y1, x2, y2);

        var target_x = -1;
        var target_y = -1;
        var idk_man = 16;
        if doritos.x > room_width/2 {
            target_x = __inst.sprite_width/2 + idk_man*2;
        } else {
            target_x = room_width - __inst.sprite_width/2 - idk_man*2;
        }
        if doritos.y > room_height/2 {
            target_y = __inst.sprite_height + idk_man;
        } else {
            target_y = room_height-1 - idk_man;
        }

        mp_grid_path(__mp_grid, __path, __inst.x, __inst.y, target_x, target_y, true);
        with __inst {
            path_start(other.__path, 5, path_action_stop, true);
        }
        path_set_precision(__path, 4);

        var has_moved = __inst.xprevious != __inst.x || __inst.yprevious != __inst.y;
        __inst.sprite_index = has_moved ? spr_enemy_gamer : spr_gamer_idle;

        var spr_w = __inst.sprite_width;
        var spr_h = __inst.sprite_height;
        __inst.depth = -__inst.y;
        __inst.x = clamp(__inst.x, spr_w/2, room_width-spr_w/2);
        __inst.y = clamp(__inst.y, spr_h, room_height);
    }

    __hsp = 0;
    __vsp = 0;

    __mp_grid = mp_grid_create(0, 0, room_width, room_height, 1, 1);
    __path = path_add();
    mp_grid_add_instances(__mp_grid, obj_tv, false);
    mp_grid_add_instances(__mp_grid, obj_sofa, false);
    mp_grid_add_instances(__mp_grid, obj_gamer_table, false);

    __add_inst = function(inst, margin) {
        var x1 = inst.bbox_left - margin;
        var y1 = inst.bbox_top - margin;
        var x2 = inst.bbox_right + margin;
        var y2 = inst.bbox_bottom + margin;
        mp_grid_add_rectangle(__mp_grid, x1, y1, x2, y2);
    }

    __inst = inst;
}
