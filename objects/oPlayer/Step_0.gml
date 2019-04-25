// get player input
if (hascontrol){
	key_right = keyboard_check(ord("D"));
	key_left = keyboard_check(ord("A"));
	key_jump = keyboard_check_pressed(ord("W"));
}
//react
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grav

//jump
canjump--;
if (canjump > 0) && (key_jump){
	vsp = -7
	canjump = 0;
}
else {
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//collision
if (place_meeting(x + hsp, y, oWall)){
	while (!place_meeting(x + sign(hsp), y, oWall)){
		x = x + sign (hsp);
	}
	hsp = 0;
}
x = x + hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWall)){
	while (!place_meeting(x, y + sign(vsp), oWall)){
		y = y + sign (vsp);
	}
	vsp = 0;
}
y = y + vsp;

//animation
if (!place_meeting(x, y + 1, oWall)) {
	sprite_index = sprPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;
	else image_index = 0;
}
else {
	canjump = 10;
	if (sprite_index == sprPlayerA){
		audio_sound_pitch(snLanding, random_range(0.8, 1.2));
		audio_play_sound(snLanding, 4, false);
		
		repeat(5){
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust)){
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0){
		sprite_index = sprPlayer;
	}
	else {
		sprite_index = sprPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
