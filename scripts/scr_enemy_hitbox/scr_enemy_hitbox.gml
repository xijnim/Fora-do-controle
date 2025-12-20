function EnemyHitbox(inst, is_aggressive, damage=true) constructor {
    update = function() {
    }

    notify_hit = function(doritos) {
        if __is_aggressive {
            if !State.berserk && __damage {
                doritos.take_damage(__inst.data.xp_reward);
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

    __is_aggressive = is_aggressive;
    __damage = damage;
    __inst = inst;
    __dead = false;
}
