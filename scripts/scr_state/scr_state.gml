function __State() constructor {
    get_level = function() {
        if xp < 100 {
            return 1;
        }
        return 2;
    }

    xp = 0;
    berserk = false;
}

globalvar State;
State = new __State();

