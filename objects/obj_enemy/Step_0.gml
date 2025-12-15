ai.update();
vfx_manager.update();
hitbox.update();

if hitbox.is_dead() {
    State.xp += State.berserk ? 3 : 1;
	audio_play_sound(sfx_player_eat, 2, 0, .7, 0, random_range(.9, 1.1));
    instance_destroy();
}
