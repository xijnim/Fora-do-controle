function EnemyHitbox(inst) constructor {
    update = function() {
        var meeting = false;
        with __inst {
            meeting = place_meeting(x, y, obj_doritos);
        }

        if meeting {
            __dead = true;
        }
    }

    is_dead = function() {
        return __dead;
    }

    __inst = inst;
    __dead = false;
}
