character_controller = new CharacterController(id);
had_berserk = false;

berserk_timer = new Timer(3, function() {
    State.berserk = false;
});

invincible = false;
invincible_timer = new Timer(1, function() {
    invincible = false;
});
take_damage = function(damage, knockback=0, dir=0) {
    if invincible {
        return;
    }
    if !State.berserk {
        State.xp -= damage;
    }
    character_controller.add_knockback(knockback, dir);
    invincible = true;
}

path_timer = new Timer(.0001, function() {
    instance_create_depth(x, y, 0, obj_doritos_path);
});
