function CharacterController(inst) constructor {
    update = function() {
        var move_x = -keyboard_check(ord("A"))+keyboard_check(ord("D"));
        var move_y = -keyboard_check(ord("W"))+keyboard_check(ord("S"));

        if move_x != 0 || move_y != 0 {
            var spd = 2;
            var acel = .2;
            var dir = point_direction(0, 0, move_x, move_y);

            __hsp = lerp(__hsp, lengthdir_x(spd, dir), acel);
            __vsp = lerp(__vsp, lengthdir_y(spd, dir), acel);
        } else {
            var fric = .3;
            __hsp = lerp(__hsp, 0, fric);
            __vsp = lerp(__vsp, 0, fric);
        }

        __inst.x += __hsp;
        __inst.y += __vsp;
    }

    __inst = inst;
    __hsp = 0;
    __vsp = 0;
}
