function EnemyHitbox(inst) constructor {
    update = function() {
    }

    notify_hit = function(doritos) {
        if __inst.data.level > State.get_level() {
            var dir = point_direction(__inst.x, __inst.y, doritos.x, doritos.y);
            if !State.berserk && __inst.data.is_aggressive {
                doritos.take_damage(1);
                obj_camera.screenshake(5);
            }
            
            return false;
        }

        __dead = true;
        return true;
    }

    is_dead = function() {
        return __dead;
    }

    __inst = inst;
    __dead = false;
}
