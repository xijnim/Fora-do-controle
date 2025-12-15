function EnemyHitbox(inst) constructor {
    update = function() {
        var doritos = noone;
        with __inst {
            doritos = instance_place(x, y, obj_doritos);
        }

        if !instance_exists(doritos) {
            return;
        }
        
        if __inst.data.level > State.get_level() {
            var dir = point_direction(__inst.x, __inst.y, doritos.x, doritos.y);
            doritos.take_damage(1, 10, dir);
            
            return;
        }

        __dead = true;
    }

    is_dead = function() {
        return __dead;
    }

    __inst = inst;
    __dead = false;
}
