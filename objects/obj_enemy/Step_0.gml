strategy.update();
vfx_manager.update();
hitbox.update();

if type != EnemyIdx.Mini_Ant  {
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
}

var is_dead = hitbox.is_dead();

var meeting_predator = false;
with obj_enemy {
    if array_contains(data.victims, other.type) && place_meeting(x, y, other) {
        meeting_predator = true;
    }
}
if meeting_predator {
    is_dead = true;
}

hsp = lerp(hsp, 0, .1);
vsp = lerp(vsp, 0, .1);

x += hsp;
y += vsp;

var enemy = instance_place(x, y, obj_enemy);
if instance_exists(enemy) && data.repel {
    var dir = point_direction(x, y, enemy.x, enemy.y)+180;
    hsp += lengthdir_x(3, dir);
    vsp += lengthdir_y(3, dir);
}

var solid_inst = instance_place(x, y, obj_enemy);
if instance_exists(solid_inst) {
    var dir = point_direction(x, y, solid_inst.x, solid_inst.y)+180;
    hsp += lengthdir_x(3, dir);
    vsp += lengthdir_y(3, dir);
}

if is_dead {
    notify_kill(!meeting_predator, data.xp_reward);
    instance_destroy();
}
