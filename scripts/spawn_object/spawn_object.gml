///arg grid

var _grid = argument0;
var _height = argument1;
var _width = argument2;
var _num_door = 1;
var _num_enemies = 5*global.morality+1;
var _num_items = 5*global.morality+1;

randomize();

while(_num_door || _num_enemies || _num_items)
{
	for (var _y = 1; _y < height_-1; _y++) {
		for (var _x = 1; _x < width_-1; _x++) {
			if (_grid_[# _x, _y] == FLOOR) {
				//if all are emty, break?
				;
			}
		}
	}
}
while(_num_enemies)
{
	for (var _y = 1; _y < height_-1; _y++) {
		for (var _x = 1; _x < width_-1; _x++) {
			if (_grid_[# _x, _y] == FLOOR) {
				//if all are emty, break?
				;
			}
		}
	}
}while(_num_items)
{
	for (var _y = 1; _y < height_-1; _y++) {
		for (var _x = 1; _x < width_-1; _x++) {
			if (_grid_[# _x, _y] == FLOOR) {
				//if all are emty, break?
				;
			}
		}
	}
}
