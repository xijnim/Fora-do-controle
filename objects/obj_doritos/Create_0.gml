character_controller = new CharacterController(id);
had_berserk = false;

invincible = false;
invincible_timer = new Timer(1, function() {
    invincible = false;
});
take_damage = function(damage, knockback=0, dir=0) {
    if invincible {
        return;
    }
    State.xp -= damage;
    character_controller.add_knockback(knockback, dir);
    invincible = true;
}
