type = self[$ "type"] ?? EnemyIdx.CropBac;
data = global.enemies[type];
sprite_index = data.sprite;
mask_index = sprite_index;

strategy = data.make_strategy(id);
hitbox = new EnemyHitbox(id, data.is_aggressive);

vfx_manager = new VfxManager();
vfx_manager.set_scale_add(-1, -1);
vfx_manager.set_alpha(0);
vfx_manager.add_angle(50);

hsp = 0;
vsp = 0;

clamp_in_room = data.clamp_in_room;

if type == EnemyIdx.Mini_Human {
    image_index = irandom(image_number-1);
    image_speed = 0;
}

kill = function() {
    instance_destroy();
}
