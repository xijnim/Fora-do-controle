strategy.update();
vfx_manager.update();
hitbox.update();

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

var is_dead = hitbox.is_dead();

if type == EnemyIdx.Sugar || EnemyIdx.Cheese {
    var meeting_ant = false;
    with obj_enemy {
        if type == EnemyIdx.Ant && place_meeting(x, y, other) {
            meeting_ant = true;
        }
    }
    if meeting_ant {
        is_dead = true;
    }
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
    var xp_reward = data.xp_reward;
    /*if State.berserk {
        xp_reward *= 3;
    }*/
    State.xp += xp_reward;
    if !State.berserk {
        State.berserk_progress += 1;
    }
    with obj_doritos {
        vfx_manager.add_angle(40);
        vfx_manager.add_scale_force(.5, -.5);
    }
	audio_play_sound(sfx_player_eat, 2, 0, .7, 0, random_range(.9, 1.1));
    instance_destroy();
}
