screenshake_spd_x = lerp(screenshake_spd_x, -screenshake_x, .2);
screenshake_spd_y = lerp(screenshake_spd_y, -screenshake_y, .2);
screenshake_x += screenshake_spd_x;
screenshake_y += screenshake_spd_y;

var cam_x = screenshake_x;
var cam_y = screenshake_y;

camera_set_view_pos(view_camera[0], cam_x, cam_y);

