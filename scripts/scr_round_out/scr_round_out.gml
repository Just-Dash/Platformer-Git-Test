// @desc Round value outward from 0 to the nearest integer

function scr_round_out(n){
	if n == 0
		return 0;
	return (n > 0 ? ceil(n) : floor(n));
}