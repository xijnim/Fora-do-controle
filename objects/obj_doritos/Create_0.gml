character_controller = new CharacterController(id);
had_berserk = false;

berserk_timer = new Timer(5, function() {
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
