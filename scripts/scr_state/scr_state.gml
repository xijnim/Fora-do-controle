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

    xp = 0;
    berserk = false;
    eaten_enemies = 0;
}

globalvar State;
State = new __State();

