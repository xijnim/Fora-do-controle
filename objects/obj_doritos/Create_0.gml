character_controller = new CharacterController(id);
vfx_manager = new VfxManager();
had_berserk = false;

berserk_timer = new Timer(3, function() {
    State.berserk = false;
    State.berserk_progress = 0;
});

invincible = false;
invincible_timer = new Timer(.5, function() {
    invincible = false;
    flash = false;
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
    var path = instance_create_depth(x, y, 0, obj_doritos_path);
    path.sprite_index = sprite_index;
});

flash = false;
flash_timer = new Timer(.04, function() {
    flash = !flash;
});
