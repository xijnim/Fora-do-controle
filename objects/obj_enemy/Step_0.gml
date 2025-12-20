strategy.update();
vfx_manager.update();
hitbox.update();

if data.clamp_in_room {
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

var car_death = false;
if !is_undefined(strategy[$ "should_die"]) {
    if strategy.should_die() {
        is_dead = true;
        car_death = true;
    }
}

var solid_inst = instance_place(x, y, obj_solid);
if instance_exists(solid_inst) {
    var dir = point_direction(x, y, solid_inst.x, solid_inst.y)+180;
    hsp += lengthdir_x(3, dir);
    vsp += lengthdir_y(3, dir);
}

if is_dead {
    if !car_death {
        notify_kill(!meeting_predator && !car_death, data.xp_reward);

        if type == EnemyIdx.Car {
            obj_spawner.cars_killed += 1;
        }
    } else {
    }
    instance_create_depth(x, y, -10, obj_enemy_dead, {sprite_index, image_speed: 0, image_index});
    instance_destroy();
}
