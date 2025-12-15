function CharacterController(inst) constructor {
    update = function() {
        if !State.berserk {
            var move_x = -keyboard_check(ord("A"))+keyboard_check(ord("D"));
            var move_y = -keyboard_check(ord("W"))+keyboard_check(ord("S"));

            if move_x != 0 || move_y != 0 {
                var spd = 2.2;
                var acel = .2;
                var dir = point_direction(0, 0, move_x, move_y);

                __hsp = lerp(__hsp, lengthdir_x(spd, dir), acel);
                __vsp = lerp(__vsp, lengthdir_y(spd, dir), acel);
            } else {
                var fric = .3;
                __hsp = lerp(__hsp, 0, fric);
                __vsp = lerp(__vsp, 0, fric);
            }
        } else {
            var spd = 10;
            var target_hsp = spd*__berserk_cos;
            var target_vsp = spd*__berserk_sin;
            var predicted_x = __inst.x + target_hsp;
            var predicted_y = __inst.y + target_vsp;

            if predicted_x != clamp(predicted_x, 0, room_width) {
                __berserk_cos = -__berserk_cos;
            }
            if predicted_y != clamp(predicted_y, 0, room_height) {
                __berserk_sin = -__berserk_sin;
            }

            __hsp = lerp(__hsp, target_hsp, .6);
            __vsp = lerp(__vsp, target_vsp, .6);
        }

        __knockback_x = lerp(__knockback_x, 0, .05);
        __knockback_y = lerp(__knockback_y, 0, .05);

        __inst.x += __hsp + __knockback_x;
        __inst.y += __vsp + __knockback_y;
    }

    add_knockback = function(spd, dir) {
        __knockback_x += lengthdir_x(spd, dir);
        __knockback_y += lengthdir_y(spd, dir);
    }

    reset_berserk = function() {
        __berserk_sin = choose(1, -1);
        __berserk_cos = choose(1, -1);
    }

    __time = 0;
    __inst = inst;
    __hsp = 0;
    __vsp = 0;
    __knockback_x = 0;
    __knockback_y = 0;
    __berserk_sin = choose(1, -1);
    __berserk_cos = choose(1, -1);
}
