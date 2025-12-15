function EnemyAI(inst) constructor {
    update = function() {
        var target_spd = __get_target_spd();
        var hsp = target_spd[0];
        var vsp = target_spd[1];
        
        __hsp = lerp(__hsp, hsp, .2);
        __vsp = lerp(__vsp, vsp, .2);

        __inst.x += __hsp;
        __inst.y += __vsp;
        
        if __panic {
            __panic_timer.tick();
        }

        __inst.x = clamp(__inst.x, 0, room_width);
        __inst.y = clamp(__inst.y, 0, room_height);
    }

    __get_target_spd = function() {
        var spd = 1.5;
        var doritos = instance_nearest(__inst.x, __inst.y, obj_doritos);
        if instance_exists(doritos) && point_distance(__inst.x, __inst.y, doritos.x, doritos.y) < 48 {
            __panic = true;
        }
        if __panic {
            var dir = point_direction(doritos.x, doritos.y, __inst.x, __inst.y);
            var hsp = lengthdir_x(spd, dir);
            var vsp = lengthdir_y(spd, dir);

            return [hsp, vsp];
        }

        __time += .06;

        var hsp = noise(__time*.3)*spd;
        var vsp = noise(__time*.26+13)*spd;

        var predicted_x = __inst.x + hsp*__mult_x;
        var predicted_y = __inst.y + vsp*__mult_y;
        if !point_in_rectangle(predicted_x, __inst.y, 0, 0, room_width, room_height) {
            __mult_x *= -1;
        }
        if !point_in_rectangle(__inst.x, predicted_y, 0, 0, room_width, room_height) {
            __mult_y *= -1;
        }

        return [hsp*__mult_x, vsp*__mult_y];
    }

    __inst = inst;
    __time = 0;
    __mult_x = 1;
    __mult_y = 1;
    __hsp = 0;
    __vsp = 0;

    __panic = false;
    __panic_timer = new Timer(3, function() {
        __panic = false;
    });
}
