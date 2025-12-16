ai.update();
vfx_manager.update();
hitbox.update();

if hitbox.is_dead() {
    var xp_reward = data.xp_reward;
    /*if State.berserk {
        xp_reward *= 3;
    }*/
    State.xp += xp_reward;
    if !State.berserk {
        State.eaten_enemies += 1;
    }
	audio_play_sound(sfx_player_eat, 2, 0, .7, 0, random_range(.9, 1.1));
    instance_destroy();
}
