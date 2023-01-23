/// player movement

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