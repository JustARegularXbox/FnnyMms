/// player movement

//movement
vx = (moveRight*walkSpeed);

//idle
if (vx == 0) {
	//do nothing
}
//moving
if (vx!= 0) {
	x += vx
}