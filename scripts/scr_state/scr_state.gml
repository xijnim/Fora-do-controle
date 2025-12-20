function __State() constructor {
    update = function() {
        if array_length(__table) == 0 {
            return;
        }
        
        var price = __table[0];
        if xp >= price {
            if price == 4 {
                State.berserk_progress = 0;
            }
            xp -= price;
            __level += 1;
            global.flash = 1;
            array_delete(__table, 0, 1);
            if array_length(__table) > 0 && __table[0] == 4 {
                xp = 0;
                State.berserk_progress = 0;
            }
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

<<<<<<< HEAD
    xp = 0//4880 + 8000;
=======
    xp = 4880;
>>>>>>> d1abf30ae1d327be454ee9f7a29668957bad88f7
    berserk = false;
	berserk_needed = 8;
    berserk_progress = 0;
    
    __level = 1;
    __table = [
        80,
        800,
		4000,
        SKIP_HOUSE ? 0 : 4,
        8000,
    ];
}

#macro SKIP_HOUSE false

globalvar State;
State = new __State();

call_later(
    1, time_source_units_frames,
    function() {
        State.update();
    }, true
);
