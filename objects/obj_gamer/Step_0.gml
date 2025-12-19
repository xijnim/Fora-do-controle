var doritos = instance_nearest(x, y, obj_doritos);

if !instance_exists(doritos) {
	exit;
}

mp_grid_clear_all(mp_grid);

var margin = 4;
add_inst(obj_tv, margin);
add_inst(obj_sofa, margin);
add_inst(obj_gamer_table, margin);

var area = 13;
var x1 = obj_doritos.x - area;
var y1 = obj_doritos.y - area - 12;
var x2 = obj_doritos.x + area;
var y2 = obj_doritos.y + area + 12;
mp_grid_add_rectangle(mp_grid, x1, y1, x2, y2);

var target_x = -1;
var target_y = -1;
var idk_man = 16;
if doritos.x > room_width/2 {
    target_x = sprite_width/2 + idk_man*2;
} else {
    target_x = room_width - sprite_width/2 - idk_man*2;
}
if doritos.y > room_height/2 {
    target_y = sprite_height + idk_man;
} else {
    target_y = room_height-1 - idk_man;
}

mp_grid_path(mp_grid, path, x, y, target_x, target_y, true);
path_start(path, 5, path_action_stop, true);

if place_meeting(x, y, obj_doritos) {
    game_restart();
}

sprite_index = xprevious != x || yprevious != y ? spr_enemy_gamer : spr_gamer_idle;

depth = -y;
x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height, room_height);

// var dist = point_distance(x, y-sprite_height/2, doritos.x, doritos.y);
// var dir = point_direction(doritos.x, doritos.y, x, y-sprite_height/2);
//
// hsp = lerp(hsp, lengthdir_x(4, dir), .3);
// vsp = lerp(vsp, lengthdir_y(4, dir), .3);
//
// x += hsp;
// y += vsp;
//
// var furniture = instance_place(x, y, [obj_tv, obj_sofa, obj_gamer_table]);
// if instance_exists(furniture) {
//     dir = point_direction(furniture.x, furniture.y, x, y);
//
//     hsp += lengthdir_x(4, dir);
//     vsp += lengthdir_y(4, dir);
// }
//
// x = clamp(x, sprite_width/2, room_width-sprite_width/2);
// y = clamp(y, sprite_height, room_height);
