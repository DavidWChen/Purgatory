randomize();

// Create the surface for the shadows
shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles");
instance_create_layer(0, 0, "Instances", o_persistant);
// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_ - 1, height_ - 1, VOID);

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 400;

var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
instance_create_layer(_player_start_x, _player_start_y, "Instances", o_player);
//instance_create_layer(_player_start_x+50, _player_start_y+50, "Instances", o_angel);
;
// Choose the direction change odds
var _direction_change_odds = 1;
var _neg_range = -10*o_persistant.morality;
var _pos_range = 10*o_persistant.morality;
// Generate the level
repeat (_steps) {
	grid_[# _controller_x, _controller_y] = FLOOR;
	var _spawn_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
	var _spawn_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
	if(irandom(100) < abs(o_persistant.morality)/3+1){
		if(o_persistant.morality >=0)
		{
		instance_create_layer(_spawn_x, _spawn_y, "Instances", o_angel);
		}
		else if(o_persistant.morality  < 0)
		{
		instance_create_layer(_spawn_x, _spawn_y, "Instances", o_devil);
		}
	}
	if(irandom(100) < 5-abs(o_persistant.morality)/3-1){
		instance_create_layer(_spawn_x, _spawn_y, "Instances", o_shard);
	}

	//(chance to spawn object?
	// Randomize the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3);	
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure we don't move outside the room
	if (_controller_x < 2 || _controller_x >= width_ - 2) {
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 2 || _controller_y >= height_ - 2) {
		_controller_y += -_y_direction * 2;
	}
}

instance_create_layer(_spawn_x, _spawn_y, "Instances", o_door);

// Avoid singleton wall tiles
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1) {
				grid_[# _x, _y] = FLOOR;

				//spawn_objects(grid_, height_, width_);
			}
		}
	}
}





// Create the walls tiles
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] == VOID) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			
			tilemap_set(_wall_map_id, _tile_index, _x, _y);
		}
	}
}
