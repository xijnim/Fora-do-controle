function __State() constructor {
    get_level = function() {
        var actual_level = __get_actual_level();
        if actual_level > __prev_level {
            __prev_level = actual_level;
        }

        return max(__prev_level,  actual_level);
    }

    __get_actual_level = function() {
        if xp < 100 {
            return 1;
        }
        if xp < 1000 {
            return 2;
        }
        return 3;
    }
    xp = 00;
    berserk = false;
    berserk_progress = 0;
    
    __prev_level = 0;
}

globalvar State;
State = new __State();

