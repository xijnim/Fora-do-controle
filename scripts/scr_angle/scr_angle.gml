/// Adapted from https://forum.gamemaker.io/index.php?threads/i-cant-write-or-find-an-angle_lerp-function.108460/
function lerp_angle(_ang0,_ang1,_lerp) {
    var ang = _ang0 - angle_difference(_ang0,_ang1) * _lerp;
    ang %= 360;
    if ang < 0 {
        ang = 360 + ang;
    }
    return ang;
}
