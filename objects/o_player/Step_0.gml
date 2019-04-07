//Keyboard Input

if(keyboard_check(vk_enter)){
	o_persistant.morality=15;
}
if(keyboard_check(vk_shift)){
	o_persistant.morality=-15;
}
if(keyboard_check(vk_tab)){
	o_persistant.morality =0;
	room_restart();
}

var _x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var _y_input = keyboard_check(vk_down) - keyboard_check(vk_up);

x_speed_ += _x_input * acceleration_;
y_speed_ += _y_input * acceleration_;
var _speed = point_distance(0, 0, x_speed_, y_speed_);
var _direction = point_direction(0, 0, x_speed_, y_speed_);
if (_speed > max_speed_) {
	x_speed_ = lengthdir_x(max_speed_, _direction);
	y_speed_ = lengthdir_y(max_speed_, _direction);
}

if (_x_input == 0) {
	x_speed_ = lerp(x_speed_, 0, .3);
}
if (_y_input == 0) {
	y_speed_ = lerp(y_speed_, 0, .3);
}

if (_x_input == 0 && _y_input == 0) {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = .7;	
}

if (x_speed_ > 0) {
	image_xscale = 1;
} else if (x_speed_ < 0) {
	image_xscale = -1;
}



//o_camera.shake = x_speed_ + y_speed_;

// Move horizontally
x += x_speed_;

// Right collisions
if x_speed_ > 0 {
	if (grid_place_meeting(self, o_level.grid_)) {
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed_ = 0;
	}
} else if x_speed_ < 0 {
	// Left collisions
	if (grid_place_meeting(self, o_level.grid_)) {
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed_ = 0;
	}
}

// Move vertically
y += y_speed_;

// Vertical collisions
if y_speed_ > 0 {
	// Bottom collisions
	if (grid_place_meeting(self, o_level.grid_)) {
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed_ = 0;
	}
} else if y_speed_ < 0 {
	// Top collisions
	if (grid_place_meeting(self, o_level.grid_)) {
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed_ = 0;
	}
}


/*if keyboard_check(ord("A")){hsp=-pwr;}
if keyboard_check(ord("D")){hsp=pwr;}
if keyboard_check(ord("W")) {vsp=-pwr;}
if keyboard_check(ord("S")) {vsp=pwr;}
hsp *= frc;
vsp *= frc;*/

//Shoot
/*if keyboard_check(vk_space)
{
	global.dir = 90;//angles?
	instance_create_depth(obj_player.x,obj_player.y,0,obj_projectile);
}*/

//Walk Animation
/*if (abs(hsp)>0.5 || abs(vsp)>0.5){
	sprite_index = s_mochi_walk;
}
else{
	sprite_index = s_mochi;
}*/

//Wall Collision
/*if place_meeting(x+hsp,y,o_wall) {
	while(!place_meeting(x+sign(hsp),y,o_wall)) {
        x += sign(hsp);
    }
    hsp = 0; 
}*/
//x += hsp;

/*if place_meeting(x, y+vsp, o_wall) {
	while(!place_meeting(x,y+sign(vsp),o_wall)) {
        y += sign(vsp);
    }
    vsp = 0; 
}*/
//y += vsp;

//Contrain in Frame
/*if x<=0 {x=0;}
if x>=1024 {x=1024;}
if y<=0 {y=0;}
if y>=728 {y=728;}*/


//Change Speeds
/*if keyboard_check(vk_enter){pwr++;}
if keyboard_check(vk_shift){
	pwr--; 
	if (pwr <= 0){
		pwr=1;
	}
}*/
//Knockback
/*if(place_meeting(x,y,obj_angel)){
	enemy = instance_nearest(x, y, obj_npc)
	direction = point_direction(x,y,enemy.x,enemy.y)+180;
	bounce = 1;
}
if (bounce==1){
	
}*/