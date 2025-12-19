if cars_killed >= 0 && get_enemy_amt_by_type(EnemyIdx.Tank) == 0 {
    instance_create_depth(room_width/2, room_height/2, 0, obj_enemy, {type: EnemyIdx.Tank});
}

timer.tick();
