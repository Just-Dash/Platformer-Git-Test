/// @desc
if not invincible {
	hp -= 1
	invincible = true
	alarm[1] = 60
	image_index = 1
}
if hp == 0 {
	instance_destroy(self)
}
