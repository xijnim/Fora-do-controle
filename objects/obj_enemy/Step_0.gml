ai.update();
vfx_manager.update();
hitbox.update();

if hitbox.is_dead() {
    instance_destroy();
}
