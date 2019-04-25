/// @desc ScreenShake(magnitude, frames)
/// @arg mag sets strength of the shake
/// @arg frames sets the duration

with (oCamera){
	if (argument0 > shake_remain) {
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
	
}