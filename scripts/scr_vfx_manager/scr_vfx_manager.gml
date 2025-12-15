function VfxManager() constructor {
    update = function() {
        __scale_manager.update();
        __jump_manager.update();

        __angle_spd = lerp(__angle_spd, -__angle, .3);
        __angle += __angle_spd;

        __alpha = lerp(__alpha, 1, .2);
    }

    set_scale_add = function(xadd, yadd) {
        __scale_manager.set(xadd, yadd);
    }

    get_xscale = function() {
        return __scale_manager.get_xscale();
    }

    get_yscale = function() {
        return __scale_manager.get_yscale();
    }

    get_jump = function() {
        return __jump_manager.get_jump();
    }

    get_angle = function() {
        return __angle;
    }

    set_alpha = function(alpha) {
        __alpha = alpha;
    }
    get_alpha = function() {
        return __alpha;
    }

    add_scale_force = function(force_x, force_y) {
        __scale_manager.add_force(force_x/2, force_y/2)
    }
    add_jump = function(spd) {
        __jump_manager.add_jump(spd);
    }

    add_angle = function(amt) {
        __angle_spd += amt;
    }
    
    __scale_manager = new ScaleManager();
    __jump_manager = new JumpVfxManager();

    __alpha = 0;
    __angle = 0;
    __angle_spd = 0;
}

function JumpVfxManager() constructor {
    update = function() {
        if __jump_h > 0 {
            __jump_spd -= .2;
        }

        __jump_h += __jump_spd;
        if __jump_h <= 0 {
            __jump_h = 0;
            __jump_spd = 0;
        }

        __jump_h = min(__jump_h, JUMP_LIMIT);
    }

    get_jump = function() {
        return __jump_h
    }

    add_jump = function(spd) {
        if __jump_h < 8 {
            __jump_spd += spd;
        }
    }

    __jump_h = 0;
    __jump_spd = 0;
}

#macro JUMP_LIMIT 20

function ScaleManager(config={}) constructor {
    static update = function() {
        __.xscale_spd = lerp(__.xscale_spd, -__.xscale_add*.7, .2);
        __.yscale_spd = lerp(__.yscale_spd, -__.yscale_add*.7, .2);
        __.xscale_add += __.xscale_spd;
        __.yscale_add += __.yscale_spd;
        
        __.angle_spd = lerp(__.angle_spd, -__.angle, .2);
        __.angle += __.angle_spd;
    }

    static get_xscale = function() {
        return __.xscale + __.xscale_add;
    }
    static get_yscale = function() {
        return __.yscale + __.yscale_add;
    }

    static add_force = function(force_x, force_y) {
        __.xscale_spd += force_x;
        __.yscale_spd += force_y;
    }
    
    static add_angle_force = function(force) {
        __.angle_spd += force;
    }
    
    static clean_up = function() {
        delete __;
    }
    
    static get_angle = function() {
        return __.angle;
    }

    static set = function(xadd, yadd) {
        __.xscale_add = xadd;
        __.yscale_add = yadd;
    }
    
    __ = {};
    with __ {
        xscale_add = config[$ "xscale_add"] ?? 0;
        yscale_add = config[$ "yscale_add"] ?? 0;
        xscale = 1;
        yscale = 1;
        xscale_spd = 0;
        yscale_spd = 0;
        angle_spd = 0;
        angle = 0;
    }
}

