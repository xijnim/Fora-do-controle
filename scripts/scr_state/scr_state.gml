function __State() constructor {
    update = function() {
        if array_length(__table) == 0 {
            return;
        }
        
        var price = __table[0];
        if xp >= price {
            xp -= price;
            __level += 1;
            global.flash = 1;
            array_delete(__table, 0, 1);
        }
    }

    get_level = function() {
        return __level;
    }

    get_progression = function() {
        if array_length(__table) == 0 {
            return 1;
        }

        return xp / __table[0];
    }

    xp = 800;
    berserk = false;
    berserk_progress = 0;
    
    __level = 1;
    __table = [
        80,
        800,
		4000,
    ];
}

globalvar State;
State = new __State();

call_later(
    1, time_source_units_frames,
    function() {
        State.update();
    }, true
);
