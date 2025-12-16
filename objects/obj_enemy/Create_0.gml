type = self[$ "type"] ?? EnemyIdx.CropBac;
data = global.enemies[type];
sprite_index = data.sprite;

ai = new EnemyAI(id);
hitbox = new EnemyHitbox(id);

vfx_manager = new VfxManager();
vfx_manager.set_scale_add(-1, -1);
vfx_manager.set_alpha(0);
vfx_manager.add_angle(50);

kill = function() {
    instance_destroy();
}
