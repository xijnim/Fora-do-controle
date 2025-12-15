function __ResolutionManager() constructor {
    update = function() {
        if keyboard_check_pressed(vk_f11) {
            __fullscreen = !__fullscreen;
        }

        if window_get_fullscreen() != __fullscreen {
            window_set_fullscreen(__fullscreen);
        }
    }

    __fullscreen = false;
}

globalvar ResolutionManager;
ResolutionManager = new __ResolutionManager();

call_later(
    1, time_source_units_frames,
    function() {
        ResolutionManager.update();
    }, true
);
