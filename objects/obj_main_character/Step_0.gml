 /// player movement

//keys
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);
moveUp = keyboard_check(vk_up);


//movement
vx = ((moveRight - moveLeft)*walkSpeed);
vy = ((moveDown - moveUp)*walkSpeed);


//idle
if (vx == 0 && vy==0) {
	//switch idle sprites
	switch dir {
	case 0: sprite_index = spr_main_char_idle_right; break;
	case 1: sprite_index = spr_main_char_idle_up; break;
	case 2: sprite_index = spr_main_char_idle_left; break;
	case 3: sprite_index = spr_main_character_boy_idle; break;
	}
}
//moving
if (vx!= 0 || vy!=0) {
	x += vx;
	y += vy;
}

//change of walking sprites
if (vx > 0) {
	sprite_index = spr_main_char_walking_right;
	dir = 0
}
if (vx < 0) {
	sprite_index = spr_main_char_walking_left;
	dir = 2;
}
if (vy < 0) {
	sprite_index = spr_main_char_walking_up;
	dir = 1 ;
}
if (vy > 0) {
	sprite_index = spr_main_character_boy_walking_down;
	dir = 3;
}  


x += vx;
y += vy;

