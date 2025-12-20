var doritos = instance_place(x, y, obj_doritos);
if instance_exists(doritos) && !State.berserk {
    doritos.take_damage(200, 5, direction);
	instance_destroy();
}
