/// @desc

scr_get_inputs()

x_mov = (key_right - key_left) * spd
if sign(x_mov) == 1 {
	image_xscale = 1
}
else if sign(x_mov) == -1 {
	image_xscale = -1	
}

grounded = place_meeting(x, y + 1, obj_wall);

if grounded and key_jump {
	y_mov = jmp
}
else {
	y_mov += global.grv
}

if place_meeting(x + x_mov, y, obj_wall) {
	while !place_meeting(x + sign(x_mov), y, obj_wall) {
		x += sign(x_mov);
	}
	x_mov = 0;
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

if key_shoot {
	instance_create_depth(x, y, depth, obj_arrow, { dir : image_xscale });
}