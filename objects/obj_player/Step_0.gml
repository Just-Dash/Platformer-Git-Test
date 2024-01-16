/// @desc
scr_get_inputs()

x_mov = key_right - key_left

grounded = instance_place(x, y + 1, obj_wall);
if grounded and key_jump {
	y_mov = jmp
}
else {
	y_mov += global.grv
}

if x_mov != 0 {
	image_xscale = sign(x_mov)
	if grounded
		x_mov = spd + sign(x_mov) * grounded.frct
	else
		x_mov = spd + sign(x_mov) * global.frct
}
else {
	if grounded
		x_mov = spd - sign(spd) * grounded.frct
	else
		x_mov = spd - sign(spd) * global.frct
	if sign(x_mov) != sign(spd)
		x_mov = 0
}

if key_jump_released and sign(y_mov) < 0 {
	y_mov = floor(y_mov / 2);
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


spd = x_mov;
spd = clamp(spd, -max_spd, max_spd);
x += (spd > 0 ? ceil(spd) : floor(spd))
y += y_mov;
show_debug_message(spd)

if key_shoot and can_attack {
	can_attack = false;
	alarm[0] = 15;
	var _arrow = instance_create_depth(x, y, depth - 1, obj_arrow)
	with _arrow {
		x = other.x + other.image_xscale * (sprite_get_width(other.sprite_index) / 2 + sprite_width / 2);
		dir = other.image_xscale;
	}
}

if key_melee and can_attack {
	can_attack = false;
	spd = 0
	alarm[0] = 15;
	var _hitbox = instance_create_depth(x, y, depth, obj_melee_hitbox)
	with _hitbox {
		player = other
	}
}
