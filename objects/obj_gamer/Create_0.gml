hsp = 0;
vsp = 0;

mp_grid = mp_grid_create(0, 0, room_width, room_height, 1, 1);
path = path_add();
mp_grid_add_instances(mp_grid, obj_tv, false);
mp_grid_add_instances(mp_grid, obj_sofa, false);
mp_grid_add_instances(mp_grid, obj_gamer_table, false);

add_inst = function(inst, margin) {
    var x1 = inst.bbox_left - margin;
    var y1 = inst.bbox_top - margin;
    var x2 = inst.bbox_right + margin;
    var y2 = inst.bbox_bottom + margin;
    mp_grid_add_rectangle(mp_grid, x1, y1, x2, y2);
}

