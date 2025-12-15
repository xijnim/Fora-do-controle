ai.update();
vfx_manager.update();
hitbox.update();

if hitbox.is_dead() {
    State.xp += State.berserk ? 3 : 1;
    instance_destroy();
}
