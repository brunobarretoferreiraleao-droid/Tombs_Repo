// ===== INPUT =====
if (!is_moving)
{
    if (keyboard_check_pressed(vk_up)) {
        dir_x = 0;
        dir_y = -1;
        is_moving = true;
    }
    else if (keyboard_check_pressed(vk_down)) {
        dir_x = 0;
        dir_y = 1;
        is_moving = true;
    }
    else if (keyboard_check_pressed(vk_left)) {
        dir_x = -1;
        dir_y = 0;
        is_moving = true;
    }
    else if (keyboard_check_pressed(vk_right)) {
        dir_x = 1;
        dir_y = 0;
        is_moving = true;
    }
}

// ===== MOVIMENTO =====
if (is_moving)
{
    repeat (move_speed)
    {
        // Bounding box atual
        var left   = bbox_left;
        var right  = bbox_right - 1;
        var top    = bbox_top;
        var bottom = bbox_bottom - 1;

        // Próxima posição
        var next_x = x + dir_x;
        var next_y = y + dir_y;

        // Tile à frente do movimento
        var tile = 0;

        if (dir_x == 1) { // direita
            tile = get_tile_at_pixel(right + 1, y);
        }
        else if (dir_x == -1) { // esquerda
            tile = get_tile_at_pixel(left - 1, y);
        }
        else if (dir_y == 1) { // baixo
            tile = get_tile_at_pixel(x, bottom + 1);
        }
        else if (dir_y == -1) { // cima
            tile = get_tile_at_pixel(x, top - 1);
        }

        // ===== RESOLUÇÃO =====
        if (tile == TILE_WALL)
        {
            is_moving = false;
            dir_x = 0;
            dir_y = 0;
            break;
        }
        else if (tile == TILE_SPIKE)
        {
            room_restart();
            break;
        }
        else
        {
            x = next_x;
            y = next_y;
        }
    }
}
