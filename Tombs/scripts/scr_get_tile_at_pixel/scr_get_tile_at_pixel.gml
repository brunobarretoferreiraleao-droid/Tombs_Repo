function get_tile_at_pixel(px, py)
{
    var tiledata = tilemap_get_at_pixel(global.collision_tilemap, px, py);
    return tile_get_index(tiledata);
}

#macro TILE_WALL 1
#macro TILE_SPIKE 2