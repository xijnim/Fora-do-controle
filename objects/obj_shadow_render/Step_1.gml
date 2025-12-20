if !surface_exists(shadow_surf) || (surface_get_width(shadow_surf) != room_width || surface_get_height(shadow_surf) != room_height) {
    if surface_exists(shadow_surf) {
        surface_free(shadow_surf);
    }
    shadow_surf = surface_create(room_width, room_height);
}


