function sfx_play(sfx, conf={}) {
    if global.muted {
        return;
    }

    var gain = conf[$ "gain"] ?? 1;
    var pitch = conf[$ "pitch"] ?? 1;
    audio_play_sound(sfx, 0, false, gain, 0, pitch);

    delete conf;
}

global.muted = false;
call_later(
    1, time_source_units_frames,
    function() {
        if keyboard_check_pressed(ord("M")) {
            global.muted = !global.muted;

            if global.muted {
                audio_pause_sound(global.music);
            } else {
                audio_resume_sound(global.music);
            }
        }
    }, true
);
global.music = audio_play_sound(sfx_music, 0, 1);

