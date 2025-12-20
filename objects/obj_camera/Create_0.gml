screenshake_x = 0;
screenshake_y = 0;
screenshake_spd_x = 0;
screenshake_spd_y = 0;

camera_x = 0;
camera_y = 0;

screenshake = function(force) {
    screenshake_spd_x += force;
    screenshake_spd_y += force;
}
