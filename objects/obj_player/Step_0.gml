if (x <= 32)
{
	x = 32;
}
if (y <= 32)
{
	y = 32;
}
if (x >= window_get_width() - 32)
{
	x = window_get_width() - 32;
}
if (y >= window_get_height() - 32)
{
	y = window_get_height() - 32;
}
// Value of _Direction will be either -1, 0, or 1.
rotate = keyboard_check(ord("A")) - keyboard_check(ord("D"));
// Lerp between current rotation value and direction by 1% (increase to make acceleration / deceleration faster).
rotation = lerp(rotation, rotate, .02);

//Add to image angle. If you are holding W then increase speed by amount of <thrust> and rotate direction of movement toward direction you are facing by amount of <turn_lag> or 
//the difference between current bike facing direction and current movement direction, whichever is smaller.
if (keyboard_check(ord("W")))
{
     spd += thrust;
}
else if (keyboard_check(ord("S")))
{
//otherwise, if you are not holding W, then decrease speed by amount of <decel>
	spd -= 10*decel;
}
else
{
	spd -= 5*decel;
}
if (spd > 0)
{
	image_angle += 0.5*rotation;
	var ang_dif = angle_difference(image_angle, direction);
	direction += min(abs(ang_dif), turn_lag) * sign(ang_dif) * 0.2;
}
//don't allow spd to be greater than max_spd
if (spd > max_spd) 
{
	spd = max_spd;
}
//don't allow spd to be less than 0
if (spd < 0)
{
	spd = 0;
}
//move the x/y to the desired resulting x/y
x = x + lengthdir_x(spd,direction);
y = y + lengthdir_y(spd,direction);

