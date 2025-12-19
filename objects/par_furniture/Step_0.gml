var gamer_exists = false;
with obj_enemy {
	if type == EnemyIdx.Gamer {
		gamer_exists = true;
	}
}

if place_meeting(x, y, obj_doritos) && !gamer_exists {
	notify_kill(true, 1);
	instance_destroy();
}