function __State() constructor {
    get_level = function() {
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
}

globalvar State;
State = new __State();

