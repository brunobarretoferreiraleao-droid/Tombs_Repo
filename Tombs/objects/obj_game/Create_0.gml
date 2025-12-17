window_set_fullscreen(true);

//Camera
var cam_w = 320;
var cam_h = 180;

cam = camera_create_view(
	0, 0,
	cam_w, cam_h,
	0,
	obj_blender,
	cam_w / 2, cam_h / 2,
	cam_w / 2, cam_h / 2
);

view_camera[0] = cam;

//TileMap
collision_layer_id = layer_get_id("Collisions");
collision_tilemap = layer_tilemap_get_id(collision_layer_id);

global.collision_tilemap = collision_tilemap;