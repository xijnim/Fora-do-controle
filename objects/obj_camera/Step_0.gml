screenshake_spd_x = lerp(screenshake_spd_x, -screenshake_x, .2);
screenshake_spd_y = lerp(screenshake_spd_y, -screenshake_y, .2);
screenshake_x += screenshake_spd_x;
screenshake_y += screenshake_spd_y;

var doritos = obj_doritos;
if instance_exists(doritos) {
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);
    var target_x = doritos.x - cam_w/2;
    var target_y = doritos.y - cam_h/2;
    target_x = clamp(target_x, 0, room_width-cam_w);
    target_y = clamp(target_y, 0, room_height-cam_h);
    camera_x = lerp(camera_x, target_x, .2);
    camera_y = lerp(camera_y, target_y, .2);
}

var cam_x = screenshake_x + camera_x;
var cam_y = screenshake_y + camera_y;

camera_set_view_pos(view_camera[0], cam_x, cam_y);

