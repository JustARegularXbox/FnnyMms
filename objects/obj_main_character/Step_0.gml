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
	//do nothing
}
//moving
if (vx!= 0 || vy!=0) {
	x += vx;
	y += vy;
}