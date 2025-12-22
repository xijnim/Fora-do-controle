function sfx_play(sfx, conf={}) {
    var gain = conf[$ "gain"] ?? 1;
    var pitch = conf[$ "pitch"] ?? 1;
    audio_play_sound(sfx, 0, false, gain, 0, pitch);

    delete conf;
}
