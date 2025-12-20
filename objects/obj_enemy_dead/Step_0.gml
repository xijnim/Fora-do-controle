hspeed = lerp(hspeed, 0, .05);
vspeed += .1;
image_angle += 5;

if y >= ystart && vspeed > 0 {
    if sprite_index == spr_enemy_mini_human {
        var human = instance_create_depth(x, y, 0, obj_enemy, {type: EnemyIdx.Mini_Human});
        human.image_index = image_index;
    }
    instance_destroy();
}
