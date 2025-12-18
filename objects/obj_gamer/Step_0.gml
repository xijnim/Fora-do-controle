var doritos = instance_nearest(x, y, obj_doritos);

if !instance_exists(doritos) {
	exit;
}

var dist = point_distance(x, y-sprite_height/2, doritos.x, doritos.y);
var dir = point_direction(doritos.x, doritos.y, x, y-sprite_height/2);

hsp = lerp(hsp, lengthdir_x(4, dir), .3);
vsp = lerp(vsp, lengthdir_y(4, dir), .3);

x += hsp;
y += vsp;

var furniture = instance_place(x, y, [obj_tv, obj_sofa, obj_gamer_table]);
if instance_exists(furniture) {
    dir = point_direction(furniture.x, furniture.y, x, y);

    hsp += lengthdir_x(4, dir);
    vsp += lengthdir_y(4, dir);
}

x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height, room_height);
