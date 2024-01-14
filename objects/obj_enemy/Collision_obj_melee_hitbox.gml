/// @desc
if not invincible {
	hp -= 1
	invincible = true
	alarm[0] = 15
	image_index = 1
	spd = 0
}
if hp == 0 {
	instance_destroy(self)
}