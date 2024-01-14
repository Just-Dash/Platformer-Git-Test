function scr_get_inputs(){
	key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	key_up = keyboard_check(ord("W")) or keyboard_check(vk_up);
	key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
	key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
	key_glide = keyboard_check(vk_space);
	key_shoot = keyboard_check_pressed(ord("Z"))
}