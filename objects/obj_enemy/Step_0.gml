/// @desc
x_mov = x_dir * spd;

grounded = place_meeting(x, y + 1, obj_wall);
if grounded {
	y_mov = 0
}
else {
	y_mov += global.grv
}

if place_meeting(x + x_mov, y, obj_wall) {
	while !place_meeting(x + sign(x_mov), y, obj_wall) {
		x += sign(x_mov);
	}
	x_mov = 0;
	x_dir *= x_dir;
}
if place_meeting(x, y + y_mov, obj_wall) {
	while !place_meeting(x, y + sign(y_mov), obj_wall) {
		y += sign(y_mov);
	}
	y_mov = 0;
}

if place_meeting(x + x_mov, y + y_mov, obj_wall) {
	while !place_meeting(x + sign(x_mov), y + sign(y_mov), obj_wall) {
		x += sign(x_mov);
		y += sign(y_mov);
	}
	x_mov = 0;
	y_mov = 0;
}


x += x_mov;
y += y_mov;
