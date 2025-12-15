function Timer(_time_max, _callback, offset=0) constructor {
    static tick = function(args=[]) {
        time += 1;

        if time > time_max {
            method_call(callback, args);
            time = 0;
        }
    }

    static reset = function() {
        time = 0;
    }

    static set_max = function(_time) {
        time_max = _time * GAME_SPEED;
    }

    static toString = function() {
        return "Timer";
    }

    time = offset*_time_max*GAME_SPEED;
    time_max = _time_max * GAME_SPEED;
    callback = _callback;
}

#macro GAME_SPEED 60
